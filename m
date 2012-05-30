Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SZjwm-0000sw-KD
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 16:32:24 +0200
Received: by mail-bk0-f47.google.com with SMTP id jm2so4321917bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dA/kYhImjdPzlhfL8CrQNVPVYavotMNyi6a9BRiIVfQ=;
	b=OZV/PMtN6RFpmvxZcaiMqncM7YI1YZ6hSzAW66hfU4uZe5QMC4t5nK7ONfurfowz6x
	aqTVRSBtAaEYsqqld1bKMcgCh0+M/mD9vEqAAmRvgxNjqxkdwu0fNBmdnZ+OuTF3mpIv
	05JlhW+SU9neVftdjDPg1D7JC/3+tKMw6gVPPQx88LfHzUvBnHA4AXfC5LruvHHygWgK
	nDwch37VxzNn7itA/GjhgWiP8cvZa1YtMF4YEGFMIf01zu6x0k2AHVAH/sUgIWL3mMoA
	LOrLF1IKSmRAPNDCTyMZ1i4bLuPDvxdW45P8+sWw7t3BlCyFW3wxzAAE77mphgOwzQPw
	ymfw==
Received: by 10.204.154.138 with SMTP id o10mr9307373bkw.34.1338387728259;
	Wed, 30 May 2012 07:22:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h18sm22430159bkh.8.2012.05.30.07.22.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 07:22:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2012 16:21:56 +0200
Message-Id: <b0ae6d8cb99d3e1648bc22f66d6f5d6a56a1ee90.1338386047.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1338386047.git.Martin.Jansa@gmail.com>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1338386047.git.Martin.Jansa@gmail.com>
References: <cover.1338386047.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/3] gcalctool: remove older version and drop 'patch=1'
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
X-List-Received-Date: Wed, 30 May 2012 14:32:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gcalctool/gcalctool_5.7.32.bb    |   13 -------------
 .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |    2 +-
 2 files changed, 1 insertions(+), 14 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb

diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
deleted file mode 100644
index f12e6c4..0000000
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-LICENSE = "GPL"
-SECTION = "x11"
-DEPENDS = "gtk+"
-DESCRIPTION = "gcalctool is a powerful calculator"
-PR = "r2"
-
-SRC_URI = "http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz \
-        file://makefile-fix.diff;patch=1\
-	file://fix-includedir.patch;patch=1"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--disable-gnome"
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
index c72860c..981a073 100644
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "gcalctool is a powerful calculator"
 PR = "r0"
 
 SRC_URI = "http://download.gnome.org/sources/${PN}/5.8/${PN}-${PV}.tar.gz \
-	file://fix-includedir.patch;patch=1"
+	file://fix-includedir.patch"
 
 inherit autotools pkgconfig
 
-- 
1.7.8.6



