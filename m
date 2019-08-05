Return-Path: <Liwei.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 23FAF7DC1C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 02:38:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x752cKhB013654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Aug 2019 19:38:20 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 4 Aug 2019 19:38:13 -0700
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Sun, 4 Aug 2019 22:36:49 -0400
Message-ID: <20190805023649.52878-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] fio: fix first direct IO errored when ioengine is splice
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
X-List-Received-Date: Mon, 05 Aug 2019 02:38:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

backport an fio upstream patch to fix "first direct IO errored" when
we specify -ioengine=spice

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 ...es-splice-remove-buggy-mem_align-set.patch | 43 +++++++++++++++++++
 meta-oe/recipes-benchmark/fio/fio_3.15.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/fio/files/0001-engines-splice-remove-buggy-mem_align-set.patch

diff --git a/meta-oe/recipes-benchmark/fio/files/0001-engines-splice-remove-buggy-mem_align-set.patch b/meta-oe/recipes-benchmark/fio/files/0001-engines-splice-remove-buggy-mem_align-set.patch
new file mode 100644
index 000000000000..cb18032d2417
--- /dev/null
+++ b/meta-oe/recipes-benchmark/fio/files/0001-engines-splice-remove-buggy-mem_align-set.patch
@@ -0,0 +1,43 @@
+From 8ca8a05d92fa799fe93a6edc27b058802211fddc Mon Sep 17 00:00:00 2001
+From: Jens Axboe <axboe@kernel.dk>
+Date: Sat, 3 Aug 2019 08:33:24 -0600
+Subject: [PATCH] engines/splice: remove buggy ->mem_align set
+
+Two things wrong here:
+
+1) We align buffers by default, so no need for splice to do anything
+   extra.
+2) ->mem_align is not a true/false setting, it's the alignment itself.
+   Hence the current setting to 1 is just buggy.
+
+Upstream-Status: Backport [https://github.com/axboe/fio/commit/8ca8a05d92fa799fe93a6edc27b058802211fddc]
+
+Fixes: https://github.com/axboe/fio/issues/810
+Reported-by: Sitsofe Wheeler <sitsofe@yahoo.com>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ engines/splice.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/engines/splice.c b/engines/splice.c
+index feb764feb2f4..6fc36bb6f154 100644
+--- a/engines/splice.c
++++ b/engines/splice.c
+@@ -278,13 +278,6 @@ static int fio_spliceio_init(struct thread_data *td)
+ 	 */
+ 	sd->vmsplice_to_user_map = 1;
+ 
+-	/*
+-	 * And if vmsplice_to_user works, we definitely need aligned
+-	 * buffers. Just set ->odirect to force that.
+-	 */
+-	if (td_read(td))
+-		td->o.mem_align = 1;
+-
+ 	td->io_ops_data = sd;
+ 	return 0;
+ }
+-- 
+2.22.0
+
diff --git a/meta-oe/recipes-benchmark/fio/fio_3.15.bb b/meta-oe/recipes-benchmark/fio/fio_3.15.bb
index c44075cdbe4e..f91a7f81d634 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.15.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.15.bb
@@ -25,6 +25,7 @@ PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 SRCREV = "01bf5128d0581e267383f280c6a1dcd26517240f"
 SRC_URI = "git://git.kernel.dk/fio.git \
           file://0001-update-the-interpreter-paths.patch \
+          file://0001-engines-splice-remove-buggy-mem_align-set.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.22.0


