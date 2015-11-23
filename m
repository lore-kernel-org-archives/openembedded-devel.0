Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 229C5605FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 04:48:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAN4mvTt027726
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 20:48:58 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 22 Nov 2015 20:48:57 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Nov 2015 12:34:12 +0800
Message-ID: <1448253252-7990-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: fix segment fault when stopping ospf6d
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
X-List-Received-Date: Mon, 23 Nov 2015 04:48:59 -0000
Content-Type: text/plain

In ospf6_clean, the variable ospf6 might be NULL causing segment fault
when stopping ospf6d. Check the variable before referencing it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...heck-ospf6-before-using-it-in-ospf6_clean.patch | 28 ++++++++++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.24.1.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch b/meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
new file mode 100644
index 0000000..f08bb57
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+Subject: ospf6d: check ospf6 before using it in ospf6_clean
+
+The ospf6 variable might be 'NULL' causing segment fault error.
+Check it before referencing it.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ ospf6d/ospf6d.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ospf6d/ospf6d.c b/ospf6d/ospf6d.c
+index 3cdd5c1..e3bf1af 100644
+--- a/ospf6d/ospf6d.c
++++ b/ospf6d/ospf6d.c
+@@ -1892,6 +1892,8 @@ ospf6_init (void)
+ void
+ ospf6_clean (void)
+ {
++  if (ospf6 == NULL)
++    return;
+   if (ospf6->route_table)
+     ospf6_route_remove_all (ospf6->route_table);
+   if (ospf6->brouter_table)
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
index 09c4e7d..cecf438 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
@@ -1,6 +1,7 @@
 require quagga.inc
 
 SRC_URI += "file://babel-close-the-stdout-stderr-as-in-other-daemons.patch \
+            file://0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch \
 "
 
 SRC_URI[md5sum] = "7986bdc2fe6027d4c9216f7f5791e718"
-- 
1.9.1


