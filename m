Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OKCIL-0004OX-Dm
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:25:22 +0200
Received: by gyg10 with SMTP id 10so166911gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=1DQ1ZToQ8GBnR0lvGHjjIwRTrLHHMlJOqXE3gakc+eg=;
	b=WWgro90ImxxKErXZ3VYcGX7qFZWMV8HiDOhRrTBhqaJzeAcUoCW4pj3EvPVnZuSblA
	9H+gReCvKYcH7QCOQBq2fr4CjxKA+Jsfo7D2b9LZSJ6vYnVuvCkIHCgQkRSWHZzKTcik
	uUNUh/bOg9iAc8lpdRVVvy/87kI8UlFMTOND4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=QgHjIat0CWYCbz/W9kSCUqTYjEk7+54H7MTqjpNnBSZ9JMjPQjDrV8Kn4sq91uMJpO
	3R2Z0Y4PtbOLOxCag0g0byCKpAMVHIDNFa9L8oXkXJ9gbyLFlvjLwpmmAP2sFf/c4A3U
	ePYi+VPexfyOvOwBtOLrYuSanfTY+pGsFds2I=
Received: by 10.101.138.35 with SMTP id q35mr10373630ann.86.1275578463583;
	Thu, 03 Jun 2010 08:21:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id f6sm657253anb.6.2010.06.03.08.21.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 08:21:02 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jun 2010 10:15:13 -0500
Message-Id: <1275578113-17291-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH] qt4-embedded: rename qtdemo file
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
X-List-Received-Date: Thu, 03 Jun 2010 15:25:22 -0000

* Changed the name of the qtdemo exectable installed
  in the /usr/bin directory to qtdemoE for Qt
  embedded builds.  This allows the Qt embedded
  version of the demos package to co-exist with
  the Qt X11 version.
* Changed the demos package file list to accept
  both qtdemo and qtdemoE.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/qt4/qt-4.6.2.inc     |    3 +++
 recipes/qt4/qt4-embedded.inc |    2 +-
 recipes/qt4/qt4.inc          |    4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/qt4/qt-4.6.2.inc b/recipes/qt4/qt-4.6.2.inc
index e89cf17..4a9f077 100644
--- a/recipes/qt4/qt-4.6.2.inc
+++ b/recipes/qt4/qt-4.6.2.inc
@@ -57,6 +57,9 @@ do_install_append() {
 	for i in rcc uic moc ; do
 		install -m 0755 ${S}/bin/$i ${D}${bindir}/
 	done
+
+	#Append an E to the qtdemo file
+	mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
 }
 
 LICENSE = "LGPLv2.1 GPLv3"
diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 9aaca6e..436f64c 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r19"
+INC_PR = "r20"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index 5a19f65..e246e17 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -103,8 +103,8 @@ FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
 FILES_${QT_BASE_NAME}-common-dbg           = "${bindir}/.debug/qtconfig"
 FILES_${QT_BASE_NAME}-dbus                 = "${bindir}/qdbus ${bindir}/qdbusxml2cpp ${bindir}/qdbuscpp2xml ${bindir}/qdbusviewer"
 FILES_${QT_BASE_NAME}-dbus-dbg             = "${bindir}/.debug/qdbus ${bindir}/.debug/qdbusxml2cpp ${bindir}/.debug/qdbuscpp2xml ${bindir}/.debug/qdbusviewer"
-FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo ${bindir}/${QT_DIR_NAME}/demos/*"
-FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/*/.debug"
+FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/*"
+FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/*/.debug"
 FILES_${QT_BASE_NAME}-designer             = "${bindir}/*designer*"
 FILES_${QT_BASE_NAME}-designer-dbg         = "${bindir}/.debug/*designer*"
 FILES_${QT_BASE_NAME}-examples             = "${bindir}/${QT_DIR_NAME}/examples/*"
-- 
1.5.4.3



