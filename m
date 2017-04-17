Return-Path: <Yadi.Hu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89DE460069
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Apr 2017 08:04:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3H84L3t009090
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Apr 2017 01:04:21 -0700 (PDT)
Received: from pek-yhu2-d1.wrs.com (128.224.162.195) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Mon, 17 Apr 2017 01:04:20 -0700
From: Yadi Hu <yadi.hu@windriver.com>
To: <yadi.hu@windriver.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Apr 2017 16:04:10 +0800
Message-ID: <1492416250-15487-2-git-send-email-yadi.hu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492416250-15487-1-git-send-email-yadi.hu@windriver.com>
References: <1492416250-15487-1-git-send-email-yadi.hu@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [PATCH] drbd-utils:add denpendency for perl.
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
X-List-Received-Date: Mon, 17 Apr 2017 08:04:19 -0000
Content-Type: text/plain

From: "Yadi.hu" <yadi.hu@windriver.com>

Perl script drbd-overview fails to run due to perl noexists
under small rootfs,fixing it through adding definitions both
perl-module-strict and perl-module-warnings.

Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
index 1d691cd1f..5aa8a88cd 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.3.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF = " \
                 --with-systemdunitdir=${systemd_unitdir}/system \
                "
 
-RDEPENDS_${PN} += "bash perl"
+RDEPENDS_${PN} += "bash perl perl-module-strict perl-module-warnings"
 
 # The drbd items are explicitly put under /lib when installed.
 #
-- 
2.11.0


