Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA4CCCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 13:11:30 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.15063.1760706682111374363
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 06:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/EUnZB/;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee12807d97so1784491f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706680; x=1761311480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LdT0k3ajCpXQ54WJy5ODXgi4DaYvPYd+PDHDGMsho6M=;
        b=T/EUnZB/yWlWctXbFfWQscoW/rteEeBjLWQUvXXQU7hsnQzDA9JRvrWmUBd5uF7OLz
         C47nVV4iKkxUimJEnzLDpkvqfzVHqnTX9VpNklZgWFYHrySk1GRZfHWN9EWSA75QQ/14
         J2KpGpob8WMmZ3XD440ua8BwXeJf/eQq7YvgmsCs6k1BlS6vp7zmuAH6mjUXq1oyUDvG
         bg5BT1aisBb5MDgL6YkQrYcEPrBSK/T41vGi+Q8fX4wlTtwbxOp3o8vnyPvolBouWDB0
         bNQGiIK+ubiB5fUsIIzhnFOWJwCB7EhB5eBryqrhPoQj763Dp+KaT76f1jjVfnVbsuv3
         lEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706680; x=1761311480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdT0k3ajCpXQ54WJy5ODXgi4DaYvPYd+PDHDGMsho6M=;
        b=gkQKM1l9+6zvUcg7NhQeyQoeBf755DTAUYZP2yJCgBq3t3C7NtziY66KtHZ29tiez7
         cROJ0CSrdcuKeveqUh/V3P//p7P/1Bi3zNhPgKRt5oEv67oLUKxyWC58PWqgrD6p/dgg
         T/50pUKWHZSMPkPubMy9O7frUKvn1++vY9xcsC7UzQ0AoRAUFCmZpdyGhqvnSIVynDMX
         EKcTFEqEjNpNjFaq7dWdFYwWqB1XttSXwhy675YKbEgRcylIFbW1Rcxf3WywQ1ORmnPf
         kxiz/7w0kMIqyNAP1lAA5T0KpxpBZVbtXIBx7pcY2lp/NLI73Kg6XZXO4YIRkvO4eDYz
         QzOQ==
X-Gm-Message-State: AOJu0YyiW0XJqnYukj9AJf0Kp4HH3+R8IBkaOYik271d2a2xAu8+SxWK
	WAeqtmZRJa4RPQs5ltEF5ikHKSw2zn01e/HXfvHxEwq1cyaGrww6h7huE0omsQ==
X-Gm-Gg: ASbGncs4kpHzPS/vNMqkVugpkvBqnQu1b4N6BINpGJweQvy6l4FAzB7eWCVjg0TyvSx
	4T5Kt8fNyEWuXoegOJswPFgYQYRyWZGlXgXOBfM2AhLtxHEiYRO6MTFh+5ti+fdH8TNf5Q/Zonu
	dnh6KV6eg8KkM073/wGm4asC/sOjP47kfd5PlW5h1f5MTuH1nhhVUgpS6IdBItnRtbJRosimVJ0
	Kv+CbboSMX7iZYwMBn1ixIFn3vx2GUsLUuvCvnEMJ3oR+NVcMPZ9VPOEr9Iu1K9hAduP9rw/ocY
	vWIIKgMtn87CVkmK+R5chPdlPKscr18IrWNfaYyW07MD2EzqtnUhSOQfGmGLeP+StiQZbbN8+lK
	sNPZmRrCKOtwAAnk8K1uR50A7XZBLVNsosw/+nIfXyoG0+JZPSqdRqAGUtI4iSf/M0Rh+DTBO5j
	supvQhEvmI8+ctdJxaAhE=
X-Google-Smtp-Source: AGHT+IEC+7MU6LAJ1qf/ig15elvwObyNNhj3wIzT7ZCEBIjX8w58agsqQkPILAYRulddKqjJVHZqnA==
X-Received: by 2002:a05:6000:25ee:b0:427:697:c2db with SMTP id ffacd0b85a97d-4270697c302mr1597028f8f.20.1760706680274;
        Fri, 17 Oct 2025 06:11:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe74sm39793792f8f.35.2025.10.17.06.11.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:11:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] function2: fix ptests
Date: Fri, 17 Oct 2025 15:11:18 +0200
Message-ID: <20251017131118.2474234-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 13:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120762

The recipe has inherited the ptest class, however it did not install
not execute any tests.

This change installs the tests and add a script to execute them.

The tests are quick, execution takes single digit seconds.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/function2/function2/run-ptest | 3 +++
 meta-oe/recipes-support/function2/function2_4.2.0.bb  | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/function2/function2/run-ptest

diff --git a/meta-oe/recipes-support/function2/function2/run-ptest b/meta-oe/recipes-support/function2/function2/run-ptest
new file mode 100644
index 0000000000..de0eab0cee
--- /dev/null
+++ b/meta-oe/recipes-support/function2/function2/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+./function2_tests && echo PASS: function2_tests || echo FAIL: function2_tests
diff --git a/meta-oe/recipes-support/function2/function2_4.2.0.bb b/meta-oe/recipes-support/function2/function2_4.2.0.bb
index 2843939ee8..3fe757f0ba 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.0.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 SRCREV = "02ca99831de59c7c3a4b834789260253cace0ced"
 PV .= "+git${SRCPV}"
 
-SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
+SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https \
+            file://run-ptest"
 
 S = "${WORKDIR}/git"
 
@@ -19,3 +20,9 @@ do_install:append() {
 	mv ${D}/${prefix}/Readme.md ${D}/${datadir}/function2/
 	mv ${D}/${prefix}/LICENSE.txt ${D}/${datadir}/function2/
 }
+
+do_install_ptest(){
+	if [ -f ${B}/test/function2_tests ]; then
+		install ${B}/test/function2_tests ${D}${PTEST_PATH}/
+	fi
+}

