Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 980C278287
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 07:47:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w297lFFK017166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Mar 2018 23:47:15 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 8 Mar 2018 23:46:39 -0800
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Mar 2018 23:46:48 -0800
Message-ID: <20180309074650.5997-1-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/3] valgrind: Fix multilib header conflict - valgrind/config.h
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
X-List-Received-Date: Fri, 09 Mar 2018 07:47:14 -0000
Content-Type: text/plain

Header file conflict between 32-bit and 64-bit versions.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index 5bd315aff0..9390d30444 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -58,7 +58,7 @@ COMPATIBLE_HOST_linux-muslx32 = 'null'
 COMPATIBLE_HOST_mipsarchn32 = 'null'
 COMPATIBLE_HOST_mipsarchr6 = 'null'
 
-inherit autotools ptest
+inherit autotools ptest multilib_header
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS') != '32']}"
@@ -91,6 +91,7 @@ do_configure_prepend () {
 
 do_install_append () {
     install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
+    oe_multilib_header valgrind/config.h
 }
 
 TUNE = "${@strip_mcpu(d)}"
-- 
2.11.0


