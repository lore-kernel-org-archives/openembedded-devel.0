Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q5Yn9-0004Lu-OL
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 09:29:11 +0200
Received: by iye7 with SMTP id 7so3509638iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=CuStp6VocmDztG4waLfAYIyO2LZRLp3RE3Q2Zc53lAM=;
	b=aYDLZAoN7a1XRMLR1dySel1j9sYBAGWVq259LVnzwDB7aC1yXwDnxxuXIKQ6K61AUv
	/L1xfe1CzfE1SM6neW5UvwzK3dGpDu5GGE2+L/lm/MfhJC/qTTpeWHukkHdM2S/wC4hT
	QutjL9i8uAXC4LhaEXlQqOHQChV/NSPTraPMg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZFprd0+3MhseM3yyDvQadEd5m+9lRLHpLkWX419ZuL8/IV1tCG8VXKm5OTrz1v0IaU
	pCLatVI7Jma+Me/p17YowN915aNXlBlrdRiIj6JnbfNTx8zF+Cq0ddwa3lVidAOw4MMW
	i51w0pVZx1+NcubFQ7gyv0ONaDXKoHFcaZbhw=
MIME-Version: 1.0
Received: by 10.43.57.7 with SMTP id we7mr4828026icb.390.1301642830502; Fri,
	01 Apr 2011 00:27:10 -0700 (PDT)
Received: by 10.231.43.6 with HTTP; Fri, 1 Apr 2011 00:27:10 -0700 (PDT)
In-Reply-To: <1301637327-26825-3-git-send-email-raj.khem@gmail.com>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
	<1301637327-26825-3-git-send-email-raj.khem@gmail.com>
Date: Fri, 1 Apr 2011 09:27:10 +0200
Message-ID: <AANLkTinRZxiXDGxDO02uSb0T1Et4CCnKVNh9RZ+q1jmp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/7] openssl-0.9.8m, binutils-2.20.1: Use linux-uclibceabi instead of uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 07:29:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/4/1 Khem Raj <raj.khem@gmail.com>:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0.../openssl/openssl-0.9.8m/configure-targets.patch | =A0 =A04 ++--
> =A0.../binutils-2.20.1/110-arm-eabi-conf.patch =A0 =A0 =A0 =A0| =A0 =A04 =
++--
> =A02 files changed, 4 insertions(+), 4 deletions(-)

maybe partly offtopic but:
openssl 0.9  is at 0.9.8r; 8m has known security vulnerabilities
probably better upgrade to 8r.

Frans
>
> diff --git a/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/configur=
e-targets.patch b/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/confi=
gure-targets.patch
> index b68123a..6fd2769 100644
> --- a/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/configure-targe=
ts.patch
> +++ b/meta-oe/recipes-connectivity/openssl/openssl-0.9.8m/configure-targe=
ts.patch
> @@ -14,8 +14,8 @@ Index: openssl-0.9.8g/Configure
> =A0+"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-po=
inter -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-s=
hared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> =A0+"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-=
pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux=
-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> =A0+"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-fram=
e-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:lin=
ux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-uclibcgnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-fr=
ame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:l=
inux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> -+"linux-uclibcgnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-=
frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn=
:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame=
-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linu=
x-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-fra=
me-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:li=
nux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> =A0+
> =A0+"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D=
_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.s=
o.\$(SHLIB_MAJOR).",
> =A0+
> diff --git a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-ea=
bi-conf.patch b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-e=
abi-conf.patch
> index 2623301..eace3e9 100644
> --- a/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf=
.patch
> +++ b/meta-oe/recipes-devtools/binutils/binutils-2.20.1/110-arm-eabi-conf=
.patch
> @@ -5,7 +5,7 @@
> =A0 =A0 =A0libgloss_dir=3Darm
> =A0 =A0 =A0;;
> =A0- =A0arm*-*-linux-gnueabi)
> -+ =A0arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
> ++ =A0arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
> =A0 =A0 =A0noconfigdirs=3D"$noconfigdirs target-qthreads"
> =A0 =A0 =A0noconfigdirs=3D"$noconfigdirs target-libobjc"
> =A0 =A0 =A0case ${with_newlib} in
> @@ -16,7 +16,7 @@
> =A0 =A0 =A0libgloss_dir=3Darm
> =A0 =A0 =A0;;
> =A0- =A0arm*-*-linux-gnueabi)
> -+ =A0arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
> ++ =A0arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
> =A0 =A0 =A0noconfigdirs=3D"$noconfigdirs target-qthreads"
> =A0 =A0 =A0noconfigdirs=3D"$noconfigdirs target-libobjc"
> =A0 =A0 =A0case ${with_newlib} in
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


