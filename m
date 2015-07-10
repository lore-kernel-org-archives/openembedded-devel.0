Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43DBC6AC3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:44:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A9i3wl009283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jul 2015 02:44:03 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 10 Jul 2015 02:44:02 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 10 Jul 2015 17:45:59 +0800
Message-ID: <1436521559-10612-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [oe-core][PATCH] libtool: remove the hostname on which libtool was build
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
X-List-Received-Date: Fri, 10 Jul 2015 09:44:03 -0000
Content-Type: text/plain

Upstream-Status: pending

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-devtools/libtool/libtool_2.4.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index 45f1b2f..65972b0 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -15,6 +15,7 @@ do_install_append () {
             -e 's@^\(compiler_lib_search_path="\).*@\1${libdir} ${base_libdir}"@' \
             -e 's@^\(predep_objects="\).*@\1"@' \
             -e 's@^\(postdep_objects="\).*@\1"@' \
+            -e 's/configured on host.*/configured on buildserver/' \
             -i ${D}${bindir}/libtool
 }
 
-- 
1.8.5.2.233.g932f7e4


