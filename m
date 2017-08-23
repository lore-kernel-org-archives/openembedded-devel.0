Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4601A7831C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 03:01:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7N31UoC016721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Aug 2017 20:01:30 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 20:01:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 23:01:23 -0400
Message-ID: <3c2a15330209056c90ee9439206915a5fe0569c6.1503457180.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503457180.git.hongxu.jia@windriver.com>
References: <cover.1503457180.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] gnulib: upgrade to 2017-08-20.18
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
X-List-Received-Date: Wed, 23 Aug 2017 03:01:30 -0000
Content-Type: text/plain

Get version number by invoking:
...
$ ${S}/build-aux/git-version-gen --version
git-version-gen 2017-08-20.18
...

The gnulib 2017-08-20.18 fixed CVE-2017-7476.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../gnulib/{gnulib_git.bb => gnulib_2017-08-20.18.bb}                | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/gnulib/{gnulib_git.bb => gnulib_2017-08-20.18.bb} (86%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_git.bb b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
similarity index 86%
rename from meta-oe/recipes-support/gnulib/gnulib_git.bb
rename to meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
index c7c7ae8..b505ac1 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_git.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
@@ -10,9 +10,8 @@ HOMEPAGE = "http://www.gnu.org/software/gnulib/"
 SECTION = "devel"
 LICENSE = "LGPLv2+"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e4cf3810f33a067ea7ccd2cd889fed21"
-SRCREV = "b6b3ed1fa4c6de12908a9f01d1689f156c3cd441"
-PV = "0.1.496+git${SRCPV}"
+LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
+SRCREV = "b23000de1e47c7d580e0e220966dd1ee42a5e5bc"
 
 SRC_URI = "git://git.sv.gnu.org/gnulib;protocol=git \
 "
-- 
2.8.1


