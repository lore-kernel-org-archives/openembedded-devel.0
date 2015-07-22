Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E87576AC95
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 05:37:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6M5bIrb018172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 22:37:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Tue, 21 Jul 2015 22:37:11 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Jul 2015 13:35:14 +0800
Message-ID: <1437543314-16171-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-ruby][PATCH] ruby: fix install error for multilib
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
X-List-Received-Date: Wed, 22 Jul 2015 05:37:20 -0000
Content-Type: text/plain

When multilib is enabled, it fails to do install with error:

sed: can't read .../image/usr/lib/ruby/*/*/rbconfig.rb: No such file or directory

Replace '/usr/lib' with ${libdir} to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
index 2bf0a00..1076a1c 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
@@ -33,7 +33,7 @@ do_install() {
 
 do_install_append () {
 if [ "${PN}" != "ruby-native" ]; then
-    sed -i "s/sysroot=[0-9a-z\/\-]*/sysroot=\//g" ${D}/usr/lib/ruby/*/*/rbconfig.rb
+    sed -i "s/sysroot=[0-9a-z\/\-]*/sysroot=\//g" ${D}${libdir}/ruby/*/*/rbconfig.rb
 fi
 }
 
-- 
1.9.1


