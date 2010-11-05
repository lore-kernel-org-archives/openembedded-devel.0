Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PEOMQ-0001ls-TM
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 16:37:52 +0100
Received: by yxe42 with SMTP id 42so2306474yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=u0RVkH8k0+J3b8xYnGNAkiq8qyoTWQr4N+fGQEhPSuY=;
	b=eGhEH5QuzVCCLqTPfOB9REAyFdXUV56o8qcOntuhy0nXk0TLoIyhmQumRbzG/EjdBj
	HZ1oti2kq61tFOx/a0ag7/Q6wx1YT7ojHxFH6fuH9HZz+gI3TuZqJtIVLxu14Ho6m6zx
	2acfBjZRXBwqUHUi8Mvuu+HIJmAY5/N23vf2c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=E9pDGqaYDTJwmyoMHdO2LS/CcJlbmMQ3X8CU7wsdQBfo9+keM8oNQlQHee9vfaaxya
	QRrDjFbsot/cGNG24WYA49QODMTrd+xGE0TKyi7o01aG/my1oQz0NLAEsQUCHDjlheIT
	Lqe99v03sfjuU+pQp19Omn1D/JXyz5D2gdwFM=
Received: by 10.91.153.10 with SMTP id f10mr1474068ago.172.1288971416503; Fri,
	05 Nov 2010 08:36:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 5 Nov 2010 08:36:36 -0700 (PDT)
