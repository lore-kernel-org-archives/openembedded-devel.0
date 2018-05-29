Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E342746F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:08:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4T78m7l021971
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:08:48 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:08:47 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:08:45 +0800
Message-ID: <1527577725-25241-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527234893-8733-3-git-send-email-yi.zhao@windriver.com>
References: <1527234893-8733-3-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 02/12 V2] geoip-perl: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 29 May 2018 07:08:47 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/geoip/geoip-perl_1.50.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
index a8c8bcf..24fb64d 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
@@ -18,6 +18,8 @@ SRC_URI = "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz;downlo
 SRC_URI[md5sum] = "2d7f8b1b54e6ba6d9e3fefce52675815"
 SRC_URI[sha256sum] = "86da0dd67f417a43dc70f15a49bd3619f668970c117b9e7f737b4ab246c240a6"
 
+UPSTREAM_CHECK_URI = "https://github.com/maxmind/geoip-api-perl/tags"
+
 S = "${WORKDIR}/geoip-api-perl-${PV}"
 
 DEPENDS += "geoip"
-- 
2.7.4


