Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 942CC60111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 14:49:58 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f89so7123903qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2016 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=aQqrpbxeW0NqUT7bWMHt3PZ3eGxGeR8UYPH6t1+DLYc=;
	b=QwWT23SyzwpopnarSny3rkrGfDBtUBuQvK+gfXNnZGuNnpoC/1WPLnc2S8JZmEcfdV
	OquHPuM8Iz09tQ81cxy7x32r2nrEY7I3zAIBektl+zXqA5Eq868GEYw3nXeH7uFRd8E3
	7d77OEaaWgkymMzZpSSev53HLXCY25gi4hc9w+Zfo3i1RmD2/jDvaXBBPIDM1o7FOMsO
	dz5VTz6VrFefd09bWTwrDoUEo6uw3SsTLLswEvTeY5Kf0Ggn+c+e/m8crSxhp1XyABQR
	JQb4Bn67tWdcuQh+QqS65A7xkxITBEbZgO+77D9xMYz79H3YM/OiW3Aq8p/Q4pAiJnnp
	MwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=aQqrpbxeW0NqUT7bWMHt3PZ3eGxGeR8UYPH6t1+DLYc=;
	b=EicbJueSg3ZLHn2PyGaBivWOaRCienK6CGfoqRy/HqwfTJFTCaWsAUDs0NqmkOfh2a
	N8xTmIQDkI9IfLaN7BTEgCy2SdIhHxmiOsNUSc35KyWeYx1+dgBKVZlcrip36bv2VrPi
	gxzIi3huhILqOvo97SlI1Z8xYxkkCRGRPiNHYiY3rWk3p5dvxbzxAyLwNJAsAOQOMdcD
	XzdpK+DW1OrVbHSr0n/CKLM3sDPb9s1vIseUWr67rV988jxFPks1Y4iMIg316lyYO/kX
	/YJyGQoHXLg5gHXVGLmTR5Ned7D+oZRa9P01eysTFafJhnaZfDjiqRx8NCykcWBWcNzs
	b6Bg==
X-Gm-Message-State: ALyK8tKwucqYmGdQpBYoMaA4dSRnbAnB6DCWUm5ltoXBhzZIu4u8GhQGgRUjz3TgH7A2QvPiUbLT6lECbF/j0w==
X-Received: by 10.200.50.77 with SMTP id y13mr32799504qta.5.1467384598903;
	Fri, 01 Jul 2016 07:49:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 1 Jul 2016 07:49:29 -0700 (PDT)
In-Reply-To: <1467378824-13923-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1467378824-13923-1-git-send-email-fabio.berton@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2016 07:49:29 -0700
Message-ID: <CAMKF1so5SPCvuyiVXej2z3M2n+Z2uCskG7_2f5hdYZx+3JGS9w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] firefox: Fix build using gcc 6
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
X-List-Received-Date: Fri, 01 Jul 2016 14:49:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 1, 2016 at 6:13 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Append CFLAGS and CXXFLAGS to set work around code which gcc6 would
> otherwise regard as out-of-specification and allow it to produce a
> working program.
> Add patch to to correct the source to be compatible with gcc6 by
> preventing c++ scope errors.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  ...-source-to-be-compatible-with-gcc6-by-pre.patch | 29 ++++++++++++++++=
++++++
>  recipes-mozilla/firefox/firefox_38.8.0esr.bb       | 19 +++-----------
>  2 files changed, 33 insertions(+), 15 deletions(-)
>  create mode 100644 recipes-mozilla/firefox/firefox/fixes/Correct-the-sou=
rce-to-be-compatible-with-gcc6-by-pre.patch
>
> diff --git a/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-=
be-compatible-with-gcc6-by-pre.patch b/recipes-mozilla/firefox/firefox/fixe=
s/Correct-the-source-to-be-compatible-with-gcc6-by-pre.patch
> new file mode 100644
> index 0000000..643fef2
> --- /dev/null
> +++ b/recipes-mozilla/firefox/firefox/fixes/Correct-the-source-to-be-comp=
atible-with-gcc6-by-pre.patch
> @@ -0,0 +1,29 @@
> +From fd21526d36bd579f2a227b3add38bd615e59db5e Mon Sep 17 00:00:00 2001
> +From: Fabio Berton <fabio.berton@ossystems.com.br>
> +Date: Thu, 30 Jun 2016 16:57:00 -0300
> +Subject: [PATCH] Correct the source to be compatible with gcc6 by preven=
ting
> + c++ scope errors
> +Organization: O.S. Systems Software LTDA.
> +
> +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> +---
> + nsprpub/config/make-system-wrappers.pl | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/nsprpub/config/make-system-wrappers.pl b/nsprpub/config/mak=
e-system-wrappers.pl
> +index fa0873a..bf09583 100644
> +--- a/nsprpub/config/make-system-wrappers.pl
> ++++ b/nsprpub/config/make-system-wrappers.pl
> +@@ -19,7 +19,9 @@ while (<STDIN>) {
> +     open OUT, ">$output_dir/$_";
> +     print OUT "#pragma GCC system_header\n";  # suppress include_next w=
arning
> +     print OUT "#pragma GCC visibility push(default)\n";
> ++        print OUT "#define _GLIBCXX_INCLUDE_NEXT_C_HEADERS\n";
> +     print OUT "#include_next \<$_\>\n";
> ++        print OUT "#undef _GLIBCXX_INCLUDE_NEXT_C_HEADERS\n";
> +     print OUT "#pragma GCC visibility pop\n";
> +     close OUT;
> + }
> +--
> +2.1.4
> +
> diff --git a/recipes-mozilla/firefox/firefox_38.8.0esr.bb b/recipes-mozil=
la/firefox/firefox_38.8.0esr.bb
> index bd9b82c..94e5e04 100644
> --- a/recipes-mozilla/firefox/firefox_38.8.0esr.bb
> +++ b/recipes-mozilla/firefox/firefox_38.8.0esr.bb
> @@ -48,6 +48,7 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}/source/firefox
>             file://debian-hacks/Work-around-binutils-assertion-on-mips.pa=
tch \
>             file://debian-hacks/Revert-Bump-search-engine-max-icon-size-t=
o-35kB.patch \
>             file://fixes/Fix-firefox-install-dir.patch \
> +           file://fixes/Correct-the-source-to-be-compatible-with-gcc6-by=
-pre.patch \
>             "
>
>  SRC_URI[archive.md5sum] =3D "af46898414a433f8260c5373efb97d19"
> @@ -63,6 +64,9 @@ EXTRA_OEMAKE +=3D "installdir=3D${libdir}/${PN}"
>
>  ARM_INSTRUCTION_SET =3D "arm"
>
> +CFLAGS +=3D" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-sche=
dule-insns2"
> +CXXFLAGS +=3D" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-sc=
hedule-insns2"
> +

