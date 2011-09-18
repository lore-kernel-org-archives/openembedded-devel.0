Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYE-0003rN-83
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:46 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592229fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=k7R093nWatXL9gvZgbxn4OiIdXHnl0A86CMmSm6p/sk=;
	b=Ap6noPxuAriOSNIxg+HfUS5ZS5WyKmPe5ujnoLqTqgcnq2KSfHcfK796HxWTtzFfVu
	VD1DhYp1J200oiYr/icnEZo7rRtmeGRSuEv7sSeXpnnjVIqMnmKyQ6zKa0UdO7oEVXZa
	r3JwOVajehZmcrAh5VNnCpRJsKXivZpvr224M=
Received: by 10.223.23.10 with SMTP id p10mr2959311fab.112.1316345013670;
	Sun, 18 Sep 2011 04:23:33 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:33 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:04 +0400
Message-Id: <1316344999-26642-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 02/17] libqpe-opie: fix LnkProperties desctructor visibility issues
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
X-List-Received-Date: Sun, 18 Sep 2011 11:28:46 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../qpe-fix-lnkproperties-visibility.patch         |   22 ++++++++++++++++++++
 recipes-opie/libqpe/libqpe-opie_1.2.5.bb           |    3 +-
 recipes-opie/libqpe/libqpe-opie_git.bb             |    3 +-
 3 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 recipes-opie/libqpe/libqpe-opie/qpe-fix-lnkproperties-visibility.patch

diff --git a/recipes-opie/libqpe/libqpe-opie/qpe-fix-lnkproperties-visibility.patch b/recipes-opie/libqpe/libqpe-opie/qpe-fix-lnkproperties-visibility.patch
new file mode 100644
index 0000000..8b4e86f
--- /dev/null
+++ b/recipes-opie/libqpe/libqpe-opie/qpe-fix-lnkproperties-visibility.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Pending
+
+Make constructor and desctructor visible when compiling moc files.
+This fixes the problem with LnkProperties::~LnkProperties() visibility.
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+
+Index: library/lnkproperties.h
+===================================================================
+--- library.orig/lnkproperties.h	2011-09-05 02:13:36.000000000 +0400
++++ library/lnkproperties.h	2011-09-05 02:14:47.000000000 +0400
+@@ -41,6 +41,10 @@
+     Q_OBJECT
+
+ public:
++// hack to fix LnkProperties::~LnkProperties() visibility
++#ifdef Q_MOC_OUTPUT_REVISION
++#define QTOPIA_INTERNAL_FSLP 1
++#endif
+ // WARNING: Do *NOT* define this yourself. The SL5xxx from SHARP does NOT
+ //      have this class.
+ #ifdef QTOPIA_INTERNAL_FSLP
diff --git a/recipes-opie/libqpe/libqpe-opie_1.2.5.bb b/recipes-opie/libqpe/libqpe-opie_1.2.5.bb
index f31bdb0..c9dab6e 100644
--- a/recipes-opie/libqpe/libqpe-opie_1.2.5.bb
+++ b/recipes-opie/libqpe/libqpe-opie_1.2.5.bb
@@ -1,12 +1,13 @@
 require ${PN}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "http://sources.openembedded.org/opie-1.2.5-split_library.tar.bz2;name=split_library \
            file://fix-titleheight.patch \
            file://unbreak-logging-2.patch \
            file://citytime-path-2.patch \
            file://no-include-pro.patch \
+           file://qpe-fix-lnkproperties-visibility.patch \
           "
 SRC_URI[split_library.md5sum] = "195ede745b2d1b2111f97654151b7af4"
 SRC_URI[split_library.sha256sum] = "aace8f512c0f8f0e23509599c60ec12cf41145bc583d814228db0fcb356a0ea0"
diff --git a/recipes-opie/libqpe/libqpe-opie_git.bb b/recipes-opie/libqpe/libqpe-opie_git.bb
index 585c0ae..590829d 100644
--- a/recipes-opie/libqpe/libqpe-opie_git.bb
+++ b/recipes-opie/libqpe/libqpe-opie_git.bb
@@ -1,11 +1,12 @@
 require ${PN}.inc
 
 PV = "${OPIE_GIT_PV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI = "${OPIE_GIT};protocol=git;subpath=library \
            file://fix-titleheight.patch \
            file://unbreak-logging-2.patch \
            file://citytime-path-2.patch \
            file://no-include-pro.patch \
+           file://qpe-fix-lnkproperties-visibility.patch \
           "
-- 
1.7.2.5



