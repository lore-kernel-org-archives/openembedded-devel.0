Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEB0C35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:25 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.39878.1742165715790282342
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bvmNjw1j;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202503162255130a29a230fc8fcb47a7-rlmnnb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202503162255130a29a230fc8fcb47a7
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FgQ/8u6KCEDBlvSekJafVZLK3ZjHID6b0PS7vSLCGpw=;
 b=bvmNjw1jKATJM1dRoRih7Sh9SaLCuITamGoexZqqkDQGfP7z8tMBs5U/A7ugLQmG0NnXrk
 91Vq567zUq7jNuy9wDrzKA2A3jRoBEoL9ZkzDMAK9no/eCeLWxJDO/sjRXal8cd90y72uJmO
 c9Awbsp1yfe51Tzh0syr9JKJ9N5Kk4tR3ZB3QmQTyyS1PEKudsvSh06bKSJKTvPFEhRPp1E1
 shsXyQ41AnNQfvYUEl2UNRPXaxxlMS6iuoIJPIkB6iXV0LUvEUPfkFa8KS/R/2v5ryB+fAJv
 IuXLdSxz7aI1qaIJFI37kyLS8smDfamj5IkDp017CXqikvMR0R+TAoGQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 06/12] sox: patch CVE-2021-23159 and CVE-2021-2317
Date: Sun, 16 Mar 2025 23:53:52 +0100
Message-Id: <20250316225358.2816208-6-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116011

From: Peter Marko <peter.marko@siemens.com>

Use patch from Debian:
https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2021-23159.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sox/CVE-2021-23159_CVE-2021-2317.patch    | 31 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-23159_CVE-2021-2317.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-23159_CVE-2021-2317.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-23159_CVE-2021-2317.patch
new file mode 100644
index 0000000000..472e4bac60
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-23159_CVE-2021-2317.patch
@@ -0,0 +1,31 @@
+From 8eb3afb37f80d7231a998e3074e6fc5f7bdfe4d5 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sun, 16 Mar 2025 20:28:15 +0100
+Subject: [PATCH] hcom: validate dictsize
+
+Source: https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2021-23159.patch
+
+CVE: CVE-2021-23159
+CVE: CVE-2021-23172
+Upstream-Status: Inactive-Upstream [lastrelease: 2015]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/hcom.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/hcom.c b/src/hcom.c
+index 594c8706..9e8b03c6 100644
+--- a/src/hcom.c
++++ b/src/hcom.c
+@@ -141,6 +141,11 @@ static int startread(sox_format_t * ft)
+                 return (SOX_EOF);
+         }
+         lsx_readw(ft, &dictsize);
++        if (dictsize == 0 || dictsize > 511)
++        {
++                lsx_fail_errno(ft, SOX_EHDR, "Implausible dictionary size in HCOM header");
++                return SOX_EOF;
++        }
+ 
+         /* Translate to sox parameters */
+         ft->encoding.encoding = SOX_ENCODING_HCOM;
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index a87f4de131..bfa1d9c2d4 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -30,6 +30,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
 SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
            file://CVE-2021-3643_CVE-2021-23210.patch \
+           file://CVE-2021-23159_CVE-2021-2317.patch \
            "
 
 # last release was in 2015, use latest hash from 2024-05-30

