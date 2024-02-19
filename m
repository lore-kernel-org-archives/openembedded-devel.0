Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A564C54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 19:23:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.3065.1708370617792457934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 11:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+W3m30Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d91397bd22so39270395ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 11:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708370617; x=1708975417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTII/lDdnT+/PObMPV0kBeZFMZUCfcx2Epi3yYKESp0=;
        b=f+W3m30Q/ZvolmCDLVJBk7ScMubGEw8yc+x/HODdCufeCXIg7FZ3lyrVksyYvNBOib
         TJ9IITPVH9RBTAZMH7M9AwS7cshrxzj7/Lc68dnnuBpZY3TMnojdtWrIld8PMhVPkMEn
         f2SmzDnvWVGUlCDgkmqisa746irnNREcAyaaorIy8Y/qARhnF/4/HhoW7pAb+esQvCNV
         ZRiJhNZb9THPropFIvLye7iNxj41BEdZFtANqvro0RtV6/gqko5VXyJFI52D1rocUrgl
         GH9C6tAKTxR9xz7EGLEDpdob9msmJkk0kFusja8bBF4H/mg98cc9MlxBcjcblA5dDY7b
         tu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708370617; x=1708975417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTII/lDdnT+/PObMPV0kBeZFMZUCfcx2Epi3yYKESp0=;
        b=xFNXcsg0CNFHX7mtXIS6UDo0MlvDHff6o0myiuh00Zss8iXfnXmLTJ5hAOrT4Bfp+k
         ZTDUAibX3VOMzUZEILUMznyMQ7VU+22dcANyALAxGI3b8KJE467sBUsCNKQyGYuWtBhe
         3J0nkWdtX3FVKdWOwX4YCVR4i1p9H0pkqHu9ZEZPSXk35OK+jDSxgbocnaK58wdXje0q
         HHt4Q3XBLKbqJaUONhf0/nR2HKYeMlnZIiuHY/0iYLyXg/VzBRsvSxh2bf16eiP5RplE
         BbiOha4VescaFiBKxZQBXeRCEH+iAYJnbpI2io4MPnlWLv7P2kD5LcXfMFa48w20rzN7
         vLig==
X-Gm-Message-State: AOJu0YxZdE3F8GNI9Ck3BxcRqaMfZMoaWHx5v2Hg1qgAVXL7NeZuLX59
	2Fdl29xpbQIScJ/bf9O0JsdvNR0grw+ww/aezD5ETwZqgsmEkxNeTAXPs0A8
X-Google-Smtp-Source: AGHT+IFppsZNpYtAxJR2z0JqfHxBRkNPGme0Bu7m0scDn6Jce9MlxSS77dKRb8333tbLveI6LcHBTQ==
X-Received: by 2002:a17:902:c1c4:b0:1db:e6a1:9e87 with SMTP id c4-20020a170902c1c400b001dbe6a19e87mr3890786plc.46.1708370616812;
        Mon, 19 Feb 2024 11:23:36 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id u10-20020a170903304a00b001d7222d8caasm4797723pla.50.2024.02.19.11.23.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 11:23:36 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/5] meta-networking: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 11:23:18 -0800
Message-Id: <2dc2ca46f44d7a7d69879391a056148dbaefe633.1708370337.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708370337.git.tim.orling@konsulko.com>
References: <cover.1708370337.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108883

python 2 is long unsupported, so we no longer need this variable

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-scapy_2.5.0.bb        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
index d99d7016b2..2fd4dc6baf 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
@@ -36,7 +36,7 @@ do_install_ptest() {
     sed -i 's,@PTEST_PATH@,${PTEST_PATH},' ${D}${PTEST_PATH}/run-ptest
 }
 
-RDEPENDS:${PN} = "tcpdump ${PYTHON_PN}-compression ${PYTHON_PN}-cryptography ${PYTHON_PN}-netclient  \
-                  ${PYTHON_PN}-netserver ${PYTHON_PN}-pydoc ${PYTHON_PN}-pkgutil ${PYTHON_PN}-shell \
-                  ${PYTHON_PN}-threading ${PYTHON_PN}-numbers ${PYTHON_PN}-fcntl ${PYTHON_PN}-logging \
-                  ${PYTHON_PN}-difflib"
+RDEPENDS:${PN} = "tcpdump python3-compression python3-cryptography python3-netclient  \
+                  python3-netserver python3-pydoc python3-pkgutil python3-shell \
+                  python3-threading python3-numbers python3-fcntl python3-logging \
+                  python3-difflib"
-- 
2.34.1


