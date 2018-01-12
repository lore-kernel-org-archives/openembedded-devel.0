Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3DEA78257
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 03:07:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0C37i16015311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:07:45 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 11 Jan 2018 19:07:44 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Jan 2018 10:46:20 +0800
Message-ID: <20180112024620.3804-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] strongswan: add ${PN}-plugin-curve25519 to RDEPENDS
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
X-List-Received-Date: Fri, 12 Jan 2018 03:07:44 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* The default DH group curve25519 depends on
  an optional plugin ${PN}-plugin-curve25519,
  add it to RDEPENDS to avoid below error:

  root@test:~# ipsec up host-lan
  initiating IKE_SA host-lan[1] to 192.168.7.2
  configured DH group CURVE_25519 not supported
  tried to checkin and delete nonexisting IKE_SA
  establishing connection 'host-lan' failed

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
index 3fb56bcfe..97ebcd8a5 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
@@ -123,6 +123,7 @@ RDEPENDS_${PN} += "\
     ${PN}-plugin-x509 \
     ${PN}-plugin-xauth-generic \
     ${PN}-plugin-xcbc \
+    ${PN}-plugin-curve25519 \
     "
 
 RPROVIDES_${PN} += "${PN}-systemd"
-- 
2.13.3


