Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8A90C60088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 15:58:49 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f206so41186180wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 07:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X59pXle6BSlxZJm4ykG5pmnPlWGqEGb4bUvjzBjPQCs=;
	b=YTkvbVTFV0ryH++HPLvG0IgrvYWZ1uF8d+V7UpgluoDTgb6QnMKoKS0sG8ukp3jCpH
	KM2ods8F8L6Mr8aOVn0MAycnHs9KesHMB9bciZ4fk0i2w10JPrwNlIi+j4IvpCn3UJCd
	Y/cGWJGZrD2JdGgkXAVB2zYlQNb2cLkqspxEDFWLUI8pe7bjxkQjbB8i4aVN5Zk8C2pH
	28naGFsoWuPb471NZ7K3Bht5yhCG0Zc/ZY3J/4tNKKDYqRyOO8pIR2pAmygzQLtO1ivK
	pLh2zkYTVK5CjANuCNa6c3d6kJ9/qZO1KFg7Z8D2ICXgILcfwgi6fWjg6HvuL32uGfe5
	OkGQ==
X-Received: by 10.28.223.67 with SMTP id w64mr23405060wmg.28.1451491129924;
	Wed, 30 Dec 2015 07:58:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q6sm66059670wjx.28.2015.12.30.07.58.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 07:58:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 17:02:23 +0100
Message-Id: <1451491343-27865-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][jethro[master]][meta-networking] netmap-modules: fix build with kernel < 3.17
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
X-List-Received-Date: Wed, 30 Dec 2015 15:58:51 -0000

* define NETMAP_LINUX_ALLOC_NETDEV_4ARGS only when MACHINE is using kernel
  3.17 or newer

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 6e6f02c..31fedbb 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -61,7 +61,6 @@ do_configure_append () {
 #define NETMAP_LINUX_HAVE_PHYS_ADDR_T
 #define NETMAP_LINUX_HAVE_ACCESS_ONCE
 #define NETMAP_LINUX_HAVE_NETDEV_OPS
-#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
 #define NETMAP_LINUX_HAVE_INIT_NET
 #define NETMAP_LINUX_HAVE_LIVE_ADDR_CHANGE
 #define NETMAP_LINUX_HAVE_TX_SKB_SHARING
@@ -75,6 +74,13 @@ do_configure_append () {
 #define NETMAP_LINUX_HAVE_E1000E_EXT_RXDESC
 #define NETMAP_LINUX_HAVE_E1000E_DOWN2
 EOF
+
+if ${@ 'true' if (bb.utils.vercmp_string(d.getVar('KERNEL_VERSION', True), '3.17') < 0) else 'false' } ; then
+    echo OK
+    cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
+#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
+EOF
+fi
 }
 
 do_compile () {
-- 
2.6.4


