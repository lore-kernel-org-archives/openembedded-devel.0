Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE7376FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2016 04:34:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P4Y8gt026646
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 24 Jul 2016 21:34:08 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 24 Jul 2016 21:34:07 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Jul 2016 00:34:06 -0400
Message-ID: <1469421246-165286-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <20160724120523.mjotstuu5gpnzkvx@jama>
References: <20160724120523.mjotstuu5gpnzkvx@jama>
MIME-Version: 1.0
Subject: [PATCH] x11vnc: fix do_patch failed
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
X-List-Received-Date: Mon, 25 Jul 2016 04:34:11 -0000
Content-Type: text/plain

Since the following commit applied in bitbake:
--------
commit 2afcbfef2cd1ca568e5225884a8021df38ee3db0
Author: Ross Burton <ross.burton@intel.com>
Date:   Thu Jul 14 19:56:22 2016 +0100

    bitbake: build: don't use $B as the default cwd for functions
--------

We need to parse file with absolute path.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 98a0734..b047bc4 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -29,6 +29,6 @@ PACKAGECONFIG[libvncserver] = "--with-system-libvncserver,--without-system-libvn
 
 do_prepare_sources () {
     # Remove old libtool macros from acinclude.m4
-    sed -i -e '/^# libtool.m4/q' acinclude.m4
+    sed -i -e '/^# libtool.m4/q' ${S}/acinclude.m4
 }
 do_patch[postfuncs] += "do_prepare_sources"
-- 
2.8.1


