Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C639FCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:47 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.18607.1759326767068302968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cFjuOCfu;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b456d2dc440so308366166b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326765; x=1759931565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/h96DKGDAOpkYH+0zsB8JX9MVuSTzg6ogKfREBgZzM=;
        b=cFjuOCfuKAa7MHlMDOq510CRPeU7vMl1NX0d9egRcL0R25IuF2hg0X+vOY/QgNP88D
         IDrASmOV8jEtLpk9/GhZ6/nmbHiUT+2FGz+ZmkE7uDILrj7FKfnaRGLY/UZKIK4X4f+F
         aHEXTRigGbzR67GoAsHyBYAYfoiJY888NU+pRKPwuPjd12ffgu3kVrS6BGizu/ztd7/x
         FGRmWGe2GOYKM5OOMdCSY7CqLrDrC2lOHm+lXmAePm2nAIOhx+IueocUeDcb1tvaSJU3
         C74v4Mh7QNqx2AdJ7a5fmBDmaiMQ/D+ntcVCjCwJGNzaHXV3eIIwK7we1UqZaU3ov/St
         W8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326765; x=1759931565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/h96DKGDAOpkYH+0zsB8JX9MVuSTzg6ogKfREBgZzM=;
        b=AmlWYA9TLRKMOxXPzUF3IW5/Rz6KGdmirfaLoy7MrdzEPlovLPBWOyGkXGofwuA9FM
         iLfHcHiIJC65+aYluSxJweRa5LgQ7GyZfcvsYmYYQrdrA4GMqJHpN2E+spF1r4xl0uP5
         kEHF/1NAo70vcEX5o5VEYawi9M2GnjT1fk1iCMsBfxcs1nE6SsYrtePu+0/lm2Ry86U5
         JBxMHOzuRKhzvN35L59ZDJQYCXpPSbPvIZ7OQyBSevmp0xsWrMnm9xvQ72K3fum1ERqP
         caXDUcm/o8OsKNUNyYRbp6LXkfG7wkkntpnnuwheX4/e/ZgGJlG4nawaZLvKIjM3MlbT
         M/iA==
X-Gm-Message-State: AOJu0YyS2L+ENj1JKegJ00GOEALz0n26NFA7xoOx2fy+Dwk7EpqPiJye
	WPAEXgoB3D2RVf0Iq5JAV80aPcKGolUIAAJ6dMBJNPuhfwq+S4vWnErbIHIsBg==
X-Gm-Gg: ASbGncvwSh2HWfZoORSQnGixheSBPmMh7ObgA9sq+UFwKnRX+c5hvllSK1ddGHnLw61
	9rfe7gVuapHCcRYXq3UtddfHHKaZj3k6FSbfcws+W5QipdNrKPOqaUzNZd9jq/e6Y0GYp89n7QX
	0J/hX+KjpKGT/Twk/vwiCfyMU6gzdYBChWVUPSRLUBPPeW2/kW/j4IU6w79brrmR3zAFFvVIK+A
	UrOkPsvoS56pThZD/Xz71V7Uk9MegZ0jDbJ+qAqQwYfgO4gtWc0AqHke8bP8eMxdoTXYHYVZuFS
	/Phiuk7wRs/8mFxlEQRn+x+IZyZ29yWhdmJZGHNqULd883Jrmi/ctwzuEDQCgGsqQj4iVEL1TXn
	WgY0FtIOphA9EDO9wi10fomJCyYssddOhHcr/G6bgBMLL
X-Google-Smtp-Source: AGHT+IHHcmifME9EVrrlhb8m8sPXaah81lLa++lfBB4SCEVPoP7OuNYD66cngnhyzJdNhMCPX+MVDQ==
X-Received: by 2002:a17:906:c149:b0:b3d:b251:cded with SMTP id a640c23a62f3a-b46e4d79a6fmr475328466b.16.1759326765173;
        Wed, 01 Oct 2025 06:52:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 01/25] paho-mqtt-cpp: Improve the license information
Date: Wed,  1 Oct 2025 15:52:19 +0200
Message-ID: <20251001135243.1490753-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120116

From: Peter Kjellerstedt <pkj@axis.com>

Replace the about.html and notice.html files in LIC_FILES_CHKSUM with
the license information from one of the source files. Including HTML
files in LIC_FILES_CHKSUM complicates things when the license files that
OE collects are, e.g., later processed and presented to a user where the
expectation is that they are plain text files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 71e75357af45b3c45e09bf8f5ead3c47c0d2d0ff)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
index 27c0de4744..bb5aa69077 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
@@ -5,10 +5,9 @@ SECTION = "console/network"
 LICENSE = "EPL-1.0 | EDL-1.0"
 
 LIC_FILES_CHKSUM = " \
+    file://src/mqtt/message.h;beginline=9;endline=18;md5=5eec304e6066523386c222963ceeb6ff \
     file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
     file://epl-v10;md5=659c8e92a40b6df1d9e3dccf5ae45a08 \
-    file://notice.html;md5=a00d6f9ab542be7babc2d8b80d5d2a4c \
-    file://about.html;md5=dcde438d73cf42393da9d40fabc0c9bc \
 "
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master \

