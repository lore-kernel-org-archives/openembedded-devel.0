Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD31BC54EE9
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 03:33:13 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web08.3237.1663817592113504767
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Sep 2022 20:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=c5jNlc1G;
 spf=pass (domain: underview.tech, ip: 209.85.167.195,
 mailfrom: vince@underview.tech)
Received: by mail-oi1-f195.google.com with SMTP id m130so10757213oif.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Sep 2022 20:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=49bvjJCZZUF+ew1o5rPo1TgY4yPnQkiv9ne9tmy31fE=;
        b=c5jNlc1Ggkmy1XSolrd3w/J/n+KnzdBpj2sMbFefB3OoCan2Q1JUhEhOu1wwI8FEg6
         kyX3TwFGVQ818bWdKHHsPhj8VUdipQtV2IZqQVXAkFRSq8WI9sTn/2GrebN40yvWEUlc
         oIM/KCnIMeuuAPY4XxtDEZVN7Gi7DID94wrDQYS/n71U6AFR+knyGDxn1tRQqFJW9+Tu
         WkCu2DXo+oVr59z5ovLcfy+ELewJdXi36VsXFqiuBEAb3GHwN596NfkWB5dc3cuEq7b+
         ridZhDE85uZwclX6WN3ZYRWq+pIqCIdWdCRRrwSj27ylmuhRz0KTwgdXnnmK13cGVB9x
         bZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=49bvjJCZZUF+ew1o5rPo1TgY4yPnQkiv9ne9tmy31fE=;
        b=IEZVE48yFQjO9y5nL0uWMl8KWipUS8OmHysUtoJVg6N3r7NbfZr/oe5PT3dETzgDdD
         EU8SDeknCkUPgxKCV8b2AsO2LRCSxxxpOdjX7rBvF3yoSJulU/HC+6kf+GyHYXdtOy/4
         wVRZqSRuY3CVPTx+to9ukfqaj+FM8hX516QmjQF6COkQ1IZL5kkD3segemofmctg/dgw
         zSz0udSlwkPIjYFh1bP3xGehaXPOyFhbJI5ERodxfyhFJcKOVpzoh7NCMn4BDVAt4CeX
         0/ii76gPMqMWYS0THC9PgcHKmbNZzqDFSkaP4jZZaUy/fDRjK09W15GFs8k8bs9VYuUz
         MQEw==
X-Gm-Message-State: ACrzQf3tUSGh16Ww8EC7oohAYtAqGoe044PkJc6RvwvV3bg//um7HrNw
	vqs/FImLBPPb7lyj4xWPGhTw/WUvQHJYfMSiBiE=
X-Google-Smtp-Source: 
 AMsMyM6LeWz2yFzHIiDqg/R7FwgJ9AeKH5xD/TlkQ/rsv9yf+gz2COc7VqTAhhfaDJt0aaxeK95FVw==
X-Received: by 2002:a05:6808:14c7:b0:350:2df7:fa7c with SMTP id
 f7-20020a05680814c700b003502df7fa7cmr658750oiw.180.1663817590968;
        Wed, 21 Sep 2022 20:33:10 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net
 (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a056870a40900b0011f390fdb0asm2556475oal.12.2022.09.21.20.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 20:33:10 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-devel@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [meta-oe][PATCH] cglm: New recipe for cglm-0.8.5
Date: Wed, 21 Sep 2022 22:32:41 -0500
Message-Id: <20220922033241.3216287-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 03:33:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98919

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb b/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
new file mode 100644
index 000000000..5a437c102
--- /dev/null
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
@@ -0,0 +1,25 @@
+SUMMARY = "OpenGL Mathematics Library for C"
+DESCRIPTION = "Highly optimized 2D|3D math library, also known as OpenGL Mathematics (glm) for `C`. \
+cglm provides lot of utils to help math operations to be fast and quick to write. It is community \
+friendly, feel free to bring any issues, bugs you faced."
+HOMEPAGE = "https://github.com/recp/cglm"
+BUGTRACKER = "https://github.com/recp/cglm/issues"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
+
+SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
+# Tag v0.8.5
+SRCREV = "7e5d1f435f628b873347eb052b7d6605b0b997f2"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG[build_tests] = "-Dbuild_tests=true,-Dbuild_tests=false,"
+
+PACKAGECONFIG ?= ""
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON += "--buildtype release"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


