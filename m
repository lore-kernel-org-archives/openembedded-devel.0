Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web08.11484.1630287152565018175
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Aug 2021 18:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GdkT8h+w;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630287150; i=@fujitsu.com;
	bh=0RXYFkFp83jA/Wgfc+/WdNa4y3RLZuqB8ukh9kBwhf4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GdkT8h+wwytz/gmYQlRG1I4rfNEfU9HtwY9ayUv9BP4opyHUrKgbmmhbXOd1VXW0G
	 HOqj00HF2GynEjbklh4fjv67xteHaSZgtIJ0V22c/kxF5RqdsgWKfNa4/9fmuuEdhx
	 tjxm55zvMixor+QUb1kVfPkkTCdFz2GoHp0gkMSPA/LINCa/wQRYsB90I8DITBit4w
	 cJzy7jgfv5wq8Qys2DSTa4AnaZgyKyzvWHIUCKfdLSP3S2MiYCZVFUJ+v+bage5lQx
	 PlA6yezM+0iONApsWL2eeTU6szlNVnfePwTxwwtzE4HbuMmQtzCsUKv6kkt707BYLj
	 xRkx5dPRrHvcA==
Received: from [100.112.192.29] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id BC/5E-28260-D253C216; Mon, 30 Aug 2021 01:32:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVVfXVCf
  R4MMuRouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePb3ZusBet5Kq5P38DewDiJu4uRi0NIYDaT
  xJuVF5khnBOMEtfW3mTrYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFnCX2DZpFpjNIqAq8Xz7c
  nYQmxckvmcVmC0hoCAx5eF7Zoi4oMTJmU/A5jALSEgcfPGCGaJGUWL7zjMsEHaFxOvDl5gnMP
  LMQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaWprpGhqZ6iVW6iXqppbrlqcUluoZ
  6ieXFesWVuck5KXp5qSWbGIGBlFJw+PoOxluvP+gdYpTkYFIS5fV9rpUoxJeUn1KZkVicEV9U
  mpNafIhRhoNDSYJX3UAnUUiwKDU9tSItMwcY1DBpCQ4eJRHe1UZAad7igsTc4sx0iNQpRl2Oz
  XOXLmIWYsnLz0uVEue9ZQxUJABSlFGaBzcCFmGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKg
  nzWoFM4cnMK4Hb9AroCCagI5yYNUGOKElESEk1MEmunSYRsbbX9c9BS9te4fOn7d+vOH23YGv
  B3jg2d4Frt5frPLae8eDhK2H2xQ8N2mLdlS90zdpiJ52d9/dVrNeTkzL7108LVHqx7tEs5lU3
  XpSuDjRsyVRmevxjS8v2Pce1TO672PJMdQ97m6787KXh0cT5qTZHDa88FWEobWn0/PLSy3rbp
  zpLtctmJonT6ya+ffX0r1bTblbB8Nke5wP32z368sLNeW5x4IJVsnd9rNN23AsyEEpRm+8nvt
  Q22OVJpeLBn17+T+/vOGS3S8he6bFmnIBHmJ7ooferhHPXeUTx/phekyZVdTffTDAiJt4vvFC
  ek3+v+pRoJekrLv5WTmWJaQ1c9T0vGPkfK7EUZyQaajEXFScCABm31vcrAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-267.messagelabs.com!1630287148!302470!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4640 invoked from network); 30 Aug 2021 01:32:28 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Aug 2021 01:32:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17U1WKKu014883
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Aug 2021 02:32:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 30 Aug 2021 02:32:18 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 35.0 -> 36.0
Date: Mon, 30 Aug 2021 09:32:12 +0800
Message-ID: <1630287132-58438-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Changes:
d7a9dde Merge pull request from yishaih/mlx5_misc
3133cf5 Merge pull request from yishaih/mlx5_dr
47c0f43 tests: Add raw wqe test
5af61e8 pyverbs: Added mlx5dv_wr_raw_wqe wrapper
b0e2dca pyverbs: Add mlx5_wqe_ctrl_seg, mlx5_wqe_data_seg wrapper
8ff1c5c mlx5: Introduce mlx5dv_wr_raw_wqe builder
2d15a14 Merge pull request from yishaih/mlx5_cq
0c40d53 mlx5: Avoid translation from free running to real time
95d660b Update kernel headers
a66e2a5 Merge pull request from rpearsonhpe/mw

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../rdma-core/{rdma-core_35.0.bb => rdma-core_36.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_35.0.bb => rdma-core_36.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_35.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_35.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
index dcdfb5bd40..097144d356 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_35.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_36.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git"
-SRCREV = "e29a698e99028e9a092bb00c03ee4bfa31ae0cf3"
+SRCREV = "d7a9dde2b164a1563c7a51e4ade8ea3b6cdea9ef"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1

