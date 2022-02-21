Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2E2C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 05:38:46 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.7609.1645421925371184632
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TPRoUSHQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so2766175pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O6NPZGa1FlfwLsyVCMvcuyj/DbIrzXVpS8dldRMOGro=;
        b=TPRoUSHQt6FfRzOWsHt4cOX4YacszapWFTEfZezG+iJzZ7fzasNwcWPRP7p1vkWkrn
         NZH1dkjpmSKx61BLBrayONiZsZeBTbgKoIeBc5Jum57s+JhxCzw22+FwPQHUvu4V1q4P
         OgfZDo1lbEmiKEw3OD0jGDmqeKn1Ijp4sNRVD4D41IDMGEfBPfDaGZwOMdXRtZIA00Ij
         eTxUunfSJIzChnABhXPR5hqpFwNMdQwMut2CbdEB8jPWXDJRWmhtpHDgn+kb36TV4SWn
         MxfC5fnfWPNxKBv+jlOScUaQAP96X6t+Dq2JUs8WFVp6pigaofx46z86DImpvCSj/XBP
         mUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6NPZGa1FlfwLsyVCMvcuyj/DbIrzXVpS8dldRMOGro=;
        b=5YMRkz+Y0qflnKHqGoZB8ENrTbSma0sFjZfwtCYtUt4nHOcYZ3vdbu7Lt8hbirygAz
         /MARVrCo4J8PqFINy4HVfPj1hHnFqBayk53y0uL5c6zd0b/ikwTw6/XasGqKcuIdgZHQ
         uJX0UnTwjScEuu+s1iNNrs0IzfzmCYVkgeSHvgvU6XHh61xH0UKpQaot8FshC03Ym72f
         BsprBc8f5aIPp06Oiwb5rEsM3M2cmfPXc1AK4pnHWAvQSXQPT+jnkjlzY1ehPPXs2RU7
         /OKbWbIn2iStfMaKFeSi6tq5o2Ba87birZSoiCIhGPiL3Q0brTXRnQ4JeXO4cP39y2IE
         h8Vg==
X-Gm-Message-State: AOAM532dyt7Vb5eeklLWy9ULVzTXgFoQ+4/HBM5nqAjz3OQ9s5UGhO/u
	zK+yz9Go0KBlEQ4rjc369CGamVYitJu7fw==
X-Google-Smtp-Source: 
 ABdhPJyjoiRE2+QHaVM7T7fRjYuzSbZJ1ZEyRkHFiGWUVYRFHcXs52Qv/304KHH9dgq0xGRPK1eWLQ==
X-Received: by 2002:a17:902:b584:b0:14d:b8a8:d11b with SMTP id
 a4-20020a170902b58400b0014db8a8d11bmr17829759pls.64.1645421924655;
        Sun, 20 Feb 2022 21:38:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 h7sm10527444pfi.128.2022.02.20.21.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:38:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 2/6] cairomm: Add recipe for cairomm 1.16
Date: Sun, 20 Feb 2022 21:38:37 -0800
Message-Id: <20220221053841.98265-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221053841.98265-1-raj.khem@gmail.com>
References: <20220221053841.98265-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 05:38:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95400

Upgrade normal cairomm to 1.14.3

Changes in 1.16 are here
https://github.com/freedesktop/cairomm/blob/master/NEWS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cairo/cairomm-1.16_1.16.1.bb               | 18 ++++++++++++++++++
 .../{cairomm_1.12.0.bb => cairomm_1.14.3.bb}   |  7 ++++---
 2 files changed, 22 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.1.bb
 rename meta-oe/recipes-graphics/cairo/{cairomm_1.12.0.bb => cairomm_1.14.3.bb} (53%)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.1.bb b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.1.bb
new file mode 100644
index 0000000000..98ad0a4256
--- /dev/null
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.16.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "C++ bindings for Cairo graphics library"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase
+
+DEPENDS += "boost cairo libsigc++-3"
+
+SRC_URI = "https://www.cairographics.org/releases/cairomm-${PV}.tar.xz"
+SRC_URI[sha256sum] = "6f6060d8e98dd4b8acfee2295fddbdd38cf487c07c26aad8d1a83bb9bff4a2c6"
+
+S = "${WORKDIR}/cairomm-${PV}"
+
+FILES:${PN}-doc += "${datadir}/devhelp"
+FILES:${PN}-dev += "${libdir}/cairomm-*/"
+
diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
similarity index 53%
rename from meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb
rename to meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
index a697e36cd8..6407c68855 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
@@ -3,12 +3,13 @@ SUMMARY = "C++ bindings for Cairo graphics library"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase
 
-DEPENDS = "cairo libsigc++-2.0"
+DEPENDS += "boost cairo libsigc++-2.0"
 
-SRC_URI[archive.md5sum] = "c62b476b61bd0abf7e9851f417d73291"
-SRC_URI[archive.sha256sum] = "a54ada8394a86182525c0762e6f50db6b9212a2109280d13ec6a0b29bfd1afe6"
+SRC_URI = "https://www.cairographics.org/releases/${P}.tar.xz"
+SRC_URI[sha256sum] = "0d37e067c5c4ca7808b7ceddabfe1932c5bd2a750ad64fb321e1213536297e78"
 
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/cairomm-*/"
-- 
2.35.1


