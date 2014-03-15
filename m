Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2566F6F0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 14:49:13 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id hz1so3868279pad.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 07:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/6cybdUyE6L9CxOV9aF1X+LTfzIJapO/okNhC6mkYtc=;
	b=RevpyGmWiQudDxqJ4eUjOWDSd3WqWl9T4P+tBnYiBGDtOrWpoCnXol706Ux2g579pr
	9OsBORcxIFWdoUhEa4QMqhif7oLwUtGKCZ6goVzuZqxRZVuIJtr6scDnrEELZjP8Y/y4
	1GY4IB1bGdkYRr2nksF8hNF8S7BCe2W9EZcaow5HMmlspjL/EWTlo0fnWs+JygEtkJ9U
	Bn1AOQ/CIdt1pvzLQ13SKdC2qEWf8aMkuhE292TfqMTTPwCPRQ7tesBcFNcoGXVvccrp
	QPSE2wNm97UO5/xryfi2k5ip885+6SzeHMVn2zGqIHcvC/bqzUrnSE6nFQnevUhUrLn0
	21Tw==
X-Received: by 10.68.131.202 with SMTP id oo10mr15381059pbb.35.1394894954338; 
	Sat, 15 Mar 2014 07:49:14 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	st4sm42637628pab.34.2014.03.15.07.49.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Mar 2014 07:49:13 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Mar 2014 01:54:39 +1100
Message-Id: <1394895279-7276-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] licenses: rename NOKIA-TPLA-2.4 to DIGIA-TPLA-2.4
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
X-List-Received-Date: Sat, 15 Mar 2014 14:49:18 -0000

The license agreement doesn't mention Nokia anymore after Qt was
acquired by Digia.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 licenses/{NOKIA-TPLA-2.4 => DIGIA-TPLA-2.4} | 0
 recipes-qt/qt5/qt3d.inc                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename licenses/{NOKIA-TPLA-2.4 => DIGIA-TPLA-2.4} (100%)

diff --git a/licenses/NOKIA-TPLA-2.4 b/licenses/DIGIA-TPLA-2.4
similarity index 100%
rename from licenses/NOKIA-TPLA-2.4
rename to licenses/DIGIA-TPLA-2.4
diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
index 78b9ecc..74c4cad 100644
--- a/recipes-qt/qt5/qt3d.inc
+++ b/recipes-qt/qt5/qt3d.inc
@@ -2,7 +2,7 @@ require qt5.inc
 
 DEPENDS += "qtdeclarative"
 
-LICENSE = "GFDL-1.3 & LGPL-2.1 & NOKIA-TPLA-2.4 | GPL-3.0"
+LICENSE = "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.PREVIEW.COMMERCIAL;md5=9d94dadfab8b246782ffea02082ee13a \
-- 
1.9.0


