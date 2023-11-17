Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5460C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:18:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8260.1700212678484886015
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=h6RuAnyH;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so17162995e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 01:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700212676; x=1700817476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmV3yRZJ7CvmeWdB7uVktj+hwYIoZ5TvjipVSzeO6fc=;
        b=h6RuAnyHVR1HU5wioZdMGjB+LmNyW7oGA8ALA4x5q+F7kL/t8ufypQAlRnD4D/CVVm
         BOlCkVtPct3h6DuL8vTmUkkpZU18Ad5Qz6bQMaHAS4T3v32Z2BdOzFd9OIpUCwFrLY2P
         OXP7lo00fBO7vGgRLrnsvKPQ1ZEuxSIp2D+wFZsYHL5wrqNxUXndZ6ugYezef9A5s1Od
         MyXrimKu6Od61Fy9qXwlzNJmDeTwGMtwHkgNlgRrIGX4lzmNwIaXnzM0BVZbTewfUf5f
         Y+jfb6gRSm5GDDVQPOAT3O/D0/sW2D3JLZBanbvL7gYJtHF1ZGuP0boK6mw6mPDAs7wr
         XQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700212676; x=1700817476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmV3yRZJ7CvmeWdB7uVktj+hwYIoZ5TvjipVSzeO6fc=;
        b=p2wp2GREFJO2iK52XSwPlghYb3FihqrTsTLrSCiGlTHhg9Xx0RyNFDDc35OXb339IT
         gm/JneqpnPqeYZUqBeRUlgM6+sLPGP7/i3PW5C8IhGmRlWsqUZZi9T9GGOQ5iRsdOhD1
         DaXMA1EVznPqTGRxu8kfJAY9znXgP1UeUy5KcoJ10c0H7oiFnhS+fvsG+pJl4DhyISeP
         66Wjhv/i7YLdi75YSvzD7KLmWE9wrtJBr3sCMDTLt3MHWRqAHKxV5v5wa8KFOD3Kso1t
         v8KZ4O16NY1LQPnqKW6pLX/qiegrT4WEYeMW94dsRB5/oWxFkf0jmxrl0wvDrOgU97Og
         Ubkw==
X-Gm-Message-State: AOJu0YxgQhQRlISh3A3GxUknV5+VN2QndLGCIsMw/k+8gEq9v29i+DIA
	cvl7vMGU/t3W4FqkTYZgh5vdvn0TO3KwF2Gcmak=
X-Google-Smtp-Source: AGHT+IFJ6c7rKmMF1FSAl3RsBETwpd8+p05lTbarXxSqpE/nFGBAr1ZY8GOGSH18i9ECJVgdCR/kgA==
X-Received: by 2002:a5d:648d:0:b0:32f:76f4:b2b with SMTP id o13-20020a5d648d000000b0032f76f40b2bmr3879525wri.11.1700212676315;
        Fri, 17 Nov 2023 01:17:56 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id f12-20020adff44c000000b003313e4dddecsm1679132wrp.108.2023.11.17.01.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 01:17:56 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][kirkstone][PATCH 2/3] libwebsockets: Support building for native
Date: Fri, 17 Nov 2023 10:17:32 +0100
Message-Id: <20231117091733.450572-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231117091733.450572-1-yoann.congal@smile.fr>
References: <20231117091733.450572-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 09:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106862

From: Peter Kjellerstedt <pkj@axis.com>

This is needed to be able to build mosquitto-native.

The dependency on libcap when building for native is needed because
cmake will pick up the existence of libcap from the host, but then the
build fails if it is not available in the sysroot. Unfortunately, there
does not seem to be any way to explicitly tell cmake to not build with
libcap.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c083e0569ad80d11b4f5cfdfa89acdd4264d8152)
Backported: Updated paths to follow PV changes.
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
index 2a3a4ebd0..24b9e9a07 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
@@ -4,6 +4,7 @@ LICENSE = "MIT & Zlib & BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c8bea43a2eb5d713c338819a0be07797"
 
 DEPENDS = "zlib"
+DEPENDS:append:class-native = " libcap-native"
 
 S = "${WORKDIR}/git"
 SRCREV = "8d605f0649ed1ab6d27a443c7688598ea21fdb75"
@@ -44,3 +45,5 @@ RDEPENDS:${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-s
 
 # Avoid absolute paths to end up in the sysroot.
 SSTATE_SCAN_FILES += "*.cmake"
+
+BBCLASSEXTEND = "native"
-- 
2.30.2


