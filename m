Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 36F8B719AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:10:40 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 50so25156672uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=XD98YMHwbDw/RoRlGlZUMfkqAmAB5T8MqmqPUOy4vyE=;
	b=YZrCiqMMoVejuriPS2Rc9ZvFM0VPgSOUjwLYOFmcc9CO61cidXI1DnwJH73zGBi1Kb
	xYuCZWcxsYAHcg/mUZRUXhyaahbpcpyd6ON/H9E0YLxkF9sbSzO/W8qdisa8Lwr2+9Tg
	W8jMiV0q5LZMn+qxrcaZErIX9e/8Sq1+6kt+BZKtSLVZ/26Af659klZuLGKKkIjSjxbT
	WJhnDr8NSDiSfjnNtiQ+ITQkFSCUMzpY3pM3r63jECGGMz+BUT1qgmu/Nep7t8H36gpl
	eR6Bjovumpsi0EJaQmURTzAc+xoaTwnZv+fJ6B/wszrX01m4pt1vFcwzPgloMUQULQIT
	1X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=XD98YMHwbDw/RoRlGlZUMfkqAmAB5T8MqmqPUOy4vyE=;
	b=PdR5HkEL6RJ01Mc73mghzuPNorv3/6NkmBwYow7bXBDHelRlvdROUvxk6yAY3uYAQ8
	56hcXYiTQIQR5BopMj63nUspiXAdAW5MYNO9HI+PVgdKyIthrYuNE0TcLF2FikuKT+1M
	n3imZw97lQasOL1vbukLLD075wIbe1t0XZEAI857Gcr7s7SUYWUJU+a8E13FTxPsNZl1
	Q20pPubKnDsNq/Otc1bWu28j++atb/M55Ow5xjzlVc4FuaTr6Qn3qG0CBXtYQqxd0em8
	NB+qPzBQ5RxSYhc0PRSiep3wLFUHk3kYsIPWelcNq+gmzUG1QImB+RNDmOH4oHr4fX2v
	ThNw==
X-Gm-Message-State: AKaTC03rNatZ38g6gnhoOqkHhxO99wZjj6rQipLU9loXj0akFEntILLF4kZGw+i5IODCu17jyFKo1+P8XM+LBA==
X-Received: by 10.176.5.130 with SMTP id e2mr7227277uae.108.1479730242069;
	Mon, 21 Nov 2016 04:10:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Mon, 21 Nov 2016 04:10:41 -0800 (PST)
