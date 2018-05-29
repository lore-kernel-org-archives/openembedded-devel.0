Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19390747EB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:19:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4T7IuQd032453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:19:11 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:18:44 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:38 +0800
Message-ID: <1527578277-26494-6-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 05/24] libnet: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 29 May 2018 07:19:20 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
index dfc2049..c991344 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
@@ -15,6 +15,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "f051e6e5bdecddb90f77c701c2ca1804"
 SRC_URI[sha256sum] = "72c380785ad44183005e654b47cc12485ee0228d7fa6b0a87109ff7614be4a63"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libnet-dev/files/"
+UPSTREAM_CHECK_REGEX = "libnet-(?P<pver>\d+(\.\d+)+-*[a-z]*\d*)\.tar"
+
 S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools binconfig
-- 
2.7.4


