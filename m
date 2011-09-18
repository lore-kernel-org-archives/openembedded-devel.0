Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYQ-0003rO-6r
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:28:58 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592243fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JrFquykW7IuocdDhG5CzYDEeGyyJfX3nobQJr+N4fPc=;
	b=mjtnTHF2igkzAY1uFfMJSNPefLv7LDPnCbZxtmfpM8ZywT7IKZfIVaqWoC2IJ0Xy6G
	V/Rsvu5D4jRQVmZJkRB7yFa7oBmRmvK42arkDvsHoM/CreN3/cjaltQXe2yl3/nooV5v
	pFJsasc1U/2UHBU/CAidxWmr4fWYXZJl3BPcY=
Received: by 10.223.38.196 with SMTP id c4mr1069710fae.32.1316345025200;
	Sun, 18 Sep 2011 04:23:45 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:44 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:12 +0400
Message-Id: <1316344999-26642-11-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 10/17] uicmoc-native: install tools with suffix 2
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
X-List-Received-Date: Sun, 18 Sep 2011 11:29:00 -0000

To remove conflicts with Qt4, install Qt2 tools with suffix "2", like
moc2, uic2, qvfb2.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-qt/uicmoc/uicmoc-native_2.3.10.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-qt/uicmoc/uicmoc-native_2.3.10.bb b/recipes-qt/uicmoc/uicmoc-native_2.3.10.bb
index 5846fc5..e6bcba1 100644
--- a/recipes-qt/uicmoc/uicmoc-native_2.3.10.bb
+++ b/recipes-qt/uicmoc/uicmoc-native_2.3.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "User Interface Generator and Meta Object Compiler (moc) for Qt(E)
 HOMEPAGE = "http://www.trolltech.com"
 SECTION = "devel"
 LICENSE = "GPL QPL"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-free.tar.gz \
            file://fix-makefile.patch \
@@ -47,8 +47,9 @@ do_compile() {
 
 do_install() {
     install -d ${D}${bindir}
-    install -m 0755 bin/moc ${D}${bindir}
-    install -m 0755 bin/uic ${D}${bindir}
+    install -m 0755 bin/moc ${D}${bindir}/moc2
+    install -m 0755 bin/uic ${D}${bindir}/uic2
+    install -m 0755 tools/qvfb/qvfb ${D}${bindir}/qvfb2
     install -m 0755 tools/makeqpf/makeqpf ${D}${bindir}
 }
 
-- 
1.7.2.5