In-Reply-To: <1478562596-4919-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478562596-4919-1-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 21 Nov 2016 13:10:41 +0100
Message-ID: <CALbNGRTyHRkJfgu85sTpdod3SmP=gs_HGgpPGMOg_nxLfFCQDw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] glmark: update to latest sources
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
X-List-Received-Date: Mon, 21 Nov 2016 12:10:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2016 at 12:49 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> With mesa 13.0.0 glmark-es2 crashed at the terrain part. This bug was fix=
ed in
> the latest commit. See further details at [1].
>
> [1] https://github.com/glmark2/glmark2/issues/25
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...uild-error-due-missing-space-before-macro.patch | 27 ----------
>  .../files/Fix-deprecated-declarations.patch        | 61 ----------------=
------
>  ...-packages-to-be-used-by-the-enabled-flavo.patch |  6 +--
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   | 14 ++---
>  4 files changed, 10 insertions(+), 98 deletions(-)
>  delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/Fix-build-err=
or-due-missing-space-before-macro.patch
>  delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/Fix-deprecate=
d-declarations.patch
>
> diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-=
missing-space-before-macro.patch b/meta-oe/recipes-benchmark/glmark2/files/=
Fix-build-error-due-missing-space-before-macro.patch
> deleted file mode 100644
> index 00eb2ed..0000000
> --- a/meta-oe/recipes-benchmark/glmark2/files/Fix-build-error-due-missing=
-space-before-macro.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 3fb9b6aeed2e2758239e59ba9ba1ca98535fe510 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Fri, 19 Aug 2016 15:08:44 +0000
> -Subject: [PATCH] Fix build error due missing space before macro
> -Organization: O.S. Systems Software LTDA.
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - src/native-state-x11.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/native-state-x11.cpp b/src/native-state-x11.cpp
> -index 3b66b77..3c1703b 100644
> ---- a/src/native-state-x11.cpp
> -+++ b/src/native-state-x11.cpp
> -@@ -60,7 +60,7 @@ NativeStateX11::display()
> - bool
> - NativeStateX11::create_window(WindowProperties const& properties)
> - {
> --    static const char *win_name("glmark2 "GLMARK_VERSION);
> -+    static const char *win_name("glmark2 " GLMARK_VERSION);
> -
> -     if (!xdpy_) {
> -         Log::error("Error: X11 Display has not been initialized!\n");
> ---
> -2.1.4
> -
> diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-decla=
rations.patch b/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-decl=
arations.patch
> deleted file mode 100644
> index 7a25de7..0000000
> --- a/meta-oe/recipes-benchmark/glmark2/files/Fix-deprecated-declarations=
.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -Index: git/src/image-reader.cpp
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/image-reader.cpp      2016-07-29 16:17:51.000000000 -05=
00
> -+++ git/src/image-reader.cpp   2016-07-29 16:18:43.000000000 -0500
> -@@ -120,7 +120,7 @@
> -
> -     Log::debug("Reading PNG file %s\n", filename.c_str());
> -
> --    const std::auto_ptr<std::istream> is_ptr(Util::get_resource(filenam=
e));
> -+    const std::unique_ptr<std::istream> is_ptr(Util::get_resource(filen=
ame));
> -     if (!(*is_ptr)) {
> -         Log::error("Cannot open file %s!\n", filename.c_str());
> -         return false;
> -Index: git/src/libmatrix/shader-source.cc
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/libmatrix/shader-source.cc    2016-07-29 16:18:14.00000=
0000 -0500
> -+++ git/src/libmatrix/shader-source.cc 2016-07-29 16:18:43.000000000 -05=
00
> -@@ -34,7 +34,7 @@
> - bool
> - ShaderSource::load_file(const std::string& filename, std::string& str)
> - {
> --    std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
> -+    std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
> -     std::istream& inputFile(*is_ptr);
> -
> -     if (!inputFile)
> -Index: git/src/model.cpp
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/model.cpp     2016-07-29 16:18:00.000000000 -0500
> -+++ git/src/model.cpp  2016-07-29 16:18:43.000000000 -0500
> -@@ -361,7 +361,7 @@
> -
> -     Log::debug("Loading model from 3ds file '%s'\n", filename.c_str());
> -
> --    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource=
(filename));
> -+    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resour=
ce(filename));
> -     std::istream& input_file(*input_file_ptr);
> -
> -     if (!input_file) {
> -@@ -681,7 +681,7 @@
> - {
> -     Log::debug("Loading model from obj file '%s'\n", filename.c_str());
> -
> --    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource=
(filename));
> -+    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resour=
ce(filename));
> -     std::istream& inputFile(*input_file_ptr);
> -     if (!inputFile)
> -     {
> -Index: git/src/scene-jellyfish.cpp
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/scene-jellyfish.cpp   2016-07-29 16:18:08.000000000 -05=
00
> -+++ git/src/scene-jellyfish.cpp        2016-07-29 16:18:43.000000000 -05=
00
> -@@ -272,7 +272,7 @@
> - {
> -     Log::debug("Loading model from file '%s'\n", filename.c_str());
> -
> --    const std::auto_ptr<std::istream> input_file_ptr(Util::get_resource=
(filename));
> -+    const std::unique_ptr<std::istream> input_file_ptr(Util::get_resour=
ce(filename));
> -     std::istream& inputFile(*input_file_ptr);
> -     if (!inputFile)
> -     {
> diff --git a/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages=
-to-be-used-by-the-enabled-flavo.patch b/meta-oe/recipes-benchmark/glmark2/=
files/build-Check-packages-to-be-used-by-the-enabled-flavo.patch
> index ff13329..72b8deb 100644
> --- a/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-=
used-by-the-enabled-flavo.patch
> +++ b/meta-oe/recipes-benchmark/glmark2/files/build-Check-packages-to-be-=
used-by-the-enabled-flavo.patch
> @@ -18,9 +18,9 @@ index cab62a3..e7eaed0 100644
>  --- a/wscript
>  +++ b/wscript
>  @@ -121,13 +121,17 @@ def configure(ctx):
> -                 ('mirclient','mirclient', '0.13', list_contains(Options=
.options.flavors, 'mir')),
> -                 ('wayland-client','wayland-client', None, list_contains=
(Options.options.flavors, 'wayland')),
> -                 ('wayland-egl','wayland-egl', None, list_contains(Optio=
ns.options.flavors, 'wayland'))]
> +                 ('mirclient','mirclient', '0.13', list_contains(ctx.opt=
ions.flavors, 'mir')),
> +                 ('wayland-client','wayland-client', None, list_contains=
(ctx.options.flavors, 'wayland')),
> +                 ('wayland-egl','wayland-egl', None, list_contains(ctx.o=
ptions.flavors, 'wayland'))]
>  -    for (pkg, uselib, atleast, mandatory) in opt_pkgs:
>  +    for (pkg, uselib, atleast, check) in opt_pkgs:
>  +        # Check packages required by the flavors
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/r=
ecipes-benchmark/glmark2/glmark2_git.bb
> index a2558a7..e8ccf37 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -12,13 +12,13 @@ DEPENDS =3D "libpng12 jpeg"
>
>  PV =3D "2014.03+${SRCPV}"
>
> -SRC_URI =3D "git://github.com/glmark2/glmark2.git;protocol=3Dhttps \
> -           file://build-Check-packages-to-be-used-by-the-enabled-flavo.p=
atch \
> -           file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_w=
ind.patch \
> -           file://Fix-build-error-due-missing-space-before-macro.patch \
> -           file://Fix-configure-for-sqrt-check.patch \
> -           file://Fix-deprecated-declarations.patch"
> -SRCREV =3D "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
> +SRC_URI =3D " \
> +    git://github.com/glmark2/glmark2.git;protocol=3Dhttps \
> +    file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
> +    file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.pat=
ch \
> +    file://Fix-configure-for-sqrt-check.patch \
> +"
> +SRCREV =3D "f413c5b423250b4fde8f95639ad368d5b02c5b9b"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.5.5
>

ping

