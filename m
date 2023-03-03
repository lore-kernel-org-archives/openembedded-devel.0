Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCB2C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 12:32:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.21698.1677846759058469396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 04:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HK48O02z;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id h8so2471199plf.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 04:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677846758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bD6o0QRmL2CQqxYakxO0O5br16Vx0sdO/dJxaSagQpk=;
        b=HK48O02zTm6Y2NxC6DkfFp+IukheIHQhRh5WFjnxJMdGVuWDpGWkE61WlbcQAIpIh3
         C/KCNW4VEdJyirgZzRX71RrQV0n0MkK53Mvr8SZNuMzAq/3VUctZam7c2RnNSCgsbA4D
         ahThiaS1U3K6zcoixFbM/WRLaxmBuH4jDUfkCDnfTtwGPRF/JHZztYWKlOmk36n6G3qa
         O7ofrYSA1HU/D5HNpqG2K3D1UrXtaGNz6HEOYveJ33RZ8hJyzPk9bD5bUG+1dutU7yu7
         HihWivhGlZryVNIy0XKrX0OPY1hbZRk3OgRo4fKZbq1JV8JmXIfw5e6IaVsUjt0Mvs/3
         cx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677846758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bD6o0QRmL2CQqxYakxO0O5br16Vx0sdO/dJxaSagQpk=;
        b=x0uNYDGSNY9ivrCYCIF6ewcGFXVPxoTiJfpPENLncrUjEIcD8PBLFqYWrblBY9bTKP
         CQ3yjELtJ1sOQXVF7ULXxxR1Ipx2Y6QwnNRLGHSosclhcx2ppqRmUlgimMZyIMrljhJ9
         jVPwa2gjYJNQhFTsxw0/5T2a+HpwfKkmb4tqs01Lj0n/98cO+OjQ3fY1j+1sECH/boQd
         egA7It51XluWBILnr50Pdc4Ek3+Ka3ZuyvXWcmHmZRsPsEgyJMogmAOqhfKWXdiR4mxt
         rHERCkkgQJE3GybUlQdRlcGyrFlP/tbaBubCZjFt0WMLHFPXe4g3ZQB1ZLozfLeyxHrv
         vYwQ==
X-Gm-Message-State: AO0yUKUWhjsbk/cJ6jCjvil6TsPGaNDjqgczmcPlBFblS9A+Q9gpErgm
	GrMVnUwYrdLnlMw7ennoYMd2AgKUTnbBHw==
X-Google-Smtp-Source: AK7set/5lGjhkyjCHe+vF+HIZQ9F0PUMQ7dJT9xemyhjyQqc7aOM88LobvUrlQXVPMwG/sfClNS+PA==
X-Received: by 2002:a17:902:d4c9:b0:19d:90f:6c30 with SMTP id o9-20020a170902d4c900b0019d090f6c30mr1717925plg.49.1677846758163;
        Fri, 03 Mar 2023 04:32:38 -0800 (PST)
Received: from localhost.localdomain ([27.58.236.238])
        by smtp.gmail.com with ESMTPSA id j37-20020a63fc25000000b00478c48cf73csm1449881pgi.82.2023.03.03.04.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:32:37 -0800 (PST)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	ppjadhav456@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam Jadhav <Poonam.Jadhav@kpit.com>,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [oe][meta-filesystems][dunfell][PATCH 3/4] nodejs: Fix CVE-2022-43548
Date: Fri,  3 Mar 2023 18:02:14 +0530
Message-Id: <20230303123215.296036-3-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303123215.296036-1-omkarpatil10.93@gmail.com>
References: <20230303123215.296036-1-omkarpatil10.93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 12:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101349

From: Poonam Jadhav <Poonam.Jadhav@kpit.com>

Add patch to fix CVE-2022-43548

Link: https://sources.debian.org/src/nodejs/12.22.12~dfsg-1~deb11u3/debian/patches/cve-2022-43548.patch

Signed-off-by: Poonam Jadhav <Poonam.Jadhav@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 .../nodejs/nodejs/CVE-2022-43548.patch        | 214 ++++++++++++++++++
 .../nodejs/nodejs_12.22.12.bb                 |   1 +
 2 files changed, 215 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-43548.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-43548.patch b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-43548.patch
