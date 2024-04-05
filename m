Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04857C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 17:00:59 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.17896.1712336453161167095
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 10:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QiI4RAUN;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-36a0aed8accso4699695ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712336452; x=1712941252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlRiywzJvdNYsHcyc/O9bXkwId9416bE+rJV/9TMnDc=;
        b=QiI4RAUNZKjObXC6qTQM+4quIhYXLmI/1368q3F2vW7X0SXOcqffJjrXigLG+sk6E2
         /G1c0O0Mj2CqOmOwFtqhQOYS+ZR1hv7S0UpwmRughtVTrhuvkssdSa0o0t0FBzWcxsyn
         oM7GP3aRmD77IjknYNr7nZFDmOZHud0u4yTSv2EaQmfK+aX/PL2fOVgleSFjFuCMEE66
         nV3MUNtXqvjgi438Ceti0F+SdWIg+uFA8U75bwndE/fWe6bPz3yRm4Y7EVChuIbUwD1I
         HPZ/D4nTNpiRuo0eaRclnxYU1YIXR8SgEZFDNZ/ivvWc5gP06fAt/Z/MQIaINyQ7p3XD
         nhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712336452; x=1712941252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlRiywzJvdNYsHcyc/O9bXkwId9416bE+rJV/9TMnDc=;
        b=Y8RN1erE27xww8jKxZqKgzZCMlWE7xZnmJdsb7nsQN9jdc+xM+ugwEcKfBwv7brsbY
         GMUy1IPGUFiYF3OGblRaWyKA9DyTX0oiesUDJTuBYwa2nHEww+ELeGofy4Rv2i4LH7EQ
         tFh2TxomeeHNaOvzAHmsFn6koXEiT9A2KooSPOcuWRWr9tGYFWcMa+xfnFw+CxY7kn27
         I4a1PVqk3BPwcWJMsqh/x0hclwuZfzaE450LKeJqBEHFB6V+D6ggD2wj2h6ox74v5lEo
         NgT7DDbFyCt4fKeAI0RxERKW/+xvpvezYj8CbzUMIJLRBkKf/9jXmLqOQ1jXRp9jPopF
         5UzA==
X-Gm-Message-State: AOJu0YyUoeK2Nl8zA2NyP+iC23pLk6rL1Qs9q4bxTd7A992miUtPTlvF
	cmgJM5ntNwJ3036J3NIGAWJvOw2MSDtwh+cwoxHGy7tCsqp76UBqEdvCjrjz5Dg=
X-Google-Smtp-Source: AGHT+IGHoWjbl/hkMVJZd6BGcapsr6/3BRYewAiACH2ZIUPsw1IDzuJ3jOui+Yrbf90OPgiFoetV0w==
X-Received: by 2002:a05:6e02:15cb:b0:368:a0d1:9200 with SMTP id q11-20020a056e0215cb00b00368a0d19200mr2569893ilu.12.1712336452164;
        Fri, 05 Apr 2024 10:00:52 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id y22-20020a05663824d600b0047ec65f586fsm665244jat.171.2024.04.05.10.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 10:00:51 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-oe][PATCH] libfido2: new recipe
Date: Fri,  5 Apr 2024 11:00:32 -0600
Message-ID: <20240405170032.3299945-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 17:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109827

From: Dan McGregor <dan.mcgregor@usask.ca>

libfido2 adds support for FIDO2 authenticators. It's required for
OpenSSH to support FIDO backed keys, which I intend to add optional
support for in oe-core.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../libfido2/libfido2_1.14.0.bb               | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb

diff --git a/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb b/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
new file mode 100644
index 00000000000..08d3f4e84df
--- /dev/null
+++ b/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "FIDO 2.0 support library"
+DESCRIPTION = "libfido2 provides library functionality and command-line tools to \
+communicate with a FIDO device over USB, and to verify attestation and \
+assertion signatures."
+HOMEPAGE = "https://developers.yubico.com/libfido2"
+LICENSE = "BSD-2-Clause"
+SECTION = "libs/network"
+DEPENDS = "libcbor openssl zlib udev"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5f14cb32bdf2b87063e0a2d20c4178d0"
+
+SRC_URI = "https://developers.yubico.com/${BPN}/Releases/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "3601792e320032d428002c4cce8499a4c7b803319051a25a0c9f1f138ffee45a"
+
+inherit cmake pkgconfig manpages
+
+PACKAGECONFIG[manpages] = "-DBUILD_MANPAGES:BOOL=ON,-DBUILD_MANPAGES:BOOL=OFF"
+
+EXTRA_OECMAKE = "-DUDEV_RULES_DIR=${nonarch_base_libdir}/udev/rules.d -DBUILD_EXAMPLES:BOOL=OFF"
+
+PACKAGE_BEFORE_PN = "${PN}-tools"
+
+FILES:${PN}-tools = "${bindir}/fido2-*"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


