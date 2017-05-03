Return-Path: <Yadi.Hu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 06E4771D7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 May 2017 03:26:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v433QCki014805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 May 2017 20:26:12 -0700 (PDT)
Received: from pek-yhu2-d1.wrs.com (128.224.162.195) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Tue, 2 May 2017 20:26:11 -0700
From: Yadi Hu <yadi.hu@windriver.com>
To: <yadi.hu@windriver.com>, <openembedded-devel@lists.openembedded.org>,
	<martin.jansa@gmail.com>
Date: Wed, 3 May 2017 11:25:59 +0800
Message-ID: <1493781959-31023-2-git-send-email-yadi.hu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493781959-31023-1-git-send-email-yadi.hu@windriver.com>
References: <1493781959-31023-1-git-send-email-yadi.hu@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Cc: marius.tiplea@windriver.com
Subject: [PATCH] drbd-utils: fix dependency for perl under small-fs
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
X-List-Received-Date: Wed, 03 May 2017 03:26:12 -0000
Content-Type: text/plain

From: "Yadi.hu" <yadi.hu@windriver.com>

Perl script drbd-overview fails to run due to some of
perl's lib noexists under small rootfs,fixing it through
adding explicit definitions

Signed-off-by: Marius Tiplea <marius.tiplea@windriver.com>
Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
index 3d6f5b262..67ed8e5c0 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF = " \
                 --without-manual\
                "
 
-RDEPENDS_${PN} += "bash perl"
+RDEPENDS_${PN} += "bash perl-module-getopt-long perl-module-exporter perl-module-constant perl-module-overloading perl-module-exporter-heavy"
 
 # The drbd items are explicitly put under /lib when installed.
 #
-- 
2.11.0


