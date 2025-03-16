Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE53C35FF1
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:25 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.39881.1742165723571077800
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=j0ZqF+FZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202503162255215bc2a188e899bda551-jgixkh@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202503162255215bc2a188e899bda551
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/ATY9ltZwtk7orszoWaKMZYuugBHOoO+RFUjB4OqT/E=;
 b=j0ZqF+FZzE9hNgx2Ab4pRw6nMKeENWKDYA8TZL+3JHYSzXvRYcyxhmtMVeuakOUQ1R9TdS
 6n7vC1IMe9z1/0dgmhRBWJcqVa0bAxfmXDsxMu6FUswAMb4P3dSLN1yO6+4HKiZ/QGALSesE
 eno0Nd74/lYuhGTQ7N0ejxlr+cT6zKFzsVSJ0vAeXSd3RvKvms4s8Ue6jZIBKSlOIsXdcOSi
 pKxKlB7JTaQ4+BYKFyK1UptJm7NONLK2v0rDnOS8JN8sIUXt0vtshNoAd4pvRnRFnDHk/YtO
 hjkqMT35ftOMwCGfAdM4OfHhUD504spuwy47zXKVI1+XSb/8hCKFTTrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 08/12] sox: patch CVE-2021-40426
Date: Sun, 16 Mar 2025 23:53:54 +0100
Message-Id: <20250316225358.2816208-8-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116013

From: Peter Marko <peter.marko@siemens.com>

Use patch from Debian:
https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2021-40426.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sox/sox/CVE-2021-40426.patch              | 38 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-40426.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-40426.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-40426.patch
new file mode 100644
index 0000000000..9e505a03a7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-40426.patch
@@ -0,0 +1,38 @@
+From 25f686e0da423326a74fe16c603b6b6b75857fa4 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sun, 16 Mar 2025 20:07:19 +0100
+Subject: [PATCH] sphere: avoid integer underflow
+
+Source: https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2021-40426.patch
+
+CVE: CVE-2021-40426
+Upstream-Status: Inactive-Upstream [lastrelease: 2015]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/sphere.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/sphere.c b/src/sphere.c
+index a3fd1c64..9544d160 100644
+--- a/src/sphere.c
++++ b/src/sphere.c
+@@ -63,7 +63,8 @@ static int start_read(sox_format_t * ft)
+     return (SOX_EOF);
+   }
+ 
+-  header_size -= (strlen(buf) + 1);
++  bytes_read = strlen(buf);
++  header_size -= bytes_read >= header_size ? header_size : bytes_read + 1;
+ 
+   while (strncmp(buf, "end_head", (size_t)8) != 0) {
+     if (strncmp(buf, "sample_n_bytes", (size_t)14) == 0)
+@@ -105,7 +106,8 @@ static int start_read(sox_format_t * ft)
+       return (SOX_EOF);
+     }
+ 
+-    header_size -= (strlen(buf) + 1);
++    bytes_read = strlen(buf);
++    header_size -= bytes_read >= header_size ? header_size : bytes_read + 1;
+   }
+ 
+   if (!bytes_per_sample)
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 18ca7d504d..022a2d6b59 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://CVE-2021-3643_CVE-2021-23210.patch \
            file://CVE-2021-23159_CVE-2021-2317.patch \
            file://CVE-2021-33844.patch \
+           file://CVE-2021-40426.patch \
            "
 
 # last release was in 2015, use latest hash from 2024-05-30

