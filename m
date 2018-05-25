Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B88E974A01
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:55:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P7tbnY023726
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 00:55:37 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 25 May 2018 00:55:36 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 25 May 2018 15:54:44 +0800
Message-ID: <1527234893-8733-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
References: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 03/12] ipvsadm: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Fri, 25 May 2018 07:55:36 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
index b35a9f4..2ac2b48 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
@@ -26,6 +26,8 @@ SRC_URI = "http://www.linuxvirtualserver.org/software/kernel-2.6/${BP}.tar.gz \
 SRC_URI[md5sum] = "eac3ba3f62cd4dea2da353aeddd353a8"
 SRC_URI[sha256sum] = "6d6c46fecb1c532a892616b4445c73b71730e8790d5630f60269fd9cbee0eb2d"
 
+UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/ipvsadm"
+
 do_compile() {
     oe_runmake \
     CC="${CC} -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3 -L${STAGING_LIBDIR}" \
-- 
2.7.4


