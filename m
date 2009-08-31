Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MiAXo-0007RB-IM
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 19:19:52 +0200
Received: by qyk34 with SMTP id 34so2585324qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=an/gxXm61waXfa7bgYNzCffODR9qkXTqNlXqa7dSquQ=;
	b=DM/jWB/DlU7PqAZNhHbVxsYBPqDGGyi9KWtP4gZiPW9Jl3Z0vgq+n0qRKvp+sSJoL3
	/QA5EchC9foTcWMhb8Sb/mxEiqnx6UJUrngydn4KH3TkjQImJ5EQCbrBRxac+6r6GbFL
	ZzWRescl1+hSqGjY6VVZdGw5PD4rNcgCAfwF4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=lFCn5MzFAVU22SYSTh8sXXlDGBfnz+hm+WReoMldrAKAa/CWyK9kTkliBN+9HIJvhB
	15R87+lVRgvikBWFQ2/PtonSlDNcqGEt2HAYrsMaB1hSxTLtYTGJs/dE6a55kzTin3p3
	Ay/s1Cgq3+gx8Mt9QdUmjSAJrCsp4/nEkjJt8=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.116.140 with SMTP id m12mr1710598qcq.54.1251738079126; 
	Mon, 31 Aug 2009 10:01:19 -0700 (PDT)
In-Reply-To: <4A9BFC7E.6040401@cbnco.com>
References: <1250536860-9140-1-git-send-email-msmith@cbnco.com> 
	<4A9BFC7E.6040401@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 31 Aug 2009 10:00:59 -0700
X-Google-Sender-Auth: cb22e8ca7c58bad3
Message-ID: <b6ebd0a50908311000r5e588fc1h2f1e7fc0da88c43b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] package_deb: create md5sums control files
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
X-List-Received-Date: Mon, 31 Aug 2009 17:19:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Looks okay to me.  Not tested, but looks sane. :)

Acked-by: Chris Larson <clarson@kergoth.com>

On Mon, Aug 31, 2009 at 9:38 AM, Michael Smith<msmith@cbnco.com> wrote:
> OK to commit?
>
> Mike
>
> Michael Smith wrote:
>>
>> These are created with the package and get installed in
>> /var/dpkg/info. Afterward it's a great way to find modified files
>> for backup with a little shell script magic.
>>
>> It feels a bit weird to still use MD5, but that seems to be the
>> convention in the Debian world.
>>
>> Signed-off-by: Michael Smith <msmith at cbnco.com>
>> ---
>> =C2=A0classes/package.bbclass =C2=A0 =C2=A0 | =C2=A0 45
>> +++++++++++++++++++++++++++++++++++++++++++
>> =C2=A0classes/package_deb.bbclass | =C2=A0 =C2=A07 ++++++
>> =C2=A02 files changed, 52 insertions(+), 0 deletions(-)
>>
>> diff --git a/classes/package.bbclass b/classes/package.bbclass
>> index f6bd7c5..e3f55b5 100644
>> --- a/classes/package.bbclass
>> +++ b/classes/package.bbclass
>> @@ -202,6 +202,51 @@ def runstrip(file, d):
>> =C2=A0 =C2=A0 =C2=A0 return 1
>> =C2=A0+def write_package_md5sums (root, outfile, ignorepaths):
>> + =C2=A0 =C2=A0# For each regular file under root, writes an md5sum to o=
utfile.
>> + =C2=A0 =C2=A0# With thanks to patch.bbclass.
>> + =C2=A0 =C2=A0import bb, os
>> +
>> + =C2=A0 =C2=A0try:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# Python 2.5+
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0import hashlib
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ctor =3D hashlib.md5
>> + =C2=A0 =C2=A0except ImportError:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0import md5
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ctor =3D md5.new
>> +
>> + =C2=A0 =C2=A0outf =3D file(outfile, 'w')
>> +
>> + =C2=A0 =C2=A0# Each output line looks like: "<hex...> =C2=A0<filename =
without leading
>> slash>"
>> + =C2=A0 =C2=A0striplen =3D len(root)
>> + =C2=A0 =C2=A0if not root.endswith('/'):
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0striplen +=3D 1
>> +
>> + =C2=A0 =C2=A0for walkroot, dirs, files in os.walk(root):
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# Skip e.g. the DEBIAN directory
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if walkroot[striplen:] in ignorepaths:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dirs[:] =3D []
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0for name in files:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fullpath =3D os.path.join(wal=
kroot, name)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.islink(fullpath) o=
r (not
>> os.path.isfile(fullpath)):
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m =3D ctor()
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D file(fullpath, 'rb')
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while True:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d =3D f.read(81=
92)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not d:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=
reak
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m.update(d)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print >> outf, "%s =C2=A0%s" =
% (m.hexdigest(),
>> fullpath[striplen:])
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ =C2=A0 =C2=A0outf.close()
>> +
>> +
>> =C2=A0#
>> =C2=A0# Package data handling routines
>> =C2=A0#
>> diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
>> index e5339a9..4a17010 100644
>> --- a/classes/package_deb.bbclass
>> +++ b/classes/package_deb.bbclass
>> @@ -243,6 +243,13 @@ python do_package_deb () {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conffiles.write(=
'%s\n' % f)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conffiles.close()
>> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_package_md5sums(root, o=
s.path.join(controldir,
>> 'md5sums'),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0['DEBIAN'])
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0except:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.unlockfile(lf)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise
>> +
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(basedir)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D os.system("PATH=3D\"%s\" fakeroot dp=
kg-deb -b %s %s" %
>> (bb.data.getVar("PATH", localdata, 1), root, pkgoutdir))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ret !=3D 0:
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


