Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB7DE78497
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 21:40:18 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.68797.1696196409332034206
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 14:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FfvJnByo;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-57de6e502fcso3735638eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 14:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696196408; x=1696801208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apF/D4XTRTMwhnijP8sWqjBgO9VvH33JuicN6ySqNdU=;
        b=FfvJnByo52Unx0SwEyIO/C9bZf/ReE/ErTWGzhE4CPBqxOTTo6zIM+Q+NZf4pdP4Vd
         PbQZr3ai8sSgALJXz+xc8ILA4JL7zQ0I5tuVO/xmqR2od2rWh0T/LSP96SC/Ee38K5T9
         rhzJUXEYoDaeisH7yAIsAbLFz2dGj0MZOkNgE1jKN3xPFEFnQIAVFfF0fWz1s2mvAGEU
         QVsLZBDDE6aps2g8tuFFEmC7Wy+lxVlNewEbIzBfxiX3KqftLKdMyJVAww5C4/Ut9z2X
         UYBtdffYJ5bLmq6beQErPLtsO5JOaZdI9gK+myP+boR0hyc7QQo1isx3BJAC5bR8BjBI
         fDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696196408; x=1696801208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apF/D4XTRTMwhnijP8sWqjBgO9VvH33JuicN6ySqNdU=;
        b=YXueSV7LAErbXURqJpUBF7/EHr6sokUx7BcOkwtfsLrEsGeA1iurgJM0kGcqWuJIuR
         2DMAEC/vP5HNEm8Mp9Ja7EMzOoFWAgz5kzgV7TMkX72ddc2wXE7Wb4+Tlo/sIv1FIJD4
         U9xZ/ree3nw4D/BSiNt5yYMfN8WgwEDLJT31RiWeQzXU7Qn15VwwKUP+HtPGMEGBhSY1
         vz/dyrYO9kouwP/XaIY8PsJC/AhrWTjbNNfa+sW400t7ok8zZuSvqdcmqBDuxbFwWWVO
         IoTm5pNe/wHqUbelNSAPqmRZedkLGocGWzz2ozU1yuT28q0eLAEObU0H82/YtrBdy/qS
         DbqA==
X-Gm-Message-State: AOJu0YzJkFb+cP9s8a5qynkd1Y94kD0sjv8RTXmlaqfJVyEWJriWWtjI
	N3Zia5zPkp8fXtYl18gJ3RRr9gmklJoKrg==
X-Google-Smtp-Source: AGHT+IHcbpahlR8r63N0wZAHJgkhZH9Brj3MaE3JoeXiSli0T8MzEQ6liQ6U3cymBWFosRmvzQVGzw==
X-Received: by 2002:a05:6358:8827:b0:143:7949:fb2a with SMTP id hv39-20020a056358882700b001437949fb2amr9484994rwb.7.1696196408184;
        Sun, 01 Oct 2023 14:40:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id g23-20020aa78197000000b00684ca1b45b9sm18720012pfi.149.2023.10.01.14.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 14:40:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] relayd: Update to latest tip of trunk
Date: Sun,  1 Oct 2023 14:40:04 -0700
Message-ID: <20231001214005.766217-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 21:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105298

Drop the patch fixing an issue already addressed upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-rtnl_flush-Error-on-failed-write.patch | 34 -------------------
 .../recipes-connectivity/relayd/relayd_git.bb |  6 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch

diff --git a/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch b/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch
deleted file mode 100644
index eaaf30460f..0000000000
--- a/meta-networking/recipes-connectivity/relayd/relayd/0001-rtnl_flush-Error-on-failed-write.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2fa326b26dc479942367dc4283e2f87372403988 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 17 Jun 2017 09:32:04 -0700
-Subject: [PATCH] rtnl_flush: Error on failed write()
-
-Fixes
-route.c:45:2: error: ignoring return value of 'write', declared with attribute warn_unused_result [-Werror=unused-result]
-|   write(fd, "-1", 2);
-|   ^~~~~~~~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- route.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/route.c b/route.c
-index c552d1f..fc5c31e 100644
---- a/route.c
-+++ b/route.c
-@@ -42,7 +42,8 @@ static void rtnl_flush(void)
- 	if (fd < 0)
- 		return;
- 
--	write(fd, "-1", 2);
-+	if (write(fd, "-1", 2) < 0 )
-+		perror("write");
- 	close(fd);
- }
- 
--- 
-2.13.1
-
diff --git a/meta-networking/recipes-connectivity/relayd/relayd_git.bb b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
index 1da18d7ca0..5105753e73 100644
--- a/meta-networking/recipes-connectivity/relayd/relayd_git.bb
+++ b/meta-networking/recipes-connectivity/relayd/relayd_git.bb
@@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://main.c;endline=17;md5=86aad799085683e0a2e1c2684a20bab
 
 DEPENDS = "libubox"
 
-SRC_URI = "git://git.openwrt.org/project/relayd.git;branch=master \
-           file://0001-rtnl_flush-Error-on-failed-write.patch \
-"
+SRC_URI = "git://git.openwrt.org/project/relayd.git;branch=master"
 
-SRCREV = "f4d759be54ceb37714e9a6ca320d5b50c95e9ce9"
+SRCREV = "f646ba40489371e69f624f2dee2fc4e19ceec00e"
 PV = "0.0.1+git${SRCPV}"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.42.0


