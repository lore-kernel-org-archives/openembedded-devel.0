Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3627F605F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 00:40:20 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id z6so4529147yhz.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 16:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=FHe8V24KiROwzgYKkMkMJwBE0bTB6iDmrIgWlRocRhU=;
	b=H7USjMYXun3lxxzYlSAZIyBUDIacO1hRCSVAE641JsB/vwvITntnvLM91FWXtzN17N
	zWALCd4Kw6vOIsplWmefywYmLZ2v+Z/APPp48c+w7RWx1JYST0kYk4NLRf6G5Knze3xH
	NuM4dvjo/cWiTfp6TPCQgYUSM9iof79rAXlrpwCh4ZVTERjt7xBbqgjsLejfgWo94/fE
	eeXx2p1Zr636VjegRG+mHCL3dtjFzLHsKrRJRFd6gOth31c9Pe9yXIpMHF0tSQp8O9sU
	V2zf3fm3dXq4ePcePKRJ9PMm9hDd5kQmqH9FdVoTQXDoFKqickCfmgomaEnjGYqI8N2l
	Io4Q==
X-Received: by 10.236.23.71 with SMTP id u47mr27115836yhu.143.1393202421077;
	Sun, 23 Feb 2014 16:40:21 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id 48sm44205160yhq.11.2014.02.23.16.40.18
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 16:40:19 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 21:39:53 -0300
Message-Id: <1393202396-11130-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v3 1/4] qmake5_paths.bbclass: Use Qt version path for headers
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
X-List-Received-Date: Mon, 24 Feb 2014 00:40:22 -0000

When looking for Qt5 headers we ought to use the Qt5 specific path. In
case the distribution wants to have a flat tree it can set QT_DIR_NAME
and it will still works as expected.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v3:
- Move headers path inside paths class

 classes/qmake5_paths.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qmake5_paths.bbclass b/classes/qmake5_paths.bbclass
index 2b5bf4b..8f91e93 100644
--- a/classes/qmake5_paths.bbclass
+++ b/classes/qmake5_paths.bbclass
@@ -5,7 +5,7 @@
 QT_DIR_NAME ?= "qt5"
 
 OE_QMAKE_PATH_PREFIX = "${prefix}"
-OE_QMAKE_PATH_HEADERS = "${includedir}"
+OE_QMAKE_PATH_HEADERS = "${includedir}/${QT_DIR_NAME}"
 OE_QMAKE_PATH_LIBS = "${libdir}"
 OE_QMAKE_PATH_ARCHDATA = "${libdir}"
 OE_QMAKE_PATH_DATA = "${datadir}"
-- 
1.7.10.4


