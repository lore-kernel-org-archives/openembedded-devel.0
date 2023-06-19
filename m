Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D23EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 18:20:35 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.14910.1687198831372515676
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 11:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EtVu5Bzz;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: beniaminsandu@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-988c495f35fso137860566b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 11:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687198830; x=1689790830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLDkNZh27DsKX1aMohcRyEM4AVtT9VCPMtS0dnDMW1M=;
        b=EtVu5Bzz80oI+8GKHKPEpPynYY3XfQ3G61hwGdBRMo+lX1Q9aZVXH0wYR9fSz5EmgZ
         haDAtAClOYSNbqWnlv2GSFP9MOMPZ810xb3vPmE6RAtD23TeUa/eSZl4LdgzVz920JrH
         VN6huLvyu8GvzV7n9gtFy2VvI1rLMK6UsFPhvAVw67lMu0SEZj2KNNvEemssKcoccdPK
         f+UpVJWQldRvNKo8fdvdmej0Qv3Uds2sHz/hPkx0XxWCsjfvSSWvCIG7HhucAqHL/Vd3
         jBlnfRjWrYNXHQ0JAQGbW1sTwHhBNCH+VUInJv8E2Xes3nSTuXFOIt0yLPmpOxZdNP22
         DOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687198830; x=1689790830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLDkNZh27DsKX1aMohcRyEM4AVtT9VCPMtS0dnDMW1M=;
        b=jQikZYUDNtO18EnUFN5jfny1X1WKuRGcnPVtqFSRv1z6Qk2Bh4eZH5tgBKPNR7bRjG
         Ry42JpPQlHdD1Cz3bhm71BBG5f4gxnNFH6W2iwO9YhaBYeyYv+sm+mVmyiyjnSAyjrW8
         jTjCETeE4/AI9PlA5Am7Q0GYIQtQ6BFi8eAaW2JfZ5xCDbUeSJYavW88RTkrxZykZ00V
         yaQICSDbaEzYOCMberRXJNbEK6Mo/5ANIdTR1mxqUtdxUUtts62hCzFjraGQhlVoTLcR
         80KShZbZFCJY35XOtWz7LMrWmpWPHf37b+4qwJ/l1v4733lDN7g0cv+zl72pQ/rfaU4D
         BDLA==
X-Gm-Message-State: AC+VfDzIOoxXLsH/CUBPU2Atvc6/KWNU2/+3Ba0egdLuJP4zg+iPFHTm
	TdUS8I9np8EL/9Yirj5SulybesYHhHhc/1tQ
X-Google-Smtp-Source: ACHHUZ5/lX+ABhYULgJ4qWfkgwf7GpxZyRXe4o6aGI3D4p+5DX7RgRbVCtK0b7rxQOn3teIoSSfbFw==
X-Received: by 2002:a17:907:7f2a:b0:97e:ab29:952c with SMTP id qf42-20020a1709077f2a00b0097eab29952cmr10547956ejc.2.1687198829539;
        Mon, 19 Jun 2023 11:20:29 -0700 (PDT)
Received: from localhost.localdomain ([5.13.151.121])
        by smtp.gmail.com with ESMTPSA id a20-20020a170906275400b0095807ab4b57sm25221ejd.178.2023.06.19.11.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 11:20:28 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] mdns: remove unneeded headers
Date: Mon, 19 Jun 2023 21:19:55 +0300
Message-Id: <20230619181955.103171-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 18:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103440

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../mdns/0009-remove-unneeded-headers.patch   | 33 +++++++++++++++++++
 .../recipes-protocols/mdns/mdns_1790.80.10.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch

diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
new file mode 100644
index 000000000..74d387368
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-headers.patch
@@ -0,0 +1,33 @@
+From 1d7e71e72c597ffcc19c04373a477d1fbd3ad955 Mon Sep 17 00:00:00 2001
+From: Beniamin Sandu <beniaminsandu@gmail.com>
+Date: Thu, 15 Jun 2023 17:02:58 +0000
+Subject: [PATCH] remove unneeded headers
+
+From a quick look, these seem to not be needed and having them
+breaks the build with mbedtls 3.x. Without them it builds fine
+on both 2.x and 3.x versions.
+
+Upstream-Status: Pending
+
+Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
+---
+ mDNSPosix/mbedtls.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
+index a73681b..ab8f8c7 100644
+--- a/mDNSPosix/mbedtls.c
++++ b/mDNSPosix/mbedtls.c
+@@ -38,10 +38,8 @@
+ #include <mbedtls/sha256.h>
+ #include <mbedtls/base64.h>
+
+-#include <mbedtls/certs.h>
+ #include <mbedtls/x509.h>
+ #include <mbedtls/ssl.h>
+-#include <mbedtls/config.h>
+
+ // Posix TLS server context
+ struct TLSContext_struct {
+--
+2.34.1
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
index 612d343c8..46f1b70cb 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1790.80.10.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0006-Handle-noisy-netlink-sockets.patch \
            file://0007-Mark-deleted-interfaces-as-being-changed.patch \
            file://0008-Handle-errors-from-socket-calls.patch \
+           file://0009-remove-unneeded-headers.patch \
            file://mdns.service \
            "
 SRCREV = "8769ab51605e465425d33d757f602ce5905ca639"
-- 
2.25.1


