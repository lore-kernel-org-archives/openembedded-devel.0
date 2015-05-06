Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id EDB8C73755
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:17 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so17045006wgy.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=c6ReoGbhkI1IWQzwk21pfasAP8V1ILWpT03qOly46Sc=;
	b=Dymsr5Z7RSLDrSkQ8SnD6Xqf6AzVwYvaJKR+VEzET5BIrzbUGkzWoWBUobJFTwu30f
	+E1Ra3ZpUhaA5VvJaTBVLYvFmcqd1AGqUEGX4VHtjsCuALAIp6hTB57d7CgbBluMn5IF
	YgccK3pOPprDpb+kFKcD5f78j5xXyK4HDXbCjqDFYYCtGd5QvsaZEOCI5YmQ5vUhcyqM
	JVG7VkPiqB6FJnLkbkxkW4SuJKyNiDamlWyKd8o9VeVz77I+GgTn0ZPWqfEOK9iJT0an
	iN+/+e5VcMx4yYYwVqfPeE8pbNMlYHiWJnaB/294Y7hJBMsn2ACdV60DEq5BQwVct2r+
	PCYg==
X-Received: by 10.180.101.65 with SMTP id fe1mr15035892wib.22.1430928678572;
	Wed, 06 May 2015 09:11:18 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:39 +0200
Message-Id: <1430928646-2007-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] exo: update to 0.10.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 May 2015 16:11:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.10.3.bb => exo_0.10.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.10.3.bb => exo_0.10.4.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.3.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.4.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.10.3.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.10.4.bb
index f11f049..eeb2e75 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.3.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.4.bb
@@ -17,8 +17,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "d45b7e18e3a73e4a7b2ec6ef7943de17"
-SRC_URI[sha256sum] = "95704b14ef9065268c3aa9a7c0bacbe0ddb490a183a4f5ab13bba4a1722826bd"
+SRC_URI[md5sum] = "fe54dad8b897af36628da46b33844f95"
+SRC_URI[sha256sum] = "cced5fdbc0b61a5d976210ff71ecdd81b89fcd15e5860a44f50da7b83fb2deaa"
 
 PACKAGES =+ "exo-csource"
 
-- 
1.9.3


