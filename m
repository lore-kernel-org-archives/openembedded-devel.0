Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 16F776EA39
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:23 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so2705899eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6J7yxpBMH6xfpu/jeZhIxEcCgrkafg7MrkuR+dApZNs=;
	b=j/g7H5HWqLVyE/7mMLdifkrtRL2bTdozq4A0vhyJeblNVy0QBOMzpRjxbhLJuAV4ht
	D7OfHbkneN9pj5asOnNsCPaLBg3lJf7LTo5rppCZ4RWC6ndOk9zv7Wvsh5Ywkioy7m0i
	HBiV8EuQO0vOU5R4ct5EZQBijhgN6IVJLzfMIrzKNCgkR6tD2N4s2ZvjIaef9QkOq0s3
	nRNg8OQEGl1ep7vOMuKvmjRcJfI27wF1Px6+mbOKuYvehOWiKhqsO5S2XoRx/iovCJuN
	fAS0glWt9KngFzjlTiaoLLIPwfcytekLtZObGpQau7uPsvAoyQgQeOGJru8+SjbXZCHG
	bQ5Q==
X-Received: by 10.14.172.133 with SMTP id t5mr221044eel.99.1391240064659;
	Fri, 31 Jan 2014 23:34:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm46156634ees.4.2014.01.31.23.34.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:03 +0100
Message-Id: <0b221b90a5491401b5c02b94c89ccccca57491c4.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/20] terminology: upgrade to 0.4.0
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:24 -0000

* announcement
  http://sourceforge.net/mailarchive/message.php?msg_id=31728362

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/terminology.inc      |  1 -
 meta-efl/recipes-efl/e17/terminology_0.3.0.bb | 10 ----------
 meta-efl/recipes-efl/e17/terminology_0.4.0.bb |  8 ++++++++
 3 files changed, 8 insertions(+), 11 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/terminology_0.3.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.4.0.bb

diff --git a/meta-efl/recipes-efl/e17/terminology.inc b/meta-efl/recipes-efl/e17/terminology.inc
index 00b8f83..89c9ee5 100644
--- a/meta-efl/recipes-efl/e17/terminology.inc
+++ b/meta-efl/recipes-efl/e17/terminology.inc
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=03f6c2cf2bef233fadf7d0769f5bfda7"
 DEPENDS = "evas ecore edje elementary eina eet emotion"
 
 inherit e gettext
-INC_PR = "r2"
 
 # Because latest release we have is 0.1.0 which sorts lower then 0.1.0+svnr${SRCPV} already in feeds
 PE = "2"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.3.0.bb b/meta-efl/recipes-efl/e17/terminology_0.3.0.bb
deleted file mode 100644
index d3cd59c..0000000
--- a/meta-efl/recipes-efl/e17/terminology_0.3.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "7cecd058cb4509873412252477f2ce5b"
-SRC_URI[sha256sum] = "77850b1100fab93fc5c3c571d78f80fe10f5b153863dbb8efad83eccb55cc5b6"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.4.0.bb b/meta-efl/recipes-efl/e17/terminology_0.4.0.bb
new file mode 100644
index 0000000..83ceee8
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology_0.4.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "5a2eee4849d4fa44db4caf743b3beb37"
+SRC_URI[sha256sum] = "63f2d1fa584ecda6c4ef61b05b8956415feb955c4bb13c0872c11d98024dcfc6"
-- 
1.8.5.3


