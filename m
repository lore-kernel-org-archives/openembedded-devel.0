Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3759FC55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:29 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22338.1785672320460259956
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pDGSw+LI;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so1277926a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672320; x=1786277120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mJPglDW67eZ3XYkhi4jyyrvcinpD+b27FsXMwBpGTM=;
        b=pDGSw+LIdp3B2bFdotv1Qok+cevVqItfVFeK+y/VedSpUC9FxPlGan6BMJMfieWbDq
         Zqbe5WsLxn7E38fd7/Je+gR5WQXsDnFPZ0K1qRiayGcHT6TAVJD/4YWNTbO4228LtoC/
         2Cvu90Rt2XoIa4jZEMdDUeRMB6POyoazvEVF0ZkGVc/+oR4F12jRnq2s4+V1ZARW0mke
         HRXvtp9xEF9Y1flITJY3QowNTq7YM8Y/HtejLXOLZ6j8+ACp+MVi2kUoVWfiSPVD6rMD
         opV1X80vbtYA0+4fjn1ze0kItBYvsc1Up06diyODUYzEvmLtYUuSbLCSE0c2RCvtOYhh
         dbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672320; x=1786277120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mJPglDW67eZ3XYkhi4jyyrvcinpD+b27FsXMwBpGTM=;
        b=Wfm7sl+XotxEOcdGdYzX4BSTMrl9E6/fEQ1HoS3sGsml0XkSulAYIloRJStjrv6NwY
         K0q4gF817rcR32mIFptt8LxaIixS4Lz8smB4iunLTB1QIEhKKqBkrbvM6IYeyPnI2jxb
         34KDAPMvZuOzwDciErwHkrybmoCUcjANe4cooOndRoTh6xXB90K4MfEiFXqUmx02ZEm4
         yNldcLV5MR/4OTGytrOVBA00kxRO4EZmmwh9Un3yFAEHmZl7XzphpmiQlS88lL39pNJ2
         r5aXtaV4k+Bxr4w6ciTODdbnCjXfAI7vZ2xZNaSqX7OO6NyxPzGQpcQkIBC8NI7NmDG5
         e6vA==
X-Gm-Message-State: AOJu0YxTd2e1QSnRxJrJHgnsSE0ipYgbY5LQU3IRsAX8v2zMVqtxH5R4
	CpyT7Pdgt1b53n8hihJgLfynixeUjjvH3DXY2N4Ik6UiRp0QiQ1LzFMCNNRCrw==
X-Gm-Gg: AR+sD12GsRq3klQo4+n00f6T4M7dnpQsClZNfb1S7j2xchedAPCNAjUkOhQ4gRt8aV/
	xrQtkFz5Fh5ysnZbKjgw0FVqebcGtgi0CZ/7TwMNjj2auB1iXIOFwOaGMIoZjMOJRIw0rnxcGzc
	Q0GJxyNRbu7xmyWcq4czSVYWQAjJCG1y7dEhzsX6d25q173wSnOYTZ6qq++EInkQ21VN4q07N4m
	GakGk/uRmUTEdGHi7vDPV2bpmwnBY1XzYyO6DWmx/ulJE6uG6VbSBl4WXAqvLU/vfMHrhXYaCqr
	WpC65nkVLLA/F92Bjlbeumc+fl3O6DFIGWA73sRsCZ1gmXMtWTbu4vEyLrQ5LJ0xPusWJhXN+GE
	CtYcEvlfuSVfDtfCFvUkNytiqufuj79eoUKUna1CjW5CaUDH3f2Yh8yh3a4FenQ20R79qt9zAoV
	3EacXugi0HQWXkSzhf2qlIbjh8EoSbzkooF7VvU9FPbfCnfeFxw/bL5KrWqqaPbqFtlEUekALoM
	Q==
X-Received: by 2002:a05:6a21:3390:b0:3c3:87df:fc7 with SMTP id adf61e73a8af0-3c92aafd87bmr6392242637.64.1785672319659;
        Sun, 02 Aug 2026 05:05:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master-next][PATCH 10/11] libwmf: upgrade 0.2.13 -> 0.2.15
Date: Mon,  3 Aug 2026 00:04:41 +1200
Message-ID: <20260802120444.2973561-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128665

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

https://github.com/caolanm/libwmf/releases/tag/v0.2.15

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libwmf/{libwmf_0.2.13.bb => libwmf_0.2.15.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libwmf/{libwmf_0.2.13.bb => libwmf_0.2.15.bb} (92%)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.15.bb
similarity index 92%
rename from meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
rename to meta-oe/recipes-extended/libwmf/libwmf_0.2.15.bb
index c5411d53a1..a093c6410b 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.15.bb
@@ -16,8 +16,8 @@ inherit features_check autotools pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://github.com/caolanm/libwmf.git;protocol=https;branch=master"
-SRCREV = "9e4737f2293c0d127bda92e5b01896df10571424"
+SRC_URI = "git://github.com/caolanm/libwmf.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "d00b314cc5fbed48fe79fd3acdcf42324d2f4b8e"
 
 
 do_install:append() {

