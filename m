Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id BEE2770E38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Aug 2014 12:02:11 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so11686519wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Aug 2014 05:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2IpL2qewm4E6AWsG0Nvz+P2OxRS7A1P94RRaLyQQkD0=;
	b=mQKBZ7pVizQ7tPI0zYv8nCmlmJlgkmAePD0lwCOx+rKn7qUsAbbhh0d2F3l7uFA0lC
	41l2LX9sfoewsRrATuqhiHB/Lzma4OBaJzWmBNknhB/RVwdJ+vl3ZNDTp7ZOF2z/uTvy
	aNhj/n1F70frYBIBxzF47gC/MOYup3eGq7eU5FDO0zl/HCSVIRMBdmOV2eFb1nOgTh2u
	B3PpILxzBTLwcOjPrgH9/KyuiNfnvEBVAP0gGFkTCvd9Ulgu4ehaflJkAyYNos8tK+Nn
	uGd4QTQ8B4bnB4nFqde005qy3A/FBOZS14GX+su/Dj0nnj1NKPXFb8LPpInWwM+HEwxx
	lGIA==
X-Received: by 10.194.203.73 with SMTP id ko9mr457646wjc.101.1408795332323;
	Sat, 23 Aug 2014 05:02:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xw9sm82936328wjc.32.2014.08.23.05.02.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Aug 2014 05:02:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Aug 2014 14:02:15 +0200
Message-Id: <1408795335-10619-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][PATCH] python-cython: Fix missing deps for native
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
X-List-Received-Date: Sat, 23 Aug 2014 12:02:17 -0000

* ERROR: Nothing RPROVIDES 'python-netserver-native' (but virtual:native:/OE/build/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-cython_0.20.2.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python-cython_0.20.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
index 8578a14..3966e0b 100644
--- a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
+++ b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
@@ -21,3 +21,4 @@ RDEPENDS_${PN} += "\
     python-subprocess \
     python-shell \
 "
+RDEPENDS_${PN}_class-native = ""
-- 
2.0.4


