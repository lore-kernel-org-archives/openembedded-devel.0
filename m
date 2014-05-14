Return-Path: <martin.jansa@gmail.com>
Received: from mail-ve0-f180.google.com (unknown [209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id E80A1660A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 09:03:40 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id db12so1980466veb.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2014 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6ryEN06CUDESsMspcFvGkvtH8U3N5Zo5B6y+LVEeirY=;
	b=Teb/qW1U37cZ0iMx/Bw16ozxseOeKs48p61TM0NWCBmaqNNVvczHeBMD1UFpwIwhQe
	ddHpNk3NklnVwPFgsmgwK5FSXHjKYDHiIVupwoW+WPEEk2CUXB1PQvQMO6f2HA/gnrJD
	+Y5v7AQWpPdXhvUzsCdh/XRedWaM7LiTCboj+HFNC3u55Xzmcy3Db+Uapim6CX0TC7Nq
	YnXNMbWHm/k7W1fJP0U0CFru3RgdWFqh5Uc5c1VsL8Y8wCw4IDpXFC1rrAOepu7EAG+c
	/AvWkfakeU/Odu9/7Egq41wP1YWFjHXnIMDQHPbUlGazTM1KY0OEyfTbNKao95jkCwYx
	gDNQ==
X-Received: by 10.52.189.97 with SMTP id gh1mr1807274vdc.0.1400058221772;
	Wed, 14 May 2014 02:03:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id 10sm2235721vdu.9.2014.05.14.02.03.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 02:03:40 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 May 2014 11:03:48 +0200
Message-Id: <1400058231-23201-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
References: <1400058231-23201-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 5/8] flame: fix build for B!=S
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
X-List-Received-Date: Wed, 14 May 2014 09:03:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/flame_svn.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/flame_svn.bb b/meta-efl/recipes-efl/e17/flame_svn.bb
index 97683dd..b674a5d 100644
--- a/meta-efl/recipes-efl/e17/flame_svn.bb
+++ b/meta-efl/recipes-efl/e17/flame_svn.bb
@@ -8,9 +8,6 @@ PR = "${INC_PR}.0"
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


