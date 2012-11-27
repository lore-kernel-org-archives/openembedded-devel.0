Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5h-0005cR-OY
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:16 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sMESGkmkN/vNAP/Lp3XTOIcctqLyKHNjxHHsttZaAHk=;
	b=OxGe7cJKAeE+3haMWGSfC/+8jea9kET6kkXbt5n5JgbSJGPejpJcBYdfeudz2nfTZ8
	ZDoHl2pyaZEd+Sq5ExKV2H/QbC9g0DPx5lFFMbloiiiRxaYqDjT+C200RDO9Ks3TiXgk
	TsH3XZhgU7nDZVfh/zPRx0XLRKc82RwQnubc/mG3jMfyH5rcysjnuiuBias28zpOX70q
	goxPCMvJ7xUHZdCTQqNLJzDFheb7iiyFoQmkPrujy65GljBlAesK3SI61wBpbynYtGLc
	ZPBV8Y3HEn2JAOurSX6jURuX1z7IC/Trnb+v0GG0XK+ToUC8FIa81Qc3K3cSqgl1awVy
	6VAA==
Received: by 10.14.177.1 with SMTP id c1mr61838733eem.8.1354048502632;
	Tue, 27 Nov 2012 12:35:02 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n7sm25081357eeo.2.2012.11.27.12.35.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:45 +0100
Message-Id: <a911292c407a66c939231db66d62870b181a20ae.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/21] efl: update svn recipes to use 1.7 branch
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
X-List-Received-Date: Tue, 27 Nov 2012 20:49:16 -0000

* E17 will depend only on EFL 1.7 (probably 1.7.2)
* next EFL release we'll have to update recipes a lot to use unified EFL
  source tree, maybe also git instead of svn
* some libs are for newer EFL_SRCREV moved to IN-EFL subdirectory in
  trunk (eet  eina  embryo  eo  evas  evil)
* trunk depends on edbus2 (edbus dir instead of e_dbus)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore_svn.bb                | 4 +++-
 meta-efl/recipes-efl/efl/edbus_svn.bb                | 4 +++-
 meta-efl/recipes-efl/efl/edje_svn.bb                 | 4 +++-
 meta-efl/recipes-efl/efl/eet_svn.bb                  | 4 +++-
 meta-efl/recipes-efl/efl/eeze_svn.bb                 | 4 +++-
 meta-efl/recipes-efl/efl/efreet_svn.bb               | 4 +++-
 meta-efl/recipes-efl/efl/eina_svn.bb                 | 4 +++-
 meta-efl/recipes-efl/efl/eio_svn.bb                  | 4 +++-
 meta-efl/recipes-efl/efl/elementary_svn.bb           | 4 +++-
 meta-efl/recipes-efl/efl/embryo_svn.bb               | 4 +++-
 meta-efl/recipes-efl/efl/emotion_svn.bb              | 4 +++-
 meta-efl/recipes-efl/efl/ethumb_svn.bb               | 4 +++-
 meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb | 4 +++-
 meta-efl/recipes-efl/efl/evas_svn.bb                 | 4 +++-
 meta-efl/recipes-efl/efl/expedite_svn.bb             | 4 +++-
 15 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index b238b0d..2059626 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -5,8 +5,10 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
   file://fix-ecore-fb-initialization.patch \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/expedite_svn.bb b/meta-efl/recipes-efl/efl/expedite_svn.bb
index f5b92aa..78730be 100644
--- a/meta-efl/recipes-efl/efl/expedite_svn.bb
+++ b/meta-efl/recipes-efl/efl/expedite_svn.bb
@@ -5,7 +5,9 @@ PV = "1.7.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
+SRCNAME_append = "-1.7"
+
 SRC_URI = "\
-  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
-- 
1.8.0