In-Reply-To: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1288958934-18209-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2010 08:36:36 -0700
Message-ID: <AANLkTi=sxWjPYHhwVf+RX-n6caCp6Sh-ikYGieYs0Y_b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libX11: patch configure.ac so a nios2 system is not seen as an os2 system.
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
X-List-Received-Date: Fri, 05 Nov 2010 15:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 5, 2010 at 5:08 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> configure.ac matches target_system against *os2* to detect if we're
> configuring for an os2 system. Unfortunately this also matches if the
> target_system is nios-linux (which is not an os2 system :-) )
> This patch adds an additional case. The patch is added to the individual
> recipes and also made upstream.
>
> Patch is tested by fully building 1.3.2 and by running
> bitbake -c patch for the other recipes.
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Hmmm good find. I am ok with general fix. but please consider other
review comments before you commit

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../xorg-lib/libx11-1.1.5/configure.ac-nios2.patch | =C2=A0 12 ++++=
++++++++
> =C2=A0.../xorg-lib/libx11-1.3.2/configure.ac-nios2.patch | =C2=A0 12 ++++=
++++++++
> =C2=A0.../xorg-lib/libx11-1.3.6/configure.ac-nios2.patch | =C2=A0 12 ++++=
++++++++
> =C2=A0.../libx11-1.3.99.903/configure.ac-nios2.patch =C2=A0 =C2=A0 | =C2=
=A0 12 ++++++++++++
> =C2=A0recipes/xorg-lib/libx11_1.1.5.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 ++-
> =C2=A0recipes/xorg-lib/libx11_1.3.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 ++-
> =C2=A0recipes/xorg-lib/libx11_1.3.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 ++-
> =C2=A0recipes/xorg-lib/libx11_1.3.99.903.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A08 files changed, 56 insertions(+), 4 deletions(-)
> =C2=A0create mode 100644 recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2=
.patch
> =C2=A0create mode 100644 recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2=
.patch
> =C2=A0create mode 100644 recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2=
.patch
> =C2=A0create mode 100644 recipes/xorg-lib/libx11-1.3.99.903/configure.ac-=
nios2.patch
>
> diff --git a/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch b/rec=
ipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
> new file mode 100644
> index 0000000..5605a59
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.1.5/configure.ac-nios2.patch
> @@ -0,0 +1,12 @@
> +Index: libX11-1.3.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libX11-1.3.2.orig/configure.ac =C2=A0 =C2=A0 2010-11-05 10:30:33.825=
536983 +0100
> ++++ libX11-1.3.2/configure.ac =C2=A02010-11-05 10:31:25.913899269 +0100
> +@@ -202,6 +202,7 @@
> + # arch specific things
> + WCHAR32=3D"1"
> + case $target_alias in
> ++ =C2=A0nios2*) os2=3D"false" ;;
> + =C2=A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
> + =C2=A0 *) ;;
> + esac
> diff --git a/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch b/rec=
ipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
> new file mode 100644
> index 0000000..5605a59
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.3.2/configure.ac-nios2.patch
> @@ -0,0 +1,12 @@
> +Index: libX11-1.3.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libX11-1.3.2.orig/configure.ac =C2=A0 =C2=A0 2010-11-05 10:30:33.825=
536983 +0100
> ++++ libX11-1.3.2/configure.ac =C2=A02010-11-05 10:31:25.913899269 +0100
> +@@ -202,6 +202,7 @@
> + # arch specific things
> + WCHAR32=3D"1"
> + case $target_alias in
> ++ =C2=A0nios2*) os2=3D"false" ;;
> + =C2=A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
> + =C2=A0 *) ;;
> + esac
> diff --git a/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch b/rec=
ipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
> new file mode 100644
> index 0000000..5605a59
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.3.6/configure.ac-nios2.patch
> @@ -0,0 +1,12 @@
> +Index: libX11-1.3.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libX11-1.3.2.orig/configure.ac =C2=A0 =C2=A0 2010-11-05 10:30:33.825=
536983 +0100
> ++++ libX11-1.3.2/configure.ac =C2=A02010-11-05 10:31:25.913899269 +0100
> +@@ -202,6 +202,7 @@
> + # arch specific things
> + WCHAR32=3D"1"
> + case $target_alias in
> ++ =C2=A0nios2*) os2=3D"false" ;;
> + =C2=A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
> + =C2=A0 *) ;;
> + esac
> diff --git a/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch =
b/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
> new file mode 100644
> index 0000000..5605a59
> --- /dev/null
> +++ b/recipes/xorg-lib/libx11-1.3.99.903/configure.ac-nios2.patch
> @@ -0,0 +1,12 @@
> +Index: libX11-1.3.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libX11-1.3.2.orig/configure.ac =C2=A0 =C2=A0 2010-11-05 10:30:33.825=
536983 +0100
> ++++ libX11-1.3.2/configure.ac =C2=A02010-11-05 10:31:25.913899269 +0100
> +@@ -202,6 +202,7 @@
> + # arch specific things
> + WCHAR32=3D"1"
> + case $target_alias in
> ++ =C2=A0nios2*) os2=3D"false" ;;
> + =C2=A0 *os2*) os2=3D"true" ; WCHAR32=3D"0" ;;
> + =C2=A0 *) ;;
> + esac
> diff --git a/recipes/xorg-lib/libx11_1.1.5.bb b/recipes/xorg-lib/libx11_1=
.1.5.bb
> index e775585..b44dcc8 100644
> --- a/recipes/xorg-lib/libx11_1.1.5.bb
> +++ b/recipes/xorg-lib/libx11_1.1.5.bb
> @@ -1,7 +1,8 @@
> =C2=A0require libx11.inc
> =C2=A0DEPENDS =3D "${COMMON_DEPENDS}"
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> +SRC_URI +=3D " file://configure.ac-nios2.patch"
> =C2=A0SRC_URI[archive.md5sum] =3D "d1512d65dadd4f48c779d4749e7753a8"
> =C2=A0SRC_URI[archive.sha256sum] =3D "da9272900e41615e9c5dc25d84730b8966d=
a6f5c8f4c40418dca2ad040fc8b82"
>
> diff --git a/recipes/xorg-lib/libx11_1.3.2.bb b/recipes/xorg-lib/libx11_1=
.3.2.bb
> index b3d48ab..189d1ff 100644
> --- a/recipes/xorg-lib/libx11_1.3.2.bb
> +++ b/recipes/xorg-lib/libx11_1.3.2.bb
> @@ -1,10 +1,11 @@
> =C2=A0require libx11.inc
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"
> =C2=A0# gcc 4.5 ends up ICEing with thumb and -O1 with -fno-omit-framepoi=
nter
> =C2=A0# therefore if we are in thumb mode then we use -Os instead of -O1 =
for
> =C2=A0# DEBUG_OPTIMIZATION
>
> =C2=A0DEBUG_OPTIMIZATION_thumb_append =3D " -Os"
> =C2=A0SRC_URI +=3D " file://dolt-fix.patch"
> +SRC_URI +=3D " file://configure.ac-nios2.patch"
> =C2=A0SRC_URI[archive.md5sum] =3D "001d780829f936e34851ef7cd37b4dfd"
> =C2=A0SRC_URI[archive.sha256sum] =3D "4def4d5c9fce85d690f1f29d675154594ac=
dea3d3fe792d0cb513732c7b4bcb2"
> diff --git a/recipes/xorg-lib/libx11_1.3.6.bb b/recipes/xorg-lib/libx11_1=
.3.6.bb
> index 625f906..8d9f343 100644
> --- a/recipes/xorg-lib/libx11_1.3.6.bb
> +++ b/recipes/xorg-lib/libx11_1.3.6.bb
> @@ -1,6 +1,7 @@
> =C2=A0require libx11.inc
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0SRC_URI +=3D " file://dolt-fix.patch"
> +SRC_URI +=3D " file://configure.ac-nios2.patch"
> =C2=A0SRC_URI[archive.md5sum] =3D "8e0a8a466aa78f66e09fe06cb395319f"
> =C2=A0SRC_URI[archive.sha256sum] =3D "599826765c59a98b1e58b4f6c4ad50dca69=
eeb0e7bd78aea736ca815f45bea40"
> diff --git a/recipes/xorg-lib/libx11_1.3.99.903.bb b/recipes/xorg-lib/lib=
x11_1.3.99.903.bb
> index 65ff63c..5ea3291 100644
> --- a/recipes/xorg-lib/libx11_1.3.99.903.bb
> +++ b/recipes/xorg-lib/libx11_1.3.99.903.bb
> @@ -2,7 +2,8 @@ require libx11.inc
> =C2=A0#--without-xcb is not an option anymore
> =C2=A0#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=3D15e5eaf62=
897b3179d1fbe457cb19f886f0449f8
> =C2=A0DEPENDS_virtclass-native =3D "libxcb-native ${COMMON_DEPENDS}"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> +SRC_URI +=3D " file://configure.ac-nios2.patch"
> =C2=A0SRC_URI[archive.md5sum] =3D "3e8ed7a91f70bb819b5dab9c124a7062"
> =C2=A0SRC_URI[archive.sha256sum] =3D "50205aad0646c0ab13aff8e8eaec7c5cddf=
f416d3a012f83c5661ad98e49736f"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


