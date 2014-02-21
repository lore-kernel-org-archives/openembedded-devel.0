Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB7F6EE43
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 22:31:09 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id mc6so2826224lab.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 14:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=IN9Zl5Xv900tbceA8HA3NOsUYrxbexXKK+PSL/g7w2k=;
	b=OBj0M9G+Xp17SQp5rjrkhHsFsSql2o0bgUFuohXjmZe8w/pow5UVFTx92JKV4l2hDX
	5hAKzOog7mSY1SSFRIfikUEF6rZgPvUYlrguKyNsj+Cm3uTBSYcumICeoOWSNqCuTBbX
	BkDw73O6IKVkeuOau1nTeWjxLvo+fJxNeKZt7iiBaunkEsyluJMqUZpWvirS8c+Fbvmq
	9onS+6yevqnqzo2kICdzdQdqUAvFu4TOZ/FGJcXYJ8CMcSlIDuBeuR1DCpI1jFiLDh1n
	boTzVYjRBmBbDckqmWfl8gsUv7hRShrfLJem46jGzUrUntM6EfxPHRHbAD1qrvVII26n
	05cA==
X-Received: by 10.112.50.15 with SMTP id y15mr5332876lbn.74.1393021869197;
	Fri, 21 Feb 2014 14:31:09 -0800 (PST)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id ya9sm9116537lbb.2.2014.02.21.14.31.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Feb 2014 14:31:08 -0800 (PST)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2014 23:29:25 +0100
Message-Id: <1393021765-4399-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-qt5][PATCH] Disable Debian-style package renaming for nativesdk-qtbase-tools
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
X-List-Received-Date: Fri, 21 Feb 2014 22:31:13 -0000

Since commit 8da5017712a7ddcb8488e095b9aa03b0273f23e9, libQt5*.so files
are included in the nativesdk-qtbase-tools package. However this
seems to enable Debian-style renaming, causing the resulting ipk package
to be created as "nativesdk-libqt5core5".

Explicitly disable renaming for nativesdk-qtbase-tools package.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 recipes-qt/qt5/nativesdk-qtbase.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
index 3cb9b0e..e87624b 100644
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ b/recipes-qt/qt5/nativesdk-qtbase.inc
@@ -60,6 +60,8 @@ FILES_${PN}-tools = " \
     ${OE_QMAKE_PATH_BINS}/* \
 "
 
+DEBIAN_NOAUTONAME_${PN}-tools = "1"
+
 QT_CONFIG_FLAGS += " \
     -reduce-relocations \
     -shared \
-- 
1.8.5.3


