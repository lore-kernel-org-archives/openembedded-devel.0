Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 798FB76AC7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2015 05:32:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t865WI1w007016
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 5 Sep 2015 22:32:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sat, 5 Sep 2015 22:32:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 6 Sep 2015 13:27:10 +0800
Message-ID: <1441517230-12899-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] postgresql: set the tclsh as target path
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
X-List-Received-Date: Sun, 06 Sep 2015 05:32:19 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The tclsh path in pltcl_listmod is set to sysroot, which causes pltcl_listmod
to fails to run on target, so fix the path to /usr/bin/tclsh.
    $ pltcl_listmod
    /usr/bin/pltcl_listmod: line 5: /buildarea1/WRLinux70-STD-0825/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tclsh: No such file or directory
    $

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 15fb7c7..2b8db34 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -139,6 +139,7 @@ do_configure() {
 	    -e "/^perl_embed_ldflags/s:${LIBPNA}:${STAGING_LIBDIR}:g" \
 	    -e "/^perl_embed_ldflags/s:${LIBNA}:${STAGING_LIBDIR}:g"  \
 	    -e "/^perl_embed_ldflags/s:${BLIBNA}:${STAGING_BASELIBDIR}:g" \
+	    -e "/^TCLSH/s:=.*:= ${bindir}/tclsh:g" \
 	${B}/src/Makefile.global
 
 	# workaround perl package's libperl.so problem
-- 
1.9.1


