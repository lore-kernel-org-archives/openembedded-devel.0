Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA4477811
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 07:03:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7M73cpa007729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 00:03:40 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 22 Aug 2017 00:03:38 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 15:02:58 +0800
Message-ID: <20170822070258.27716-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mozjs: customize HOST_CFLAGS
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
X-List-Received-Date: Tue, 22 Aug 2017 07:03:39 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Customize HOST_CFLAGS, HOST_CXXFLAGS and HOST_LDFLAGS
to fix do_configure error as previously use the common
CFLAGS and CXXFLAGS in both cross-compile env and host env,
and the option -fstack-protector-strong which not
recognized in host env can result in do_configure
error as below.

| checking whether the host c compiler (gcc -O2 -pipe -g -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now) works... configure: error: installation or configuration problem: host compiler gcc cannot create executables.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index b6744395f..b72ee7bb3 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -51,6 +51,9 @@ PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${ST
 
 # mozjs requires autoreconf 2.13
 do_configure() {
+    export HOST_CFLAGS="${BUILD_CFLAGS}"
+    export HOST_CXXFLAGS="${BUILD_CPPFLAGS}"
+    export HOST_LDFLAGS="${BUILD_LDFLAGS}"
     ( cd ${S}
       gnu-configize --force
       mv config.guess config.sub build/autoconf )
-- 
2.11.0


