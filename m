Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98110C46CCD
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 13:38:55 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.43631.1702906728848957547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 05:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ckFIYyCs;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so33080455e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 05:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702906727; x=1703511527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PAOfdJ+GV6NMqNUm5Ps2O6K0r7xm/iwJzBJjg2SGnsM=;
        b=ckFIYyCsmGdlUergMX3nFzDBe9nFDh66YJlFfnH9xqGvzVeOXN7TN63+i9ath205/w
         TjhujCJvh1fBBfd+atgV2sZyFICFEkzFIE9ROURrNEpzguTioR/2UjGc3n9NSE5Y3vyR
         oIO0WWDrLrHJwaMO2owYoI6a0J8FS/gRT9lLpQS8QrioI5zMKaSrTuqmjEpbhsAh9wka
         ynaQecPz5r41EZh/1h1ggv3PQR5SfsAV+POMZw40RJXxSoMr4L8ZLmWte91WKCW331s2
         bTDQzHeEU2pt4ZgeYGeU852LiGTeKze4E6RxLR1geA4gaWpKDjuT2RYzS7WyLanyMWvm
         7E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702906727; x=1703511527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAOfdJ+GV6NMqNUm5Ps2O6K0r7xm/iwJzBJjg2SGnsM=;
        b=Qz2/iBc2fZoCaC9V/90RO9+hXGFlKbFYZ0TBVBs7y3e7rLWholXjrtD1tSUeE1SHgo
         lJccBTYEL0MeRRNOvgELJh7g8w6Oq5yite0m6Vt3xo5lRUlbglLTROLy8Zj6w1kV6nUX
         xjBOXGfR51M5cxESreUN4B7DUFBxaUolB8CFkSpsyJ4t1j1aYheH9Go/mQNX9CpWBN5C
         D2oblxmSx2Jqv3NUrXwUGbiyFoP0uqmMZk9trAnCPAUnroDUsVzInJE+gZmNELEyQDki
         PAERtGwKh5RWIVMB0kO9rb3Ti1938uCM/rv3fm0J2UcVuzYrLy89d1Me9Hdnj3Vb5EpE
         vzxQ==
X-Gm-Message-State: AOJu0YyslInfyQeykfzePeFVLWwRDy6XqlSjWPc2o/2WdDQjqQCXQXrq
	DLih/vyLOWGWn55Vh0TxfO9Vb3mTemc=
X-Google-Smtp-Source: AGHT+IFRZXW74aZ55Vstfi/sTSdLRqSdn+4f+zOeB50sK5hPnX5QXDTu7rPPQaa06cmYHn9OKrbu7w==
X-Received: by 2002:a7b:c451:0:b0:40c:2f84:599c with SMTP id l17-20020a7bc451000000b0040c2f84599cmr8221760wmi.134.1702906726343;
        Mon, 18 Dec 2023 05:38:46 -0800 (PST)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id f10-20020adff8ca000000b003365951cef9sm8416350wrq.55.2023.12.18.05.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 05:38:46 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] mbedtls: Upgrade 3.5.0 -> 3.5.1
Date: Mon, 18 Dec 2023 13:37:47 +0000
Message-Id: <20231218133747.28222-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 13:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107544

Use canonical URL, add UPSTREAM_CHECK_GITTAGREGEX.

Changes:

Dave Rodgman (12):
      Header updates
      Fix some non-standard headers
      Update documentation
      Add Changelog for license
      Update license for p256-m
      README improvements to 3rdparty section
      assemble Changelog
      Fix typos in changelog
      Bump version
      Update BRANCHES
      Update Changelog with bugfix entry
      Add docs re Everest license

David Horstmann (1):
      Fix 3rdparty target names for custom config

License-update: Upstream clarified licensing as dual Apache-2.0 or GPL-2.0 or later
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../mbedtls/{mbedtls_3.5.0.bb => mbedtls_3.5.1.bb}       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.5.0.bb => mbedtls_3.5.1.bb} (90%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.1.bb
similarity index 90%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.1.bb
index 5f284227edc0..6fc824898a58 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.1.bb
@@ -17,16 +17,17 @@ understand what the code does. It features:                          \
 
 HOMEPAGE = "https://tls.mbed.org/"
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LICENSE = "Apache-2.0 | GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "1ec69067fa1351427f904362c1221b31538c8b57"
-SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
+SRCREV = "edb8fec9882084344a314368ac7fd957a187519c"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=master \
 	file://0001-AES-NI-use-target-attributes-for-x86-32-bit-intrinsi.patch \
 	file://run-ptest"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake update-alternatives ptest
 
-- 
2.39.0


