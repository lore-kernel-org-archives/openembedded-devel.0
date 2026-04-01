Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F7FD3515E
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 08:33:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8209.1775032406882667484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 01:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GqL48ohN;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so1959676f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032405; x=1775637205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbAWJBr5Td3nlZsSvs7DsLxfq4fan6SOGi6bhY2IZWI=;
        b=GqL48ohNdTr1k5306W3+PziVXV9LBMMzkFTZaRBCsaVcNy4WVf1mJ9hqxQM4F+Wy8a
         oIKfDuM4bsYrFbskNXf3k8oMXqMWmN6IMT9cfyIWiMTAjz5xlVqKtLS8wpEPwuL0IgnC
         IT6qJ2NdbH7UEph0lFqW4WZLVVaRCdoILAE3+V7+HJnnIf9hmwxg586zhxVdoKP550ZA
         wcbiCiv6SxpfdJhX7DGXveOgbZF24zJW0yu2ETcbh29H566HTS0M7DQdhz19nKMI5gsq
         dX75NKhuXmVUZX7tulGTBTYNNGaWPQMEqjD9L/6DSsfcyy1OWFoEdyQDFA6KvzHz6RFq
         gcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032405; x=1775637205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbAWJBr5Td3nlZsSvs7DsLxfq4fan6SOGi6bhY2IZWI=;
        b=lmnWpGRDM9ozhstcNyEFI++st1yAlE+THdPkPulVG8SmffhN6cr8cWjrTCmvrCSWcZ
         2lD1GiF4VOAZf+333hBLb0Rrqcp56x9VqPwxovRb8egbm6bRxjD8Jq+lfT3w772HOpWG
         7bpTgZUwGUvGHzAVeQDLKDwzhyF1m5YrpZjVfw2WmLTJbBa+Lk9jAPwjSL0oRL6mO/za
         2qZzDTe6WVvyTnWLHAC5qMZK8GCgqiXpO+zWn+I70m9eCbgMMpCFGUJR0TaNDLpOv7YM
         EZ+/urZSErVs2TrAM/FfHRO9bcDgttl5uO9lzg46wn1ZIBWren5Kq1U6oD/JJfYcMmyK
         9gXw==
X-Gm-Message-State: AOJu0YzzNSKGrgYbhnG0njD/f62wpv3o/nxyi6wCOg/336S9G0MatVE8
	0v7OfSNkXXy/FPeKisu+pe8arCimVpKJJ0KWeAle+TycMDMWCN27xqPEBZNXxA==
X-Gm-Gg: ATEYQzzr06isvIWKkyY01yAUCOQFd96UAAeyrPOutylbw1aVVDWbAiOIr2QZzXvAiLj
	xlBDNcIv1WChwSg0U5rjVJuT+7Im72XmhzCmsM40KmjhdQJ5z9nGfOImA/Qn+Qy/y0gXLKe0MF2
	PDCWcV3J0CZIJPwfXTJI7/HgtKRSi9wqnDmvPKO30HytpGEJO/ATPTiQ14APfMiBEffW8DwZ76O
	ZyLjv4+3Pu5O+AwezcYKXefGTuZSseNX9xm184YYG6i/ryCOiHP9uznz6nJliZZw5W3+iLsHqSB
	9SVHyQjyU+kQ0H1swYelzIjz6lKCuVqx8FRrADlxTc3mm9Kwr3/wgY8TRjJKw+a6TF9R2sXmrfD
	H4Bv5ae2m6JkMgnGvh6D1AT8Ie2JBCWgvCWt+xtS594D/x37YTgfdEZv0NSdxObfzezor1Ql+OQ
	DxoldLYqYGCDz2rX1gUnmo
X-Received: by 2002:a05:6000:601:b0:43b:5097:6f60 with SMTP id ffacd0b85a97d-43d150c2112mr4788212f8f.32.1775032404806;
        Wed, 01 Apr 2026 01:33:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm31524338f8f.17.2026.04.01.01.33.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:33:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] zabbix: upgrade 7.0.23 -> 7.0.24
Date: Wed,  1 Apr 2026 10:33:22 +0200
Message-ID: <20260401083323.399106-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 08:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125901

Changelog:
- reverted the custom-on-fail discard value behavior so that it now correctly
  discards the value instead of resetting the error state and recalculating dependent items
- added possibility to switch SSO user on internal login failures
- improved trigger-related postprocessing after configuration cache sync
- fixed graph rendering for items using throttling
- updated man page and help message for zabbix_js
- improved Device status mapping and added trigger for Meraki template
- updated maximum supported TimescaleDB version to 2.25
- fixed script macros expanding via Zabbix proxy during autoregistration
- fixed dependent item error message clearing in preprocessing
- fixed incorrect filter being applied when switching subfilters in multiple tabs
  in Data collection->Hosts->Items, Monitoring->Hosts->Graphs
- fixed regexp runtime error when processing log* items with unspecified encoding
  by sanitizing invalid UTF-8
- fixed inability to delete host, user, or template groups when accordingly hosts,
  users, or templates belonging to them were previously deleted in parallel requests
- improved Teams Workflow webhook to use ALERT.SENDTO macro
- fixed redirect link when deleting host or template from item or item prototype list
- fixed snmp cache housekeeping not to interrupt scheduling
- fixed system.run not terminating commands correctly on Zabbix agent 2
- fixed showing some selected value by default for Map navigation tree
  widget if listener does not exist
- fixed multiple event generation not to generate changelog entries on new events
- fixed compilation of Zabbix agent on HP-UX 11.23 (ia64)
- fixed "daylight saving time" error for scheduled reports
- fixed inability to return "not supported" via user parameters
- fixed discovery uniqueness criteria bug
- updated documentation links for Create template group and Create host group
- fixed checkboxes "SSL verify peer" and "SSL verify host" not being selected
  when corresponding label is clicked in media type form
- fixed message box display bug in Monitoring problems page

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../zabbix/{zabbix_7.0.23.bb => zabbix_7.0.24.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.0.23.bb => zabbix_7.0.24.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
index 1cbe9ed9b0..330dd1e943 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${PV}.tar.gz
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "43ea5fcb1e5db25e74bdc83ea8936d79b8093b614af4e889417485bc74f061e2"
+SRC_URI[sha256sum] = "6f8ae990b9b25767e4fffbcb5cc7c455d674e2a392dc21478488a5d1c0e7d597"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 

