Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SIgP3-00015R-IV
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 15:19:05 +0200
Received: by wera1 with SMTP id a1so1941389wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4ky/8H87vciDoWPNvnHVmk3RIWvZd0Dt46ds9E0GMR4=;
	b=PG9MgT4IHFegXasiZrURtRgkXfVKB1T8YOzWcjWn7pAbR1RWgYckT/s99OE/1zshJR
	d4m6nu2HZkRAqIsA36vknKvUZm67Yes1QK1ES1tuVQqyHO/HZLk5AXWOSxAEdiGwJpym
	O+EmIeSf7pjyu+U7slheSyBh6Hl8371dffYc7lruGJLKJVOLjf5DN7pSZBBYi90MhkJe
	bReRTwNQChLtTd7d45QTyRCr3nMJUNPqrdCrcnEH8rZ1tEOpvUQC5VXtvauM96RPYQoA
	99ZhzRjVp9sMZWnSyUqc2eWJDnTBvULKpBXBl8aBFUq6vRG1ACiS+DZXAkZCLymdxo8E
	PEvQ==
Received: by 10.180.91.165 with SMTP id cf5mr4623948wib.2.1334322584458;
	Fri, 13 Apr 2012 06:09:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm4703882wix.0.2012.04.13.06.09.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 06:09:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Apr 2012 15:09:36 +0200
Message-Id: <1ab99af784f5f1564f28f6afc4718d630b42a606.1334322354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1334322354.git.Martin.Jansa@gmail.com>
References: <cover.1334322354.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/1] xorg: add more native BBCLASSEXTENDs for gtk+-native
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
X-List-Received-Date: Fri, 13 Apr 2012 13:19:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libxcomposite_0.4.3.bbappend          |    1 +
 .../xorg-lib/libxcursor_1.1.12.bbappend            |    1 +
 .../xorg-lib/libxdamage_1.1.3.bbappend             |    1 +
 .../xorg-lib/libxfixes_5.0.bbappend                |    1 +
 .../xorg-lib/libxrandr_1.3.2.bbappend              |    1 +
 .../xorg-proto/compositeproto_0.4.2.bbappend       |    1 +
 .../xorg-proto/damageproto_1.2.1.bbappend          |    1 +
 .../xorg-proto/fixesproto_5.0.bbappend             |    1 +
 .../xorg-proto/randrproto_1.3.2.bbappend           |    1 +
 9 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxcomposite_0.4.3.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxdamage_1.1.3.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxfixes_5.0.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxrandr_1.3.2.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend b/meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/compositeproto_0.4.2.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend b/meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/damageproto_1.2.1.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend b/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend b/meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-proto/randrproto_1.3.2.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
-- 
1.7.8.5



