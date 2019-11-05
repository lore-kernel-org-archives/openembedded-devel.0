Return-Path: <prvs=2054d270f=Richard.Leitner@skidata.com>
X-Greylist: delayed 310 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Nov 2019 08:40:58 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id CD8367E21C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1572943260; x=1604479260;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=rPvcI2ESG0AgjjS8dQ6VAxim57349c4ML3H9lGNGIKM=;
	b=tVmUL+pmcASs0k9YLppP/PnHzRgtkke5lquOrt6I5v7LCcfgBYR7E0mA
	8TuFuPucnq/pGBvv3iZgpgotjWU86md5PovM2oZk6bZhA89cdN1l+a/qu
	3YcFqItnM7ra0sdcfST9VQG5Swk9SY+DPbyrUpmPDG7HBdLx0+4pWlYdS
	7exGLlZDtDCMR+K3T7Ea4Pvq/4l6Azecq/xgVb23hgJDXxKrnnsfNT2Zv
	rPpeJZMCl1kI+bzbZCy0oX4wSbLRe90WGBbtoEScAW5O//hAdz2rz4Zgk
	wERKftMUEfExydsGjcVqGnJM+tvq0yd4SPcUxuGND78YXeYlOMZCabDIl g==;
IronPort-SDR: NROt4ziyhCbLUrwbdjWP36sd1fFDXbwBVTVfx6r76K07/pjdEI3FwzRdDW4ER6J2TaGuawK1A4
	alYrwHwyJyHZx0+Yz6p09CBWu7aFKa3O7/BmrNfQKYGD4d+13y1jnjvLS1fEneX3/bVSK2bFJI
	R4uHkTj5xJ3qq8dyO1DdvzG0JJVyHBkSpvx6jQm1MQPUW42BZ/NV5BPscmfPhSwU5D1KW7Swg+
	MczD+7ZCtSrxjJ2GGJucPKRl8qAt04sM+9YLM+M9Qz1R5frwbo1QGNENDjnLPXmytn5MIbTqDw
	NA8=
X-IronPort-AV: E=Sophos;i="5.68,270,1569276000"; 
   d="scan'208";a="2407077"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Nov 2019 09:40:45 +0100
Message-ID: <20191105084045.20756-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] layer.conf: remove compatibility with thud and warrior
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
X-List-Received-Date: Tue, 05 Nov 2019 08:40:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As we want to start some cleanup work on meta-java stay only compatible
with zeus.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index cdba2cd..9be071d 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "thud warrior zeus"
+LAYERSERIES_COMPAT_meta-java = "zeus"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.21.0


