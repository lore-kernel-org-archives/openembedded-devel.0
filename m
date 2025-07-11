Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A277C83F22
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:37 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.10146.1752228087130454326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=JwUT5o0N;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228089; x=1783764089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fnrviWt1QVNe/9Cocl0BozSuQCnt5W/4LbE+8WgyBCY=;
  b=JwUT5o0NmP4y/jzZEaYADF/NlSEptvlnzFWoJ/jWMlyvG2YQ8bnwgFBj
   wdtF0MZVXincTPqstjnhN74LklnByw/V2qgwWeQ1eQZD/WPAhfNWXZcYk
   UPVNElocZuaLLm0BVvFsPH6jlnDD5ZOU0YReD66OjjZ4PmvmCMr/4k1wJ
   I=;
X-CSE-ConnectionGUID: ey6g4AShR+GxwRzy77ZZKA==
X-CSE-MsgGUID: ceJap1CrRty4Gb9xe2HBuw==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:26 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw6.muc with
 ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb3.muc with ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:24 +0200
X-CSE-ConnectionGUID: 75HvsMWdT8CqFfsjANZibQ==
X-CSE-MsgGUID: qO7bbzJmRiGFDEO7LS8+CA==
X-CSE-ConnectionGUID: 9a1BZdycRd6SoMrTDwaJEA==
X-CSE-MsgGUID: wnhT5S+jS1OCIv5yG2cxww==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 05/10] heaptrack: Allow to build with CMake 4+
Date: Fri, 11 Jul 2025 12:00:22 +0200
Message-ID: <20250711100052.255467-6-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711100052.255467-1-Moritz.Haase@bmw.de>
References: <20250711100052.255467-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118440

Upstream is inactive, so use the 'minimum policy version' override.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
index 3aca51ee3e..6896daf836 100644
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
@@ -22,7 +22,9 @@ SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
+EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF \
+                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+"
 
 # libunwind is not yet ported to RISCV
 COMPATIBLE_HOST:riscv32 = "null"

