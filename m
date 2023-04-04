Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0541FC77B6C
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 23:51:05 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.118101.1680652257129951457
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 16:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=h6C3Wb7w;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680652257;
  x=1712188257;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JAm9OU+xaydyG4IZtHgePzeuPDFtZEt1/bx+JCTIUJc=;
  b=h6C3Wb7wsjCJupEVLRwUBSqeiM7qasMCL5A8cai7trLXYn472xIwDDEU
   YMGX/DkMQ3+IsV/6zoSGx9xlpt+K2xcVCpUq1WaMKzEa+npqN0RmL3eOy
   +liTya7irBKZSz2plslfQtQUucJ0w+EupWmxao9GHG/vqXYMO3ZzU4R2e
   KSdeLaOHY2iSGl2ockarmOIfaSvbkIdEa3AMghLK/cQ0mEYmULRAGcdVo
   AdymVVUVDWOYt40yq03alvRc31SGK+XxqHULF2kF1pV+UhRvmphbGFNsK
   /o0i2quzh3bTMutNT6/wcmyPLwFC+Il4bApaalSX25djBwj8l5J8RxvWI
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/5] paho-mqtt-c: Improve the license information
Date: Wed, 5 Apr 2023 01:50:43 +0200
Message-ID: <20230404235047.601178-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 23:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101956

Replace the about.html and notice.html files in LIC_FILES_CHKSUM with
the LICENSE file. Including HTML files in LIC_FILES_CHKSUM complicates
things when the license files that OE collects are, e.g., later
processed and presented to a user where the expectation is that they are
plain text files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
index d006ae763..7a65582db 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
@@ -5,10 +5,9 @@ SECTION = "console/network"
 LICENSE = "EPL-2.0 | EDL-1.0"
 
 LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=fd3b896dadaeec3410d753ffaeadcfac \
     file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
     file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
-    file://notice.html;md5=943f861069889acecebf51dfa24478e2 \
-    file://about.html;md5=e5662cbb5f8fd5c9faac526e4077898e \
 "
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http;branch=master;protocol=https"

