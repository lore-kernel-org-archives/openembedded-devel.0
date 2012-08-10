Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szph2-0001GZ-OU
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:56:00 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1218754wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7arLnGWjpjbYvLt8mOxd7p7VNOxqLuUz32jRRSGB6W4=;
	b=F/a1vsChQljr5GIYv7XnHTKj8r7lLdn4IAmYMrZOPzj6rIoiXzv8Dpz7CTK4Ecw7y/
	cqtmEKCTrFI/Mm9/Pu2u6S+t9Qjj2OLC+I2ZpusS0DCHr88WsoFRC4Dx6cuAED9IO3BN
	GpidGTpCbAghOMOS+mxlcvFzfPKAhM7D3k537DP7tXDnQ922Qlxgcb7FV+aVti3r/ocw
	5Rv0ywMD+IJRPvUEctMMhqi3A2twXpAvuEOE254w6/XM1AgYf5EWrKRLDBqm8bFDgfYY
	X033K+za8UeZ1k+NTunLljvQh8YT6Hrce9aidI6NW+6nMNZXkXrNjaoLfGl9jsnDzA01
	CTRA==
Received: by 10.216.134.20 with SMTP id r20mr1755358wei.61.1344606253362;
	Fri, 10 Aug 2012 06:44:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm11632138wiz.11.2012.08.10.06.44.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:44:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:42:59 +0200
Message-Id: <d24b9c57461ed1051dabff9828b07f47d73bd457.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 04/46] efl: update PV in svn recipes to sort higher then release
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
X-List-Received-Date: Fri, 10 Aug 2012 13:56:00 -0000

* now when we have newer EFL_SRCREV

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore_svn.bb      |    2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb      |    2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb       |    2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb        |    2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb       |    2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb     |    2 +-
 meta-efl/recipes-efl/efl/eina_svn.bb       |    2 +-
 meta-efl/recipes-efl/efl/eio_svn.bb        |    2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
 meta-efl/recipes-efl/efl/embryo_svn.bb     |    2 +-
 meta-efl/recipes-efl/efl/emotion_svn.bb    |    2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb     |    2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb       |    2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index 05cc9db..ad724d0 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index 594de4a..720703e 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index 594de4a..720703e 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index e9de45c..de8af5f 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.6.0+svnr${SRCPV}"
+PV = "1.6.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index 594de4a..720703e 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index 594de4a..720703e 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index 594de4a..720703e 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
index f43c47f..eb28d9a 100644
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.0.0+svnr${SRCPV}"
+PV = "1.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index f43c47f..eb28d9a 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.0.0+svnr${SRCPV}"
+PV = "1.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index 594de4a..720703e 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index f43c47f..eb28d9a 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.0.0+svnr${SRCPV}"
+PV = "1.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index ac03014..f6b3f3e 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.0.0+svnr${SRCPV}"
+PV = "1.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index 594de4a..720703e 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.2.0+svnr${SRCPV}"
+PV = "1.2.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.8.6



