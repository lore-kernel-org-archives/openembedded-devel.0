Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QCAu0-0004vd-I3
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 15:23:36 +0200
Received: by fxm19 with SMTP id 19so3926895fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=82u1ZXXDrYQhygcnnLTpCJ+32WLQiHNTgq7HNstODFo=;
	b=UhPVti6ZGDaztM7QLmYTCfqzFbn030V7gU4oxjp1tL33ZsW2Pef0d1nUaUjof8Rhdj
	bKBqqzgTG0eFgzq4oP9fQb19Lh5v9tHnhoK0ajb+lUvdgQLQEEIyp1SMolKDjpYpE+97
	vGIO2+Ni2Igyjrr8Hixd7+3bxvrWmevE0mA9c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=s97CGtkQLJFcNShVYvHFnX1W6C+6hLtzEvUmnQcyjmmS+EzfhlWJejRjHh0lSa3vZP
	cyQci7gM4Hbi1HBHupId5ipEo4uEXynFIzy1LDEhzKgv+cyJKFvR3SvMsaC2IWslxYzX
	aBLv8JVn9Ql5tflb5+ynE/RqL2kw1tWp6bZ18=
Received: by 10.223.7.26 with SMTP id b26mr825439fab.119.1303219273891;
	Tue, 19 Apr 2011 06:21:13 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j18sm1932240faa.42.2011.04.19.06.21.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Apr 2011 06:21:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2011 15:21:06 +0200
Message-Id: <1303219266-5204-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
Subject: [PATCH] qt4-x11-free: fix recipe name
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
X-List-Received-Date: Tue, 19 Apr 2011 13:23:36 -0000

* reported by Franz Leitl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb |   12 ++++++++++++
 meta-oe/recipes-qt/qt4/qt4-x22-free_4.7.2.bb |   12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x22-free_4.7.2.bb

diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
new file mode 100644
index 0000000..75c6314
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
@@ -0,0 +1,12 @@
+require qt4-x11-free.inc
+require qt-${PV}.inc
+
+PR = "${INC_PR}.1"
+
+QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+
+QT_CONFIG_FLAGS += " \
+ -no-embedded \
+ -xrandr \
+ -x11"
+
diff --git a/meta-oe/recipes-qt/qt4/qt4-x22-free_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-x22-free_4.7.2.bb
deleted file mode 100644
index 75c6314..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x22-free_4.7.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require qt4-x11-free.inc
-require qt-${PV}.inc
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-QT_CONFIG_FLAGS += " \
- -no-embedded \
- -xrandr \
- -x11"
-
-- 
1.7.5.rc1



