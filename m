Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB754FA3738
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 12:19:58 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3806.1767354723825531846
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lbf9DBIf;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: sanjayembeddedse@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4f4a88e75a5so107695481cf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 03:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354722; x=1767959522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WEHk3gVchn5kUlNn1ias/s2okgxXpSxMuwCTM8zhDXU=;
        b=Lbf9DBIfmOjAZZnYU7fYTAncoJOL3xSbSpL2IrwGvcCbaUJqsU8XMz7pEakiwoxbVq
         03CL/4RdTOvB+9EKK4LYBz7L99pQPGAdPndW+Bd66E2scY4xBYHznF2svGszB5fqsF5n
         jH3Pgs/p/kOThgcKh3Vl/afTW9hke+iK6jUqi30RL1xp7ffJY0NDbuIhhP5D8VOdkONq
         uzPc2ShKEV+uqVdrnamYQ293CKsEHmU5mTVujKmZfeBYtfdZxYj5C+qlMzvUXQPoqfgY
         8q9QpPnhH9iTfVbl5qB3C0M4FYt6eT3sh/06No3ukEXuGt+P2K+fTz39WCT8oZ+etm0g
         oirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354722; x=1767959522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEHk3gVchn5kUlNn1ias/s2okgxXpSxMuwCTM8zhDXU=;
        b=KhfiBBKkECwFUvk9V4shersktcalz1BbwkRy+p18W10jPwlxUDmXDvKQsgAAcGRm4G
         5DVf2HrmB9I3MuUpeUjX9V+SU2SQ31XyytU5IASIgPJCuJFh2qvUBceaf5kgzblt4pyR
         dfMbiYExVjNf6chYK+dQzE7xFSge09mZjXryzmA9g/ma5eOsj6JNXE88HTT/axJ4JFfz
         9wTh+llSjUK3RP6UZWGwviUo/bAUehy1VFJ6yGrgx1aSDmXUW8lhEmf1JZ32aVgzRBQz
         7av3rOkC8/UKb0G7mnEbkYB2zYAvgVuKgJpWFFS9NSMaEpWGFfSI8e0ZR/+1GAIbuWq8
         QxWw==
X-Gm-Message-State: AOJu0YziSyluCyrpXHenQHJzXSXp8VlheYXF/Vsv1Sqk1Ot8h9IFZd01
	6ivPEP36pP1SN89Pq9U/sfb0rbV3Hgj6lVc1sbXEnXgXylhh0QvXqwqCnh3W/g==
X-Gm-Gg: AY/fxX4qel4JXAgUGN4BpR2Q0M205YXD/w+OpmLoTPRp2CkeQ3tf7hts/HUo82SFhZ8
	8imb8wIRXz5mR1agOuU6n8wHX/aE+Qk3e5Yh9L46EtvFtyuvDIuXltEnXQmi1jisG/1Icy+EzyT
	4MXldVQ9WCDsImnKkZVQW1g7dOtYqD+j5gfzc4Obx6/vguOU9sZe2nWDpZVXi0CkRx5exXXrs3i
	Icz3Bq/1ClhK0dN0a2NI4WVnC/YxfSo/XFHp5l0SJ/tLUOlFW4wWbrxrqfB0LoArPPXOOGEsDUw
	Y0ertX0nppT30iApDZNVrF97t3yJw+GGomqP7Z09tSI3oFkC8u+l6HFPqyRl2Yr79lXRQZoB7Zf
	IZ/quhA27razfMrRb3M8MFWOVkA7JioPO7tKJUkPkZEuirB7g0INmlhvATaYIsMArGnExQLSY3c
	e+Iunan+gV6J3gau4C7QECg10JpahQlWtsVagk
X-Google-Smtp-Source: AGHT+IFcFFlzc9aHae9joa9ey2KguKjnJcCvloagE0i9dVzK0YfnZz2nI5bqcOmMca0zrqkbSTet4g==
X-Received: by 2002:a05:6a21:3086:b0:364:31e:2cac with SMTP id adf61e73a8af0-376aa6f8ee9mr36025472637.46.1767354335970;
        Fri, 02 Jan 2026 03:45:35 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79e05712sm35190723a12.14.2026.01.02.03.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:45:35 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: sanjayembeddedse@gmail.com
Subject: [PATCH] recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
Date: Fri,  2 Jan 2026 17:15:32 +0530
Message-Id: <27202d444b49cf83c11bcc9425f145c8cc0b3cc7.1767354024.git.sanjayembeddedse@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 12:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123095

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The upstream site (landley.net) serves inconsistent content when using HTTP,
causing checksum mismatches during do_fetch. Using HTTPS ensures stable
downloads and resolves checksum failures.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 meta-oe/recipes-core/toybox/toybox_0.8.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.13.bb b/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
index 919743135b..6a5a155ba5 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "9d4c124d7d731a2db399f6278baa2b42c2e3511f610c6ad30cc3f1a52581334b"
 
 SECTION = "base"
-- 
2.34.1


