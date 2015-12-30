Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 85E6F60088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 16:00:49 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f206so41240184wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X4QS3Zn3pipbu/kdVeSIx5BL5whoV8zlk/9gxwuH7LA=;
	b=SHxR8/nqzecTGEcbmmPX8WtwAHca6niMZNbK8PbFXXDcJROAyyuNfPukj68t/CExCs
	fbCZmAFVsw7nDtpwNSmxJg2m9YjTEbDkbu8bt9dlqaxokHpFW+SNbBxlhIDmVWpO6eJp
	3rr+EG4OXems6VYvs4jLVKEaNsljDvUd5/fylQnyLN8+pHhxRHF+T6yxXSVP8i24SAvD
	i+IyVRe36efoH7m12jqG9ZWIZkKr6QFeuDis/qGgQwj7dr/A8mqZQhk0X3QmMHuP/L1V
	WWX+m4itJQTm3HC1/gc1YfasAE6QLEpKkqeP7MV70bjpPtB5O1WH2hSCgmOVbXPLWrVa
	ADYQ==
X-Received: by 10.28.138.6 with SMTP id m6mr73378578wmd.82.1451491250311;
	Wed, 30 Dec 2015 08:00:50 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n129sm57818797wmb.1.2015.12.30.08.00.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 08:00:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 17:04:23 +0100
Message-Id: <1451491463-27931-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCHv2][jethro[master]][meta-networking] netmap-modules: fix build with kernel < 3.17
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
X-List-Received-Date: Wed, 30 Dec 2015 16:00:52 -0000

* define NETMAP_LINUX_ALLOC_NETDEV_4ARGS only when MACHINE is using kernel
  3.17 or newer

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 6e6f02c..51e7cce 100644
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
+if ${@ 'false' if (bb.utils.vercmp_string(d.getVar('KERNEL_VERSION', True), '3.17') < 0) else 'true' } ; then
+    echo OK
+    cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
+#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
+EOF
+fi
 }
 
 do_compile () {
-- 
2.6.4


