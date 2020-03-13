Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9994B60C70
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 10:16:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02DAGpR9027265
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 03:16:51 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 13 Mar 2020 03:16:32 -0700
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Mar 2020 18:16:29 +0800
Message-ID: <20200313101629.18495-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] fio: disable compiler optimizations for x86 arch
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
X-List-Received-Date: Fri, 13 Mar 2020 10:16:50 -0000
Content-Type: text/plain

with compiler optimizations enabled, "fio --help" will failed with
"Illegal instruction" on Intel Denverton board.
Enable it on condition that MACHINE_FEATURES include x86.

Related commits:
https://git.openembedded.org/meta-openembedded/commit/?id=c58d9d500f90246d2d879e720fdfa5bbbc731c7f
https://git.openembedded.org/meta-openembedded/commit/?id=739349da0826221f98648b64b693f9ae33e7d4ea

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.17.bb b/meta-oe/recipes-benchmark/fio/fio_3.17.bb
index b65ab19a3efe..759d1087c055 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.17.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.17.bb
@@ -34,6 +34,7 @@ S = "${WORKDIR}/git"
 DISABLE_STATIC = ""
 
 EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}'"
+EXTRA_OECONF = "${@bb.utils.contains('MACHINE_FEATURES', 'x86', '--disable-optimizations', '', d)}"
 
 do_configure() {
     ./configure ${EXTRA_OECONF}
-- 
2.17.1


