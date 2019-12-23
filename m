Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7CA7F6B5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 06:43:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBN6gmAa002134
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Dec 2019 22:42:59 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 22 Dec 2019 22:42:38 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Dec 2019 14:42:37 +0800
Message-ID: <1577083357-110480-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libhugetlbfs: update patch to make it work for python3
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
X-List-Received-Date: Mon, 23 Dec 2019 06:43:08 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Fix error:
TypeError: a bytes-like object is required, not 'str'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
index 34a6220..83934ab 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
@@ -12,6 +12,9 @@ Signed-off-by: Ting Liu <b28495@freescale.com>
 
 Update for 2.22.
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+
+Update to work for python3
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  tests/run_tests.py | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)
@@ -36,7 +39,7 @@ index 018264d..0aabcd1 100755
 +        return sizes
 +    except OSError:
 +        return sizes
-+    out = p.stdout.read().strip()
++    out = p.stdout.read().decode().strip()
 +
      if rc != 0 or out == "":
          return sizes
-- 
2.7.4


