Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1A62A76FF2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 16:06:10 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u21G682d030731; Tue, 1 Mar 2016 10:06:08 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016030110060882-886899 ;
	Tue, 1 Mar 2016 10:06:08 -0600 
Date: Tue, 1 Mar 2016 18:05:39 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Message-ID: <20160301180539.36ea4b3a@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <1456148023.2298.22.camel@linux.intel.com>
References: <cover.1455895912.git.adrian.ratiu@ni.com>
	<4e53f5b5f4e5f9120695e83c4a44b5f99179ed5a.1455895912.git.adrian.ratiu@ni.com>
	<1456148023.2298.22.camel@linux.intel.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/01/2016 10:06:09 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/01/2016 10:06:09 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-01_09:, , signatures=0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core][PATCH v6 1/4] gpg_sign: add local ipk package signing functionality
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 16:06:13 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello

On Mon, 22 Feb 2016 15:33:43 +0200
Markus Lehtonen <markus.lehtonen@linux.intel.com> wrote:

> On Fri, 2016-02-19 at 17:43 +0200, Ioan-Adrian Ratiu wrote:
> > Implement ipk signing inside the sign=5Fipk bbclass using the gpg=5Fsign
> > module and configure signing similar to how rpm does it. sign=5Fipk
> > uses
> > gpg=5Fsign's detach=5Fsign because its functionality is identical to
> > package
> > feed signing.
> >=20
> > IPK signing process is a bit different from rpm:
> >     - Signatures are stored outside ipk files; opkg connects to a
> > feed
> > server and downloads them to verify a package.
> >     - Signatures are of two types (both supported by opkg): binary or
> > ascii armoured. By default we sign using ascii armoured.
> >     - Public keys are stored on targets to verify ipks using the
> > opkg-keyrings recipe.
> >=20
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  meta/classes/package=5Fipk.bbclass |  5 ++++
> >  meta/classes/sign=5Fipk.bbclass    | 52
> > ++++++++++++++++++++++++++++++++++++++++
> >  meta/lib/oe/gpg=5Fsign.py          | 50 ++++++++++++++++++++++++++++--
> > --------
> >  3 files changed, 94 insertions(+), 13 deletions(-)
> >  create mode 100644 meta/classes/sign=5Fipk.bbclass
> >=20
> > diff --git a/meta/classes/package=5Fipk.bbclass
> > b/meta/classes/package=5Fipk.bbclass
> > index 51bee28..f64837a 100644
> > --- a/meta/classes/package=5Fipk.bbclass
> > +++ b/meta/classes/package=5Fipk.bbclass
> > @@ -246,6 +246,11 @@ python do=5Fpackage=5Fipk () {
> >              bb.utils.unlockfile(lf)
> >              raise bb.build.FuncFailed("opkg-build execution failed")
> > =20
> > +        if d.getVar('IPK=5FSIGN=5FPACKAGES', True) =3D=3D '1':
> > +            ipkver =3D "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> > +            ipk=5Fto=5Fsign =3D "%s/%s=5F%s=5F%s.ipk" % (pkgoutdir, pk=
gname,
> > ipkver, d.getVar('PACKAGE=5FARCH', True))
> > +            sign=5Fipk(d, ipk=5Fto=5Fsign)
> > +
> >          cleanupcontrol(root)
> >          bb.utils.unlockfile(lf)
> > =20
> > diff --git a/meta/classes/sign=5Fipk.bbclass
> > b/meta/classes/sign=5Fipk.bbclass
> > new file mode 100644
> > index 0000000..a481f6d
> > --- /dev/null
> > +++ b/meta/classes/sign=5Fipk.bbclass
> > @@ -0,0 +1,52 @@
> > +# Class for generating signed IPK packages.
> > +#
> > +# Configuration variables used by this class:
> > +# IPK=5FGPG=5FPASSPHRASE=5FFILE
> > +#           Path to a file containing the passphrase of the signing
> > key.
> > +# IPK=5FGPG=5FNAME
> > +#           Name of the key to sign with.
> > +# IPK=5FGPG=5FBACKEND
> > +#           Optional variable for specifying the backend to use for
> > signing.
> > +#           Currently the only available option is 'local', i.e.
> > local signing
> > +#           on the build host.
> > +# IPK=5FGPG=5FSIGNATURE=5FTYPE
> > +#           Optional variable for specifying the type of gpg
> > signatures, can be:
> > +#                     1. Ascii armored (ASC), default if not set
> > +#                     2. Binary (BIN)
> > +# GPG=5FBIN
> > +#           Optional variable for specifying the gpg binary/wrapper
> > to use for
> > +#           signing.
> > +# GPG=5FPATH
> > +#           Optional variable for specifying the gnupg "home"
> > directory:
> > +#
> > +
> > +inherit sanity
> > +
> > +IPK=5FSIGN=5FPACKAGES =3D '1'
> > +IPK=5FGPG=5FBACKEND ?=3D 'local'
> > +IPK=5FGPG=5FSIGNATURE=5FTYPE ?=3D 'ASC'
> > +
> > +python () {
> > +    # Check configuration
> > +    for var in ('IPK=5FGPG=5FNAME', 'IPK=5FGPG=5FPASSPHRASE=5FFILE'):
> > +        if not d.getVar(var, True):
> > +            raise=5Fsanity=5Ferror("You need to define %s in the confi=
g"
> > % var, d)
> > +
> > +    sigtype =3D d.getVar("IPK=5FGPG=5FSIGNATURE=5FTYPE", True)
> > +    if sigtype.upper() !=3D "ASC" and sigtype.upper() !=3D "BIN":
> > +        raise=5Fsanity=5Ferror("Bad value for IPK=5FGPG=5FSIGNATURE=5F=
TYPE
> > (%s), use either ASC or BIN" % sigtype)
> > +}
> > +
> > +def sign=5Fipk(d, ipk=5Fto=5Fsign):
> > +    from oe.gpg=5Fsign import get=5Fsigner
> > +
> > +    bb.debug(1, 'Signing ipk: %s' % ipk=5Fto=5Fsign)
> > +
> > +    signer =3D get=5Fsigner(d, d.getVar('IPK=5FGPG=5FBACKEND', True))
> > +    sig=5Ftype =3D d.getVar('IPK=5FGPG=5FSIGNATURE=5FTYPE', True)
> > +    is=5Fascii=5Fsig =3D (sig=5Ftype.upper() !=3D "BIN")
> > +
> > +    signer.detach=5Fsign(ipk=5Fto=5Fsign,
> > +                       d.getVar('IPK=5FGPG=5FNAME', True),
> > +                       d.getVar('IPK=5FGPG=5FPASSPHRASE=5FFILE', True),
> > +                       armor=3Dis=5Fascii=5Fsig)
> > diff --git a/meta/lib/oe/gpg=5Fsign.py b/meta/lib/oe/gpg=5Fsign.py
> > index ada1b2f..ef47d1a 100644
> > --- a/meta/lib/oe/gpg=5Fsign.py
> > +++ b/meta/lib/oe/gpg=5Fsign.py
> > @@ -1,5 +1,6 @@
> >  """Helper module for GPG signing"""
> >  import os
> > +import sys
> > =20
> >  import bb
> >  import oe.utils
> > @@ -50,6 +51,7 @@ class LocalSigner(object):
> >              bb.error('rpmsign failed: %s' % proc.before.strip())
> >              raise bb.build.FuncFailed("Failed to sign RPM packages")
> > =20
> > +
> >      def detach=5Fsign(self, input=5Ffile, keyid, passphrase=5Ffile,
> > passphrase=3DNone, armor=3DTrue):
> >          """Create a detached signature of a file"""
> >          import subprocess
> > @@ -57,23 +59,45 @@ class LocalSigner(object):
> >          if passphrase=5Ffile and passphrase:
> >              raise Exception("You should use either passphrase=5Ffile
> > of passphrase, not both")
> > =20
> > -        cmd =3D [self.gpg=5Fbin, '--detach-sign', '--batch', '--no-tty=
',
> > '--yes',
> > -               '-u', keyid]
> > -        if passphrase=5Ffile:
> > -            cmd +=3D ['--passphrase-file', passphrase=5Ffile]
> > -        else:
> > -            cmd +=3D ['--passphrase-fd', '0']
> > +        cmd =3D [self.gpg=5Fbin, '--detach-sign', '--batch', '--no-tty=
',
> > '--yes', '-u', keyid]
> > +
> >          if self.gpg=5Fpath:
> >              cmd +=3D ['--homedir', self.gpg=5Fpath]
> >          if armor:
> >              cmd +=3D ['--armor']
> > -        cmd.append(input=5Ffile)
> > -        job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE,
> > stdout=3Dsubprocess.PIPE,
> > -                               stderr=3Dsubprocess.PIPE)
> > -        =5F, stderr =3D job.communicate(passphrase)
> > -        if job.returncode:
> > -            raise bb.build.FuncFailed("Failed to create signature
> > for '%s': %s" %
> > -                                      (input=5Ffile, stderr))
> > +
> > +        try:
> > +            keypipe =3D os.pipe()
> > +
> > +            if passphrase=5Ffile:
> > +                with open(passphrase=5Ffile) as fobj:
> > +                    os.write(keypipe[1], fobj.readline());
> > +            else:
> > +                os.write(keypipe[1], passphrase)
> > +
> > +            cmd +=3D ["--passphrase-fd",  str(keypipe[0])]
> > +            cmd +=3D [input=5Ffile]
> > +
> > +            job =3D subprocess.Popen(cmd, stdin=3Dsubprocess.PIPE,
> > stderr=3Dsubprocess.PIPE)
> > +            (=5F, stderr) =3D job.communicate(passphrase)
> > +
> > +            os.close(keypipe[1])
> > +            os.close(keypipe[0]) =20
>=20
> I still fail to see why you want to complicate the code with os.pipe.
> Why not ditch pipe and just do something like:
>     if passphrase=5Ffile:
>         with open(passphrase=5Ffile) as fobj:
>             =5F, stderr =3D job.communicate(fobj.readline())
>=20

If I don't use os.pipe, gpg >2.1 errors out:
gpg: Sorry, we are in batchmode - can't get input

Most likely it has something to do with >2.1 gpg-agent loopback
configuration but I can't seem to find its cause nor a workaround.=20
Obviously removing batch mode and --no-term is not an option.

If I use os.pipe to send the passphrase, then everything works as
expected. The internet is full of issues like this, but after some
heavy googling still no fix to be found for this specific case.

Any ideas, anyone?=20

Thank you,
Adrian

>=20
>=20
> Thanks,
>   Markus
>=20
>=20
> > +
> > +            if job.returncode:
> > +                raise bb.build.FuncFailed("GPG exited with code %d:
> > %s" %
> > +                                          (job.returncode, stderr))
> > +
> > +        except IOError as e:
> > +            bb.error("IO error (%s): %s" % (e.errno, e.strerror))
> > +            raise Exception("Failed to sign '%s'" % input=5Ffile)
> > +        except OSError as e:
> > +            bb.error("OS error (%s): %s" % (e.errno, e.strerror))
> > +            raise Exception("Failed to sign '%s" % input=5Ffile)
> > +        except:
> > +            bb.error("Unexpected error (%s): %s" %
> > (sys.exc=5Finfo()[0], sys.exc=5Finfo()[1]))
> > +            raise Exception("Failed to sign '%s'" % input=5Ffile)
> > +
> > =20
> >      def verify(self, sig=5Ffile):
> >          """Verify signature""" =20
>=20


