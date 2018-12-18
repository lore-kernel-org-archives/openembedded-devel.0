Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57A327C03C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 07:40:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBI7e01Z014823
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 23:40:35 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 23:40:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Dec 2018 15:38:42 +0800
Message-ID: <426075779bd78f3533e6f783956eedc66c15feb7.1545037250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1545037250.git.hongxu.jia@windriver.com>
References: <cover.1545037250.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 8/8] efibootmgr: fix conflicting types for 'efi_set_verbose'
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
X-List-Received-Date: Tue, 18 Dec 2018 07:40:55 -0000
Content-Type: text/plain

Since upstream efivar-37 pulibc efi_set_verbose in its
headers [daf3b6c Move verbosity headers to be public],
it is not necessary to delcare in efibootmgr.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb    |  1 +
 .../efibootmgr/files/0001-remove-extra-decl.patch  | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch

diff --git a/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
index 8fdfedb..4edb2e6 100644
--- a/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
+++ b/meta-oe/recipes-bsp/efibootmgr/efibootmgr_17.bb
@@ -12,6 +12,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRCREV = "e067160ecef8208e1944002e5d50b275733211fb"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
+           file://0001-remove-extra-decl.patch \
           "
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch b/meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch
new file mode 100644
index 0000000..42f3a81
--- /dev/null
+++ b/meta-oe/recipes-bsp/efibootmgr/files/0001-remove-extra-decl.patch
@@ -0,0 +1,31 @@
+From 99b578501643377e0b1994b2a068b790d189d5ad Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 13 Jun 2018 09:41:01 -0400
+Subject: [PATCH] remove extra decl
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+
+Upstream-Status: Backport [git://github.com/rhinstaller/efibootmgr.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ src/efibootmgr.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index de38f01..4e1a680 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -1536,9 +1536,6 @@ parse_opts(int argc, char **argv)
+ 					       "invalid numeric value %s\n",
+ 					       optarg);
+ 			}
+-                        /* XXX efivar-36 accidentally doesn't have a public
+-                         * header for this */
+-			extern int efi_set_verbose(int verbosity, FILE *errlog);
+ 			efi_set_verbose(opts.verbose - 2, stderr);
+ 			break;
+ 		case 'V':
+-- 
+2.7.4
+
-- 
2.7.4


