Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lh4Kh-00080f-KA
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 16:57:32 +0100
Received: by wa-out-1112.google.com with SMTP id n7so1123560wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 08:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=Iktik2Lrarxfch8GJfZraH0/VYz0N9yg13fMGsHd+M8=;
	b=x/lq0VrMn0ITVkQgl9CK3GyDe6ZsYQyxsLT09hBEf8kBni4JCZBv1BISd9mMl7AXse
	V+IJ7RHuc0BbRzGHG0NACOHRC6N2dWz8cm+LKwp4NtuKLPF1Uxih9bKknb73+zGSgyIF
	AA19xVhYLiEqVU/JkLvvsRUWECMJb9lVhO/kY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=fTQsLjI06ywbQ3OfUlSXFFioLar/5aU2wh5AoOfojdYPXR4KHZD4L/HfvVN8chFZrQ
	BtL2XRftgwnsYrLfOyn3aPjmed1hfbfN90YDTLiHv2lQLrApJvnubw19UOTuqJvKp6mZ
	Au+LL63V8tidfgRJpSShulqiXCRhnhgd2gGCU=
Received: by 10.114.24.5 with SMTP id 5mr4104739wax.106.1236672137283;
	Tue, 10 Mar 2009 01:02:17 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id g25sm4838414wag.8.2009.03.10.01.02.16
	(version=SSLv3 cipher=RC4-MD5); Tue, 10 Mar 2009 01:02:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2009 01:02:13 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-8-generic; KDE/4.2.1; x86_64; ; )
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-27-git-send-email-openembedded@haerwu.biz>
In-Reply-To: <1236182004-4523-27-git-send-email-openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200903100102.14905.raj.khem@gmail.com>
Cc: Marcin Juszkiewicz <openembedded@haerwu.biz>,
	Marcin Juszkiewicz <hrw@openedhand.com>
Subject: Re: [PATCH 26/70] yum: do not hardcode arm architecture - rootfs_rpm provide arch info (from Poky)
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
X-List-Received-Date: Tue, 10 Mar 2009 15:57:38 -0000
X-Groupsio-MsgNum: 8329
Content-Type: multipart/signed; boundary="nextPart123677328.F57PXZbB1F";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart123677328.F57PXZbB1F
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 04 March 2009 07:52:41 Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz <hrw@openedhand.com>
>
> git-svn-id: https://svn.o-hand.com/repos/poky@5392
> 311d38ba-8fff-0310-9ca6-ca027cbcb966 ---
>  packages/yum/files/hacks.patch    |   21 ---------------------
>  packages/yum/yum-native_3.2.18.bb |    2 +-
>  packages/yum/yum_3.2.18.bb        |    1 +
>  3 files changed, 2 insertions(+), 22 deletions(-)
>
> diff --git a/packages/yum/files/hacks.patch
> b/packages/yum/files/hacks.patch index d0232ec..ac8445f 100644
> --- a/packages/yum/files/hacks.patch
> +++ b/packages/yum/files/hacks.patch
> @@ -5,27 +5,6 @@
>   yum/depsolve.py         |    2 ++
>   4 files changed, 7 insertions(+), 1 deletion(-)
>
> -Index: yum-3.2.18/rpmUtils/arch.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- yum-3.2.18.orig/rpmUtils/arch.py	2008-06-17 14:05:42.000000000 +0100
> -+++ yum-3.2.18/rpmUtils/arch.py	2008-09-01 15:47:11.000000000 +0100
> -@@ -275,6 +275,7 @@
> -     return arch
> -
> - def getCanonArch(skipRpmPlatform =3D 0):
> -+    return "arm"
> -     if not skipRpmPlatform and os.access("/etc/rpm/platform", os.R_OK):
> -         try:
> -             f =3D open("/etc/rpm/platform", "r")
> -@@ -331,6 +332,8 @@
> -        base arch is the arch before noarch in the arches dict if myarch
> is not -        a key in the multilibArches."""
> -
> -+    return "arm"
> -+
> -     if not myarch:
> -         myarch =3D canonArch
> -
>  Index: yum-3.2.18/rpmUtils/transaction.py
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- yum-3.2.18.orig/rpmUtils/transaction.py	2008-06-17 14:05:42.000000000
> +0100 diff --git a/packages/yum/yum-native_3.2.18.bb
> b/packages/yum/yum-native_3.2.18.bb index 60dafe3..679f8e9 100644
> --- a/packages/yum/yum-native_3.2.18.bb
> +++ b/packages/yum/yum-native_3.2.18.bb
> @@ -5,7 +5,7 @@ SRC_URI =3D
> "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
> file://paths.patch;patch=3D1 \
>  	   file://yum-install-recommends.py \
>  	   file://extract-postinst.awk"
> -PR =3D "r5"
> +PR =3D "r6"
>
>  DEPENDS =3D "rpm-native python-native python-iniparse-native
> python-urlgrabber-native yum-metadata-parser-native libxml2-native"
>
> diff --git a/packages/yum/yum_3.2.18.bb b/packages/yum/yum_3.2.18.bb
> index 67e9ad7..7d34097 100644
> --- a/packages/yum/yum_3.2.18.bb
> +++ b/packages/yum/yum_3.2.18.bb
> @@ -1,4 +1,5 @@
>  HOMEPAGE =3D "http://linux.duke.edu/projects/yum/"
> +PR =3D "r1"
>
>  SRC_URI =3D
> "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
> file://hacks.patch;patch=3D1 \

ah this invalidates my comment to patch 18/70
=2D-=20
Khem Raj

--nextPart123677328.F57PXZbB1F
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkm2HoYACgkQHnJKy6V6em6W7wCePLe/7Sjl5Ixx2cI5vwMjmf3c
vvkAnikX0+Mnyg/G6YGdfgv+Am2VxcTq
=DrgW
-----END PGP SIGNATURE-----

--nextPart123677328.F57PXZbB1F--
