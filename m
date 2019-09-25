Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5E6A7E08D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 14:09:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8PE944G022211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 07:09:04 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 25 Sep 2019 07:09:04 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 10:09:03 -0400
Message-ID: <20190925140903.11670-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] crash: update from 7.2.6 to 7.2.7
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
X-List-Received-Date: Wed, 25 Sep 2019 14:09:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Change log: http://people.redhat.com/anderson/crash.changelog.html

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-kernel/crash/{crash_7.2.6.bb => crash_7.2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/crash/{crash_7.2.6.bb => crash_7.2.7.bb} (98%)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.6.bb b/meta-oe/recipes-kernel/crash/crash_7.2.7.bb
similarity index 98%
rename from meta-oe/recipes-kernel/crash/crash_7.2.6.bb
rename to meta-oe/recipes-kernel/crash/crash_7.2.7.bb
index 770b99ff0..8098d096e 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.6.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.7.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git \
            file://0002-crash-fix-build-error-unknown-type-name-gdb_fpregset.patch \
            file://0003-crash-detect-the-sysroot-s-glibc-header-file.patch \
            "
-SRCREV = "4076ebea6626e3f0a20150602c6ffab999ea5c90"
+SRCREV = "5b0e3777ccbb571678791903e93446ccd0aba03a"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
-- 
2.22.0


