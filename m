Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lh6sq-0004NE-PK
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 19:40:57 +0100
Received: by wa-out-1112.google.com with SMTP id n7so1156398wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 11:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=8uXt15DojizU5TkrVxdKQpmGVhAcGbJKzMjGJZoH73c=;
	b=uYhrKznPfhQIsDeIqQYZXLng7XrabeibQ+Eb2Y9bc/wCIpA8GlNEF7QBMKlPOSs0Ry
	hxYRjPv5xXKw2cO4L5AQkoox+9spb3RINi4xq8LASuJZ25NJ8Mn7mV/19FCLK0o6pNec
	EpiHZRk+z3cAx6PjeZd5M81rrkpZhpm1OtZys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=o/N3KfoUR+0m32a27WogE6Eg3RHkRPQRIF0K04DwDw3j8A12akii8EBj5/J/JlPSEd
	dy6lwJOV1MdFNkL1xZHn95v9K/IdcmPFCbWzeAJmUTmaB614KnbEpSmiP2JytTAa0uk7
	BFl122wT7c4MRGKNGrdr0efDO8h/zflIu0VPM=
Received: by 10.115.22.1 with SMTP id z1mr4088131wai.216.1236671898282;
	Tue, 10 Mar 2009 00:58:18 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id m17sm4824405waf.66.2009.03.10.00.58.17
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Mar 2009 00:58:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2009 00:58:10 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-8-generic; KDE/4.2.1; x86_64; ; )
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-19-git-send-email-openembedded@haerwu.biz>
In-Reply-To: <1236182004-4523-19-git-send-email-openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200903100058.15789.raj.khem@gmail.com>
Cc: Marcin Juszkiewicz <openembedded@haerwu.biz>,
	Richard Purdie <richard@openedhand.com>
Subject: Re: [PATCH 18/70] yum-native: Add some hacks to make yum work better in the cross build case (from Poky)
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
X-List-Received-Date: Tue, 10 Mar 2009 18:40:57 -0000
X-Groupsio-MsgNum: 8335
Content-Type: multipart/signed; boundary="nextPart1583488.Fv2dHVMAOu";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1583488.Fv2dHVMAOu
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 04 March 2009 07:52:33 Marcin Juszkiewicz wrote:
> From: Richard Purdie <richard@openedhand.com>
>
> git-svn-id: https://svn.o-hand.com/repos/poky@5110
> 311d38ba-8fff-0310-9ca6-ca027cbcb966 ---
>  packages/yum/yum-native/hacks.patch |   66
> +++++++++++++++++++++++++++++++++++ packages/yum/yum-native_3.2.18.bb   |=
 =20
>  3 +-
>  2 files changed, 68 insertions(+), 1 deletions(-)
>  create mode 100644 packages/yum/yum-native/hacks.patch
>
> diff --git a/packages/yum/yum-native/hacks.patch
> b/packages/yum/yum-native/hacks.patch new file mode 100644
> index 0000000..0486b5f
> --- /dev/null
> +++ b/packages/yum/yum-native/hacks.patch
> @@ -0,0 +1,66 @@
> +---
> + rpmUtils/arch.py        |    3 +++
> + rpmUtils/transaction.py |    1 +
> + yum/constants.py        |    2 +-
> + yum/depsolve.py         |    2 ++
> + 4 files changed, 7 insertions(+), 1 deletion(-)
> +
> +Index: yum-3.2.18/rpmUtils/arch.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- yum-3.2.18.orig/rpmUtils/arch.py	2008-08-26 12:43:14.000000000 +0100
> ++++ yum-3.2.18/rpmUtils/arch.py	2008-08-26 12:50:11.000000000 +0100
> +@@ -275,6 +275,7 @@ def getCanonX86_64Arch(arch):
> +     return arch
> +
> + def getCanonArch(skipRpmPlatform =3D 0):
> ++    return "arm"

