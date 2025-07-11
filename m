Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9E2C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:36 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.10146.1752228087130454326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=qGyTHByi;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228087; x=1783764087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/FyM+zh7JrvC57+4Er1IaC9mlZ97DZSKEZoPRcVBc4g=;
  b=qGyTHByikUczOAMKkWG4RSkTBjDGEqjA5ziXH/NK6q90hh24/vAj/bWq
   SCfJENQ45v3xCF7iAVwu19X51CsTgEFwjWYfaH4SoCU4sVF2wPdc91gHG
   48jTmhNGFf4pRcgabHkjUOTAsWqeaDs5SYLJaAdfYEcsYRvgCGUdVtIsv
   0=;
X-CSE-ConnectionGUID: WnTDub2xR5uXymd+zn4HNg==
X-CSE-MsgGUID: kkOn351pTTuHQN9JnzaTaA==
Received: from 160.46.252.35.spf.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw3.muc with
 ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb6.muc with ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:24 +0200
X-CSE-ConnectionGUID: 0Pdpbf5DTG2jXuSppc1AEg==
X-CSE-MsgGUID: OLIafLHxSCuVlswrFaq2Jg==
X-CSE-ConnectionGUID: EZQyzauVSrGfCdEmpdKwHg==
X-CSE-MsgGUID: hmiXEh36SXWeNcVwqgCyqw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 09/10] synergy: Allow to build with CMake 4+
Date: Fri, 11 Jul 2025 12:00:26 +0200
Message-ID: <20250711100052.255467-10-Moritz.Haase@bmw.de>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118434

The version hasn't been updated in years, so even though there are newer
upstream releases, bumping the version is not straightforward. Thus, use the
'minimum policy version' override for now.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta-oe/recipes-support/synergy/synergy_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index e215c62620..e66c04b9fc 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -19,6 +19,8 @@ PV = "1.10.1+git"
 
 inherit cmake features_check
 
-EXTRA_OECMAKE += "-DSYNERGY_BUILD_LEGACY_GUI=OFF"
+EXTRA_OECMAKE += "-DSYNERGY_BUILD_LEGACY_GUI=OFF \
+                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+"
 
 FILES:${PN} += "${datadir}/icons/hicolor"