I am ok with this patch, however am curious why -fno-schedule-insn2 is need=
ed ?


>  do_install_append() {
>      install -d ${D}${datadir}/applications
>      install -d ${D}${datadir}/pixmaps
> @@ -105,18 +109,3 @@ PRIVATE_LIBS +=3D " \
>      libssl3.so \
>      libsoftokn3.so \
>  "
> -
> -# | i586-oe-linux-gcc  -m32 -march=3Di586 --sysroot=3D/home/jenkins/oe/w=
orld/shr-core/tmp-glibc/sysroots/qemux86 -o WebMElement.o -c
> -#  -I../../dist/system_wrappers -include /home/jenkins/oe/world/shr-core=
/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/config/gcc=
_hidden.h -DMOZ_GLUE_IN_PROGRAM -DAB_CD=3Den-US -DNO_NSPR_10_SUPPORT
> -#  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefo=
x/38.7.1esr-r0/mozilla-esr38/media/libmkv -I.
> -#  -I../../dist/include   -I/home/jenkins/oe/world/shr-core/tmp-glibc/wo=
rk/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/=
include/nspr -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux=
/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nss
> -#  -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/incl=
ude/pixman-1   -fPIC   -include ../../mozilla-config.h -DMOZILLA_CLIENT -MD=
 -MP -MF .deps/WebMElement.o.pp  -Wall -Wdeclaration-after-statement -Wempt=
y-body -Wpointer-to-int-cast -Wsign-compare -Wtype-limits -Wno-unused -Wcas=
t-align -Os -fsigned-char -fno-strict-aliasing -std=3Dgnu99 -fgnu89-inline =
-fno-strict-aliasing -fno-math-errno -pthread -pipe  -DNDEBUG -DTRIMMED -fr=
eorder-blocks -Os -fomit-frame-pointer     /home/jenkins/oe/world/shr-core/=
tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmk=
v/WebMElement.c
> -# | In file included from ../../../dist/system_wrappers/stdlib.h:3:0,
> -# |                  from ../../../dist/include/mozilla/mozalloc.h:15,
> -# |                  from ../../../dist/stl_wrappers/cstdlib:39,
> -# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work=
/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/inc/Mai=
n.h:29,
> -# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work=
/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/CmapCac=
he.cpp:28,
> -# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work=
/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/gfx/gra=
phite2/src/Unified_cpp_gfx_graphite2_src0.cpp:11:
> -# | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/inclu=
de/c++/6.1.1/stdlib.h:38:12: error: 'std::abort' has not been declared
> -# |  using std::abort;
> -PNBLACKLIST[firefox] ?=3D "BROKEN: fails to build with gcc-6"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

