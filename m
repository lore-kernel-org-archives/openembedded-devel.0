Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qm9lH-0008Qe-B0
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jul 2011 21:27:19 +0200
Received: by pzk1 with SMTP id 1so3213558pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2011 12:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Awf+CNVbY/dXvA7jRE6m2JWkZK+JuVFnuu/0lT2R8xs=;
	b=k3ev1c+KF9b7z6++jxjokn1Py3G6MZPN/U+J+SNyTqjR5Z3F+jPX/T0g1wbBtoGoKH
	eFd3UIEzbxAnu3Lhr1fPu/dluyxBDM03FqDkc4v7E440tfbvV2T1syFPnlqwV/koTunO
	AL3ohiSXMYuFTLhISjxvZijEa6ERiVcJlkhTs=
Received: by 10.68.29.200 with SMTP id m8mr280955pbh.278.1311794582075; Wed,
	27 Jul 2011 12:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Wed, 27 Jul 2011 12:22:32 -0700 (PDT)
In-Reply-To: <1311792635-17715-1-git-send-email-tom_rini@mentor.com>
References: <1311792635-17715-1-git-send-email-tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jul 2011 12:22:32 -0700
Message-ID: <CAMKF1sqmoDG_YGu-6-BrD2T4iekUnVXdGTyOhQkaHaGUpJTiDQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] rp-pppoe: Resync the 3.8 recipe with oe.dev and cleanup patches
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
X-List-Received-Date: Wed, 27 Jul 2011 19:27:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 11:50 AM, Tom Rini <tom_rini@mentor.com> wrote:
> - Update HOMEPAGE (from oe.dev)
> - Bump PR to match oe.dev (will sync the next bits back over)
> - Add Upstream-Status to all patches and a description to the ones
> =C2=A0missing descriptions.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
> =C2=A0.../rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch | =C2=A0 =C2=A06=
 ++++++
> =C2=A0.../rp-pppoe-3.8/dont-swallow-errors.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A04 ++++
> =C2=A0.../rp-pppoe-3.8/pppoe-src-restrictions.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 ++
> =C2=A0.../rp-pppoe/rp-pppoe-3.8/top-autoconf.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 ++
> =C2=A0.../rp-pppoe/rp-pppoe-3.8/update-config.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 ++
> =C2=A0.../rp-pppoe/rp-pppoe-3.8/use-ldflags.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A04 ++++
> =C2=A0.../recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb =C2=A0| =C2=A0 =
=C2=A06 +++---
> =C2=A07 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure=
_in_cross.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/config=
ure_in_cross.patch
> index 381a44d..1896759 100644
> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cro=
ss.patch
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/configure_in_cro=
ss.patch
> @@ -1,3 +1,9 @@
> +Update the configure script to cross-compiling with OE. =C2=A0This hard-=
codes
> +a few target paths, reworks a few tests to be more friendly for cross
> +and drops other tests.
> +
> +Upstream-Status: Inappropriate [build system specific changes]
> +
> =C2=A0Index: src/configure.in
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0--- rp-pppoe-3.8.orig/src/configure.in 2006-04-03 00:29:42.00000000=
0 +1000
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swal=
low-errors.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-=
swallow-errors.patch
> index 81ce2db..f2f681a 100644
> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-err=
ors.patch
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/dont-swallow-err=
ors.patch
> @@ -1,3 +1,7 @@
> +Further fixup to the configure scripts to not swallow errors
> +
> +Upstream-Status: Unsubmitted

this should be set to "Pending" to match the rest.

