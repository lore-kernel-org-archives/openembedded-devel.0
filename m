Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A074C53210
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 15:42:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.159333.1672155744749185784
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Dec 2022 07:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=p8DR6ToW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=936063681c=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRFOv71023351
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=ly6dt4gVKThGVBJ4Ao7g4K07ZEMvNnNzvpIGPdHtDno=;
 b=p8DR6ToWs0Ik/FCnwIRr7GEkXKZg/RflMnEVaHz2swXS3O59xwoqFjWs6scKDdOlBtBo
 rvdyRHjE75u8YkIxgYDQ/wdJI2miozjrmIEhAqkXtidQTwSNpne7tUSSwiZMkQXKeSKD
 W1P9INIQz1xVe4C7rgZjmk3dR9KTnRnRAdF2tJXskKUqsA4JIWHYNqRVRHTh4xj0EOZK
 wDMbO4qx5+7dgnv8sfNB1wL5/vwPiWGFu2lC4IC3ypGnwGFBXaYYaCsX/93QGcBfNqp+
 lOnwMWe09F314CL8QVgdaLbEBZwCA9faCz+bBypBGD4Mmkln1NbFoybT/WMjTpd9F0XL CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda1skv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 15:42:23 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BRFgMEP029047
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 15:42:23 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda1skt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Dec 2022 15:42:22 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 07:42:22 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 07:42:21 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 3/5] xfce4-wavelan-plugin: 0.6.2 -> 0.6.3
Date: Tue, 27 Dec 2022 23:42:15 +0800
Message-ID: <20221227154217.30842-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221227154217.30842-1-kai.kang@windriver.com>
References: <20221227154217.30842-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hgvbNS5WefxDPFiQ92RQiqU3-b88wEeM
X-Proofpoint-GUID: BPsbl21FFSn7hpzn3NI26YDqoU13E7tw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_11,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=892 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212270128
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 15:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100289

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...e4-wavelan-plugin_0.6.2.bb => xfce4-wavelan-plugin_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.6.2.bb => xfce4-wavelan-plugin_0.6.3.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
rename to meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb
index c52b35d02..530f52425 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.2.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.6.3.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "ea7aa36650c596b1a29567d100776c68ed732aaf0f48c92245c4466058b5481d"
+SRC_URI[sha256sum] = "61c0c2f56cb70872d403b770dd76349df9ff24c0dbe905ee1b4f913c34d8f72b"
-- 
2.34.1


