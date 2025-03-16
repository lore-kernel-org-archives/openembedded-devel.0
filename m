Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF33C35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:15 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.39871.1742165709649645793
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=X/Uw+Bln;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025031622551057b5f0370b53edf0bc-xy41yb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025031622551057b5f0370b53edf0bc
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nSVgdpjsf0C1p87jo4tJmyarwPQqmPuIdWcNo4mw12g=;
 b=X/Uw+Blnehd8uPb2BAJMwMSgzySqF+Z2sAcRMXhngf/wrYeTKNSQ9diu9j6a/LaaR6zRON
 GGnJqzS2sHcp+7uzc+vKUgrQjYcPZT2JSvvf82JmzrXq0tCGoyH5QMhJUIWq0hV7k2HCWXn5
 GTMNV5VLiMIkeckvX1w4vXTkOhWxTq0oznfo/aZ1A0J4tO9qLo8DWncSWZoJDw3Vd+R0NigX
 JvBagkR7F734Bs+zvyCohW4sUo4TFrexjjEo8teIhWndDDAvM/alN3cBnGci+cvHCWpZVssl
 wiMo1Z0Y6RXBiMNP3zTmwaEA7vex0M/Zv/UKN+hEcj4VE3hmfDV2MfMg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 05/12] sox: patch CVE-2021-3643 and CVE-2021-23210
Date: Sun, 16 Mar 2025 23:53:51 +0100
Message-Id: <20250316225358.2816208-5-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116010

From: Peter Marko <peter.marko@siemens.com>

Use patch from Debian:
https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2021-3643.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sox/CVE-2021-3643_CVE-2021-23210.patch    | 30 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-3643_CVE-2021-23210.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-3643_CVE-2021-23210.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-3643_CVE-2021-23210.patch
new file mode 100644
index 0000000000..f58d2fd774
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-3643_CVE-2021-23210.patch
@@ -0,0 +1,30 @@
+From 5b9a7c0fc7054b4f16a5058eef721470e9adcfcc Mon Sep 17 00:00:00 2001
+From: Helmut Grohne <helmut@subdivi.de>
+Date: Sun, 16 Mar 2025 21:16:40 +0100
+Subject: [PATCH] voc: word width should never be 0 to avoid division by zero
+
+Source: https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/CVE-2021-3643.patch
+
+CVE: CVE-2021-3643
+CVE: CVE-2021-23210
+Upstream-Status: Inactive-Upstream [lastrelease: 2015]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/voc.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/voc.c b/src/voc.c
+index a75639e9..0ca07f94 100644
+--- a/src/voc.c
++++ b/src/voc.c
+@@ -625,6 +625,10 @@ static int getblock(sox_format_t * ft)
+         v->rate = new_rate_32;
+         ft->signal.rate = new_rate_32;
+         lsx_readb(ft, &uc);
++        if (uc <= 1) {
++          lsx_fail_errno(ft, SOX_EFMT, "2 bits per word required");
++          return (SOX_EOF);
++        }
+         v->size = uc;
+         lsx_readb(ft, &uc);
+         if (v->channels != -1 && uc != v->channels) {
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index e8294a05af..a87f4de131 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -29,6 +29,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
 
 SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
+           file://CVE-2021-3643_CVE-2021-23210.patch \
            "
 
 # last release was in 2015, use latest hash from 2024-05-30

