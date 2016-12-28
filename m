Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id E457271987
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 23:25:50 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 96so14575388uaq.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 15:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=27Ds2cK0e8EveUeWk2KVPHghx3VKsWkBDAEo8CkMSnI=;
	b=jldH5soaP5mEDOrvTKVXvjSfT2m1V7j+0sQPOHB1peKCA/5LvIloM4msgrPdA/fJ0K
	ed4vZdyJ0fev2xvbuad0Y7tY9XUuNgmRNXZfvCdzU5r9v0Psgm/rrRugw/Qh8s4zrzOB
	bCHvd2TamlaI+GMQZzipJutYMu5BGwVkbeskA2sOjPRiK67Z+FGc9u4uMQ/9xKajPF1Y
	+YEbPKmiS+gcUaVGPPHG57sDy9s83Vr2Fm2Un4K3JvvmvJtmAODhU0QQA8WCXRzYXdkw
	0qnuDeCoRNJJ7U/eNLCik+H2RHK3UWTA5T9qJAJ8jiKq1cBTgM8LL391QFxcvq27KMJv
	V93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=27Ds2cK0e8EveUeWk2KVPHghx3VKsWkBDAEo8CkMSnI=;
	b=gWO0C+FJkJUR4/qHbhs548wTSKSrs7GwICQ2X2X82shiZczNNWW9HnZVv8LjpR+xGC
	ZRLUl+WoY+kEELdrRIlA9/lAF13vTtFRu5/F/traYsroSE/HhHzZWKx2GsuHAJqyS7wg
	Mw+99wjPV599Z96sZ45vDfW9cSVqV7BFLEQhFSpQuj/AYH/V3ZHSVhTf+zCjFfHcFE0C
	Yj2y2kH3owTxX0I5MStI+7F7uRr/fCFCFKCOVJTVCY364PQC1ymPMz8DoXGSOL2AZPE6
	BOXOh+5Jm3EfM+v0hYldiKSeKL31O9d/2fZiy6Dzt2AhBf8Pm7AO6uYU4SBQmIutp3vy
	usnQ==
X-Gm-Message-State: AIkVDXIDukSh74R7AJPliIwdIQbUkq6jrKbqdyjej283zPnH9SZr1QvgDgsBXDH3Ca86dIh0kh0WJrE+6ibJrw==
X-Received: by 10.159.48.147 with SMTP id j19mr26160411uab.6.1482967551747;
	Wed, 28 Dec 2016 15:25:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 28 Dec 2016 15:25:21 -0800 (PST)
In-Reply-To: <1482949868-19842-1-git-send-email-moritz.fischer@ettus.com>
References: <1482949868-19842-1-git-send-email-moritz.fischer@ettus.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Dec 2016 15:25:21 -0800
Message-ID: <CAMKF1sprcT_VSdif3q8v78awE4Zv4FO6gdgdA1=WL=085ijVYA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: mdf@kernel.org, philip@opensdr.com
Subject: Re: [PATCH] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 28 Dec 2016 23:25:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 28, 2016 at 10:31 AM, Moritz Fischer
<moritz.fischer@ettus.com> wrote:
> Add a recipe to build 'ectool', a utility to interact with the embedded
> controller on Google's Chromebooks (and other platforms using it).
>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  .../chromium-utils/chromium-utils.bb               | 26 ++++++++++++++++++++++
>  .../0001-build-Add-HOST_LDFLAGS.patch              | 26 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-devtools/chromium-utils/chromium-utils.bb
>  create mode 100644 meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch
>
> diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils.bb b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
> new file mode 100644
> index 0000000..c351717
> --- /dev/null
> +++ b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Chromium EC utilities"
> +DEPENDS = "libftdi"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=562c740877935f40b262db8af30bca36"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

this is probably not needed. Move the files to pre-defined search
paths e.g. files/

> +
> +SRCREV = "b19bb1f22a3fd0102030485d324c0321a18827e8"
> +SRC_URI = "git://chromium.googlesource.com/chromiumos/platform/ec;protocol=https \
> +           file://0001-build-Add-HOST_LDFLAGS.patch \
> +         "
> +
> +PV="1.1.9999-${SRCPV}"

why minus ? usually we say 1.1.9999+${SRCPV}

> +
> +S = "${WORKDIR}/git"
> +
> +do_compile() {
> +       oe_runmake HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS}" HOST_LDFLAGS="${LDFLAGS}" utils
> +}
> +
> +do_install() {
> +       install -m 0755 -d ${D}${bindir}
> +       install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir}/ectool
> +}
> +
> +FILES_${PN} = "${bindir}"

this should not be needed.

> diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch b/meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch
> new file mode 100644
> index 0000000..46e8cad
> --- /dev/null
> +++ b/meta/recipes-devtools/chromium-utils/chromium-utils/0001-build-Add-HOST_LDFLAGS.patch
> @@ -0,0 +1,26 @@
> +From 56ffeeffea735a6a8f69fc111278ebabe3c7e2d8 Mon Sep 17 00:00:00 2001
> +From: Moritz Fischer <moritz.fischer@ettus.com>
> +Date: Tue, 27 Dec 2016 22:24:07 -0800
> +Subject: [PATCH] build Add HOST_LDFLAGS
> +
> +Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> +---
> + Makefile.rules | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.rules b/Makefile.rules
> +index 404454d..0057ba9 100644
> +--- a/Makefile.rules
> ++++ b/Makefile.rules
> +@@ -60,7 +60,7 @@ cmd_c_to_build = $(BUILDCC) $(BUILD_CFLAGS) \
> +                $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c)) $*.c) \
> +                $(BUILD_LDFLAGS) \
> +                -MMD -MF $@.d -o $@
> +-cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) -MMD -MF $@.d  -o $@ \
> ++cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -MMD -MF $@.d  -o $@ \
> +                $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c)) $*.c)
> + cmd_cxx_to_host = $(HOSTCXX) -std=c++0x $(COMMON_WARN) $(HOST_CXXFLAGS)\
> +       -I ./$($(notdir $@)_ROOT) -o $@ $(filter %.cc,$^) $($(notdir $@)_LIBS)
> +--
> +2.4.11
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

