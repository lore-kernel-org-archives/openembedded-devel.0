Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 77F206E268
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 20:03:54 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YgIg7-0001NQ-Ht from Dmitry_Eremin@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2015 13:03:55 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-03.mgc.mentorg.com (137.202.0.108) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 9 Apr 2015 21:03:54 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Apr 2015 23:03:53 +0300
Message-ID: <1428609833-15774-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mozjs: disable methodjit for armv4
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
X-List-Received-Date: Thu, 09 Apr 2015 20:03:55 -0000
Content-Type: text/plain

methodjit uses assembler instructions which are not available on armv4
architecture. Disable methodjit for it.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 91ee9a2..263e940 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -33,6 +33,9 @@ EXTRA_OECONF = " \
     --enable-threadsafe \
     --disable-static \
 "
+EXTRA_OECONF_append_armv4 += " \
+    --disable-methodjit \
+"
 
 # mozjs requires autoreconf 2.13
 do_configure() {
-- 
2.1.4


