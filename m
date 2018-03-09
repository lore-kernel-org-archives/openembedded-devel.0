Return-Path: <xiao.zhang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF0E7894A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 07:47:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w297lR6K022270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Mar 2018 23:47:42 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 8 Mar 2018 23:46:41 -0800
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Mar 2018 23:46:50 -0800
Message-ID: <20180309074650.5997-3-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180309074650.5997-1-xiao.zhang@windriver.com>
References: <20180309074650.5997-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] libgpg-error: Fix multilib header conflict - pg-error.h and gpgrt.h
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
X-List-Received-Date: Fri, 09 Mar 2018 07:47:51 -0000
Content-Type: text/plain

Header file conflict between 32-bit and 64-bit versions.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.27.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
index b2e2d507c9..b74f079f5d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.27.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "4f93aac6fecb7da2b92871bb9ee33032be6a87b174f54abf8ddf0911a2
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-inherit autotools binconfig-disabled pkgconfig gettext
+inherit autotools binconfig-disabled pkgconfig gettext multilib_header
 CPPFLAGS += "-P"
 do_compile_prepend() {
 	TARGET_FILE=linux-gnu
@@ -53,6 +53,7 @@ do_compile_prepend() {
 do_install_append() {
 	# we don't have common lisp in OE
 	rm -rf "${D}${datadir}/common-lisp/"
+	oe_multilib_header gpg-error.h gpgrt.h
 }
 
 FILES_${PN}-dev += "${bindir}/gpg-error"
-- 
2.11.0


