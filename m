Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8054795AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 09:24:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O9OodT027075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 02:24:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 02:24:50 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Aug 2018 17:24:49 +0800
Message-ID: <1535102689-9093-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lmbench: fix usrmerge install path
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
X-List-Received-Date: Fri, 24 Aug 2018 09:24:49 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update $(base_libdir) to $(baselib) to fix
the below do_install error when usrmerge
enabled in DISTRO_FEATURES.

| if [ ! -d /poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-a9-r2/image/usr/usr/lib64 ]; then mkdir
/poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-a9-r2/image/usr/usr/lib64; fi
| mkdir: cannot create directory /poky-build/tmp-glibc/work/core2-64-wrs-linux/lmbench/3.0-a9-r2/image/usr/usr/lib64 No such file or directory
| Makefile:141: recipe for target 'install-target' failed
| make[1]: *** [install-target] Error 1

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 593b62f..c78e7a8 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -51,8 +51,13 @@ do_compile () {
     install -d ${S}/bin/${TARGET_SYS}
     oe_runmake -C src
 }
+export baselib
 
 do_install () {
+    # fix the lib path when usrmerge enabled
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
+        sed -i -e "s;\$(BASE)\$(base_libdir);\$(BASE)/\$(baselib);g" ${S}/src/Makefile
+    fi
     install -d ${D}${sysconfdir}/default/volatiles \
            ${D}${bindir} ${D}${mandir} ${D}${libdir}/lmbench \
            ${D}${datadir}/lmbench/scripts
-- 
2.7.4