new file mode 100644
index 000000000..54da1fba9
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2022-43548.patch
@@ -0,0 +1,214 @@
+commit 2b433af094fb79cf80f086038b7f36342cb6826f
+Author: Tobias Nießen <tniessen@tnie.de>
+Date:   Sun Sep 25 12:34:05 2022 +0000
+
+    inspector: harden IP address validation again
+    
+    Use inet_pton() to parse IP addresses, which restricts IP addresses
+    to a small number of well-defined formats. In particular, octal and
+    hexadecimal number formats are not allowed, and neither are leading
+    zeros. Also explicitly reject 0.0.0.0/8 and ::/128 as non-routable.
+    
+    Refs: https://hackerone.com/reports/1710652
+    CVE-ID: CVE-2022-43548
+    PR-URL: https://github.com/nodejs-private/node-private/pull/354
+    Reviewed-by: Michael Dawson <midawson@redhat.com>
+    Reviewed-by: Rafael Gonzaga <rafael.nunu@hotmail.com>
+    Reviewed-by: Rich Trott <rtrott@gmail.com>
+
+CVE: CVE-2022-43548
+Upstream-Status: Backport [https://sources.debian.org/src/nodejs/12.22.12~dfsg-1~deb11u3/debian/patches/cve-2022-43548.patch]
+Comment: No hunks refreshed
+Signed-off-by: Poonam Jadhav <Poonam.Jadhav@kpit.com>
+
+Index: nodejs-12.22.12~dfsg/src/inspector_socket.cc
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/src/inspector_socket.cc
++++ nodejs-12.22.12~dfsg/src/inspector_socket.cc
+@@ -10,6 +10,7 @@
+ 
+ #include "openssl/sha.h"  // Sha-1 hash
+ 
++#include <algorithm>
+ #include <cstring>
+ #include <map>
+ 
+@@ -166,25 +167,71 @@ static std::string TrimPort(const std::s
+ }
+ 
+ static bool IsIPAddress(const std::string& host) {
+-  if (host.length() >= 4 && host.front() == '[' && host.back() == ']')
++  // TODO(tniessen): add CVEs to the following bullet points
++  // To avoid DNS rebinding attacks, we are aware of the following requirements:
++  // * the host name must be an IP address,
++  // * the IP address must be routable, and
++  // * the IP address must be formatted unambiguously.
++
++  // The logic below assumes that the string is null-terminated, so ensure that
++  // we did not somehow end up with null characters within the string.
++  if (host.find('\0') != std::string::npos) return false;
++
++  // All IPv6 addresses must be enclosed in square brackets, and anything
++  // enclosed in square brackets must be an IPv6 address.
++  if (host.length() >= 4 && host.front() == '[' && host.back() == ']') {
++    // INET6_ADDRSTRLEN is the maximum length of the dual format (including the
++    // terminating null character), which is the longest possible representation
++    // of an IPv6 address: xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:ddd.ddd.ddd.ddd
++    if (host.length() - 2 >= INET6_ADDRSTRLEN) return false;
++
++    // Annoyingly, libuv's implementation of inet_pton() deviates from other
++    // implementations of the function in that it allows '%' in IPv6 addresses.
++    if (host.find('%') != std::string::npos) return false;
++
++    // Parse the IPv6 address to ensure it is syntactically valid.
++    char ipv6_str[INET6_ADDRSTRLEN];
++    std::copy(host.begin() + 1, host.end() - 1, ipv6_str);
++    ipv6_str[host.length()] = '\0';
++    unsigned char ipv6[sizeof(struct in6_addr)];
++    if (uv_inet_pton(AF_INET6, ipv6_str, ipv6) != 0) return false;
++
++    // The only non-routable IPv6 address is ::/128. It should not be necessary
++    // to explicitly reject it because it will still be enclosed in square
++    // brackets and not even macOS should make DNS requests in that case, but
++    // history has taught us that we cannot be careful enough.
++    // Note that RFC 4291 defines both "IPv4-Compatible IPv6 Addresses" and
++    // "IPv4-Mapped IPv6 Addresses", which means that there are IPv6 addresses
++    // (other than ::/128) that represent non-routable IPv4 addresses. However,
++    // this translation assumes that the host is interpreted as an IPv6 address
++    // in the first place, at which point DNS rebinding should not be an issue.
++    if (std::all_of(ipv6, ipv6 + sizeof(ipv6), [](auto b) { return b == 0; })) {
++       return false;
++     }
++
++    // It is a syntactically valid and routable IPv6 address enclosed in square
++    // brackets. No client should be able to misinterpret this.
+     return true;
+-  uint_fast16_t accum = 0;
+-  uint_fast8_t quads = 0;
+-  bool empty = true;
+-  auto endOctet = [&accum, &quads, &empty](bool final = false) {
+-    return !empty && accum <= 0xff && ++quads <= 4 && final == (quads == 4) &&
+-           (empty = true) && !(accum = 0);
+-  };
+-  for (char c : host) {
+-    if (isdigit(c)) {
+-      if ((accum = (accum * 10) + (c - '0')) > 0xff) return false;
+-      empty = false;
+-    } else if (c != '.' || !endOctet()) {
+-      return false;
+-    }
+-  }
+-  return endOctet(true);
+-}
++   }
++
++  // Anything not enclosed in square brackets must be an IPv4 address. It is
++  // important here that inet_pton() accepts only the so-called dotted-decimal
++  // notation, which is a strict subset of the so-called numbers-and-dots
++  // notation that is allowed by inet_aton() and inet_addr(). This subset does
++  // not allow hexadecimal or octal number formats.
++  unsigned char ipv4[sizeof(struct in_addr)];
++  if (uv_inet_pton(AF_INET, host.c_str(), ipv4) != 0) return false;
++
++  // The only strictly non-routable IPv4 address is 0.0.0.0, and macOS will make
++  // DNS requests for this IP address, so we need to explicitly reject it. In
++  // fact, we can safely reject all of 0.0.0.0/8 (see Section 3.2 of RFC 791 and
++  // Section 3.2.1.3 of RFC 1122).
++  // Note that inet_pton() stores the IPv4 address in network byte order.
++  if (ipv4[0] == 0) return false;
++
++  // It is a routable IPv4 address in dotted-decimal notation.
++  return true;
++ }
+ 
+ // Constants for hybi-10 frame format.
+ 
+Index: nodejs-12.22.12~dfsg/test/cctest/test_inspector_socket.cc
+===================================================================
+--- nodejs-12.22.12~dfsg.orig/test/cctest/test_inspector_socket.cc
++++ nodejs-12.22.12~dfsg/test/cctest/test_inspector_socket.cc
+@@ -925,4 +925,84 @@ TEST_F(InspectorSocketTest, HostIpTooMan
+   expect_handshake_failure();
+ }
+ 
++TEST_F(InspectorSocketTest, HostIpInvalidOctalOctetStartChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 08.1.1.1:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpInvalidOctalOctetMidChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 1.09.1.1:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpInvalidOctalOctetEndChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 1.1.1.009:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpLeadingZeroStartChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 01.1.1.1:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpLeadingZeroMidChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 1.1.001.1:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIpLeadingZeroEndChecked) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: 1.1.1.01:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIPv6NonRoutable) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: [::]:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIPv6NonRoutableDual) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: [::0.0.0.0]:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIPv4InSquareBrackets) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: [127.0.0.1]:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
++TEST_F(InspectorSocketTest, HostIPv6InvalidAbbreviation) {
++  const std::string INVALID_HOST_IP_REQUEST = "GET /json HTTP/1.1\r\n"
++                                              "Host: [:::1]:9229\r\n\r\n";
++  send_in_chunks(INVALID_HOST_IP_REQUEST.c_str(),
++                 INVALID_HOST_IP_REQUEST.length());
++  expect_handshake_failure();
++}
++
+ }  // anonymous namespace
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
index df9c6010e..70f23de7b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.22.12.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Remove-use-of-register-r7-because-llvm-now-issues-an.patch \
            file://CVE-2022-32212.patch \
            file://CVE-2022-35255.patch \
+           file://CVE-2022-43548.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.25.1


