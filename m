Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E62C47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 06:26:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8551.1706509597955765424
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jan 2024 22:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dJXSPtRx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=27589f0060=li.wang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T5IXZg013773
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 06:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=IlRw9
	g19LG+2eh8YVfQQUL+Ml80qmE51dpRdTb5jlpc=; b=dJXSPtRx+pUPNYPFVLQkU
	N3rH/f4gyera0s1GlaTsJSjvEO0knc/6BLbKiYzS1NlqkZQgsogq6N5OUdKlmF5R
	XVgPrOr21FdDetdf1CkgFsl+TWKtHT+v23PwrViRNP44ko0Ljhncof8ZRdBy3WEa
	xy8XHSK2+OAu4e8D0+7P3eOGW3VXJCFUAa1zStA9dppDV8hVs3HBqgg6nfqT/HAT
	5fSB1nxLaHkFsBL4wu/rBBDZlhB/a4xGWxsSFmGDVHaqpI97ouus2Kq4/Z3jhYFu
	sWofJdWZcQPyVfAwZy88M0cNed1dX+xq2gBjAvr1+HjqSk9ooEKR29YTIKXQV431
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vvq1y9kv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 06:26:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Jan 2024 22:27:11 -0800
Received: from pek-lwang1-d1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 28 Jan 2024 22:27:11 -0800
From: Li Wang <li.wang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][kirkstone][PATCH] radvd: add '--shell /sbin/nologin' to /etc/passwd
Date: Mon, 29 Jan 2024 14:23:28 +0800
Message-ID: <20240129062328.1689458-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Lk2MN5Sgv4awkbe30-_CkfNgEFM8qPsT
X-Proofpoint-ORIG-GUID: Lk2MN5Sgv4awkbe30-_CkfNgEFM8qPsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_02,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 mlxlogscore=911 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jan 2024 06:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108480

the default setting USERADD_PARAM of yocto:
-s /bin/sh

follow redhat policy:
radvd/redhat/systemd/radvd.spec
  useradd ... -s /sbin/nologin ...

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/radvd/radvd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 219d88f49..5da31b3f0 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -59,7 +59,7 @@ do_install:append () {
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "--system nogroup"
-USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
+USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup --shell /sbin/nologin radvd"
 
 pkg_postinst:${PN} () {
     if [ -z "$D" -a -x /etc/init.d/populate-volatile.sh ]; then
-- 
2.25.1


