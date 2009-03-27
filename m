Received: from [209.85.200.175] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ln3Wo-0001Im-FM
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 05:18:46 +0100
Received: by wf-out-1314.google.com with SMTP id 25so1150769wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2009 21:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=Pf5sGSrKWuFVYR8oZw1zVOa2QmIdl5lCWUmydBBvsuQ=;
	b=QFNc+q2M50RqUpzJbAY4/LTelx7GQ/uepbkB1bEx6yhL8/BYbtmkb9qs6ZiDVshwer
	cejoG+Mw7kBcjW2+2ZGHA7IEvrqa+l++wqXufK9vvnkhy1DgcYf5R7slrKYS507tXUfy
	1zqZsFl8zSa5OhVdy+T/Ypu5lNRCo0A3kCgR0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=NDF8TRWUkDiaQrDAGx5ZQwHTe/evqBOzeiNyRfnujjjGE/CU2yG8Uh6Esc8/JheSoz
	wQR3QYmqz8pSlwD2Vj9vjm+SL4XrRgAm+LgZebOT2m2WB80fX26rjUhCjKmA4LE8PP4C
	YUPG5+wYWLcsSDBxl+aXCq+fe2jQME01mCSRQ=
Received: by 10.142.221.11 with SMTP id t11mr709505wfg.86.1238127421024;
	Thu, 26 Mar 2009 21:17:01 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-12-154.dsl.pltn13.sbcglobal.net
	[71.146.12.154])
	by mx.google.com with ESMTPS id 24sm1917027wff.2.2009.03.26.21.16.59
	(version=SSLv3 cipher=RC4-MD5); Thu, 26 Mar 2009 21:16:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2009 21:16:52 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.1; x86_64; ; )
References: <20090324093519.GA6521@rhein.zuhause.netz>
In-Reply-To: <20090324093519.GA6521@rhein.zuhause.netz>
MIME-Version: 1.0
Message-Id: <200903262116.57707.raj.khem@gmail.com>
Subject: Re: Bug in kernel-arch.bbclass
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
X-List-Received-Date: Fri, 27 Mar 2009 04:18:47 -0000
X-Groupsio-MsgNum: 8747
Content-Type: multipart/signed; boundary="nextPart5484954.Rn8FfPm19s";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart5484954.Rn8FfPm19s
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 24 March 2009 02:35:20 Henning Heinold wrote:
> Hi,
>=20
> while compiling 2.6.28 for wrap board(geodegx) I noticed that the asm-hea=
ders didnt install into staging.
> After examine kernel-arch.bbclass and kernel.bblcass I found the followin=
g lines=20
>=20
> kernel-arch.bbclass
>=20
> def map_kernel_arch(a, d):
>         import bb, re
>=20
>         valid_archs =3D bb.data.getVar('valid_archs', d, 1).split()
>=20
>         if   re.match('(i.86|athlon)$', a):     return '386'
>         elif re.match('arm26$', a):             return 'arm26'
>         elif re.match('armeb$', a):             return 'arm'
>         elif re.match('mipsel$', a):            return 'mips'
>         elif re.match('sh(3|4)$', a):           return 'sh'
>         elif re.match('bfin', a):               return 'blackfin'
>         elif a in valid_archs:                  return a
>         else:
>                 bb.error("cannot map '%s' to a linux kernel architecture"=
 % a)
>=20
> export ARCH =3D "${@map_kernel_arch(bb.data.getVar('TARGET_ARCH', d, 1), =
d)}"
>=20
>=20
> kernel.bbclass
>=20
> kernel_do_stage() {
>         ASMDIR=3D`readlink include/asm`
>=20
>         mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
>         cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
>         # Kernel 2.6.27 moved headers from includes/asm-${ARCH} to arch/$=
{ARCH}/include/asm
>         if [ -e arch/${ARCH}/include/asm/ ] ; then
>                 cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/i=
nclude/$ASMDIR/
>                 install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
>                 cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/
>=20
> As you can see this can not work because the ARCH-variable is set to 386 =
and so the "-e arch/${ARCH}/include/asm/"
> is not true. For backward compatiblity I attached a patch, which covers t=
his problem.
>=20
> Is this okay for checkin?

your patch installs like old dir structure, I wonder if it should install i=
n arch/$ARCH/include too
>=20
>=20
> Bye Henning
>=20


=2D-=20
Khem Raj

--nextPart5484954.Rn8FfPm19s
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknMUzQACgkQHnJKy6V6em7HmQCgsZG+kyvOw84+mXUPzIv8aJIS
49AAoIlM82TlzPOWffCO//e5RP8/IkG2
=63FA
-----END PGP SIGNATURE-----

--nextPart5484954.Rn8FfPm19s--
