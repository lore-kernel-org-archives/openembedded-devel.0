Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D2AD77E269
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:36:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P9aB6w003410
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:36:11 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:36:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:35:38 +0800
Message-ID: <cfdb034889bee11f146fabf29f2f47e20d5365aa.1569403988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403988.git.liezhi.yang@windriver.com>
References: <cover.1569403988.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] libnet-ssleay-perl: Drop broken native
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
X-List-Received-Date: Wed, 25 Sep 2019 09:36:09 -0000
Content-Type: text/plain

$ bitbake libnet-ssleay-perl-native
ERROR: Nothing RPROVIDES 'libssl-native' (but virtual:native:/path/to/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb RDEPENDS on or otherwise requires it)

It's a broken native recipe which means no ones need it any more, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index dccef16..50ab5af 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -42,8 +42,6 @@ do_install_ptest() {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
-BBCLASSEXTEND = "native"
-
 FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Net/SSLeay/.debug/"
 
 RDEPENDS_${PN}-ptest = " perl"
-- 
2.7.4


