Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EF9C44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 20:07:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6623.1784578042829825412
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 13:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eTkAXxM2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260720200719001e230a6d0002070e-eca4ej@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260720200719001e230a6d0002070e
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 22:07:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1Q7ztEwMrD18telQOfUIulKgZ3A2bi/o39Vbv0ERlHQ=;
 b=eTkAXxM2T0Onv2JHo6SHmn56O4BGsThA0Bup9MH/j/jRZPOBH0xNXutKUh5h03I8RTbzOb
 jS5UWoYkBVXLTyy94tynAbl+rlItV5A5nWKiCHqZJlSbLa1oGQgP9lVacCBZrjeXeUheuPmm
 3yO2W7SyQrGLd2kWQKHbWekj7QuEebNXBHLQbtB3q9CGYb2m8CKSsj4ve0FsxXm84j8t05zz
 pQCUGS7Oj3PNzTRHPxmEQsDxy9TFi3Tj2+Kw34HE+gdJNCsfQJXpfYxQS2v1qhmGExqrEwvz
 45gTUcdVeR75KNZIon3nrr7+0GSAgNynOpdaRMLtHg3CGwi+wCqzmALg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] hostapd: set status for CVE-2026-58374
Date: Mon, 20 Jul 2026 22:07:14 +0200
Message-ID: <20260720200714.29390-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 20:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128300

From: Peter Marko <peter.marko@siemens.com>

As desctibed in [1], vulnerable code is not yet present in 2.10.

[1] https://security-tracker.debian.org/tracker/CVE-2026-58374

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
index fec54f8a47..74fe958e60 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -63,3 +63,5 @@ do_install() {
 }
 
 CONFFILES:${PN} += "${sysconfdir}/hostapd.conf"
+
+CVE_STATUS[CVE-2026-58374] = "fixed-version: EHT/IEEE 802.11be/Wi-Fi 7 support introduced in v2.11"

