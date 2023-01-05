Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC193C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 07:50:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.8253.1672905001745747551
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 23:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K4Lv7El0;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id p24so16086297plw.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 23:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRMhCuHT6yxv0m8WE2JvYAWP5kp8/mX2zEbCfJL+E74=;
        b=K4Lv7El0MZBUkt69Inc9vNjsYvdFMgL2+PRzcy9882qoenCdss7MsdPvUqK/gZOiLj
         BfW8YVOwrVGiIwFmAGJL1wosZPkIn7cIN6kDfgHMGcT1my+6AtbJlcgPT9DfpP7KRhFg
         eisywfacPv67yJqm/uTbCYFnuLajbcgjZ9RgQnkCSGIHIPDea3lK9OCRLRBEoZq1OgCl
         +mHPJ+6Dp3VQWYruqhCisLMA0FxV+5h8lMsLNjThonDC9sFIXpLi66lvWOPBP2i/bRvU
         ILQdDTghd7sab/XZjUvteclUef6lIjuVd7hrFzY7SMeVit2nVhRxAlX2fZ0+fNbqRzvK
         3Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRMhCuHT6yxv0m8WE2JvYAWP5kp8/mX2zEbCfJL+E74=;
        b=tqRQClED3WAk8tiwsnbsLCtKyrHla6kZPM5QjTPB8oqfQCI/saPXMn+J49MfUDx0YW
         oMm726KSQvD2VOc17gSSarhfrDVgC4Cx451Z14w7Ky4Yz8i72d3FxERFs8vlnIH3BGuX
         Q/545VdaryPYTrLfJQ87VUIsQEsMeDmKb0DPcGukgs+Z8wBy8auKvqZskn+XxBzQOa7Y
         hjLIesrdiLWcbrTbiKyJltx9s7CHFn1ODhCJyX2o4nIqYCagAMNl/8TEB+JKFdRPTZHz
         zClxhdliiLLqCzrnx3IiOS84YUR0OA64mFUHNZtfYlJU57aoW5V3RlkWtUeDA+VPvMor
         af/w==
X-Gm-Message-State: AFqh2kqECBnLCZD6s5vVN2RZioXToP2O5JIAkGebMntiV+6S4sPIds75
	kJjc72UBfg/gPNegDDcrvhOkxwqZUDU=
X-Google-Smtp-Source: AMrXdXtfIjuf76d5JoTlQlSomD2Ytj4alOb0by4WAtNDSY0Fs1rtOPbBVSEPB4ewCevCQtw1NM4tzw==
X-Received: by 2002:a17:902:bcc5:b0:192:ce7c:dc40 with SMTP id o5-20020a170902bcc500b00192ce7cdc40mr13437094pls.4.1672905000731;
        Wed, 04 Jan 2023 23:50:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b0018980f14ecfsm25523591pld.115.2023.01.04.23.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 23:50:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] mycroft: Check for pulseaudio in distro features
Date: Wed,  4 Jan 2023 23:49:57 -0800
Message-Id: <20230105074957.564313-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 07:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100408

It needs pulseaudio but its only available via distro features so check
it before enabling this recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index aab43ea297..6797899808 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://github.com/MycroftAI/mycroft-core.git;branch=master;protocol=ht
 
 S = "${WORKDIR}/git"
 
-inherit systemd
+inherit systemd features_check
 
 # Mycroft installs itself on the host
 # Just copy the setup files to the rootfs
@@ -91,3 +91,5 @@ RDEPENDS:${PN} += "procps"
 RDEPENDS:${PN} += "bash jq libnotify"
 
 SYSTEMD_SERVICE:${PN} = "mycroft-setup.service mycroft.service"
+
+REQUIRED_DISTRO_FEATURES += "pulseaudio"
-- 
2.39.0