> +
> =C2=A0--- a/src/configure.in.org =C2=A0 =C2=A0 2008-01-14 21:08:38.000000=
000 +0200
> =C2=A0+++ a/src/configure.in 2008-01-14 21:20:09.000000000 +0200
> =C2=A0@@ -208,7 +208,7 @@
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src=
-restrictions.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pp=
poe-src-restrictions.patch
> index e7e1c2e..b3ad3d4 100644
> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restri=
ctions.patch
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/pppoe-src-restri=
ctions.patch
> @@ -3,6 +3,8 @@ Relax restrictions on the PPPoE src address, as per debia=
n bug
>
> =C2=A0 http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D293811
>
> +Upstream-Status: Backport [from Debian]
> +
> =C2=A0--- rp-pppoe-3.8.orig/src/discovery.c
> =C2=A0+++ rp-pppoe-3.8/src/discovery.c
> =C2=A0@@ -376,8 +376,8 @@
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoc=
onf.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf=
.patch
> index e3b0482..4fe73d0 100644
> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.pat=
ch
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/top-autoconf.pat=
ch
> @@ -4,6 +4,8 @@ S. This adds enough autoconf at the top level to allow it=
 to be
> =C2=A0called there - all it does is run a sub autoconf stuff in the src
> =C2=A0directory.
>
> +Upstream-Status: Inappropriate [build system specific change]
> +
> =C2=A0Index: rp-pppoe-3.8/Makefile.am
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0--- /dev/null =C2=A01970-01-01 00:00:00.000000000 +0000
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-co=
nfig.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-conf=
ig.patch
> index 5642e3c..3499f37 100644
> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.pa=
tch
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/update-config.pa=
tch
> @@ -6,6 +6,8 @@ The path for the plugin is wrong, it's now part of ppp an=
d is in a
> =C2=A0ppp's plugin lib directory. If no path is specified then that's whe=
re
> =C2=A0ppp looks, so that's what we do here.
>
> +Upstream-Status: Inappropriate
> +
> =C2=A0Index: rp-pppoe-3.8/configs/pppoe.conf
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0--- rp-pppoe-3.8.orig/configs/pppoe.conf =C2=A0 =C2=A0 =C2=A0 2006-=
04-03 00:29:41.000000000 +1000
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldfla=
gs.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.p=
atch
> index 1209631..da445b3 100644
> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patc=
h
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/use-ldflags.patc=
h
> @@ -1,3 +1,7 @@
> +Make the Makefile obey LDFLAGS.
> +
> +Upstream-Status: Unsubmitted

ditto

> +
> =C2=A0--- a/src/Makefile.in =C2=A02006-04-02 18:29:42.000000000 +0400
> =C2=A0+++ b/src/Makefile.in =C2=A02010-04-16 17:51:31.000000000 +0400
> =C2=A0@@ -67,16 +67,16 @@ all: $(TARGETS)
> diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb b/meta=
-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
> index 371d82e..673633a 100644
> --- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
> +++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
> @@ -1,12 +1,12 @@
> =C2=A0DESCRIPTION =3D "A user-mode PPPoE client and server suite for Linu=
x"
> -HOMEPAGE =3D "http://www.roaringpenguin.com/en/penguin/openSourceProduct=
s/rpPppoe"
> +HOMEPAGE =3D "http://www.roaringpenguin.com/products/pppoe"
> =C2=A0SECTION =3D "console/network"
> =C2=A0LICENSE =3D "GPLv2"
> =C2=A0LIC_FILES_CHKSUM =3D "file://doc/LICENSE;md5=3Da194eaefae2be54ee322=
1339b10d0581"
> =C2=A0RDEPENDS_${PN} =3D "ppp"
> =C2=A0RDEPENDS_${PN}-server =3D "${PN}"
> =C2=A0RRECOMMENDS_${PN} =3D "ppp-oe"
> -PR =3D "r7"
> +PR =3D "r8"
>
> =C2=A0SRC_URI =3D "http://www.roaringpenguin.com/files/download/${P}.tar.=
gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://top-autoconf.patch \
> @@ -14,7 +14,7 @@ SRC_URI =3D "http://www.roaringpenguin.com/files/downlo=
ad/${P}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pppoe-src-restrictions.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://update-config.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dont-swallow-errors.patch=
 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-ldflags.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://use-ldflags.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pppoe-server.default \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pppoe-server.init"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


