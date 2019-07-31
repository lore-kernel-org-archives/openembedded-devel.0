Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 015B67F3EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 07:05:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6V757rD008463
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Jul 2019 00:05:07 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 31 Jul 2019 00:05:07 -0700
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2019 00:05:07 -0700
Message-ID: <20190731070507.113722-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731070103.34814-1-mingli.yu@windriver.com>
References: <20190731070103.34814-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] log4cplus: remove gold linker setting
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
X-List-Received-Date: Wed, 31 Jul 2019 07:05:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After commit[3a7abb175 log4cplus: Fix build with gold linker]
applied, with below logic in conf/local.conf
MACHINE ??= "qemumips64"
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf

There comes below configure error:
 $ bitbake libn32-log4cplus
 | checking for the pthreads library -lpthread... no
 | configure: error: Requested threads support but no threads were found.

Actually the logic[CXXFLAGS += "-fuse-ld=gold"] is not
needed in commit[3a7abb175 log4cplus: Fix build with gold linker],
so remove it to fix the above configure error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
index b396cabf3..566de2853 100644
--- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
+++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
@@ -18,5 +18,3 @@ UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
 inherit autotools pkgconfig
 
 BBCLASSEXTEND = "native"
-
-CXXFLAGS += "-fuse-ld=gold"
-- 
2.21.0


