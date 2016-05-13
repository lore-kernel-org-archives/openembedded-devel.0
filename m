Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB6176FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 02:56:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4D2uU7m029864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 19:56:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 May 2016 19:56:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 May 2016 19:56:29 -0700
Message-ID: <1463108189-37514-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] rrdtool: only unset PERLHOSTLIB in do_configure
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
X-List-Received-Date: Fri, 13 May 2016 02:56:32 -0000
Content-Type: text/plain

The do_compile requires it, otherwise it can't find the native module
correctly when perl-native is mirrored from another build.

Fixed:
| Compilation failed in require.
| BEGIN failed--compilation aborted.
| Can't locate loadable object for module File::Glob in @INC

(LOCAL REV: NOT UPSTREAM -- sent to oe on 20160512)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 216aafc..73a5d0e 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -58,9 +58,9 @@ export STAGING_INCDIR
 # emulate cpan_do_configure
 EXTRA_OEMAKE = ' PERL5LIB="${PERL_ARCHLIB}" '
 # Avoid do_configure error on some hosts
-export PERLHOSTLIB = ""
 
 do_configure() {
+    unset PERLHOSTLIB
     #fix the pkglib problem with newer automake
     #perl
     sed -i -e "s|-Wl,--rpath -Wl,\$rp||g" \
-- 
2.8.0


