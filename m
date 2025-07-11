Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA6AC83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:02:07 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web11.10154.1752228116595437643
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=g3TFpSw6;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228118; x=1783764118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ANhCN1OmCIt2w7QE0/rO2lnqbgvHrzqeNtpdvYhMr6s=;
  b=g3TFpSw6qp5WQy4czgHAzmPRZqh3d1l3BdwvExTi/ha3Wig7NUmK8Uxr
   Nu0Lrnn6z+iY5r79yd1lD6LiUdNiK7WIbQ05broGKVEl7dFre9w8Yeq/o
   hCchwJGzoufhaRSszktk3JCTEQke2C52olMGBvekSWDM3sFRJ2gtYFmzM
   o=;
X-CSE-ConnectionGUID: 1EdOVw/UT5mdj+HcDimMBw==
X-CSE-MsgGUID: 7o95oDVMQjCoRVRJ7a7iew==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:39 +0200
Received: from unknown (HELO esabb5.muc) ([10.31.187.136]) by esagw4.muc with
 ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb5.muc with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:24 +0200
X-CSE-ConnectionGUID: LNxk1XAaSCebA6hdJnm+OQ==
X-CSE-MsgGUID: SQb7QIimQFSgMzamvLjEJg==
X-CSE-ConnectionGUID: yLzug7UbR8adKsUQfe6+dw==
X-CSE-MsgGUID: 9Jqjp/VeQaCUuPtpGlYi8g==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 07/10] upm: Allow to build with CMake 4+
Date: Fri, 11 Jul 2025 12:00:24 +0200
Message-ID: <20250711100052.255467-8-Moritz.Haase@bmw.de>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118444

Upstream is inactive, so use the 'minimum policy version' override.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 616f4ca09a..9b809ce727 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -27,7 +27,9 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
 inherit setuptools3-base cmake pkgconfig
 
-EXTRA_OECMAKE += "-UPYTHON_EXECUTABLE -DWERROR=off"
+EXTRA_OECMAKE += "-UPYTHON_EXECUTABLE -DWERROR=off \
+                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+"
 
 # override this in local.conf to get needed bindings.
 # BINDINGS:pn-upm="python"

