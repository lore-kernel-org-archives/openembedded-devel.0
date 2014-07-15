Return-Path: <stephanoc@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 432D0607E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:02:23 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq14so4789683pab.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=51Tx80gm+yzTsdLYCvlCLhNG776byd9U3fFGzmiIRbI=;
	b=J6onJ5LgiGFKtt/iRUlQ317Pq9d5etN2oilFXquECji4lqHPEy6iJ85RDJI5kyl91/
	Zwi2r+oMcot59yJ78neveHpCLF1h/QmkqVOD4XMPCxJDsal4kM6OTGyAV3MS1+kMBNUr
	iFQGxFul2KnQ3LiXDtG3f8wzCoUnYIFj4lov8BcjbPCMyyYTHTMlPbp2N31nWteTzZY0
	SX8u4X+QlY8lHf/jZmxJlXKFScGOqf3WAzEpVZME2nXVZtPpG0VbRQqoKMwb16zFICkK
	CLvdrJPQKRCYWYQ4pj56Z20l6yZXI2b0SDFcgA6dSHql9uLU2/OCrTZau6tWOD4kwcqF
	jabA==
X-Received: by 10.70.43.227 with SMTP id z3mr24510741pdl.77.1405447345279;
	Tue, 15 Jul 2014 11:02:25 -0700 (PDT)
Received: from localhost.localdomain
	(74-92-165-193-Oregon.hfc.comcastbusiness.net. [74.92.165.193])
	by mx.google.com with ESMTPSA id
	fb4sm60565140pac.30.2014.07.15.11.02.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 11:02:24 -0700 (PDT)
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:01:55 -0700
Message-Id: <1405447315-798-1-git-send-email-stephanoc@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Stephano Cetola <scetola@reachtech.com>
Subject: [meta-oe][PATCH] stop trying to remove folders that do not exist
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
X-List-Received-Date: Tue, 15 Jul 2014 18:02:25 -0000

From: Stephano Cetola <scetola@reachtech.com>

The directory ${D}/${TMPDIR} does not exist. This patch removes code
that was calling rm and rmdir on that location.

Signed-off-by: Stephano Cetola <scetola@reachtech.com>
---
 meta-oe/recipes-devtools/php/php.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index b1bf79c..000316b 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -90,6 +90,12 @@ do_install_append_pn-php() {
     sed -i 's:=/var:=${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fpm
     install -m 0755 ${B}/sapi/fpm/init.d.php-fpm ${D}${sysconfdir}/init.d/php-fpm
     TMP=`dirname ${D}/${TMPDIR}`
+    bbwarn "D"
+    bbwarn ${D}
+    bbwarn "TMPDIR"
+    bbwarn ${TMPDIR}
+    bbwarn "TMP"
+    bbwarn ${TMP}
     while test ${TMP} != ${D}; do
         rmdir ${TMP}
         TMP=`dirname ${TMP}`;
-- 
1.7.10.4


