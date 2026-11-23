Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50423.1795423193250003937
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 00:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sTxZFagR;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4aa5833c263so2829147f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 00:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795423191; x=1796027991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BqFZiHRB5ntjN1fd4e6Fy3lLGBBSG9CujU27iBF7v1M=;
        b=sTxZFagRDZes91yXDxr0UVdF8V4TkSY2HH/+g6WZsJKoYTL/sbKoVh295g+9SPQV4u
         d4tUhqVLgg6VTcpVoLc7t+2Khqxe1f95FON3D/YQVuaGmk6u2Lq6h1utkuFqfqSxxvgr
         WTiRUytyTB77kPALa6C3ml8xbpRaJdb52wockWPNXMIcRl6/Rl7OetQoWzC1sgcj/UOO
         BHBI571WWvN0V869i7NeDi1lgK0K4z/BO0WW7nZBMK90/MI0UOQoEuwtTNuz3C3HYhAt
         QT2m7eoDBUDnr8wNt3n9UfNUBeSoiXdF72qUj82lXNl+pRs5uXhQHsy4qYLTfLdOOAdI
         GxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423191; x=1796027991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BqFZiHRB5ntjN1fd4e6Fy3lLGBBSG9CujU27iBF7v1M=;
        b=YM+yL0q4NjD1Gl6STc5l27Vw3L96ncW2U688L76mb/g0zdsrDCWrtVsm2akjy4R/W3
         iugd4sM9QqigIuk7cO1fIMFJxVR90xONQV1ih/l0mk/KgyEzdkDi3rUYkXHSEOWBO5PF
         ySNsjnzRoa6207j4BXCIHiAPlrp37n0F54D/IDMFbssCjnkro/T5bDfNJzOvwPnPoK0a
         Xisn36OAQspVnZHdDKHywD5aSC5n+TBvmY5fDp3j1jpejYbqi2zcDiXXdzub80epx/g1
         eJh+qckHpdVz9wHnqGMwM9BOU0GQeU3pp4OpT7ic3AODchORkOt3HVDyrtD26ZaxmVX5
         EFHQ==
X-Gm-Message-State: APuU4Z8I7whEmHYPkcyMyH1F3jgV0wV+yrhOVKJr3Q4RwQmu0AOZSjal
	xdeFeVdemvJndMugbwFfYoeLdF//gDSbXHwP62S7tkdM0nLaxJr3Rz1Xa5q76Q==
X-Gm-Gg: AZFdTZeh9n4Fl3RRICokTBI9a0GMFbVG8IIa2YGhOke91BxGcWNC7xbGvENsKahTfZE
	da62o0HX/93NDr6y38SIiX/uBMnWliQKP10YQu3e1BiUmkL85gQE4hgPhe7pUOwytN5uDTkjSw7
	AnDhsnGfsX+5EnpXdtD64OTL+Nh5Jmy4/FsVuc0n5sTc02hGYrCZnk8+Fg79gL1QqAppVoHcLq3
	qFf0o9MtWVgjyq5c4KIhj3Mqz7u/zcQInbLXFfccK8wGZqzBVst4Qtt0krNtn0mIgZAf7H79cAv
	v6tcvROjMa3L8Y5NQ6loRIZ2DDM9a795tcUBtN1Glr3mRZIMnNkP4Crd0a0RzrwTAzLf60EqDNl
	jUOoG7ZQj8lBRbuoWVCobuvxQwSFXvlapVzZlEKMLKc4BSTdXpQqBCBbxMd5JsFJSIJvkwqyrLX
	QNwp0f+CrWbm6YeuMVH0H5m3ySoP8yf6f1CQb8AkjFJMBTvuMZmuJPCixdbrQ0jPlnObiuaQpwj
	1T5aeusHCLOWziLIx3fOuIzpo4aDumytDdiPFJfwxHCXG3e7tFCjDRV8BxqrOXrN/9WW36CIM4G
	KypAWzMy8XvGe25fMTATMQq5T3++yRyXM/XdchizzufIvxEF3MwvkwqYH+9TbyhoahDpu08l+t/
	AL/+0xs4r+bBGQg==
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr14731543f8f.47.1795423191327;
        Mon, 23 Nov 2026 00:39:51 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm4419223f8f.19.2026.11.23.00.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:39:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH] python3-paho-mqtt: correct license
Date: Mon, 23 Nov 2026 08:39:04 +0000
Message-ID: <20261123083903.2627354-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 08:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132885
Content-Type: text/plain; charset="utf-8"

The license has been EPL-2.0 or EDL-1.0 since 2.0 (LICENSE.txt and
epl-v20); the recipe still said EPL-1.0.

AI-Generated: Claude Opus 5.5 (Claude Code)
License-Update: EPL-1.0 corrected to EPL-2.0, as shipped since 2.0
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../recipes-devtools/python/python3-paho-mqtt_2.2.0.bb       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.2.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.2.0.bb
index fbfbf064d6bd..946f1867210d 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.2.0.bb
@@ -1,6 +1,7 @@
-SUMMARY = "MQTT version 3.1/3.1.1 client library"
-LICENSE = "EPL-1.0 OR LicenseRef-EDL-1.0"
+SUMMARY = "MQTT version 5.0/3.1.1 client library"
+LICENSE = "EPL-2.0 OR LicenseRef-EDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e5f264c6988aec56808a3a11e77b913 \
+                    file://epl-v20;md5=2dd765ca47a05140be15ebafddbeadfe \
                     file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
 "
 
