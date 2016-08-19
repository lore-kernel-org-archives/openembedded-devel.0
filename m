Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1304C7705F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:04:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7JA4WPO024288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 03:04:32 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 19 Aug 2016 03:04:31 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Aug 2016 18:04:17 +0800
Message-ID: <6f2170c4f37eb89ab388b16a96de79d50e13d04b.1471600808.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1471600808.git.yi.zhao@windriver.com>
References: <cover.1471600808.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH 3/3] iscsitarget: fix QA warning for GNU_HASH
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
X-List-Received-Date: Fri, 19 Aug 2016 10:04:32 -0000
Content-Type: text/plain

Split kernel module and user space build. Ensure the LDFLAGS is passed
when build user space code.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 4c5eed6..c60277d 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -26,7 +26,8 @@ do_configure[noexec] = "1"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
 do_compile() {
-    oe_runmake KSRC=${STAGING_KERNEL_DIR} LDFLAGS='' V=1
+    oe_runmake KSRC=${STAGING_KERNEL_DIR} LDFLAGS='' V=1 kernel
+    oe_runmake KSRC=${STAGING_KERNEL_DIR} usr
 }
 
 do_install() {
-- 
2.7.4


