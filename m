Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A4ACF8855
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 13:24:15 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33992.1763645044298770320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 05:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=pWTN/ElU;
 spf=temperror, err=temporary DNS error (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=412024c03=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1763645044; x=1795181044;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gl97lPtCcSocqlxlJRYCbeZMKpsaROn85zZ7m09LnUQ=;
  b=pWTN/ElU9VF/cvPBdIMbOOySGRYH66c7wnGk2ZKwiR3dk/bmf7UB7Z0d
   ggpLLip0O9vzuZXE/zAK8b7cwxDe4w6L8xxvKJH3kewJBv2TLSBQuxk93
   0PBHLOIxd4kCNJeSMfH0SXNH4Cv3/RA/MVNLBx9k6OfTYZMsZ8qY7DZHI
   M=;
X-CSE-ConnectionGUID: htBBN37NRIaZyQn/kSkD+w==
X-CSE-MsgGUID: UniYEQ0/QJqP5fTiL5qzqg==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 20 Nov 2025 14:24:01 +0100
Received: from unknown (HELO esabb5.muc) ([10.31.187.136]) by esagw6.muc with
 ESMTP/TLS; 20 Nov 2025 14:24:02 +0100
Received: from smucmp19e.bmwgroup.net (HELO smucmp19e.europe.bmw.corp)
 ([10.30.13.171]) by esabb5.muc with ESMTP/TLS; 20 Nov 2025 14:24:01 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp19e.europe.bmw.corp (2a03:1e80:a15:58f::1:6d) with Microsoft SMTP
 Server (version=TLS; Thu, 20 Nov 2025 14:24:01 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.211) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Thu, 20 Nov 2025 14:24:01 +0100
X-CSE-ConnectionGUID: m5tFBcHeRMaz174QjZBb+g==
X-CSE-MsgGUID: RLDoQrxZTbeClZ5lxCpsbw==
X-CSE-ConnectionGUID: oKRwvO5VSOameOujAjGMeg==
X-CSE-MsgGUID: A9gVZrFBTW6BCSlooKETnw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <changqing.li@windriver.com>
Subject: [PATCH] curl: Ensure 'CURL_CA_BUNDLE' from host env is indeed respected
Date: Thu, 20 Nov 2025 14:23:34 +0100
Message-ID: <20251120132334.779326-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17f.europe.bmw.corp (2a03:1e80:a15:58f::1:64) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 13:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121936

Due to what looks like a copy'n'paste mistake, the environment setup script
might override 'CURL_CA_BUNDLE' from the host env instead of leaving it
untouched. Fix that.

CC: changqing.li@windriver.com
Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta/recipes-support/curl/curl/environment.d-curl.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 581108ef35..b948db2cf6 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,6 +1,6 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
-# CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "${CURL_CA_PATH:-}" ]; then
+# CAFILE/CAPATH is auto-detected when source buildtools
+if [ -z "${CURL_CA_BUNDLE:-}" ]; then
 	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then

