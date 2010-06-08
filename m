Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OLtGO-0005Dk-2W
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 09:30:20 +0200
Received: by fxm9 with SMTP id 9so2759843fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=FKdICJYoq1o2lnum3ABSdxVyvSvE7sJPY8vCl2LTyz0=;
	b=mwAZHIAqzd1lnzi/ZWI6lBQm6+YmsvE2X3AeiZj7I1yAY/rZdaEVC8iyC4yIwopWg7
	Yj7tlZVigl/sZTsmXAj5jQcc8R+JxSQkqGXAvclBZfPMlOKVPnWleBVd9K8wM5HYkW7I
	bazegaiapD1fxBGUPNrzyiwv4Zc/EUj0ashLM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=wIErWNxCwZH2+oLZzeLZ2MC42GO97DHbG7vUPCy/F614pWqs7pBJNmGjAUVSFP/s1Y
	LE1hfLzXRfeDo7O5Zb5RqdzDmSIdN//IedjQ1svFOMyqbIto1E29wVaUwWHs/7Kbr+9p
	21zwt8NDfvASYamuP4FEFBbpsFc2mP5j5aDAo=
Received: by 10.223.23.83 with SMTP id q19mr16156127fab.12.1275981959509;
	Tue, 08 Jun 2010 00:25:59 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm24127930fah.16.2010.06.08.00.25.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 08 Jun 2010 00:25:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jun 2010 09:25:51 +0200
Message-Id: <1275981951-532-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qt-4.6.2+4.7.0-beta1: fix SRC_URI and S after c070de32d40dd561b63de5b4f41baa3cf822ef5b
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
X-List-Received-Date: Tue, 08 Jun 2010 07:30:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/qt4/qt-4.6.2+4.7.0-beta1.inc        |    4 ++--
 recipes/qt4/qt4-tools-native_4.7.0-beta1.bb |    9 ++++++++-
 recipes/qt4/qt4-x11-free_4.7.0-beta1.bb     |    3 ++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc b/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
index eb19285..9de3a5d 100644
--- a/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
+++ b/recipes/qt4/qt-4.6.2+4.7.0-beta1.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1 GPLv3"
 FILESPATHPKG .= ":qt-${PV}"
 
 SRC_URI = "\
-	ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+	ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${SRCVER}.tar.gz \
 	file://0004-no-qmake.patch \
 	file://hack-out-pg_config.patch \
 	file://0006-freetype-host-includes.patch \
@@ -19,7 +19,7 @@ SRC_URI = "\
 	file://linux.conf \
            "
 
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+S = "${WORKDIR}/qt-everywhere-opensource-src-${SRCVER}"
 
 QT_LIB_NAMES += "QtDeclarative"
 FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
diff --git a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
index 0539c04..fb08ded 100644
--- a/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
+++ b/recipes/qt4/qt4-tools-native_4.7.0-beta1.bb
@@ -3,9 +3,16 @@ DEFAULT_PREFERENCE = "-1"
 require qt4-tools-native.inc
 LICENSE = "LGPLv2.1 GPLv3"
 
-PV = "4.6.2+4.7.0-beta1"
+SRCVER = "4.7.0-beta1"
+PV = "4.6.2+${SRCVER}"
 PR = "${INC_PR}.0"
 
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${SRCVER}.tar.gz \
+           file://qt-config.patch \
+           file://g++.conf \
+           file://linux.conf"
+S = "${WORKDIR}/qt-everywhere-opensource-src-${SRCVER}"
+
 EXTRA_OECONF += " -no-fast -silent -no-rpath"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
diff --git a/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb b/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb
index beef158..c489a48 100644
--- a/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb
+++ b/recipes/qt4/qt4-x11-free_4.7.0-beta1.bb
@@ -2,7 +2,8 @@ DEFAULT_PREFERENCE = "-1"
 
 require qt4-x11-free.inc
 
-PV = "4.6.2+4.7.0-beta1"
+SRCVER = "4.7.0-beta1"
+PV = "4.6.2+${SRCVER}"
 PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-- 
1.7.1



