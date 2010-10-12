Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P5erT-0007iD-6K
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 15:25:49 +0200
Received: by yxj4 with SMTP id 4so1339169yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=QtMou16OYILuESQgQdq8PBKB7yXj6Yk5k//+vSfPguU=;
	b=o3aqhvyhz6qi64uZzwUnrSnypQV8DfkW9jE/s4ScmqbH1MOzAzCEJM/M57Mfs9A5ug
	54BQ9k4ho60mkMG8louMbHGPUEkxoS0jw5OlW2nkBTUJMa///leoKb125EIIw/zgBSSw
	SHBdG364cZ8hwIDNgsHmZqm9vy5qScEWQ8JwQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UrW8HiSnOD29amhZJHkOJ/5kgyrla4ssalwY7+nnao4dwu1YF8cjzmiFJO4JqEXhax
	ADeHxbECimiu7kMDY8KbDELDKg0bT0+UgMOdVK4r0UaKJ1xl3WZRcFP/swd76EyS8Ekw
	QLmvU22dTs9on8OOBnDtgay669U5uLHsl2STc=
Received: by 10.236.105.148 with SMTP id k20mr14772071yhg.33.1286889917284;
	Tue, 12 Oct 2010 06:25:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id h70sm5081565yha.46.2010.10.12.06.25.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Oct 2010 06:25:15 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Oct 2010 08:25:13 -0500
Message-Id: <1286889913-20008-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] qt4: replace underscore with dash in library name
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
X-List-Received-Date: Tue, 12 Oct 2010 13:25:49 -0000

* For libraries that are added to the QT_LIB_NAMES or
  QT_EXTRA_LIBS variables replace any "_" characters in the
  library name with "-" for use in the package name.
* The actual library file names are left alone.
* Bump the PR for packages using qt4.inc

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/qt4/qt4-embedded.inc |    2 +-
 recipes/qt4/qt4-x11-free.inc |    2 +-
 recipes/qt4/qt4.inc          |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 111716d..9331302 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r23"
+INC_PR = "r24"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
index 66e6d1c..ff4e454 100644
--- a/recipes/qt4/qt4-x11-free.inc
+++ b/recipes/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.trolltech.com"
 LICENSE = "GPL QPL"
 DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch \
diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index ffd56dd..6721265 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -34,7 +34,7 @@ python __anonymous () {
     dev_packages = []
     dbg_packages = []
     for name in bb.data.getVar("QT_LIB_NAMES", d, 1).split():
-        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "") + "4"
+        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "").replace("_", "-") + "4"
         # NOTE: the headers for QtAssistantClient are different
         incname = name.replace("QtAssistantClient", "QtAssistant")
         bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
@@ -52,7 +52,7 @@ python __anonymous () {
         dbg_packages.append("%s-dbg" % name)
 
     for name in bb.data.getVar("QT_EXTRA_LIBS", d, 1).split():
-        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "") + "4"
+        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "").replace("_", "-") + "4"
         bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" % locals(), d)
         bb.data.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.prl
                   ${libdir}/lib%(name)s.a
-- 
1.7.0.4



