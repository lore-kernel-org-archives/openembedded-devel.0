Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F57C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 06:33:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16908.1706078019313849730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jan 2024 22:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MTDczbMb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17535b5328=li.wang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O4mtrO019951
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 22:33:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=dM7BA
	GRWDlot5WoSuFANjh9VQCkQ3EQPCG7wpR1bEWE=; b=MTDczbMbDAtKbUK2bj5bU
	1iyHsbWbmuHqloKXh5CN3/uCraFW+Lp14R1DY5E5Wv5e8M8IAYObNB0aEjqW1Oz6
	ZaUUSwqNpXm9+zltSWN85vDUXhhtISnZQSmJLaSXmNrcK+qo3ZKU2CT0bVv6nlWv
	pkJHv5C7SaKA+xkOoWqht2a/er3Ex2SCic457xuQc3hQ7odDxqjWiRYiask2CZ1q
	9mb8G9Xs0RC3DIgPs0c14NHADZlC6iR54wPgAKz9yNPXGRG1GBfvNOCyluHCXbUD
	9n/1Btr+CK64uMIMPpBjRW6pAxxKCiyrz3fZ+h4U0+fiHR92rULKbZcEWLdLGex2
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmfhgdgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 22:33:38 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 22:33:43 -0800
Received: from pek-lwang1-d1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 22:33:43 -0800
From: Li Wang <li.wang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] radvd: add '--shell /sbin/nologin' to /etc/passwd
Date: Wed, 24 Jan 2024 14:30:32 +0800
Message-ID: <20240124063032.3464741-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cb6dYQ7UDKAWEdj2CttRp6SESvh61Jcz
X-Proofpoint-GUID: cb6dYQ7UDKAWEdj2CttRp6SESvh61Jcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_02,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=831
 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 06:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108444

the default setting USERADD_PARAM of yocto:
-s /bin/sh

follow redhat policy:
radvd/redhat/systemd/radvd.spec
  useradd ... -s /sbin/nologin ...

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta-networking/recipes-daemons/radvd/radvd_2.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
index 36c921a16..a9b5f7942 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
@@ -62,7 +62,7 @@ do_install:append () {
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "--system nogroup"
-USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
+USERADD_PARAM:${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup --shell /sbin/nologin radvd"
 
 pkg_postinst:${PN} () {
     if [ -z "$D" -a -x /etc/init.d/populate-volatile.sh ]; then
-- 
2.25.1


