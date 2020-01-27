Return-Path: <obi@opendreambox.org>
Received: from relay.dream-property.net (relay.dream-property.net
	[178.19.67.222])
	by mail.openembedded.org (Postfix) with ESMTP id 61CCE7FE1D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:16:27 +0000 (UTC)
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 5F6E110045D5E;
	Mon, 27 Jan 2020 20:16:27 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de
	[176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id BCE28314001C;
	Mon, 27 Jan 2020 21:16:26 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org; 
	s=dkim; t=1580156186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=cPWMkrJ/SzJ6ZCfRa+iRojMSc+N87npWhsDwgvnXEu8=;
	b=rCTRU4pTBnob8OROd9D0HA4/NV2ObeX1yCWuk6Yu9t9X3Om131e+rcGXTa9hBcc4vxPE6b
	T9UEs/CsOT1q8mCw==
Date: Mon, 27 Jan 2020 21:16:18 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Message-ID: <20200127211618.28e763ec@opendreambox.org>
In-Reply-To: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/3] pcsc-lite: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 20:16:28 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Andrey,

On Mon, 27 Jan 2020 17:36:06 +0000
Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> From: Andrey Zhizhikin <andrey.z@gmail.com>
> 
> Update pcsc-lite recipe to target python3 since python2 is EOL and has
> been dropped from OE-Core.
> 
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> ---
>  .../0001-pcsc-spy-use-python3-only.patch      | 43 +++++++++++++++++++
>  .../pcsc-lite/pcsc-lite_1.8.26.bb             |  7 ++-
>  2 files changed, 48 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> 
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> new file mode 100644
> index 000000000..3e7b0adda
> --- /dev/null
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite/0001-pcsc-spy-use-python3-only.patch
> @@ -0,0 +1,43 @@
> +From 75dd98876951d86890ceb30be521de57fd31e3c7 Mon Sep 17 00:00:00 2001
> +From: Andrey Zhizhikin <andrey.z@gmail.com>
> +Date: Mon, 27 Jan 2020 13:27:12 +0000
> +Subject: [PATCH] pcsc-spy: use python3 only
> +
> +Python2 has been EOL and most distributions would not provide any
> +support for it anymore. Since Python3 is available in all distributions
> +now, switch pcsc-spy to use it exclusively.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> +---
> + src/spy/pcsc-spy | 9 ++-------
> + 1 file changed, 2 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/spy/pcsc-spy b/src/spy/pcsc-spy
> +index 85222c6..965138e 100755
> +--- a/src/spy/pcsc-spy
> ++++ b/src/spy/pcsc-spy
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/python
> ++#!/usr/bin/env python3
> + 
> + """
> + #    Display PC/SC functions arguments
> +@@ -22,12 +22,7 @@ from __future__ import print_function
> + import os
> + import signal
> + import time
> +-try:
> +-    # for Python3
> +-    from queue import Queue
> +-except ImportError:
> +-    # for Python2
> +-    from Queue import Queue
> ++from queue import Queue
> + from threading import Thread
> + from operator import attrgetter
> + 
> +-- 
> +2.17.1
> +

This patch would not have been necessary if we managed the python symlink with update-alternatives. I'm doing this in my layer. Maybe that would be a better way to go? I won't be able to build master in the next days or weeks, but if you want to try and submit it, here's what I have in my bbappends:

python_%.bbappend:

inherit update-alternatives

ALTERNATIVE_${PN}-core = "python"
ALTERNATIVE_TARGET[python] = "${bindir}/python2"
ALTERNATIVE_PRIORITY = "2"

do_install_append_class-target() {
    rm -f ${D}${bindir}/python
}

python3_%.bbappend:

inherit update-alternatives

ALTERNATIVE_${PN}-core = "python"
ALTERNATIVE_TARGET[python] = "${bindir}/python3"
ALTERNATIVE_PRIORITY = "3"

Best regards,
Andreas

