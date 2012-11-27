Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS54-0005cR-J3
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:48:34 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rZkqBpSVVhJQOG+JTBaXEDJwyk8+DxtUnoOWwXuXiIM=;
	b=PWi6qEVqOOu7iGrUE9knefcopz2Zutoid+8X4QMBKXyjg9B+AOaBlkjTY05N/Bi0Nu
	tl2iM7ea9eyXNvVydgURSfx2jUaAUjLgRHB+1zdXcymuUyfPPZQhupD8R7mmiQFkG9x9
	vhPqwA4XSWHGaDM0UhhPx7Z3tpPeWxd7lftMfu08s/cA0JHj0HyX0vTwObzlMy64lKwf
	q2SgTxvyzL2ujxlAA52QdpNE0iD6MAq2AadSsLQlpKFnBdwtzIvQW3X4t3YoZByXsL7K
	cdW1m4m+LmAwAwuDTLFXTCULZeX1CG5aSvOPiNRvbcmhvy/Jd35c+lJMickliALb1iak
	019w==
Received: by 10.14.205.198 with SMTP id j46mr62112986eeo.27.1354048463458;
	Tue, 27 Nov 2012 12:34:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a45sm42291713eep.16.2012.11.27.12.34.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:34:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:39 +0100
Message-Id: <36f5b2a6ca70a0ef8d3ad67679138402c1b7d1cc.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/21] efl: EFL_SRCREV bump past 1.7.1 release and update PV in svn recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 20:48:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass                      | 2 +-
 meta-efl/recipes-efl/efl/ecore_svn.bb                | 2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb                | 2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb                 | 2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                  | 2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb                 | 2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb               | 2 +-
 meta-efl/recipes-efl/efl/eina_svn.bb                 | 2 +-
 meta-efl/recipes-efl/efl/eio_svn.bb                  | 2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb           | 2 +-
 meta-efl/recipes-efl/efl/embryo_svn.bb               | 2 +-
 meta-efl/recipes-efl/efl/emotion_svn.bb              | 2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb               | 2 +-
 meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb | 2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb                 | 2 +-
 meta-efl/recipes-efl/efl/expedite_svn.bb             | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 98aac41..90c71b4 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "75861"
+EFL_SRCREV ?= "78377"
 
 ARM_INSTRUCTION_SET = "arm"
 
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index 4e2cdec..b238b0d 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/expedite_svn.bb b/meta-efl/recipes-efl/efl/expedite_svn.bb
index d8fd5d6..f5b92aa 100644
--- a/meta-efl/recipes-efl/efl/expedite_svn.bb
+++ b/meta-efl/recipes-efl/efl/expedite_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.0+svnr${SRCPV}"
+PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.8.0



