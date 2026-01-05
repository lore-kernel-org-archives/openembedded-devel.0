Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57515C2A081
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61161.1767607361513037458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IcICyZw3;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso130835245e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607360; x=1768212160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh6JvLT0aRqroM20ZJ0XdPrGHZJDrtVDwnGxdATqMDw=;
        b=IcICyZw3BZ4ESGoe/ceScqjjkLTOjDXyjHDRKn8l1zZ6tARwDt3drvKWzWqKjWzzYa
         oB7/lHhuZfJsgO2LMmu09Hi/gIU5cZw+5lN7qGHPkT/bW/BIQuXH7RVnBenIOSVJOUDy
         ydK5WHoBM8jeEwpGvy/ZIr3W1PVsDQQMrTtqHsAAWvms1d+YHV67o5QbOrQRAp5S56Jo
         Wnzo3xcmr6U1zsj5pamvZHj78+O1dNWDKmu7QemJgk2vmjNF2IaHOotkQ3pD0BlIb6Fb
         T7DE5RcGOZqaZ6DJh1JUbAMHeXZ1x12Xi+3tPZvSrti32//v8mqON5EFbhzocQ0FVEX3
         o5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607360; x=1768212160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh6JvLT0aRqroM20ZJ0XdPrGHZJDrtVDwnGxdATqMDw=;
        b=CfyoGZ512VOVLTiGi78ltU+DDPKxnNQUoDpfy9xyMjZ4koGdNrU+ZxTpHcMMvaBNGO
         GJxTFxJk7wyd9DiEgfEo6VkFCW1i5SB8QlZK375giEJz9W2tykEyYvDp1L1I78ciWcz/
         +xj+IehZEUh7sKMp2zxmipYv950fuZLxHAPFm7C6Ub0QNOelT5S+cDnNwbN1d2U+zV+o
         57vl+d4T25LQq6o8hmygywYju74OHUNGIQssRR4xxPXyfKSddetbeiWJKOeNXP4ukMgd
         AhtpycT72BxvY1iTe+p8Ok3mwTRGd02+YXIndq9BZlc+6MMYVC33N+aY0b4QW1/I+fnu
         fV+w==
X-Gm-Message-State: AOJu0YxjBWIYKhWE04XPKjLNB1X5RBHH/MQhQ4l2BkZ7KLQdQj3eY6Gw
	jbD9qBf0/wzG+8CioFxZLdw0bEJtN0c1juWU24z977OTiTHFmmpjZ00O/cXPfg==
X-Gm-Gg: AY/fxX7WrN+FG2dPaT7GcYipoUY4siZqbz3BCy1qGttOrcfSIzlK6svIh/kmntR6SNF
	hwAK7FyNpfWof2iUDZifEMPEJiVfjJecklZtcfRFS8enz7hSCT9KSp7OWqcBdtak3ZLphy1krLI
	4IwJd+pn11KFLPcBybQBxB/wEyyAn4gJ7KLfCij/APKnCIbL3eyaY1Uk61JgiC7THiTLpmzX3JY
	X5jjvWqTLVjZUjW3rmq329JKfFTmMmCuZdNKd3SwTpr8G3W5/fR4ddpzQEE7NN9DR3S9GmVlxjU
	m/20MQ3TFEyqpImut0A6WfgO8kJkS5qMAmp2fkVhkt05WheS/Sy1d6VGF3nGTA/buFCZ1Nvimbo
	L9x+SOvbbwcjntB+xx22hsaB+u/fmnjBEZCe+J082Z5t9vCrwJqVnh82kRhKSiUFVvTGBjuT11K
	zxwbFVy90QsbZW8DxpHg4=
X-Google-Smtp-Source: AGHT+IEUE3HIaG/m2iLFgR36PtL1HgiNX6eGgMOtik3M37rY28kE4AcvTA4i0ouowfdvXEJ43nIw7w==
X-Received: by 2002:a05:600c:8b56:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47d5b21d77emr270264545e9.36.1767607359622;
        Mon, 05 Jan 2026 02:02:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 01/17] civetweb: ignore CVE-2025-9648
Date: Mon,  5 Jan 2026 11:02:21 +0100
Message-ID: <20260105100237.3081345-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123132

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-9648

It is already fixed in the currently used version.

Also, update CVE-2025-55763's status to "fixed-version" (so it will be
marked as "Patched" in the CVE report instead of "Ignored")

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bfb76da63bd141173aeb71ce91c336b8aa557a5f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index 1d0207edb1..0e13bc6deb 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -10,7 +10,8 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
            "
 
-CVE_STATUS[CVE-2025-55763] = "cpe-incorrect: The vulnerability is fixed in the used revision"
+CVE_STATUS[CVE-2025-55763] = "fixed-version: The vulnerability is fixed in the used revision"
+CVE_STATUS[CVE-2025-9648] = "fixed-version: The vulnerability is fixed in the used revision"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
 inherit cmake

