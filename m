Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD187885B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2018 01:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B1D320B35;
	Thu, 11 Jan 2018 01:45:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3g-oidpCCWie; Thu, 11 Jan 2018 01:45:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 10A5A20481;
	Thu, 11 Jan 2018 01:45:28 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id C0885163255;
	Wed, 10 Jan 2018 20:45:27 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 20:45:26 -0500
Message-Id: <1515635126-19293-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-qt5][rocko][PATCH] qtwebengine: explicitly depend on bison-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 01:45:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

QtWebEngine uses bison during the build. While normally bison-native gets
staged into sysroot indirectly by the toolchain via binutils-cross, it's
better to have the dependency listed explicitly for deterministic builds.
Otherwise, when using an external toolchain, it fails like this:

| FAILED: gen/blink/core/XPathGrammar.cpp gen/blink/core/XPathGrammar.h
| .../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/bin/python-native/python2
|    ../../../../git/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/rule_bison.py
|    ../../../../git/src/3rdparty/chromium/third_party/WebKit/Source/core/xml/XPathGrammar.y gen/blink/core bison
| Traceback (most recent call last):
|   File "../../../../git/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/rule_bison.py", line 83, in <module>
|     returnCode = subprocess.call([bisonExe, '-d', '-p', prefix, inputFile, '-o', outputCpp])
|   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 168, in call
|     return Popen(*popenargs, **kwargs).wait()
|   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 390, in __init__
|     errread, errwrite)
|   File ".../qtwebengine/5.9.3+...-r0/recipe-sysroot-native/usr/lib/python2.7/subprocess.py", line 1024, in _execute_child
|     raise child_exception
| OSError: [Errno 2] No such file or directory

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-qt/qt5/qtwebengine_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 1f53e4a..ed179de 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += " \
     ninja-native \
     yasm-native \
+    bison-native \
     qtwebchannel \
     qtbase qtdeclarative qtxmlpatterns qtquickcontrols qtquickcontrols2 \
     qtlocation \
-- 
2.7.4


