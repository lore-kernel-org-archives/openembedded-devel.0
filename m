Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7A5C35FF1
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:35 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.39885.1742165733211563336
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XBnc7d+O;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250316225531deb3fc482dc44b4463-rq2adh@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250316225531deb3fc482dc44b4463
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=o3xtVJ6pRdaTIZrI7im30XBileOZ6Vwe76P1Q38J0oY=;
 b=XBnc7d+OXlNeck4amITVqa0XZYuIQof2kWGsNTZMbrJg7CCzW9bmWkENMtWcfLIbTjVR9v
 pRb8L/kY1nXdfCkDnVMuzdFiDk4vb/ZA/O4HHBYUwa1DUrPIFvakCIKq32Mnw0h8yI1qxGBH
 voCeVqq/Jrw0I312rHRjCJfKQ966bYq4a2E0LUUAc0a3yCGf5Yu6vE6z0RiIkDyH44nsRsFo
 5ZA75HsHlnGqXBf//Zpt3xbbvv+5ILw/22Aez9LWAlyxPWhkUjSMw0AWswZNLFxE2/v0ynGp
 Dp2G2zZKIRWjrC8I2PAiUbO6D7gcJUfykjt9z9bSqUREhU3eaWuYPmwQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 10/12] sox: patch CVE-2022-31651
Date: Sun, 16 Mar 2025 23:53:56 +0100
Message-Id: <20250316225358.2816208-10-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116015

From: Peter Marko <peter.marko@siemens.com>

Use patch from Debian:
https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2022-31651.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sox/sox/CVE-2022-31651.patch              | 36 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2022-31651.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2022-31651.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2022-31651.patch
new file mode 100644
index 0000000000..853a69d210
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2022-31651.patch
@@ -0,0 +1,36 @@
+From db9641ce748bdfb465fdfa9b7794de2f8da0a249 Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sun, 16 Mar 2025 20:08:13 +0100
+Subject: [PATCH] formats: reject implausible rate
+
+Source: https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2022-31651.patch
+
+CVE: CVE-2022-31651
+Upstream-Status: Inactive-Upstream [lastrelease: 2015]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/formats_i.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/formats_i.c b/src/formats_i.c
+index 6a7c27e3..5f5ef979 100644
+--- a/src/formats_i.c
++++ b/src/formats_i.c
+@@ -70,9 +70,15 @@ int lsx_check_read_params(sox_format_t * ft, unsigned channels,
+     ft->signal.channels = channels;
+   }
+ 
+-  if (rate && ft->signal.rate && ft->signal.rate != rate)
++  if (rate && ft->signal.rate && ft->signal.rate != rate) {
+     lsx_warn("`%s': overriding sample rate", ft->filename);
+-  else ft->signal.rate = rate;
++  /* Since NaN comparisons yield false, the negation rejects them. */
++  } else if (!(rate > 0)) {
++    lsx_fail_errno(ft, EINVAL, "invalid rate value");
++    return SOX_EOF;
++  } else {
++    ft->signal.rate = rate;
++  }
+ 
+   if (encoding && ft->encoding.encoding && ft->encoding.encoding != encoding)
+     lsx_warn("`%s': overriding encoding type", ft->filename);
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index e66c10a56d..94072cb35a 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://CVE-2021-33844.patch \
            file://CVE-2021-40426.patch \
            file://CVE-2022-31650.patch \
+           file://CVE-2022-31651.patch \
            "
 
 # last release was in 2015, use latest hash from 2024-05-30

