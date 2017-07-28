Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC74783D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 03:49:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 184so25872351wmo.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 20:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hvaqW373CgFqKN0qK83XkszelentdWo+MEjbTh3IToc=;
	b=cxsSVjKA17CGnl2m9+si03SPZoFRHRrwmEwwuUvdfA1/hQ3+vdxgzk8XC3355a6Pps
	4GbRijwFBMtonT+pWB+oVJpKbAdBKaWwkq/5wHPYnv11+yOeRmVWW9jVn1N4/B+LrNYX
	dTIvtkBvlKCmPNdx6kVmVAFYOZKgpiHd5bxCioc7bVxiWRnKQ+Dz6/LfcGKoGRpx9ukT
	lgLmZRmpe9+xjX01r+4bjBOAtizMldQul0V/tPuKfuEaVbrUPXpxwJDLskxKd3eqL/kO
	kIPcQOINX/Vlr3qfyUhrmaGiyF1nRpo2+IqKH7FanBAZW6xYrcPirvEYDC3tsrxBN3YD
	UsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hvaqW373CgFqKN0qK83XkszelentdWo+MEjbTh3IToc=;
	b=LQ1u4z4l/zhRLqHJxDG0ZqfYUE1Chy0lj8lCx1ElcNGlLQ/5DyfUbbm27O3sLdO9Gi
	Zti6HkO7OMCUcZ1CrDewmwwGjEd54yWoiUkzbSO4+hZVrNoF0mJ7CqgfnJwnGAYsC9wA
	wJNGeqey0fDD7NC5T1GJR5bt5wVxBx0WZFGaYHwxtzVGYn99fN2CUjz07Rb6FycV30zV
	QXZ1WUqu9wxznwZ4coolcbmA0lmStYHUJ1kHcWzvZ3v34yMM4EnVwvyjqrpFSUNmG1Mk
	uuDW055pLTazf3kk/qfhyOu6U6gOXdkmxqMmVdlYxGsxkEMnO4wMXZehJ8KN8u5FGwEz
	6trQ==
X-Gm-Message-State: AIVw1136bSHwq9s2eCP7w7QJLgHDOjzcYKuDGv6vDWwdg36UEustL4Az
	XCEMYmv2/7zZI8cpVgW66thE/vXeGg==
X-Received: by 10.80.145.38 with SMTP id e35mr5626617eda.8.1501213793759; Thu,
	27 Jul 2017 20:49:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Thu, 27 Jul 2017 20:49:23 -0700 (PDT)
In-Reply-To: <20170728032804.11300-1-kai.kang@windriver.com>
References: <20170728032804.11300-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jul 2017 20:49:23 -0700
Message-ID: <CAMKF1spLk6xU==AvhR9yKyGz2bHnOH7wobKZA+d0G-0KkSSRdg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] assimp: remove recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 03:49:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 27, 2017 at 8:28 PM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Remove recipe of assimp which exists in oe-core.
>
> * Patch 0001-Fix-build-on-big-endian-architectures.patch has been merged
>   in 4.0.0
> * Dependencies 'boost' and 'virtual/libgl' are dropped which needded by
>   ASSIMP_BUILD_SAMPLES but ASSIMP_BUILD_SAMPLES is disabled by default
> * Sync up other parts such as DESCRIPTION with the recipe in oe-core
>

this is ok.

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...001-Fix-build-on-big-endian-architectures.patch | 29 ----------------------
>  meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb    | 18 --------------
>  2 files changed, 47 deletions(-)
>  delete mode 100644 meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
>  delete mode 100644 meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb
>
> diff --git a/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch b/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
> deleted file mode 100644
> index c94bb3d..0000000
> --- a/meta-oe/recipes-graphics/assimp/assimp/0001-Fix-build-on-big-endian-architectures.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 614475dcac1cee4d63b764282c578672bc060321 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 29 Jun 2017 14:23:00 -0700
> -Subject: [PATCH] Fix build on big-endian architectures
> -
> -see
> -https://github.com/assimp/assimp/pull/986
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - code/glTFAsset.inl | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/code/glTFAsset.inl b/code/glTFAsset.inl
> -index d52c825c..470246c9 100644
> ---- a/code/glTFAsset.inl
> -+++ b/code/glTFAsset.inl
> -@@ -40,6 +40,8 @@ OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -
> - #include "StringUtils.h"
> -
> -+using namespace Assimp;
> -+
> - namespace glTF {
> -
> - namespace {
> ---
> -2.13.2
> -
> diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb b/meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb
> deleted file mode 100644
> index 064683a..0000000
> --- a/meta-oe/recipes-graphics/assimp/assimp_3.3.1.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION = "Open Asset Import Library is a portable Open Source library to import \
> -               various well-known 3D model formats in a uniform manner."
> -HOMEPAGE = "http://www.assimp.org/"
> -SECTION = "devel"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4cd8c0aedc7a0623476669377d7eeda8"
> -
> -DEPENDS = "boost virtual/libgl"
> -
> -SRCREV = "a8673d4828df5107186f49e5e4efa5316b727482"
> -SRC_URI = "git://github.com/assimp/assimp \
> -           file://0001-Fix-build-on-big-endian-architectures.patch \
> -           "
> -S = "${WORKDIR}/git"
> -
> -inherit cmake
> -
> -FILES_${PN}-dev += "${libdir}/cmake"
> --
> 2.10.1
>

