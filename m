Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f174.google.com (unknown [209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 87712660A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:03:37 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id jw12so1996439veb.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Eh24Mc1gzCW/tJrCxRz4o+38qDO09a7y53Dgy7KPZiI=;
	b=rFKfOrwnI/976drHb627odhxHzGtMSGpGDz6sOrZ0FCDop6hpMOBQAKOzS/5VSJZEg
	Qwle/nuqSC0v7YZMuwnutKvpwP5ntfUkPD0YYhcVbJvTOmIMigW5sd9uyU7qb27N90RG
	TT9Z8X5zwJ4dZRw8plyMgNy1poiSgcDEIVc6tiAJJwbxIsd6fs/3gRCbpsqUQJpdQFgz
	MpABfzvk9LOpBI8/8vsRFjX35R6vjMc+XXNnQnFZJnAqTtgQdLL7MTvk16bi1lvWTd20
	jDBkLXZa6kcje2rCGPM642l3Xx0+tZkV2Dbu0lONoEROcQghxhY5IyQAuD1z8wIpPnxc
	OMzw==
X-Received: by 10.220.167.2 with SMTP id o2mr2132542vcy.8.1400058218295;
	Wed, 14 May 2014 02:03:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nh8sm1400566veb.3.2014.05.14.02.03.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:03:37 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:03:47 +0200
Message-Id: <1400058231-23201-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
References: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 4/8] rain: fix build for B!=S
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
X-List-Received-Date: Wed, 14 May 2014 09:03:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/rain_svn.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
index d5e6803..0e990d5 100644
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ b/meta-efl/recipes-efl/e17/rain_svn.bb
@@ -9,9 +9,6 @@ PR = "${INC_PR}.0"
 require e-module.inc
 
 do_configure_prepend() {
-    sed -i -e /po/d configure.ac 
-    sed -i -e s:\ po::g Makefile.am
+    sed -i -e /po/d ${S}/configure.ac 
+    sed -i -e s:\ po::g ${S}/Makefile.am
 }
-
-
-
-- 
1.9.3


