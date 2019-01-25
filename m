Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8AECD7C316
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 01:51:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l12so9092849qtf.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 17:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JjGuvwgcEGRVUEa2s2qvvnTpK6i8H1opw7PUbKbABmc=;
	b=CrWy+xWK9o9g0wMVa/RGvlYr4BMmNo1NO/gaoJ3KkgoLu8cT90eUs9ehKzcdo8CD2o
	v8TFxVovIaQMMb5eoCIkoRMcGg3oHO72jr+RJO/wblqS6etovbeCDyRdGIQG7Jy9JdZo
	wpASFcUgI2KMbPBgEQkWU/OYGSuI5uJ0N0pOQQQsd1juAwgA965NE7BkngNK0ueiJpIJ
	JlyfTxbTWQbpUN9Na6zFaxKqBM4jMspQJPeR2oxJWUYllsFB2zWxqWwHq6nTAetF3gq2
	V7nlUFEszkO/+xajynyX5BQVNiK1q7rQKAonF8kAZlfz3v2dZJWMe8fLCdtLJh7K9HcB
	s5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JjGuvwgcEGRVUEa2s2qvvnTpK6i8H1opw7PUbKbABmc=;
	b=eeiad0OBxv2mkGTyr+Dg9p8dIlVwFbz0SyAHd4m4IhJo0BJ/cXr8wYQHF+WEa2J7Is
	oOEtkUaSEHrcB8CI3A9uBRKCg2u7G4WsVyFO+7IRRnfRU4aep+ewaF6frqppJDrZlTpI
	KjbzLZoviU9MUikmE8NF3sGrtpyQIVfvjut74EoOE5a7BOvBlTiWabHS7qxezOi+OAm8
	hO6uOzjA0keYqOkysM/Qw43O/y69Ptzy2+1ODkke5TBMr9q1o7zTyJKEjUB/E8BM3X61
	uBKRHaRcgq4wFchCCO9pBeOSronf8bOkeBPD+as4tASTwqc4WsmQuJbmPDHQc41zs83/
	ebqg==
X-Gm-Message-State: AJcUukeFf68yoGaQfOEKsdKkZfRIELr/f0B65XPrBoMgM/jvyzTDzEsP
	shKTYl2MuRW3aFrbkGKVUDW1UZcKGRzzW643XI4=
X-Google-Smtp-Source: ALg8bN6fRo0LwAfW5kPd6iO4FilgJXHJokV+etaQ1DQl9+qOEBSVMwrmWs14TG4YM10WZMKDv6Ps2/tTPq4gmOhIRho=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr8992249qtc.236.1548381080985; 
	Thu, 24 Jan 2019 17:51:20 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOKAJbq++7QHCU_qOSgDiQWLYusfD9P02Xk8r=a3XpPMkQ@mail.gmail.com>
In-Reply-To: <CAGvkhOKAJbq++7QHCU_qOSgDiQWLYusfD9P02Xk8r=a3XpPMkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2019 20:50:54 -0500
Message-ID: <CAMKF1sq2DJqHw07SqC9GBntZzi7HsYoiif7M2aOML-mXt_N5ZQ@mail.gmail.com>
To: Glenn Stroz <gstroz@uber.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] libqmi: Update to 1.22.0
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
X-List-Received-Date: Fri, 25 Jan 2019 01:51:20 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Glenn

Thanks for patch but it does not apply,

Applying: libqmi: Update to 1.22.0
error: corrupt patch at line 56
Patch failed at 0001 libqmi: Update to 1.22.0

Can you generate this patch on top of master and
use git format-patch to generate the patch and resend it

On Thu, Jan 24, 2019 at 5:57 PM Glenn Stroz via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
>
> Signed-off-by: Glenn Stroz <gstroz@uber.com>
> ---
>  ...t-create-invalid-wds-start-network-w.patch | 41 -------------------
>  .../{libqmi_1.20.2.bb => libqmi_1.22.0.bb}    |  6 +--
>  2 files changed, 3 insertions(+), 44 deletions(-)
>  delete mode 100644
> meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
>  rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.20.2.bb =>
> libqmi_1.22.0.bb} (78%)
>
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
> b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
> deleted file mode 100644
> index d230d6803..000000000
> --- a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 8269f4d86927fbe19e78776a12736680fe9169b6 Mon Sep 17 00:00:00 2001
> -From: Adrian Bunk <bunk@stusta.de>
> -Date: Mon, 1 Oct 2018 16:53:31 +0300
> -Subject: [PATCH] qmi-network: Don't create invalid --wds-start-network when
> - APN is not set
> -
> -In 1.20.2 the warning for this was turned into an error.
> -
> -(cherry picked from commit 289d8ad6419895e2e1fba3d78a54a0db65da521d)
> ----
> -Upstream-Status: Backport
> -
> - utils/qmi-network.in | 12 +++++++-----
> - 1 file changed, 7 insertions(+), 5 deletions(-)
> -
> -diff --git a/utils/qmi-network.in b/utils/qmi-network.in
> -index bf7bed9..a9e5299 100755
> ---- a/utils/qmi-network.in
> -+++ b/utils/qmi-network.in
> -@@ -334,11 +334,13 @@ start_network ()
> -
> -     setup_data_format
> -
> --    START_NETWORK_ARGS="apn='$APN'"
> --    if [ -n "$APN_USER" ]; then
> --        START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
> --        if [ -n "$APN_PASS" ]; then
> --            START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
> -+    if [ -n "$APN" ]; then
> -+        START_NETWORK_ARGS="apn='$APN'"
> -+        if [ -n "$APN_USER" ]; then
> -+            START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
> -+            if [ -n "$APN_PASS" ]; then
> -+
> START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
> -+            fi
> -         fi
> -     fi
> -
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
> b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
> similarity index 78%
> rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
> rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
> index f0bc81cc9..c15dfb472 100644
> --- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
> +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
> @@ -12,12 +12,12 @@ DEPENDS = "glib-2.0 glib-2.0-native"
>  inherit autotools pkgconfig bash-completion
>
>  SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
> -           file://0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
> \
>             file://0001-Detect-clang.patch \
>             "
> -SRC_URI[md5sum] = "584214476ab75c394160cb85fbccaa1d"
> -SRC_URI[sha256sum] =
> "c73459ca8bfe1213f8047858d4946fc1f58e164d4f488a7a6904edee25e2ca44"
> +SRC_URI[md5sum] = "35f7e1b03f9b6218a30c78422f72c6ac"
> +SRC_URI[sha256sum] =
> "21c198b481f1617bb7edb1960d823569de3e38b269dbf513af1b56048cafaa17"
>
>  PACKAGECONFIG ??= "udev mbim"
>  PACKAGECONFIG[udev] = ",--without-udev,libgudev"
>  PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
> +
> --
> 2.20.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

