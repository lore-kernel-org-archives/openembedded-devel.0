Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00A8860CEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 05:26:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0T5QXQl012891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 21:26:33 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 28 Jan 2014 21:26:32 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jan 2014 13:26:58 +0800
Message-ID: <1390973218-16702-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] quagga: fix a typOS
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
X-List-Received-Date: Wed, 29 Jan 2014 05:26:34 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

it should be CPP, not cpp; this typOS makes vtysh unable to work.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../quagga/files/build-fix-extract.pl-for-cross-compilation.patch    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch b/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch
index e3ccc2a..7e5beef 100644
--- a/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch
+++ b/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch
@@ -22,7 +22,7 @@ index 7612aff..4c3a47f 100755
      $file = $_;
  
 -    open (FH, "cpp -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/isisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
-+    open (FH, "@cpp@ -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/isisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
++    open (FH, "@CPP@ -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/isisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
      local $/; undef $/;
      $line = <FH>;
      close (FH);
-- 
1.7.10.4


