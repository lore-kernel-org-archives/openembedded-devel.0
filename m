Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PpiiQ-0003Em-Rl
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 15:50:51 +0100
Received: by iyj8 with SMTP id 8so1276783iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 06:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=WcmyL6Vm16LeO9tkOLDU1w4tLeLdHMiG5xkzFEzQcVM=;
	b=V+O+JespvIOAQR5EbP3I6KDY/ISuL44p/h3Tucpt645EvfMJ7kyUc1Rw8dSZ/hJ8Ea
	HtyHoEDl5xEidk3y3RVPiMO+7S9PW+JdJW/Fge07Yk9NRRMHVazXJ0U5ZB2ioTGr0Dju
	Nef+o+irdB9gsd/KhoK6lTz2CKiDSbmmjsGBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UoUSyNsv+YNvWmFwuGsZxbeejLVvVfunSNnD3bL5vf2U7TBiKPXbU6IKeku8fUwdJL
	fwln/Pu/FchByq2eIa/oGwUZ7n+EVLWWEGKIsndIPDYG3oPKXgRzi7PxBtcIuPOail/r
	VLPbfZCo9H2tV3JbMC8DyO2DX+2hCXUP6tftY=
MIME-Version: 1.0
Received: by 10.231.35.200 with SMTP id q8mr529485ibd.147.1297867778752; Wed,
	16 Feb 2011 06:49:38 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Wed, 16 Feb 2011 06:49:38 -0800 (PST)
In-Reply-To: <1297855134-19216-11-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-11-git-send-email-otavio@ossystems.com.br>
Date: Wed, 16 Feb 2011 15:49:38 +0100
Message-ID: <AANLkTimvGXthCVaN1y9mSe2mdajN1RHioHDri4oy5iS5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 11/13] cmake: drop 2.6.4 as it is not used by any distro
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
X-List-Received-Date: Wed, 16 Feb 2011 14:50:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/16 Otavio Salvador <otavio@ossystems.com.br>:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0.../fix_fortify_source_compilation.patch =A0 =A0 =A0 =A0 =A0 | =A0 32 =
--------------------
> =A0recipes/cmake/cmake-native_2.6.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 10 ------
> =A0recipes/cmake/cmake_2.6.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 11 -------
> =A03 files changed, 0 insertions(+), 53 deletions(-)
> =A0delete mode 100644 recipes/cmake/cmake-2.6.4/fix_fortify_source_compil=
ation.patch
> =A0delete mode 100644 recipes/cmake/cmake-native_2.6.4.bb
> =A0delete mode 100644 recipes/cmake/cmake_2.6.4.bb
>
> diff --git a/recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.pat=
ch b/recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch
> deleted file mode 100644
> index 316ab0c..0000000
> --- a/recipes/cmake/cmake-2.6.4/fix_fortify_source_compilation.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -upstream: http://public.kitware.com/mantis/view.php?id=3D9267
> -status: pending
> -origin: http://sisyphus.ru/ru/srpm/Sisyphus/cmake/patches/0
> -comment: fix cmake building when FORTIFY_SOURCE is enabled
> ---- a/Source/kwsys/SystemInformation.cxx
> -+++ b/Source/kwsys/SystemInformation.cxx
> -@@ -1896,9 +1896,14 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 case 5: sprintf (this->ChipID.ProcessorName,"Pe=
ntium II (0.25 micron)"); break;
> - =A0 =A0 =A0 =A0 =A0 =A0 case 6: sprintf (this->ChipID.ProcessorName,"Pe=
ntium II With On-Die L2 Cache"); break;
> - =A0 =A0 =A0 =A0 =A0 =A0 case 7: sprintf (this->ChipID.ProcessorName,"Pe=
ntium III (0.25 micron)"); break;
> -+/*
> - =A0 =A0 =A0 =A0 =A0 =A0 case 8: sprintf (this->ChipID.ProcessorName,"Pe=
ntium III (0.18 micron) With 256 KB On-Die L2 Cache "); break;
> - =A0 =A0 =A0 =A0 =A0 =A0 case 0xa: sprintf (this->ChipID.ProcessorName,"=
Pentium III (0.18 micron) With 1 Or 2 MB On-Die L2 Cache "); break;
> - =A0 =A0 =A0 =A0 =A0 =A0 case 0xb: sprintf (this->ChipID.ProcessorName,"=
Pentium III (0.13 micron) With 256 Or 512 KB On-Die L2 Cache "); break;
> -+*/
> -+ =A0 =A0 =A0 =A0 =A0 =A0case 8: sprintf (this->ChipID.ProcessorName,"Pe=
ntium III (0.18 micron) With 256 KB L2 Cache "); break;
> -+ =A0 =A0 =A0 =A0 =A0 =A0case 0xa: sprintf (this->ChipID.ProcessorName,"=
Pentium III (0.18 micron), 1/2 MB L2 Cache "); break;
> -+ =A0 =A0 =A0 =A0 =A0 =A0case 0xb: sprintf (this->ChipID.ProcessorName,"=
Pentium III (0.13 micron), 256/512 KB L2 Cache "); break;
> - =A0 =A0 =A0 =A0 =A0 =A0 default: sprintf (this->ChipID.ProcessorName,"U=
nknown P6 family"); return false;
> - =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 break;
> ---- a/Utilities/cmtar/encode.c
> -+++ b/Utilities/cmtar/encode.c
> -@@ -32,7 +32,7 @@ th_finish(TAR *t)
> - =A0 int i, sum =3D 0;
> -
> - =A0 if (t->options & TAR_GNU)
> -- =A0 =A0strncpy(t->th_buf.magic, "ustar =A0", 8);
> -+ =A0 =A0memcpy(t->th_buf.magic, "ustar =A0", 8);
> - =A0 else
> - =A0 {
> - =A0 =A0 strncpy(t->th_buf.version, TVERSION, TVERSLEN);
> diff --git a/recipes/cmake/cmake-native_2.6.4.bb b/recipes/cmake/cmake-na=
tive_2.6.4.bb
> deleted file mode 100644
> index aab6b62..0000000
> --- a/recipes/cmake/cmake-native_2.6.4.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -inherit native
> -require cmake.inc
> -
> -do_install() {
> - =A0 =A0 =A0 oe_runmake install
> -}
> -
> -SRC_URI +=3D "file://fix_fortify_source_compilation.patch"
> -SRC_URI[md5sum] =3D "50f387d0436696c4a68b5512a72c9cde"
> -SRC_URI[sha256sum] =3D "9cdd2152e37b05d0d40d334a1bb2dfc0250021797360f971=
c6ea3d457ac9fdf2"
> diff --git a/recipes/cmake/cmake_2.6.4.bb b/recipes/cmake/cmake_2.6.4.bb
> deleted file mode 100644
> index b5a47a8..0000000
> --- a/recipes/cmake/cmake_2.6.4.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require cmake.inc
> -
> -inherit cmake
> -
> -do_configure_append() {
> - =A0 =A0 =A0 sed -i -e 's,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:=
INTERNAL=3D1,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=3D0,' C=
MakeCache.txt
> -}
> -
> -SRC_URI +=3D "file://fix_fortify_source_compilation.patch"
> -SRC_URI[md5sum] =3D "50f387d0436696c4a68b5512a72c9cde"
> -SRC_URI[sha256sum] =3D "9cdd2152e37b05d0d40d334a1bb2dfc0250021797360f971=
c6ea3d457ac9fdf2"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


