Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8357460167
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 05:35:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99281917"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2015 13:39:02 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t755Xd7e001464
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Aug 2015 13:33:39 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 5 Aug 2015 13:35:32 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Aug 2015 13:35:26 +0800
Message-ID: <1438752926-1920-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] luajit: upgrade 2.0.3 -> 2.0.4
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
X-List-Received-Date: Wed, 05 Aug 2015 05:35:40 -0000
Content-Type: text/plain

License COPYRIGHT year changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/luajit/{luajit_2.0.3.bb => luajit_2.0.4.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.3.bb => luajit_2.0.4.bb} (87%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
similarity index 87%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
rename to meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index 925cbcf..4a15a4e 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=97b6446bbf9d55616838f821585c5978"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3992f1fbae3b8b061f9056b7fcda8cc6"
 HOMEPAGE = "http://luajit.org"
 
 SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
 "
-SRC_URI[md5sum] = "f14e9104be513913810cd59c8c658dc0"
-SRC_URI[sha256sum] = "55be6cb2d101ed38acca32c5b1f99ae345904b365b642203194c585d27bebd79"
+SRC_URI[md5sum] = "dd9c38307f2223a504cbfb96e477eca0"
+SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746beef1807d"
 
 S = "${WORKDIR}/LuaJIT-${PV}"
 
-- 
1.8.4.2


