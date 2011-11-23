Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTAGi-0000Qp-GM
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 11:41:32 +0100
Received: by faat2 with SMTP id t2so1561340faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2011 02:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=D3qJ03V+AYu001HeOvJDsV4FUrgmXxQGOpo7f4qyAZI=;
	b=BrKeabEgE8BcYN6MXudAp3stufvnUn5FLVxYzMV4l+OUEnyDeNL0Rs3TTTe8K/RMYH
	C1excTGdArFoThOjd5DL1VWJRlcMYdiwx+kitp/uRUSowG7wAIWaGMmSKlik058Ru08l
	QlQoFWeJS9zIhuiyWPdwlNInBY5oVnsqDDiNQ=
Received: by 10.180.14.129 with SMTP id p1mr23427062wic.8.1322044498256;
	Wed, 23 Nov 2011 02:34:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dw6sm8008907wib.12.2011.11.23.02.34.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 02:34:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2011 11:34:49 +0100
Message-Id: <1322044489-25810-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <CA+chaQdUFUswZg-aYtWdEiF0C3fVFtrmMP8uH+AMKtbH2yGkKg@mail.gmail.com>
References: <CA+chaQdUFUswZg-aYtWdEiF0C3fVFtrmMP8uH+AMKtbH2yGkKg@mail.gmail.com>
Subject: [PATCH] abiword: fix no-undefined param
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
X-List-Received-Date: Wed, 23 Nov 2011 10:41:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../abiword/abiword/fix.no.undefined.param.patch   |   30 ++++++++++++++++++++
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |    5 ++-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch b/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch
new file mode 100644
index 0000000..954b50d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch
@@ -0,0 +1,30 @@
+diff -uNr abiword-2.8.6.orig/src/Makefile.am abiword-2.8.6/src/Makefile.am
+--- abiword-2.8.6.orig/src/Makefile.am	2009-09-09 15:11:01.000000000 +0200
++++ abiword-2.8.6/src/Makefile.am	2011-11-23 09:06:06.000000000 +0100
+@@ -44,7 +44,7 @@
+ 
+ libabiword_2_8_la_LDFLAGS = \
+ 	$(DEPS_LIBS) \
+-	--no-undefined \
++	-no-undefined \
+ 	-avoid-version \
+ 	-export-dynamic
+ 
+@@ -107,7 +107,7 @@
+ 
+ AbiWord_LDFLAGS = \
+ 	$(DEPS_LIBS) \
+-	--no-undefined \
++	-no-undefined \
+ 	-avoid-version \
+ 	-export-dynamic \
+ 	-headerpad_max_install_names 
+@@ -129,7 +129,7 @@
+ 
+ abiword_LDFLAGS = \
+ 	$(platform_ldflags) \
+-	--no-undefined      \
++	-no-undefined      \
+ 	-avoid-version      \
+ 	-export-dynamic
+ 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 1746769..2d0ec97 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -2,9 +2,12 @@ require abiword-2.5.inc
 DEPENDS += " loudmouth libwmf-native gtkmathview asio"
 RCONFLICTS_${PN} = "abiword-embedded"
 
+PR = "r1"
+
 SRC_URI = "http://www.abisource.com/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz;name=abiword \
            file://autogen-common.sh \
-           file://nodolt.patch"
+           file://nodolt.patch \
+           file://fix.no.undefined.param.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 
-- 
1.7.8.rc3



