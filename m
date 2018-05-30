Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF5374BB4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:21:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U6Lr4H003705
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 May 2018 23:21:53 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 23:21:52 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Wed, 30 May 2018 14:20:56 +0800
Message-ID: <1527661260-29811-5-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527661260-29811-1-git-send-email-yi.zhao@windriver.com>
References: <1527661260-29811-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 4/8] strongswan: add UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Wed, 30 May 2018 06:21:52 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
index f2fe1f1..6570dbe 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
@@ -15,6 +15,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "46aa3aa18fbc4bd528f9a0345ce79913"
 SRC_URI[sha256sum] = "e0a60a30ebf3c534c223559e1686497a21ded709a5d605c5123c2f52bcc22e92"
 
+UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
+
 EXTRA_OECONF = " \
         --without-lib-prefix \
 "
-- 
2.7.4


