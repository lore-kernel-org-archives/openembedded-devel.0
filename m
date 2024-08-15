Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE6FC3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 17:32:51 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.129447.1723743165311753768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 10:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JrlITTv5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202408151732427132085d9be15adea8-_jn0v8@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202408151732427132085d9be15adea8
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 15 Aug 2024 19:32:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2ymgrafQZAo1UmbyG6E5Vm/ympVLQETJSj+wSEoZe2c=;
 b=JrlITTv5uvWYD7glhfNJGzsOd1l0+Ynw3oCKB2Me6HQaZ3a+MMtmVg2PRfg3xaJ+fxX5K7
 tJfDsua5sFf/uVKpoIloaceLBotwcr3dL6vYfXTcthRqFtqgsm4qsrtAKhm0lkHBH57d9+iF
 60nOh0y1KbDMcR6rwUsHXUUu9KgExZPPjtGAcARjKU6t/OwuQgamOZof2ha6YXyIG/+huNfl
 y07IcSqnpJcGuzePan40q9//UX/sADudR/QE09tGg9CrAXFf+HsVHh75Z1ksOPs4BVM+ovPx
 Qp3ch/E0Q1MAMT0/UaLa5Mrowk7huRJdPv6VwQm8T2xywEVNJlGBnmQQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][kirkstone][scarthgap][PATCH] libndp: Patch CVE-2024-5564
Date: Thu, 15 Aug 2024 19:31:55 +0200
Message-Id: <20240815173155.19658-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 17:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111825

From: Peter Marko <peter.marko@siemens.com>

Pick https://github.com/jpirko/libndp/commit/05e4ba7b0d126eea4c04387dcf40596059ee24af.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libndp/libndp/CVE-2024-5564.patch         | 48 +++++++++++++++++++
 .../recipes-connectivity/libndp/libndp_1.8.bb |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch

diff --git a/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch b/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
new file mode 100644
index 0000000000..fe7ce41b87
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp/CVE-2024-5564.patch
@@ -0,0 +1,48 @@
+From 05e4ba7b0d126eea4c04387dcf40596059ee24af Mon Sep 17 00:00:00 2001
+From: Hangbin Liu <liuhangbin@gmail.com>
+Date: Wed, 5 Jun 2024 11:57:43 +0800
+Subject: [PATCH] libndp: valid route information option length
+
+RFC 4191 specifies that the Route Information Option Length should be 1, 2,
+or 3, depending on the Prefix Length. A malicious node could potentially
+trigger a buffer overflow and crash the tool by sending an IPv6 router
+advertisement message containing the "Route Information" option with a
+"Length" field larger than 3.
+
+To address this, add a check on the length field.
+
+Fixes: 8296a5bf0755 ("add support for Route Information Option (rfc4191)")
+Reported-by: Evgeny Vereshchagin <evverx@gmail.com>
+Suggested-by: Felix Maurer <fmaurer@redhat.com>
+Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
+Signed-off-by: Jiri Pirko <jiri@nvidia.com>
+
+CVE: CVE-2024-5564
+Upstream-Status: Backport [https://github.com/jpirko/libndp/commit/05e4ba7b0d126eea4c04387dcf40596059ee24af]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libndp/libndp.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libndp/libndp.c b/libndp/libndp.c
+index 6314717..72ec92e 100644
+--- a/libndp/libndp.c
++++ b/libndp/libndp.c
+@@ -1231,6 +1231,17 @@ static bool ndp_msg_opt_route_check_valid(void *opt_data)
+ 	 */
+ 	if (((ri->nd_opt_ri_prf_reserved >> 3) & 3) == 2)
+ 		return false;
++
++	/* The Length field is 1, 2, or 3 depending on the Prefix Length.
++	 * If Prefix Length is greater than 64, then Length must be 3.
++	 * If Prefix Length is greater than 0, then Length must be 2 or 3.
++	 * If Prefix Length is zero, then Length must be 1, 2, or 3.
++	 */
++	if (ri->nd_opt_ri_len > 3 ||
++	    (ri->nd_opt_ri_prefix_len > 64 && ri->nd_opt_ri_len != 3) ||
++	    (ri->nd_opt_ri_prefix_len > 0 && ri->nd_opt_ri_len == 1))
++		return false;
++
+ 	return true;
+ }
+ 
diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
index 4d4d3e51cd..70d6abec1b 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.8.bb
@@ -4,6 +4,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/jpirko/libndp;branch=master;protocol=https \
+           file://CVE-2024-5564.patch \
            "
 # tag for v1.8
 SRCREV = "009ce9cd9b950ffa1f4f94c9436027b936850d0c"
-- 
2.30.2


