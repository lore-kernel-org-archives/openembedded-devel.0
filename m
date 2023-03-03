Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356E4C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 12:32:36 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.21695.1677846750733156529
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 04:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Do7159N7;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id ky4so2517424plb.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 04:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677846750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ihAvuAAcxLDVf0jxvYO98rj95sfrp0Q0pcprssuMD0=;
        b=Do7159N7fSWTEEInkmW6Nkz5F+scs7C4z6k8J+Axmy7MrlLBrzUdRJr41RlrFvJTYF
         gSncDpGkWHCe5LCBrBYZpW6E76CFLtFWc+vWJYjoLZQHq8jbP+qG3l3r5GBS2lx/7TsG
         e9Q/9/syddRoVZjGqzLvx36dc/NdRf1i4/hGM1UOSrSV2+JGT8ps2/1qpDTAa+GA/qMb
         qIjBrnxtXmXLRx5wCXFrsqWAFO0y1TjSZWeotLMZABtsB6r3giBeeIYlBTrhojJ0+yBf
         teLzal0TBwl/F11/ZYGB+bVJCSuU+E9sVg1xPBxeLF+84b4czsN8aWy6zWpEq64q7rPK
         trrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677846750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ihAvuAAcxLDVf0jxvYO98rj95sfrp0Q0pcprssuMD0=;
        b=vUSOrCvt9cRU+7K1ww7A/+FpacU4bh9Ow+UqIWT9vedvtWM7vc1lDRokI4mtx4UXa7
         /AyXX8Pp/NZ1sijkBE/h7JHl2ijZJnrKtBk2gpnIGiRSSlxX8DJQO5KD/x/J4M/elXJC
         QPY74Kwhf4fOQC8gRNf3LtcqClQmCP1u0lIgS957j951hv0tOxxMs863CzgbDJUvXZer
         xqozxbSauFAhtSdo6PPARE+tXvkAMS3sOD/t8ZgI5fmbO/MLrr+uUP91MOwy489Jjsyn
         ydQsEdiYcjYc69++NvzOFJ8NMYeW4FL6JBY4pnpdzsl/QntauSicpT/A6yrH7DHpPaiH
         5fTg==
X-Gm-Message-State: AO0yUKXMreahwKAZUbHK/eFX58iuWDmhcObO4IIo0weDzYI6kpVzMy65
	wsh1CZjrlIfDIbuQqVWVanrerL9HlD4u/Q==
X-Google-Smtp-Source: AK7set/fA9pWZui13T7nLHA/CcBpsdmRN4TsH/IWQlZYEHDHafVvG7XDIP4ZvwKfgFDfSw9fdzNqOw==
X-Received: by 2002:a05:6a20:8417:b0:c7:1fff:fab7 with SMTP id c23-20020a056a20841700b000c71ffffab7mr2625910pzd.54.1677846749793;
        Fri, 03 Mar 2023 04:32:29 -0800 (PST)
Received: from localhost.localdomain ([27.58.236.238])
        by smtp.gmail.com with ESMTPSA id j37-20020a63fc25000000b00478c48cf73csm1449881pgi.82.2023.03.03.04.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:32:29 -0800 (PST)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	ppjadhav456@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam Jadhav <Poonam.Jadhav@kpit.com>,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 1/4] nodejs: Fix CVE-2022-32212
Date: Fri,  3 Mar 2023 18:02:12 +0530
Message-Id: <20230303123215.296036-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 12:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101347

From: Poonam Jadhav <Poonam.Jadhav@kpit.com>

Add patch to fix CVE-2022-32212

Link: https://sources.debian.org/src/nodejs/12.22.12~dfsg-1~deb11u3/debian/patches/cve-2022-32212.patch

Signed-off-by: Poonam Jadhav <Poonam.Jadhav@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 .../nodejs/nodejs/CVE-2022-32212.patch        | 133 ++++++++++++++++++
 .../nodejs/nodejs_12.22.12.bb                 |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-32212.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-32212.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-32212.patch
