Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFBEA7713F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 05:58:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0Q5wnK3019625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2016 21:58:49 -0800 (PST)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 25 Jan 2016 21:58:48 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jan 2016 13:58:26 +0800
Message-ID: <1453787906-16552-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] cacao: remove invalid configure options
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
X-List-Received-Date: Tue, 26 Jan 2016 05:58:52 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

These configure options are invalid:
--with-classpath-libdir
--with-classpath-classes
--with-classpath-includedir

They had been replaced by:
--with-java-runtime-library-libdir
--with-java-runtime-library-classes
--with-jni_h and --with-jni_md_h

Remove them to avoid QA Issue:
WARNING: QA Issue: cacao-native: configure was passed unrecognised
options: --with-classpath-libdir --with-classpath-includedir
--with-classpath-classes [unknown-configure-option]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/cacao/cacao_1.6.1.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 8e212af..83f216c 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -25,10 +25,6 @@ EXTRA_OECONF_class-native = "\
     --with-vm-zip=${datadir}/cacao/vm.zip \
     --disable-libjvm \
     \
-    --with-classpath-libdir=${libdir_jni}:${libdir} \
-    --with-classpath-includedir=${includedir}/classpath \
-    --with-classpath-classes=${datadir}/classpath/glibj.zip \
-    \
     --with-java-runtime-library-classes=${datadir}/classpath/glibj.zip \
     --with-java-runtime-library-libdir=${libdir_jni}:${libdir} \
     --with-jni_md_h=${includedir}/classpath \
-- 
2.3.5


