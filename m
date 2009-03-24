Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LmDAH-0006Qo-3b
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 21:24:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id C39CC5036194
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 17:28:22 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NbTOx9rcPd4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 17:28:18 -0300 (BRT)
Received: from [192.168.15.91] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 17E28502762A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 17:28:16 -0300 (BRT)
From: "Jader H. Silva" <jader@2mi.com.br>
To: OpenEmbedded Dev List <openembedded-devel@lists.openembedded.org>
In-Reply-To: <200903121257.36869.raj.khem@gmail.com>
References: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
	<20090312085123.GD30336@ibawizard.net>
	<1236863674.6250.21.camel@northpole>
	<200903121257.36869.raj.khem@gmail.com>
Organization: 2MI Tecnologia
Date: Tue, 24 Mar 2009 17:22:20 -0300
Message-Id: <1237926140.6845.6.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
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
X-List-Received-Date: Tue, 24 Mar 2009 20:24:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em Qui, 2009-03-12 =C3=A0s 12:57 -0700, Khem Raj escreveu:
> On Thursday 12 March 2009 06:14:34 Jader wrote:
> > Hello.
> > I had the same problem. It's inside classes/kernel.bbclass:298
> > (reproduced below):
> >
> >
> > python populate_packages_prepend () {
> > 	def extract_modinfo(file):
> > 		import tempfile, os, re
> > 		tempfile.tempdir =3D bb.data.getVar("WORKDIR", d, 1)
> > 		tmpfile =3D tempfile.mkstemp()[1]
> > 		cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s %s" %
> > (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or=
 "",
> > file, tmpfile) os.system(cmd)
> > 		f =3D open(tmpfile)
> > 		l =3D f.read().split("\000")
> > 		f.close()
> > 		os.unlink(tmpfile)
> >
> >
> > tempfile.mkstemp() is used to create a temporary file. This function
> > return a tuple with an OS file descriptor and a filename. Filename is
> > stored in "tmpfile" but descriptor is not stored anywhere, but it is
> > still open because it's only an integer to python so it is not closed=
 at
> > the end of the function.
> >
> > For each iteration in which this function is called, a new OS file
> > descriptor is opened, but not closed. The solution is to store the fi=
le
> > descriptor and close it:
>=20
> How about using TemporaryFile () to create the file instead of mkstemp =
?
> we do not have to worry about cleaning it up once it is closed.=20

It would be a better solution, but unix implementation of
TemporaryFile() unlink the temporary file after it is created, so it's
removed from filesystem when closed, and so we won't have a valid
filename for objdump outfile.

> >
> >
> > python populate_packages_prepend () {
> > 	def extract_modinfo(file):
> > 		import tempfile, os, re
> > 		tempfile.tempdir =3D bb.data.getVar("WORKDIR", d, 1)
> > 		tf =3D tempfile.mkstemp()
> > 		tmpfile =3D tf[1]
> > 		cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s %s" %
> > (bb.data.getVar("PATH", d, 1), bb.data.getVar("HOST_PREFIX", d, 1) or=
 "",
> > file, tmpfile) os.system(cmd)
> > 		f =3D open(tmpfile)
> > 		l =3D f.read().split("\000")
> > 		f.close()
> > 		os.close(tf[0])
> > 		os.unlink(tmpfile)
> >
> >
> > There's a patch attached. As I=E1=B8=BF new to git, I don know it it =
was created
> > in the right way. Used command following:
> >
> >
> > git format-patch cab70860b89f0fd856c5de1c37c6a3d31fd3cc9d --stdout cl=
asses
> > >kernel.bbclass.patch
> >
> >
> > Jader H. Silva
> > 2MI Tecnologia
> >
> > Em Qui, 2009-03-12 =C3=A0s 09:51 +0100, Petr =C5=A0tetiar escreveu:
> > > Marco Cavallini <koansoftware@gmail.com> [2009-03-12 09:02:08]:
> > > > Piero Pezzin ha scritto:
> > >
> > > [...]
> > >
> > > > >>> During kernel building, I got the following error:
> > > > >>>
> > > > >>> OTE: package linux-2.6.28: started
> > > > >>> NOTE: package linux-2.6.28-r6: task do_package: started
> > > > >>> ERROR: Error in executing:
> > > > >>> /home/piero/work/qong-nobk/openembedded/openembedded/packages=
/linux
> > > > >>>/ linux_2.6.28.bb
> > > > >>> ERROR: Exception:exceptions.IOError Message:[Errno 24] Too ma=
ny
> > > > >>> open
> > > > >>
> > > > >> files:
> > > >
> > > > this is a known error.
> > > > Nobody solved it yet.
> > >
> > > Maybe, that increasing the numbers of max. file handles and number =
of
> > > max. inodes might help you:
> > >
> > > /proc/sys/fs/file-max
> > > /proc/sys/fs/inode-max
> > >
> > > -- ynezz
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
>=20
Att.


Jader H. Silva
jader@2mi.com.br
Depto. de desenvolvimento
2MI Tecnologia








