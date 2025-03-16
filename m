Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251BBC35FF7
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:25 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.39878.1742165715790282342
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MCiTtNsO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250316225517d7ace2ac3092bc238a-konfmm@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250316225517d7ace2ac3092bc238a
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=g0a+T6A9MMgIrCjUSNmsBZbvnjVhUtouujHZSHuutfs=;
 b=MCiTtNsOiLiSIseS7r2T1cYAhm0y0vChKc8AHTIIB1jzHcl0vwTBcedIMcCDR4GWljwtsq
 pV/ns4X2O32igxBKJwjzgzs6cme3Sj/Go1b6EZbX181JLZOeZsG7ZR+kJENVFcttH/iAM5MN
 ghhg4B3TLfFMaHMYbO4jvFGgbFnJxMF7s8W7VDhZMGxxmeL0GtKM8haeslXTQm6RhGnewVZe
 o85jA1+kdZWO9MZ8m0tKc5gA0KPOVKQpKQJucGC2IFmErdAyWegItC1DT3KOUIl8GVDNFZ3N
 a+Q+akehgLK5YbgRMVXacCUagBXxhmxeOgLzBpFTUW0qsThWDb2DX+cA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 07/12] sox: patch CVE-2021-33844
Date: Sun, 16 Mar 2025 23:53:53 +0100
Message-Id: <20250316225358.2816208-7-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116012

From: Peter Marko <peter.marko@siemens.com>

Use patch from Debian:
https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2021-33844.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sox/sox/CVE-2021-33844.patch              | 40 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-33844.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-33844.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-33844.patch
new file mode 100644
index 0000000000..02c3edb35d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-33844.patch
@@ -0,0 +1,40 @@
+From f2597e433afeee8ab00cf6368ec8519df34aa031 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sun, 16 Mar 2025 23:19:43 +0100
+Subject: [PATCH] wav: reject 0 bits per sample to avoid division by zero
+
+Source: https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2021-33844.patch
+
+CVE: CVE-2021-33844
+Upstream-Status: Inactive-Upstream [lastrelease: 2015]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/testall.sh | 1 +
+ src/wav.c      | 5 +++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/testall.sh b/src/testall.sh
+index e7398377..e1454c21 100755
+--- a/src/testall.sh
++++ b/src/testall.sh
+@@ -67,3 +67,4 @@ t voc
+ t vox -r 8130
+ t wav
+ t wve
++t wav -e gsm-full-rate
+diff --git a/src/wav.c b/src/wav.c
+index 3f6beb45..16f0bff8 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -963,6 +963,11 @@ static int startread(sox_format_t *ft)
+ #endif
+     }
+ 
++    if (ft->encoding.bits_per_sample == 0)
++    {
++        lsx_fail_errno(ft, SOX_EHDR, "WAV file bits per sample is zero");
++        return SOX_EOF;
++    }
+     if (!wav->numSamples)
+         wav->numSamples = div_bits(qwDataLength, ft->encoding.bits_per_sample)
+             / ft->signal.channels;
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index bfa1d9c2d4..18ca7d504d 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
            file://CVE-2021-3643_CVE-2021-23210.patch \
            file://CVE-2021-23159_CVE-2021-2317.patch \
+           file://CVE-2021-33844.patch \
            "
 
 # last release was in 2015, use latest hash from 2024-05-30