new file mode 100644
index 000000000..f7b4b61f4
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-32212.patch
@@ -0,0 +1,133 @@
+commit 48c5aa5cab718d04473fa2761d532657c84b8131
+Author: Tobias Nießen <tniessen@tnie.de>
+Date:   Fri May 27 21:18:49 2022 +0000
+
+    src: fix IPv4 validation in inspector_socket
+
+    Co-authored-by: RafaelGSS <rafael.nunu@hotmail.com>
+    PR-URL: https://github.com/nodejs-private/node-private/pull/320
+    Backport-PR-URL: https://github.com/nodejs-private/node-private/pull/325
+    Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+    Reviewed-By: RafaelGSS <rafael.nunu@hotmail.com>
+    CVE-ID: CVE-2022-32212
+
+CVE: CVE-2022-32212
+Upstream-Status: Backport [https://sources.debian.org/src/nodejs/12.22.12~dfsg-1~deb11u3/debian/patches/cve-2022-32212.patch]
+Comment: No hunks refreshed
+Signed-off-by: Poonam Jadhav <Poonam.Jadhav@kpit.com>
+
+Index: nodejs-12.22.12~dfsg/src/inspector_socket.cc
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/src/inspector_socket.cc
++++ nodejs-12.22.12~dfsg/src/inspector_socket.cc
+@@ -168,14 +168,22 @@ static std::string TrimPort(const std::s
+ static bool IsIPAddress(const std::string& host) {
+   if (host.length() >= 4 && host.front() == '[' && host.back() == ']')
+     return true;
+-  int quads = 0;
++  uint_fast16_t accum = 0;
++  uint_fast8_t quads = 0;
++  bool empty = true;
++  auto endOctet = [&accum, &quads, &empty](bool final = false) {
++    return !empty && accum <= 0xff && ++quads <= 4 && final == (quads == 4) &&
++           (empty = true) && !(accum = 0);
++  };
+   for (char c : host) {
+-    if (c == '.')
+-      quads++;
+-    else if (!isdigit(c))
++    if (isdigit(c)) {
++      if ((accum = (accum * 10) + (c - '0')) > 0xff) return false;
++      empty = false;
++    } else if (c != '.' || !endOctet()) {
+       return false;
++    }
+   }
+-  return quads == 3;
++  return endOctet(true);
+ }
+ 
+ // Constants for hybi-10 frame format.
+Index: nodejs-12.22.12~dfsg/test/cctest/test_inspector_socket.cc
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/test/cctest/test_inspector_socket.cc
++++ nodejs-12.22.12~dfsg/test/cctest/test_inspector_socket.cc
+@@ -851,4 +851,78 @@ TEST_F(InspectorSocketTest, HostCheckedF
+   expect_failure_no_delegate(UPGRADE_REQUEST);
+ }
+ 
++TEST_F(InspectorSocketTest, HostIPChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 10.0.2.555:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostNegativeIPChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 10.0.-23.255:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpOctetOutOfIntRangeChecked) {
++  const std::string INVALID_HOST_IP_REQUEST =
++      "GET /json HTTP/1.1\r\n"
++      "Host: 127.0.0.4294967296:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpOctetFarOutOfIntRangeChecked) {
++  const std::string INVALID_HOST_IP_REQUEST =
++      "GET /json HTTP/1.1\r\n"
++      "Host: 127.0.0.18446744073709552000:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpEmptyOctetStartChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: .0.0.1:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpEmptyOctetMidChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 127..0.1:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpEmptyOctetEndChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 127.0.0.:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpTooFewOctetsChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 127.0.1:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpTooManyOctetsChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 127.0.0.0.1:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
+ }  // anonymous namespace
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
index 8dbdd088e..2258cb108 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://big-endian.patch \
            file://mips-warnings.patch \
            file://0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch \
+           file://CVE-2022-32212.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.25.1


