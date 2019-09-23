Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 698B47C426
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 15:16:50 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id u184so15800617qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b8Oh8kZEjYziLQHkgQbQ612i1tax9pxm6vH+vycUHUY=;
	b=b+LYz40O5v/rHhl2SS2CtQHyvBjc86oYsS2XO/qye75K89dmS/oDmkZuApHFl8thjK
	GTnHhNejJ0cZslglTrCOLaCFxvP8siAXsA6PE0/GgnU5jcrwAZYkukwnugmNmAkyM2ei
	s6dWmMMLTgxSB5E8Q9X7/NdN0oNK624QehrE54M+TQh3VhI7vt9DTxesMd0ZRST1Eki4
	ucu7TV/7XO6AZOY2tYP8nEwYSAOO9GCGemKRFVMcpKjax3rkpKDmJBND3ryKv6F8BYAE
	4vznncxIbjSc5OALaNeV/KkuqaZp/fHttPp/hJT7ajzRzoy1ewYXPya6xDr6Uja3mHCD
	rtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b8Oh8kZEjYziLQHkgQbQ612i1tax9pxm6vH+vycUHUY=;
	b=f9tGD6FA/0/4CCAsS+spUtZr05rTHIIOv5hHJblpZoCelR4XyClf9zNp+wlUcEtEFf
	RGPME7UnApBqCycg07JxRXESvNm4XMxyHsQE3gLSi36UPFP6nUIPC7pkYn4MAY8Q5B/y
	miVuTQyeXwk0IB73OIKH2zyXm2kQqkF0e7A1GvbNsCRum76bpaBGDAJD+GknWsAvQVhx
	UlbN/ecvT7qlB7yzfa9dwieh7nheoA1ULaFdxK70QYWknjfrzyieVDEakWmh2TpxtScb
	ipMLp4mEHwo/XeI//pqNJtGkzFZx9vvcxF6Y0pTl+qUvBGSLhGDlrWYYDROrCjCEEGaR
	I6jA==
X-Gm-Message-State: APjAAAXenr3co145kS7iWHMnTPP6daZn6zMzvNOvORYlFN/di2NhmWFZ
	AJxVhbpTX0QA/VTGPKP6tiHqY9hT00XM3coAjQLQe60oXxw=
X-Google-Smtp-Source: APXvYqwytxz9s3eFYdhC2Lpedlajtbxy9WMmbRhVuJFq0lHCXk5uwGfJLE0ILVE5KiJxvq47m5PteLeZn69PGMcmAkg=
X-Received: by 2002:a37:6651:: with SMTP id a78mr312688qkc.474.1569251810935; 
	Mon, 23 Sep 2019 08:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190922183431.32531-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190922183431.32531-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2019 08:16:24 -0700
Message-ID: <CAMKF1srN_ZimrRYjFk3=7J9VGi5Y31j37OfvEf5iDxwMupV1DA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] can-utils: bump to latest revision
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
X-List-Received-Date: Mon, 23 Sep 2019 15:16:51 -0000
Content-Type: text/plain; charset="UTF-8"

Fails for musl

https://errors.yoctoproject.org/Errors/Details/271693/

