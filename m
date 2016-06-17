Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 061A2731E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 16:23:45 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a186so12528268qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 09:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ByeVDqNutiSZ8KynSFT8OBkoKscWFs6gBoqtZxDvy0g=;
	b=gYsppctuMaVco28GnSYU0UwShf27TvMnHbxKt4Q4ZpibKTbGOOubAtM9Ry+Hd070Rb
	IBA5cY6NxoMkO4gaTHbDgsBiADfTty+O/a48YJbisZbu47Miblm9FoY85v0lvOh5uELa
	VtQTs6T5RS1763b38bq+e9vjp8GBC8A9b0XXIB2clcqOG31d2+Qm0tYxkH/L1uzXD1GC
	+7UFV8ksxTNdzyiPjXZcc1dfc+TnusHDGDfRJ6u6qzKAiOeixJpE8AG9xqV403yL+4MA
	ESKEH/9QuSWWM3mrFRG4jPxX4E++5WgxQY8ax5jCFRr5DAkZs7RjKjp3gufy4lmV82MJ
	Vplw==
X-Gm-Message-State: ALyK8tIAItsw+/jHxWEHIj+iLI2i7iDk+L2UtOLe8giM4sFMmWje4lhP91OJ2FS6k9gsJA==
X-Received: by 10.55.197.221 with SMTP id k90mr3283323qkl.89.1466180626263;
	Fri, 17 Jun 2016 09:23:46 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	c51sm13206637qge.31.2016.06.17.09.23.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 09:23:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 12:23:37 -0400
Message-Id: <1466180617-23459-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] geis: add a patch to fix incorrect indentation issues and remove -Wno-error=misleading-indentation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2016 16:23:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../geis/fix-indentation-for-gcc6.patch                    | 14 ++++++++++++++
 .../recipes-support/canonical-multitouch/geis_2.2.17.bb    |  6 +++---
 2 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/canonical-multitouch/geis/fix-indentation-for-gcc6.patch

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis/fix-indentation-for-gcc6.patch b/meta-oe/recipes-support/canonical-multitouch/geis/fix-indentation-for-gcc6.patch
new file mode 100644
index 0000000..389e1b3
--- /dev/null
+++ b/meta-oe/recipes-support/canonical-multitouch/geis/fix-indentation-for-gcc6.patch
@@ -0,0 +1,14 @@
+--- geis-2.2.17/libgeis/geis_subscription.c.orig	2016-06-17 12:04:21.062938443 -0400
++++ geis-2.2.17/libgeis/geis_subscription.c	2016-06-17 12:05:02.934939172 -0400
+@@ -237,9 +237,10 @@
+   GeisSize i;
+   for (i = 0; i < bag->sub_store_size; ++i)
+   {
+-    if (bag->sub_store[i])
++    if (bag->sub_store[i]) {
+       _subscription_unref(bag->sub_store[i]);
+       bag->sub_store[i] = NULL;
++    }
+   }
+ }
+ 
diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 9b087a8..f71d324 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -19,13 +19,13 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "grail dbus-glib python3 virtual/libx11 libxext libxi libxcb dbus frame"
 
-SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.xz\
+           file://fix-indentation-for-gcc6.patch \
+"
 SRC_URI[md5sum] = "2ff9d76a3ea5794516bb02c9d1924faf"
 SRC_URI[sha256sum] = "8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
 
 EXTRA_OECONF = "--disable-integration-tests"
-TARGET_CFLAGS += "-Wno-error=misleading-indentation"
-
 
 FILES_${PN}-bin = "${bindir}"
 RDEPENDS_${PN}-bin = " \
-- 
1.9.1


