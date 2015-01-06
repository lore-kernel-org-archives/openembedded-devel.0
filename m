Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id DCCEF728C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 14:59:12 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so9808507wes.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+VprTo6lAVsv74JBkixo3FMzhOcA3W+tCyqB8sF6AJw=;
	b=y6HUgD1SyjEorSmKAD1zoPXGoEvXv8zbRntUUE26HM34J5sDjDvsiJY/yZ1yC6Ghkv
	zUsfqGKjBSnhVoN58HbiPqgn3CJ1nFE+wBI1WNzcizgj6uUq0JonUHb3/29bL2KDSX6s
	1mz/bhudAyC26EOma7jALi3w/jUbOf4SLMXcS1Vz7eC+yIigSQq+KSjnIhTBmGpkPd/V
	hOWrrZ1wRDleOapZJRwEGqa7/HwMHbQZeNlVt3RVWSBtSZa7DZ3lDPPfEYBY6Y5rJhic
	KosOG0uqlwm2GNH9GJN5iqtY4KMvaGC/XYObfVu0+oe4jlO4ErzP6Ch4f7nX+LsmcJfT
	6JRA==
X-Received: by 10.180.109.3 with SMTP id ho3mr37729765wib.39.1420556352398;
	Tue, 06 Jan 2015 06:59:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j10sm70295821wjn.23.2015.01.06.06.59.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 06:59:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 15:59:07 +0100
Message-Id: <1420556347-17472-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [meta-qt5][PATCH] qmake5_base: add *.prf to SSTATE_SCAN_FILES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2015 14:59:16 -0000

* e.g. maliit-framework-qt5 is staging sysroot specific paths in
  sysroot-destdir/usr/lib/qt5/mkspecs/features/maliit-plugins.prf
  sysroot-destdir/usr/lib/qt5/mkspecs/features/maliit-framework.prf
  make sure they are replaced with correct ones on sstate reuse

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/qmake5_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index f1a0945..e7b85e3 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -14,7 +14,7 @@ OE_QMAKE_PLATFORM = "linux-oe-g++"
 OE_QMAKE_DEBUG_OUTPUT ?= ""
 
 # Paths in .prl files contain SYSROOT value
-SSTATE_SCAN_FILES += "*.pri *.prl"
+SSTATE_SCAN_FILES += "*.pri *.prl *.prf"
 
 # drop default -e and add needed OE_QMAKE vars explicitly
 # the problem is that when generated Makefile has:
-- 
2.2.1