On Sun, Sep 22, 2019 at 11:35 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License header was moved due to SPDX-License-Identifier being added to
> the file.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 106 ------------------
>  .../socketcan/can-utils_git.bb                |   9 +-
>  2 files changed, 3 insertions(+), 112 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
>
> diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
> deleted file mode 100644
> index cbf3aee10..000000000
> --- a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -From 20981c8a328747f823b7eef68d0c2812b3eaed30 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 14 Jul 2019 21:50:43 +0200
> -Subject: [PATCH] fix include to find SIOCGSTAMP with latest kernel
> -
> -In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
> -the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
> -Instead it provides only SIOCGSTAMP_OLD.
> -
> -The linux/sockios.h header now defines SIOCGSTAMP using either
> -SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
> -header file is not pulled so we get a build failure.
> -
> -canlogserver.c: In function 'main':
> -canlogserver.c:404:21: error: 'SIOCGSTAMP' undeclared (first use in this function); did you mean 'SIOCGRARP'?
> -     if (ioctl(s[i], SIOCGSTAMP, &tv) < 0)
> -                     ^~~~~~~~~~
> -                     SIOCGRARP
> -canlogserver.c:404:21: note: each undeclared identifier is reported only once for each function it appears in
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
> -
> -Upstream-Status: Backport [https://github.com/linux-can/can-utils/commit/e9590b1ca75d360eaf3211bebd86058214d48064]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - canlogserver.c | 1 +
> - cansniffer.c   | 1 +
> - isotpdump.c    | 1 +
> - isotpperf.c    | 1 +
> - isotpsniffer.c | 1 +
> - slcanpty.c     | 1 +
> - 6 files changed, 6 insertions(+)
> -
> -diff --git a/canlogserver.c b/canlogserver.c
> -index e3350b7..f53165c 100644
> ---- a/canlogserver.c
> -+++ b/canlogserver.c
> -@@ -61,6 +61,7 @@
> -
> - #include <linux/can.h>
> - #include <linux/can/raw.h>
> -+#include <linux/sockios.h>
> - #include <signal.h>
> - #include <errno.h>
> -
> -diff --git a/cansniffer.c b/cansniffer.c
> -index 7b0a3fa..bf7d72e 100644
> ---- a/cansniffer.c
> -+++ b/cansniffer.c
> -@@ -61,6 +61,7 @@
> -
> - #include <linux/can.h>
> - #include <linux/can/bcm.h>
> -+#include <linux/sockios.h>
> -
> - #include "terminal.h"
> -
> -diff --git a/isotpdump.c b/isotpdump.c
> -index b2b650a..36d8af3 100644
> ---- a/isotpdump.c
> -+++ b/isotpdump.c
> -@@ -55,6 +55,7 @@
> -
> - #include <linux/can.h>
> - #include <linux/can/raw.h>
> -+#include <linux/sockios.h>
> - #include "terminal.h"
> -
> - #define NO_CAN_ID 0xFFFFFFFFU
> -diff --git a/isotpperf.c b/isotpperf.c
> -index db3a2b7..5852a57 100644
> ---- a/isotpperf.c
> -+++ b/isotpperf.c
> -@@ -56,6 +56,7 @@
> -
> - #include <linux/can.h>
> - #include <linux/can/raw.h>
> -+#include <linux/sockios.h>
> -
> - #define NO_CAN_ID 0xFFFFFFFFU
> - #define PERCENTRES 2 /* resolution in percent for bargraph */
> -diff --git a/isotpsniffer.c b/isotpsniffer.c
> -index f42e18b..d7a4c66 100644
> ---- a/isotpsniffer.c
> -+++ b/isotpsniffer.c
> -@@ -55,6 +55,7 @@
> -
> - #include <linux/can.h>
> - #include <linux/can/isotp.h>
> -+#include <linux/sockios.h>
> - #include "terminal.h"
> -
> - #define NO_CAN_ID 0xFFFFFFFFU
> -diff --git a/slcanpty.c b/slcanpty.c
> -index 431ca68..7dfaf5c 100644
> ---- a/slcanpty.c
> -+++ b/slcanpty.c
> -@@ -40,6 +40,7 @@
> -
> - #include <linux/can.h>
> - #include <linux/can/raw.h>
> -+#include <linux/sockios.h>
> -
> - /* maximum rx buffer len: extended CAN frame with timestamp */
> - #define SLC_MTU (sizeof("T1111222281122334455667788EA5F\r")+1)
> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
> index db5055fed..b674d7fc4 100644
> --- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
> +++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
> @@ -1,18 +1,15 @@
>  SUMMARY = "Linux CAN network development utilities"
>  DESCRIPTION = "Linux CAN network development"
>  LICENSE = "GPLv2 & BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a069ac1436553ee7"
> +LIC_FILES_CHKSUM = "file://include/linux/can.h;beginline=2;endline=44;md5=390a2c9a3c5e3595a069ac1436553ee7"
>
>  DEPENDS = "libsocketcan"
>
> -SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master \
> -           file://0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch \
> -           "
> -SRCREV = "4c8fb05cb4d6ddcd67299008db54af423f86fd05"
> +SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
> +SRCREV = "26ae1fffa8f290442882d3e59c7363cb371e2380"
>
>  PV = "0.0+gitr${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
>  inherit autotools pkgconfig
> -
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

