Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566A0C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:16 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.24943.1647823875397237172
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rb3trJ0h;
 spf=pass (domain: konsulko.com, ip: 209.85.160.178,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f178.google.com with SMTP id 10so10871064qtz.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aNZ0+x4pYGaR+WgLkLcNN1gxl3sZPAHihcue3TRWy/M=;
        b=rb3trJ0hiM6auFE8J0XQSnYoyNrdP+ypVS9ml5Vnv2wiIk4uFVQ9xGtHWrGkrmJuCv
         Rdp6TbR1zZ79fiI6BZoKEUVZY/M6khc2i9TUEoaneCAxaEp9LQ2tYCLw40nGWxWunOUy
         gZ/SYtQjTw6im2KC9LEzaXWoUK41pLswDUMA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aNZ0+x4pYGaR+WgLkLcNN1gxl3sZPAHihcue3TRWy/M=;
        b=Nd6Pqy/EdEKqLT1xHxErcyv4welQ6HYvbjX0ezOuCPr2o9bbDmlXjWay9BPNEh1gOB
         56j8fybNt3V2ZQxLgYevYVSZeFhRhq/2sW9L51yEsejzEmOWARw33xLPof3e51cKtwkF
         /q3ZtpROrwMi7TIpS4pNg1DEsIt0CZsQaQzXA/ZPDMk+qaCwcPFQ3g74g0wjNCCSu6zl
         3J631WVytky8ed3oeg7SEHplEwJEzXRIqzeyAftFRz9DUv1bXD3y0Y9wOf32tQQQOOQm
         t8/4HqGjhknwsp2HX1LrZBSER9Fzx3QJcixALbzJ+dVYuWk1koQllOcpW0AUsru9WOds
         UmFA==
X-Gm-Message-State: AOAM533Lggh7qVtoe1WmQtPIJXooJZNwLk3H3siNtzB5rLdFz9OiyZFV
	NOj7CqkeXelhQOl8Aso1W4I68ykFRxA1Vg==
X-Google-Smtp-Source: 
 ABdhPJzMpXecZWcS0GRcl1JhApTW9bv7F3W8RPXEzlnitJ1tAWgOlR3WuIeC2NX7eCQX6XxrrlAA+Q==
X-Received: by 2002:ac8:4e95:0:b0:2e2:15e6:c10c with SMTP id
 21-20020ac84e95000000b002e215e6c10cmr1206519qtp.444.1647823874133;
        Sun, 20 Mar 2022 17:51:14 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:13 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/8] python3-urllib3: Remove
Date: Sun, 20 Mar 2022 20:50:42 -0400
Message-Id: 
 <02662d3430bc0e066fe63b0de33f9e55f3db89aa.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647823458.git.scott.murray@konsulko.com>
References: <cover.1647823458.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96099

This recipe has been moved to oe-core.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-urllib3_1.26.8.bb          | 22 -------------------
 2 files changed, 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-urllib3_1.26.8.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 260687aa5..682814a6a 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -421,7 +421,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-ujson \
     python3-unidiff \
     python3-uritemplate \
-    python3-urllib3 \
     python3-vcversioner \
     python3-versiontools \
     python3-visitor \
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.8.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.8.bb
deleted file mode 100644
index c2a51b914..000000000
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.8.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
-HOMEPAGE = "https://github.com/shazow/urllib3"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
-
-SRC_URI[sha256sum] = "0e7c33d9a63e7ddfcb86780aac87befc2fbddf46c58dbb487e0855f7ceec283c"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-certifi \
-    ${PYTHON_PN}-cryptography \
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-idna \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-pyopenssl \
-    ${PYTHON_PN}-threading \
-"
-
-CVE_PRODUCT = "urllib3"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


