Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 376E875960
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 09:06:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5C96Ve4026223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jun 2015 02:06:31 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 12 Jun 2015 02:06:30 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Jun 2015 17:06:25 +0800
Message-ID: <5c3f992e8bae73520debd1b89e910db32b83c9a5.1434099795.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434099795.git.yi.zhao@windriver.com>
References: <cover.1434099795.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 1/1] luajit: pass correct libdir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jun 2015 09:06:31 -0000
Content-Type: text/plain

When build luajit-native:
/buildarea2/build/tmp/sysroots/x86_64-linux/usr ====
| rmdir: failed to remove '/buildarea2/build/tmp/work/x86_64-linux/luajit-native/2.0.3-r0/image/buildarea2/build/tmp/sysroots/x86_64-linux/usr/lib/lua/5.*': No such file or directory
| rmdir: failed to remove '/buildarea2/build/tmp/work/x86_64-linux/luajit-native/2.0.3-r0/image/buildarea2/build/tmp/sysroots/x86_64-linux/usr/lib/lua': No such file or directory
| WARNING: exit code 1 from a shell command.

Use ${baselib} instead of ${base_libdir} for variable MULTILIB in
Makefile. Otherwise the INSTALL_LIB would extend to wrong path.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
index b00138a..925cbcf 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
@@ -17,7 +17,7 @@ BBCLASSEXTEND = "native"
 
 do_configure_prepend() {
     sed -i 's:PREFIX= /usr/local:PREFIX= ${prefix}:g' ${S}/Makefile
-    sed -i 's:MULTILIB= lib:MULTILIB= ${base_libdir}:g' ${S}/Makefile
+    sed -i 's:MULTILIB= lib:MULTILIB= ${baselib}:g' ${S}/Makefile
 }
 
 EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
-- 
1.7.9.5


