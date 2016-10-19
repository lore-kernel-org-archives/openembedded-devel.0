Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7BA71C36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:46 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 128so1429404pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9zYXe3dd5Q46UBN4tWUSg1AmGhZWrrUn1WsKpAEU5cM=;
	b=BsWYJ1tqa09dFvyFovHhkyQak76eD2Ec2gZ6oW4FRn9ZE1Arc/gFe6WZbBwJTYFxcq
	zWHqGO7+wbpnj/T8jkDRbtNTWuUyZFFg9oNCYlFz+YCH6u2yoq/7AICb1Z7xDxj4Ir5K
	p1OBUBwhhgNslsyblQY10DzT8fJLktdQK1ljFTgyw5+jq13SllEvxW08xi47lh/qwRjJ
	M20s+C0r7VMUFXxVuCjVvuMxjfNHunqDuQl6krrOtpmy7KnHgy/w9iMrEGf5z1sKaYHV
	sddcgyGZcOvAxu1jqC8Vju9kiILkKk5F5LyUED+eCqOi5fUVCacN7cOag367PJQcPLGp
	2uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9zYXe3dd5Q46UBN4tWUSg1AmGhZWrrUn1WsKpAEU5cM=;
	b=DLuNYvBdyhNjljhEktZMgwDzDkHGZK+u9KFeqBXZy+b3VTvrR3P2vRIDO68xXmfoXC
	1/TNwTw4AmEDrMGCvyfyeIVY0nFX7tJh5l2MFI3oD3/N36VFlX23bgGhqNKh5dO1W03p
	NWYATXHUPyDHtNaXTNaJ/6P7BVlfJQinEjy8zV8bqCslPO6Z/aJBAteRHq0iA1sqJR2/
	Sgh9qxnv5eofZuIBBoaa+ZFPF57Ub9ODR0sjiMEhbQTttxxi3vaa46UvYhlERGGONwxw
	hdu/UTG8dQnwkG9cE7jtq3ihc7SHzupVmP/ZOYg1J/PzQdQ07HqjiVeHZ0zGz9/Tbmu8
	AyyA==
X-Gm-Message-State: AA6/9RlRBAAt7UesywznrJ1jpQS/6UzuNhqIT6T/j/CRD2p8qxj1yoW6ECAv3ftPL5ADOA==
X-Received: by 10.99.131.66 with SMTP id h63mr6378542pge.103.1476855528327;
	Tue, 18 Oct 2016 22:38:48 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:26 -0700
Message-Id: <20161019053834.11523-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/16] lowpan-tools: Fix errors found with clang
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-errors-with-clang.patch         | 34 ++++++++++++++++++++++
 .../lowpan-tools/lowpan-tools_git.bb               |  6 +++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch
new file mode 100644
index 0000000..8e906f7
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch
@@ -0,0 +1,34 @@
+From 5f9e80acb0a1ac399839bf160e43f6120c4b5128 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Oct 2016 23:49:09 +0000
+Subject: [PATCH] Fix build errors with clang
+
+| ../../../../../../../workspace/sources/lowpan-tools/src/coordinator.c:313:50: error: format specifies type 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
+|                 fprintf(stderr, "Opt: %c (%hhx)\n", (char)opt, opt);
+|                                           ~~~~                 ^~~
+|                                           %x
+| 1 error generated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/coordinator.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/coordinator.c b/src/coordinator.c
+index c139aae..f0de6d2 100644
+--- a/src/coordinator.c
++++ b/src/coordinator.c
+@@ -310,7 +310,7 @@ int main(int argc, char **argv)
+ #else
+ 		opt = getopt(argc, argv, "l:f:d:m:n:i:s:p:c:hv");
+ #endif
+-		fprintf(stderr, "Opt: %c (%hhx)\n", opt, opt);
++		fprintf(stderr, "Opt: %c (%hhx)\n", opt, (unsigned char)opt);
+ 		if (opt == -1)
+ 			break;
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 76a4edf..8c7dbc0 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -9,7 +9,9 @@ DEPENDS = "flex-native bison-native libnl python"
 
 PV = "0.3.1+git${SRCPV}"
 SRC_URI = "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
-           file://no-help2man.patch"
+           file://no-help2man.patch \
+           file://0001-Fix-build-errors-with-clang.patch \
+           "
 SRCREV = "38f42dbfce9e13629263db3bd3b81f14c69bb733"
 
 S = "${WORKDIR}/git"
@@ -18,6 +20,8 @@ inherit autotools python-dir pkgconfig
 
 CACHED_CONFIGUREVARS += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR}/lowpan-tools"
 
+CFLAGS += "-Wno-initializer-overrides"
+
 do_install_append() {
     rmdir ${D}${localstatedir}/run
 }
-- 
2.10.0


