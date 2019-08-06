Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 710627F2A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 18:38:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x76Icqtj007958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Aug 2019 11:38:52 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 6 Aug 2019 11:38:51 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Aug 2019 11:38:51 -0700
Message-ID: <20190806183851.159161-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] mozjs: do not expose intl api for mips64
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
X-List-Received-Date: Tue, 06 Aug 2019 18:38:51 -0000
Content-Type: text/plain

Add --with-intl-api=build to configure options.  Otherwise,
JS_Init() will fail.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
index c89aba7..33142d6 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
@@ -55,6 +55,9 @@ EXTRA_OECONF = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold", '--disable-gold', d)} \
 "
 
+# Without this, JS_Init() will fail for mips64.
+EXTRA_OECONF_append_mips64 = " --with-intl-api=build"
+
 EXTRA_OECONF_append_mipsarch = " --disable-ion"
 EXTRA_OECONF_append_riscv64 = " --disable-ion"
 EXTRA_OECONF_append_riscv32 = " --disable-ion"
-- 
2.7.4


