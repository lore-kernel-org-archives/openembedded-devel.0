Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A1EA165D99
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 22:08:39 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so3617790pab.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 15:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=53ugAtcfsl3/87B9ou6yXaeWeqH1wy29L2sbkFJVI6g=;
	b=NhSyfePRJL93rmvLBTsXjaDkI0wLCvW8k6fjjgZxVmVAJInTQ0SZMFk+ZB0Ie4WmdL
	EK2Yaw7+iLRFj2r2ozbn4BqFPdyFba9rt8XTK+BQ1cZ6WoqxQM1zrQphcN6YwfOacP7N
	IoBF9HL3t+jr2TcN6FrTe/jkQM4zxgUW7ZNsjO6hcCPEoXPvmMM+Qk6K9+SLElCAjkUs
	3W3Ya414klDu2qcRxle7phRDRaqdCkA5Gc7UKWNhnhRB9opqmtDicUoqVFlAvIqzMZlc
	oY+oyb0I1wRvJYSzTfE8TOOZ8X6p51FlONYU7WDnu63gz5F/by1IA9UGLLPc8ZqDTGlg
	kajA==
X-Received: by 10.68.197.39 with SMTP id ir7mr8002794pbc.78.1398463720007;
	Fri, 25 Apr 2014 15:08:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id bc4sm18245080pbb.2.2014.04.25.15.08.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 15:08:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 15:10:42 -0700
Message-Id: <1398463842-15794-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] mozjs: Fix build when B != S
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
X-List-Received-Date: Fri, 25 Apr 2014 22:08:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 891ae9d..1af1fa6 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -28,7 +28,7 @@ EXTRA_OECONF = " \
 
 # mozjs requires autoreconf 2.13
 do_configure() {
-    ./configure ${EXTRA_OECONF}
+    ${S}/configure ${EXTRA_OECONF}
 }
 
 PACKAGES =+ "lib${PN}"
-- 
1.7.10.4


