Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0qRq-0000AJ-F6
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 09:51:58 +0200
Received: by mail-ew0-f47.google.com with SMTP id 5so2463833ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/GBM33/7jkHl0siDfWRwBmvC+hiRZ+5XqkBNB+RRhHw=;
	b=TCqr5wcZT1g3/1Xzm5Lmet/2iHtIpyGyZGaPHOraori1Wxy+7diA0MUIpvr7DsAlJI
	YzTO7t9SfaTxj/vnwI0YtN5+aWBgMgVS+uPolg9aoo3fH89HrpcXYjejkbOM1dva/vja
	hBSwFaD9OoLHMbVoaUGxPLNGRW1DE2geNJ+5s=
Received: by 10.213.22.211 with SMTP id o19mr912093ebb.85.1315295219767;
	Tue, 06 Sep 2011 00:46:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e4sm13134802eec.10.2011.09.06.00.46.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 00:46:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 09:46:39 +0200
Message-Id: <3ee9594f519bdf4de7a4152362e37db65d31cf2e.1315295093.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
References: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1315295093.git.Martin.Jansa@gmail.com>
References: <cover.1315295093.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/6] recipes-efl: remove EFL_SRCREV_1.0.0
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
X-List-Received-Date: Tue, 06 Sep 2011 07:51:58 -0000

* with recipes from releases removed it doesn't make much sense anymore
* maybe will return after 1.1 release

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    2 +-
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |    2 +-
 meta-efl/recipes-efl/efl/edb_svn.bb                |    2 +-
 .../efl/elementary-theme-efenniht_svn.bb           |    4 ++--
 meta-efl/recipes-efl/efl/engrave_svn.bb            |    2 +-
 meta-efl/recipes-efl/efl/epeg_svn.bb               |    2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index 60df582..804f670 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -7,7 +7,7 @@ RSUGGESTS_${PN} = "elementary-theme-efenniht"
 PACKAGE_ARCH = "all"
 LICENSE = "MIT/BSD"
 
-SRCREV = "${EFL_SRCREV_1.0.0}"
+SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
 
 inherit e-base
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
index c12405b..ba16190 100644
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
@@ -4,7 +4,7 @@ SECTION = "x11"
 DEPENDS = "edje-native"
 PV = "1.0+svnr${SRCPV}"
 PR = "r6"
-SRCREV = "${EFL_SRCREV_1.0.0}"
+SRCREV = "${EFL_SRCREV}"
 
 inherit e-base update-alternatives
 
diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/efl/edb_svn.bb
index 4f7e58d..8b2338a 100644
--- a/meta-efl/recipes-efl/efl/edb_svn.bb
+++ b/meta-efl/recipes-efl/efl/edb_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT BSD"
 DEPENDS = "zlib"
 PV = "1.0.5.050+svnr${SRCPV}"
 PR = "r1"
-SRCREV = "${EFL_SRCREV_1.0.0}"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index 79557cd..68d9ee3 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -6,8 +6,8 @@ RSUGGESTS_${PN} = "e-wm-theme-illume-efenniht"
 PACKAGE_ARCH = "all"
 LICENSE = "MIT/BSD"
 
-SRCREV_THM_REV ?= "${EFL_SRCREV_1.0.0}"
-SRCREV_ELM_REV ?= "${EFL_SRCREV_1.0.0}"
+SRCREV_THM_REV ?= "${EFL_SRCREV}"
+SRCREV_ELM_REV ?= "${EFL_SRCREV}"
 
 SRCREV_FORMAT = "THM_REV"
 PV = "0.0+svnr${SRCPV}"
diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index fefd6d4..91cfa92 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 DEPENDS = "evas ecore"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r1"
-SRCREV = "${EFL_SRCREV_1.0.0}"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};proto=http;scmdata=keep"
diff --git a/meta-efl/recipes-efl/efl/epeg_svn.bb b/meta-efl/recipes-efl/efl/epeg_svn.bb
index 1ad5c36..9d66bb3 100644
--- a/meta-efl/recipes-efl/efl/epeg_svn.bb
+++ b/meta-efl/recipes-efl/efl/epeg_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 DEPENDS = "jpeg"
 PV = "0.9.0+svnr${SRCPV}"
 PR = "r2"
-SRCREV = "${EFL_SRCREV_1.0.0}"
+SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};proto=http;scmdata=keep"
-- 
1.7.6.1



