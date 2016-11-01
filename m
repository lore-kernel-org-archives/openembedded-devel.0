Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB82719C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 09:23:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA19NDSw002939
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 02:23:13 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 1 Nov 2016 02:23:11 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Nov 2016 17:23:00 +0800
Message-ID: <0c6839b0ca2d916bb77f204f69da1ea2d358fae2.1477991825.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477991825.git.yi.zhao@windriver.com>
References: <cover.1477991825.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH 1/6] aoetools: fix QA warning for GNU_HASH
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
X-List-Received-Date: Tue, 01 Nov 2016 09:23:12 -0000
Content-Type: text/plain

Add LDFLAGS variable to Makefile so that extra linker flags can be sent
via this variable.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../aoetools/aoetools/makefile-add-ldflags.patch   | 31 ++++++++++++++++++++++
 .../recipes-support/aoetools/aoetools_36.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools/makefile-add-ldflags.patch

diff --git a/meta-networking/recipes-support/aoetools/aoetools/makefile-add-ldflags.patch b/meta-networking/recipes-support/aoetools/aoetools/makefile-add-ldflags.patch
new file mode 100644
index 0000000..726d8c5
--- /dev/null
+++ b/meta-networking/recipes-support/aoetools/aoetools/makefile-add-ldflags.patch
@@ -0,0 +1,31 @@
+Add LDFLAGS variable to Makefile, make sure the extra linker flags can be passed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/Makefile b/Makefile
+index 0c56ade..79f2e2b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -68,17 +68,17 @@ clean :
+ 	rm -f ${CONF_SCRIPTS} ${AOE_PING_OBJ} ${AOE_CFG_OBJ} ${SANCHECK_OBJ} ${PROGS}
+ 
+ aoeping : ${AOE_PING_OBJ}
+-	${CC} ${CFLAGS} -o $@ ${AOE_PING_OBJ}
++	${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${AOE_PING_OBJ}
+ aoeping.o : aoeping.c dat.h fns.h
+ 	${CC} ${CFLAGS} -o $@ -c $<
+ linux.o : linux.c config.h
+ 	${CC} ${CFLAGS} -o $@ -c $<
+ aoecfg: ${AOE_CFG_OBJ}
+-	${CC} ${CFLAGS} -o $@ ${AOE_CFG_OBJ}
++	${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${AOE_CFG_OBJ}
+ aoecfg.o : aoecfg.c dat.h fns.h
+ 	${CC} ${CFLAGS} -o $@ -c $<
+ aoe-sancheck : ${SANCHECK_OBJ}
+-	-$(CC) $(CFLAGS) -o $@ ${SANCHECK_OBJ} $(SANCHECKLIBS)
++	-$(CC) $(CFLAGS) ${LDFLAGS} -o $@ ${SANCHECK_OBJ} $(SANCHECKLIBS)
+ aoe-sancheck.o : aoe-sancheck.c
+ 	-$(CC) $(CFLAGS) -o $@ -c $<
+ 
diff --git a/meta-networking/recipes-support/aoetools/aoetools_36.bb b/meta-networking/recipes-support/aoetools/aoetools_36.bb
index c382a71..9b73b44 100644
--- a/meta-networking/recipes-support/aoetools/aoetools_36.bb
+++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
@@ -12,6 +12,7 @@ RRECOMMENDS_${PN} = "kernel-module-aoe"
 
 SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz \
            file://aoe-stat-no-bashism.patch \
+           file://makefile-add-ldflags.patch \
         "
 SRC_URI[md5sum] = "bff30daa988a65f69d4448ce4726a6db"
 SRC_URI[sha256sum] = "fb5e2cd0de7644cc1ec04ee3aeb43211cf7445a0c19e13d6b3ed5a8fbdf215ff"
-- 
2.7.4


