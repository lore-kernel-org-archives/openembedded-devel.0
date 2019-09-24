Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD297F27B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2019 06:00:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,542,1559491200"; d="scan'208";a="75922103"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Sep 2019 14:00:32 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3BF684CDFCE9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2019 14:00:35 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 24 Sep 2019 14:00:36 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Sep 2019 14:00:30 +0800
Message-ID: <20190924060030.7475-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3BF684CDFCE9.AC56F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] fio: upgrade 3.15 -> 3.16
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
X-List-Received-Date: Tue, 24 Sep 2019 06:00:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-files/0001-engines-splice-remove-buggy-mem_align-set.patch
Removed since this is included in 3.16.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...engines-splice-remove-buggy-mem_align-set.patch | 43 ----------------------
 .../fio/{fio_3.15.bb => fio_3.16.bb}               |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/fio/files/0001-engines-splice-remove-buggy-mem_align-set.patch
 rename meta-oe/recipes-benchmark/fio/{fio_3.15.bb => fio_3.16.bb} (92%)

diff --git a/meta-oe/recipes-benchmark/fio/files/0001-engines-splice-remove-buggy-mem_align-set.patch b/meta-oe/recipes-benchmark/fio/files/0001-engines-splice-remove-buggy-mem_align-set.patch
deleted file mode 100644
index cb18032..0000000
--- a/meta-oe/recipes-benchmark/fio/files/0001-engines-splice-remove-buggy-mem_align-set.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8ca8a05d92fa799fe93a6edc27b058802211fddc Mon Sep 17 00:00:00 2001
-From: Jens Axboe <axboe@kernel.dk>
-Date: Sat, 3 Aug 2019 08:33:24 -0600
-Subject: [PATCH] engines/splice: remove buggy ->mem_align set
-
-Two things wrong here:
-
-1) We align buffers by default, so no need for splice to do anything
-   extra.
-2) ->mem_align is not a true/false setting, it's the alignment itself.
-   Hence the current setting to 1 is just buggy.
-
-Upstream-Status: Backport [https://github.com/axboe/fio/commit/8ca8a05d92fa799fe93a6edc27b058802211fddc]
-
-Fixes: https://github.com/axboe/fio/issues/810
-Reported-by: Sitsofe Wheeler <sitsofe@yahoo.com>
-Signed-off-by: Jens Axboe <axboe@kernel.dk>
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- engines/splice.c | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/engines/splice.c b/engines/splice.c
-index feb764feb2f4..6fc36bb6f154 100644
---- a/engines/splice.c
-+++ b/engines/splice.c
-@@ -278,13 +278,6 @@ static int fio_spliceio_init(struct thread_data *td)
- 	 */
- 	sd->vmsplice_to_user_map = 1;
- 
--	/*
--	 * And if vmsplice_to_user works, we definitely need aligned
--	 * buffers. Just set ->odirect to force that.
--	 */
--	if (td_read(td))
--		td->o.mem_align = 1;
--
- 	td->io_ops_data = sd;
- 	return 0;
- }
--- 
-2.22.0
-
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.15.bb b/meta-oe/recipes-benchmark/fio/fio_3.16.bb
similarity index 92%
rename from meta-oe/recipes-benchmark/fio/fio_3.15.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.16.bb
index df81759..092b2be 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.15.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.16.bb
@@ -21,10 +21,9 @@ PACKAGECONFIG_NUMA_armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "01bf5128d0581e267383f280c6a1dcd26517240f"
+SRCREV = "92f75708b530989fdb13b50be6604f44b80d038d"
 SRC_URI = "git://git.kernel.dk/fio.git \
           file://0001-update-the-interpreter-paths.patch \
-          file://0001-engines-splice-remove-buggy-mem_align-set.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4




