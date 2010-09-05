Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsB56-0005Fq-GT
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 11:00:11 +0200
Received: by ewy7 with SMTP id 7so1788186ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=lZ4HePu1cBmfPupWjAPs+lWFm+uEZkUWubAkKITQuGU=;
	b=VJw4KTQPxmfvzA1ON0v8USu6+HytgP8zoLzHVlXW/pFcvcuBW+CPElBQUagG75f8ig
	ZHak4aKcOCj3LbBgqCJcZ5PzwS9kdJxSRF8uxdF6793IhkDSDZ/jTOuPfkPpgZZobpzc
	zAt5QNw93uFxQc+rh1ddsnJmD/03Dvd3JyJOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Vm1+UX0nTy17bTFeNLT9OjUiY/845qfVxP0IE7g/Tiy7nZmlgce8QrWJNGBS1v7Pe7
	pYPeozRUdvemMrvHmFFVsRP1JGDxkpI5UTfZE24CCzvHW2TaHKZvzTF0OIWidyGsvRAJ
	/jjR2mRjxC1OCvLDJR4DtxZG4/RBmV7LgM9SU=
Received: by 10.213.39.196 with SMTP id h4mr1241545ebe.42.1283677170547;
	Sun, 05 Sep 2010 01:59:30 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm5988067eei.7.2010.09.05.01.59.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 01:59:29 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Sep 2010 10:59:20 +0200
Message-Id: <1283677162-7876-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] js: fixed libtermcap
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
X-List-Received-Date: Sun, 05 Sep 2010 09:00:11 -0000

the new ncurses does not have libtermcap
this patches -ltermcap into -lncurses
also added ncurses to DEPENDS

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/js/files/libtermcap.patch |   13 +++++++++++++
 recipes/js/js_1.5.bb              |    5 +++--
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 recipes/js/files/libtermcap.patch

diff --git a/recipes/js/files/libtermcap.patch b/recipes/js/files/libtermcap.patch
new file mode 100644
index 0000000..045b4fb
--- /dev/null
+++ b/recipes/js/files/libtermcap.patch
@@ -0,0 +1,13 @@
+Index: src/Makefile.ref
+===================================================================
+--- src.orig/Makefile.ref
++++ src/Makefile.ref
+@@ -127,7 +127,7 @@ endif
+ ifdef JS_READLINE
+ # For those platforms with the readline library installed.
+ DEFINES += -DEDITLINE
+-PROG_LIBS += -lreadline -ltermcap
++PROG_LIBS += -lreadline -lncurses
+ else
+ ifdef JS_EDITLINE
+ # Use the editline library, built locally.
diff --git a/recipes/js/js_1.5.bb b/recipes/js/js_1.5.bb
index eb92b24..f9aba90 100644
--- a/recipes/js/js_1.5.bb
+++ b/recipes/js/js_1.5.bb
@@ -1,11 +1,12 @@
 DESCRIPTION = "A JavaScript engine"
 LICENSE = "GPL"
 SECTION = "libs/network"
-DEPENDS = "readline"
+DEPENDS = "readline ncurses" 
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/older-packages/js-1.5.tar.gz \
+	   file://libtermcap.patch \
            file://jsautocfg.h"
 S = "${WORKDIR}/js/src"
 
-- 
1.6.4.2