Does this mean that it will only work for arm ? It would be nice if it coul=
d=20
work for other arches too.

> +     if not skipRpmPlatform and os.access("/etc/rpm/platform", os.R_OK):
> +         try:
> +             f =3D open("/etc/rpm/platform", "r")
> +@@ -331,6 +332,8 @@ def getBaseArch(myarch=3DNone):
> +        base arch is the arch before noarch in the arches dict if myarch
> is not +        a key in the multilibArches."""
> +
> ++    return "arm"
> ++

Ditto as above.

> +     if not myarch:
> +         myarch =3D canonArch
> +
> +Index: yum-3.2.18/rpmUtils/transaction.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- yum-3.2.18.orig/rpmUtils/transaction.py	2008-08-26 13:03:13.000000000
> +0100 ++++ yum-3.2.18/rpmUtils/transaction.py	2008-08-26 13:10:52.0000000=
00
> +0100 +@@ -43,6 +43,7 @@ class TransactionWrapper:
> +                          'clean']
> +         self.tsflags =3D []
> +         self.open =3D True
> ++        self.ts.setProbFilter(rpm.RPMPROB_FILTER_IGNOREOS |
> rpm.RPMPROB_FILTER_IGNOREARCH) +
> +     def __del__(self):
> +         # Automatically close the rpm transaction when the reference is
> lost +Index: yum-3.2.18/yum/constants.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- yum-3.2.18.orig/yum/constants.py	2008-08-26 13:12:39.000000000 +0100
> ++++ yum-3.2.18/yum/constants.py	2008-08-26 13:12:46.000000000 +0100
> +@@ -17,7 +17,7 @@ Yum constants. Usually dealing with rpm
> + """
> +
> + #Constants
> +-YUM_PID_FILE =3D '/var/run/yum.pid'
> ++YUM_PID_FILE =3D '/var/run2/yum.pid'
> +
> + #transaction set states
> + TS_UPDATE =3D 10
> +Index: yum-3.2.18/yum/depsolve.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- yum-3.2.18.orig/yum/depsolve.py	2008-08-26 12:44:37.000000000 +0100
> ++++ yum-3.2.18/yum/depsolve.py	2008-08-26 13:17:45.000000000 +0100
> +@@ -144,6 +144,8 @@ class Depsolve(object):
> +         probfilter =3D 0
> +         for flag in self.tsInfo.probFilterFlags:
> +             probfilter |=3D flag
> ++        probfilter |=3D rpm.RPMPROB_FILTER_IGNOREOS
> ++        probfilter |=3D rpm.RPMPROB_FILTER_IGNOREARCH
> +         self._ts.setProbFilter(probfilter)
> +
> +     def whatProvides(self, name, flags, version):
> diff --git a/packages/yum/yum-native_3.2.18.bb
> b/packages/yum/yum-native_3.2.18.bb index d3098cc..03e54d5 100644
> --- a/packages/yum/yum-native_3.2.18.bb
> +++ b/packages/yum/yum-native_3.2.18.bb
> @@ -1,8 +1,9 @@
>  HOMEPAGE =3D "http://linux.duke.edu/projects/yum/"
>
>  SRC_URI =3D
> "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \ +    =
 =20
>     file://hacks.patch;patch=3D1 \
>             file://paths.patch;patch=3D1"
> -PR =3D "r1"
> +PR =3D "r2"
>
>  DEPENDS =3D "rpm-native python-native python-iniparse-native
> python-urlgrabber-native yum-metadata-parser-native"

=2D-=20
Khem Raj

--nextPart1583488.Fv2dHVMAOu
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm2HZMACgkQHnJKy6V6em49QgCghK6muhYv6yKyh4+qbhRRD6Wt
8QEAnjGStd275SmpKbpXopszAzYKvj/+
=fKHs
-----END PGP SIGNATURE-----

--nextPart1583488.Fv2dHVMAOu--
