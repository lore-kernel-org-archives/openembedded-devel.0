Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E286871B9E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 09:23:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18639872"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 May 2017 17:23:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7B81147C6770
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 17:23:00 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 9 May 2017 17:23:00 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 May 2017 17:22:51 +0800
Message-ID: <1494321771-7251-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 7B81147C6770.A4FF1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] luajit: 2.0.4 -> 2.0.5
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
X-List-Received-Date: Tue, 09 May 2017 09:23:07 -0000
Content-Type: text/plain

1) Upgrade luajit from 2.0.4 to 2.0.5.
2) License checksum changed,since the copyright years were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/luajit/{luajit_2.0.4.bb => luajit_2.0.5.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/luajit/{luajit_2.0.4.bb => luajit_2.0.5.bb} (92%)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
similarity index 92%
rename from meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
rename to meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index cee9cc4..d7477ed 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Just-In-Time Compiler for Lua"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3992f1fbae3b8b061f9056b7fcda8cc6"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
 HOMEPAGE = "http://luajit.org"
 
 SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
 "
-SRC_URI[md5sum] = "dd9c38307f2223a504cbfb96e477eca0"
-SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746beef1807d"
+SRC_URI[md5sum] = "48353202cbcacab84ee41a5a70ea0a2c"
+SRC_URI[sha256sum] = "874b1f8297c697821f561f9b73b57ffd419ed8f4278c82e05b48806d30c1e979"
 
 S = "${WORKDIR}/LuaJIT-${PV}"
 
-- 
2.7.4




