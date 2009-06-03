Received: from [209.85.220.213] (helo=mail-fx0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsg0-0000ej-Uu
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:52 +0200
Received: by mail-fx0-f213.google.com with SMTP id 9so74430fxm.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=6p0Uryw6eU3PeMOoXEecEsNVMHI2e7+VJOI9LMqZE6Q=;
	b=WHHrYqHc7SmTVAKcbok1FB4SFvlq1euqDH7d9WWuKNPOR45Zb+X6rSdqKe2Y3CMFdg
	hXDUsgdMplTsPhP+yXSDwOIpxXrgb3roldh/cfdCmnkRSuLxBLUhNGxn3xG6P0R2CGhq
	9mXacWDqjfRWWOgiMF735ubQ+5nHdKQfTu6hc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nkaAJEXC+G4/tZRpPQsFpwkgEaovhpRJau72C1O/4vQEML5oUgzDgtvd4hrInyMtkZ
	Td1yNsY3LpLCsRb/IjoVy2rysfYwKLtO74SdIEgJx92hSbpdQ+FOP5dOjcq9ihU3U6oI
	Ukx6uMB+i8DfFa9UxmQkLaNAI6BriTgX/mPOo=
Received: by 10.103.24.11 with SMTP id b11mr689794muj.90.1244043474025;
	Wed, 03 Jun 2009 08:37:54 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 23sm453536mun.46.2009.06.03.08.37.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:53 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:16 +0300
Message-Id: <1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 06/12] meta-toolchain-qte: initial qt embedded toolchain version
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:53 -0000

This version doesn't include qt tools yet so it is not ready to create
crossed qt applications.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/meta/meta-toolchain-qte.bb         |   25 +++++++++++++++++++++++++
 recipes/tasks/task-qte-toolchain-host.bb   |    5 +++++
 recipes/tasks/task-qte-toolchain-target.bb |    8 ++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 recipes/meta/meta-toolchain-qte.bb
 create mode 100644 recipes/tasks/task-qte-toolchain-host.bb
 create mode 100644 recipes/tasks/task-qte-toolchain-target.bb

diff --git a/recipes/meta/meta-toolchain-qte.bb b/recipes/meta/meta-toolchain-qte.bb
new file mode 100644
index 0000000..49ed35e
--- /dev/null
+++ b/recipes/meta/meta-toolchain-qte.bb
@@ -0,0 +1,25 @@
+# Qt Embedded toolchain
+
+require meta-toolchain.bb
+
+TOOLCHAIN_HOST_TASK = "task-qte-toolchain-host"
+TOOLCHAIN_TARGET_TASK = "task-qte-toolchain-target"
+
+SDK_SUFFIX = "toolchain-qte"
+QT_DIR_NAME = "qtopia"
+
+do_populate_sdk_append() {
+       script = "${SDK_OUTPUT}/${prefix}/environment-setup"
+       touch $script
+       echo 'export OE_QMAKE_CC=${TARGET_SYS}-gcc' >> $script
+       echo 'export OE_QMAKE_CXX=${TARGET_SYS}-g++' >> $script
+       echo 'export OE_QMAKE_LINK=${TARGET_SYS}-g++' >> $script
+       echo 'export OE_QMAKE_LIBDIR_QT=${prefix}/${TARGET_SYS}/${layout_libdir}' >> $script
+       echo 'export OE_QMAKE_INCDIR_QT=${prefix}/${TARGET_SYS}/${layout_includedir}/${QT_DIR_NAME}' >> $script
+       echo 'export OE_QMAKE_MOC=${prefix}/${layout_bindir}/moc4' >> $script
+       echo 'export OE_QMAKE_UIC=${prefix}/${layout_bindir}/uic4' >> $script
+
+       # Repack SDK with new environment-setup
+       cd ${SDK_OUTPUT}
+       fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+}
diff --git a/recipes/tasks/task-qte-toolchain-host.bb b/recipes/tasks/task-qte-toolchain-host.bb
new file mode 100644
index 0000000..2a9b652
--- /dev/null
+++ b/recipes/tasks/task-qte-toolchain-host.bb
@@ -0,0 +1,5 @@
+require task-sdk-host.bb
+
+DESCRIPTION = "Host packages for Qt Embedded SDK"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
diff --git a/recipes/tasks/task-qte-toolchain-target.bb b/recipes/tasks/task-qte-toolchain-target.bb
new file mode 100644
index 0000000..82fa5d8
--- /dev/null
+++ b/recipes/tasks/task-qte-toolchain-target.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "Target packages for Qt Embedded SDK"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
+
+RDEPENDS_${PN} += " \
+	task-sdk-bare \
+	qt4-embedded \
+	qt4-embedded-dev"
-- 
1.6.3.1



