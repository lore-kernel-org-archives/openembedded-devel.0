Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0616E648
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 08:19:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4Q8JwCx024338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 01:19:58 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 26 May 2015 01:19:58 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 May 2015 16:19:50 +0800
Message-ID: <f16af070cdd3fef61dd094c72e244765e194ee43.1432628160.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432628160.git.yi.zhao@windriver.com>
References: <cover.1432628160.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 2/2] acpitests: fix build failure for multilib
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
X-List-Received-Date: Tue, 26 May 2015 08:19:57 -0000
Content-Type: text/plain

bitbake lib32-acpitests
[snip]
| NOTE: make -j 2  -m32 OPT_CFLAGS=-Wall
| make: *** No rule to make target ` -m32'.  Stop.
| ERROR: oe_runmake failed
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/acpica/acpitests_20140828.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
index da26582..1f6f190 100644
--- a/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
+++ b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
@@ -18,7 +18,7 @@ SRC_URI[acpica.sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f
 
 S = "${WORKDIR}/acpitests-unix-${PV}"
 
-EXTRA_OEMAKE = "'${HOST_CC_ARCH}' 'OPT_CFLAGS=-Wall'"
+EXTRA_OEMAKE = "'CC=${TARGET_PREFIX}gcc ${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}' 'OPT_CFLAGS=-Wall'"
 
 # The Makefiles expect a specific layout
 do_compile() {
-- 
1.7.9.5


