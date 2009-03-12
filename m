Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LhkkR-0004Vk-DW
	for openembedded-devel@openembedded.org; Thu, 12 Mar 2009 14:14:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id CDAED503618D;
	Thu, 12 Mar 2009 10:19:24 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fn9aFIMzupgc; Thu, 12 Mar 2009 10:19:20 -0300 (BRT)
Received: from [192.168.15.100] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 06B61502762D;
	Thu, 12 Mar 2009 10:19:19 -0300 (BRT)
From: Jader <jader@2mi.com.br>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090312085123.GD30336@ibawizard.net>
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
	<19c1b8a90903101122r59d22d0fia19158c42583e784@mail.gmail.com>
	<49bdfd00903110149y39fb7aa4we99d373a4ff1790f@mail.gmail.com>
	<49B8C180.3010607@gmail.com>  <20090312085123.GD30336@ibawizard.net>
Date: Thu, 12 Mar 2009 10:14:34 -0300
Message-Id: <1236863674.6250.21.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@openembedded.org
Subject: Re: Problem building kernel - too many files open
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Mar 2009 13:14:56 -0000
X-Groupsio-MsgNum: 8365
Content-Type: multipart/mixed; boundary="=-CyQModFXN6USqKKElkPW"

--=-CyQModFXN6USqKKElkPW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello.
I had the same problem. It's inside classes/kernel.bbclass:298
(reproduced below):


python populate_packages_prepend () {
	def extract_modinfo(file):
		import tempfile, os, re
		tempfile.tempdir =3D bb.data.getVar("WORKDIR", d, 1)
		tmpfile =3D tempfile.mkstemp()[1]
		cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (bb.dat=
a.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "", file, =
tmpfile)
		os.system(cmd)
		f =3D open(tmpfile)
		l =3D f.read().split("\000")
		f.close()
		os.unlink(tmpfile)


tempfile.mkstemp() is used to create a temporary file. This function
return a tuple with an OS file descriptor and a filename. Filename is
stored in "tmpfile" but descriptor is not stored anywhere, but it is
still open because it's only an integer to python so it is not closed at
the end of the function.

For each iteration in which this function is called, a new OS file
descriptor is opened, but not closed. The solution is to store the file
descriptor and close it:


python populate_packages_prepend () {
	def extract_modinfo(file):
		import tempfile, os, re
		tempfile.tempdir =3D bb.data.getVar("WORKDIR", d, 1)
		tf =3D tempfile.mkstemp()
		tmpfile =3D tf[1]
		cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (bb.dat=
a.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "", file, =
tmpfile)
		os.system(cmd)
		f =3D open(tmpfile)
		l =3D f.read().split("\000")
		f.close()
		os.close(tf[0])
		os.unlink(tmpfile)


There's a patch attached. As I=E1=B8=BF new to git, I don know it it was =
created
in the right way. Used command following:


git format-patch cab70860b89f0fd856c5de1c37c6a3d31fd3cc9d --stdout classe=
s >kernel.bbclass.patch


Jader H. Silva
2MI Tecnologia

Em Qui, 2009-03-12 =C3=A0s 09:51 +0100, Petr =C5=A0tetiar escreveu:

> Marco Cavallini <koansoftware@gmail.com> [2009-03-12 09:02:08]:
>=20
> > Piero Pezzin ha scritto:
>=20
> [...]
>=20
> > >>> During kernel building, I got the following error:
> > >>>
> > >>> OTE: package linux-2.6.28: started
> > >>> NOTE: package linux-2.6.28-r6: task do_package: started
> > >>> ERROR: Error in executing:
> > >>> /home/piero/work/qong-nobk/openembedded/openembedded/packages/lin=
ux/
> > >>> linux_2.6.28.bb
> > >>> ERROR: Exception:exceptions.IOError Message:[Errno 24] Too many o=
pen
> > >> files:
> >=20
> > this is a known error.
> > Nobody solved it yet.
>=20
> Maybe, that increasing the numbers of max. file handles and number of m=
ax.
> inodes might help you:
>=20
> /proc/sys/fs/file-max
> /proc/sys/fs/inode-max
>=20
> -- ynezz
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=-CyQModFXN6USqKKElkPW
Content-Disposition: attachment; filename="kernel.bbclass.patch"
Content-Type: text/x-patch; name="kernel.bbclass.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From d74c9667b3cbc6a0631b5cda6e7ed7d1facd2fcb Mon Sep 17 00:00:00 2001
From: Jader H. Silva <vo@northpole.(none)>
Date: Thu, 12 Mar 2009 10:10:12 -0300
Subject: [PATCH] Kernel bbclass "too many open files" bugfix

---
 classes/kernel.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 86f00da..4c1dbda 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -295,12 +295,14 @@ python populate_packages_prepend () {
 	def extract_modinfo(file):
 		import tempfile, os, re
 		tempfile.tempdir = bb.data.getVar("WORKDIR", d, 1)
-		tmpfile = tempfile.mkstemp()[1]
+		tf = tempfile.mkstemp()
+		tmpfile = tf[1]
 		cmd = "PATH=\"%s\" %sobjcopy -j .modinfo -O binary %s %s" % (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or "", file, tmpfile)
 		os.system(cmd)
 		f = open(tmpfile)
 		l = f.read().split("\000")
 		f.close()
+		os.close(tf[0])
 		os.unlink(tmpfile)
 		exp = re.compile("([^=]+)=(.*)")
 		vals = {}
-- 
1.5.6.3


--=-CyQModFXN6USqKKElkPW--
