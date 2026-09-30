Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6771ECA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:35:24 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14983.1790778915141038623
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PBbWzPeC;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=kbkAmVbh;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Fdn3333225
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dq4DKKkbMcRoMMU5EhyGiPa3FPCCy8cNrEfSKJjYI
	Xk=; b=PBbWzPeC2yClpn7wDKUPEcvDXSes7q3yIb/NObPNKN9YX8GxC1eVMpMiL
	jzfLskJNlXbBeHPDejplXmw0csXY7EH8M1RqrZBwUvboMNLKYIruzoHULRxB5Z9/
	c83VBRLBd+shnb2HTQQNNZybryyIaJGOVD/ipAQxhV5rqxIfqkgXSKj0FFUrzpoK
	D5KEKW0q1Uz1IydsxFPl9rkq5NCBC3on/GdRy+zRgS/dZSXMKccNZGfP6N8bSyvd
	QtrkMeHeizW5Wd/c8JN/WlOq9tQeioIMrm100DLSDe+aUkkqwTLhW6wNG7F4BfmW
	KnB2lAs1Ap0ofnmeXAEHjPI4ScbeA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1sbfj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EP+O+uiF8KskRTooJG9Ui66dzpJsf96Kj1XBNnycz6b07hbcn5UDXZ//OloU+nBsShktKwBsw1chpUWjLwl02XpynpFuoUQpWAuAEGjcTn+nL/XS7d6AfquxgFLrHST19RqY9pcTlXjF+aBnucaaIBu3PEu39fQ5IKp6EZFBWbyZiS6nK84CE4X4iliY18N3X/wAwaZ4vZUu0YK5Pe90tAuJXCBVzEkSOrqEnBPx4iQGxSv7IdyJakf+1u7azYw47w+FWQmG04zTqZbtJs/nmIFyj4S3jXrh7S55D7VwbSeKvOXWSrMgzcmbi1dTr8CrPpLBJSJpRoPe3kuG44LnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq4DKKkbMcRoMMU5EhyGiPa3FPCCy8cNrEfSKJjYIXk=;
 b=keu5LNUv+W7nQCUa+vhorQavVGNAV9QSw7C24VEdkN+JoqxHFQepdGa1vyim1sNJmG37WGsq7wdQM8UjDxzjXGmarnidPbjhOSiY9qrjhyac9rJtKZLZKvNjmikzMh9LMDKv1VF1F5+9Leb6l45V7ykJgi1INhc5266agtFJC6gk20k1IRaDfRbRaCstPBUhNgUNyhUoup2ael3vf6fsG10jd//zzbT176rL8GM3TFC6Dz2lpEi6Gpa3HmBaj0/BdBzW+HQjJ3vvFPxbEiF2NbJMy3sLgX8eb1RlP3BjQVelgeoMqVR153CsuMi6xn3wB1uZtJNt0orCOY9LmMnaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq4DKKkbMcRoMMU5EhyGiPa3FPCCy8cNrEfSKJjYIXk=;
 b=kbkAmVbhhJy25nbbmeF5o4+RqNeMl/+C98bZZa9MBrnmubcNwA/ck4B730OcSfOC+f2USjzm95hE8ffrhsEcBYLh0MfqL9wFeSAMq9ekFVCDM7AUWD5iUUYKExfvPJPUiL+NV7XUpn/VgfS7ALdn0vvtovHx9/3Mwr+QGzJhwsE=
Received: from CH2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:610:50::30)
 by PH0PR10MB4760.namprd10.prod.outlook.com (2603:10b6:510:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Wed, 30 Sep
 2026 14:35:12 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::4b) by CH2PR16CA0020.outlook.office365.com
 (2603:10b6:610:50::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 14:35:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:35:12 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:34:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEYvTo049310
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:34:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xBvOb-00000000jjj-0xrM
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2026 09:34:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 1/4] ulogd2: Move protocol=https into SRC_URI
Date: Wed, 30 Sep 2026 09:34:54 -0500
Message-ID: <20260930143457.175793-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930143457.175793-1-reatmon@ti.com>
References: <20260930143457.175793-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH0PR10MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: e81dc445-e64e-4d20-bca1-08df1f00094a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|22082099003|18002099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	otOw4GPI4iDmLIQ/z6UUVqKho12yGDh9wmwY9vJBhK4QqxR2269WLayppXkkjI/mPehckq/OSSAbgikvlmXybII3ucd1z7wK5pgZOswEAkyBkKg6fN9yMX90EtMA9EHpslscXFpERFWNLeobBTPtQptesjZcZIYNVzOZ1YXXNKYCDsGS+kXl0XBK2lrNWw+kPjOEN/eOTGKcHVUO4CuS12FmGg5EgJJ6YhXIuTAdNvz82ngIbzZokZRv6CoADEZsIWNNjk9rdKK5I6rvc8w5QxNWzbSh4SDvOLRsAsufAYL7zNpINZI80Q/0W0WzJnd/p/tB0dXfSDlOxYSI26lHV8sfUDGjmOJNOubM1laESRcc+Iuja+T9gTFZ/3tmkmJA0rymxPjDf1TH9kdEAMaSbcbuz6kf6zOpdMhw0bk2tMpGsHhVie7OiGvFcFoV45UUch8AvZuXt4S/ZdY5lJNf4EltNuf1Sx/Imv1eUhLjnoFylwbCWPWhjNazma6X0lFceVnojYOhd3OZXqH9C27ngldtmduxSqbbhicksWfAl37+IXpc9p4UuWfoVjS8lx8EV6b73SZCjCcbykjCH8xc7VnMt1ER6IFF9Dsied5U+6kPAXs5p0gPEpWrW1VFU7lHTyU0j6TRLL4WERqeYsOGBQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	efYgxSkAgEJnI4ORNeBx5iQwF2pQO7TTyu1728IzuLP8L46mzdF4H9WTxVuVs4NFkO6VDemXvP0lRReUUxHmrgIvvJCu3ZHmnmusuIghahqFSHpSHGy2ic3/XCnjUGh8r/c3xBFEYtOg7qvEkZi9/biJysoFDWjH+N0vdXamCS4ASTdiNKIr1oI/QNonX7vxcUiXF7bYfYvMZgDc+CaE02OtitFC1ml371Sx77fdZenYa2ZtublZc+W287ndMyVAHRn12w4nFJE0Vf4ubiOnSjkJpfzoRl6+J22A8MiWKPyULOyEboS2c9CFlkRj/2JICD24AWFwrTDoe5OyYEqQ98tBvu6gHH8rps0TpdhFZUS3LKdb7GSXoMvQ7JpgWwflswTG4oAFlis1wstvepM+yGKwIRqYAj5fYRheM6VxjJQUatdY5f7SfbQYgxn0Qk77
X-Exchange-RoutingPolicyChecked: 
	rSRM/xf4BP8x0dfDupWKOS5M0hHZAkhJ9CgX4RAwWLO176h56MbpbfZvAixuWjWjjes+l5b/gDForo6mbev3UblN+XBQGGmIae7F8VH6SDJiZcKyzxRgRiUew2E0S2sZOCQnenj8jTO84FbE+FUPAR2cszZcWPI1YOMO2pa06b2VNhv0NttLvYZB+QSOeZnZkhVJVXMwC3a+T+WzJkrIoCMW8pVIXoIBVaOU5C+JY3YRGCQWRPE5xlTua1U08Zjzf6sZlsfvhXmhUEC/gHWTRDnKb3DtfYVf+luEGtLSFni+Kr77t894WjBFhUYrE2HjlBYB6EbKHhX2BdqEz8t5dA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:35:12.5218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e81dc445-e64e-4d20-bca1-08df1f00094a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4760
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX5soEgM9fxU1a
 nM8vmTIGdocveD7h3e7JlNrjziLmhf0mU6fhc2D4wKWiijk0BCFskJE720jiOCu4U9naMjNoTnO
 TwvU7tifuIKixfHUjWSt+0GzLd6tpGE=
X-Proofpoint-ORIG-GUID: vqNqrBedAQCWNG_Gmxij86N96j5lXYbb
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd1e22 cx=c_pps
 a=ht+bKkBNmLq2ln/DE6MnYA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=3HDBlxybAAAA:8 a=sozttTNsAAAA:8
 a=84XCEVuMHTUo9TAsc1QA:9 a=laEoCiVfU_Unz3mSdgXN:22
X-Proofpoint-GUID: vqNqrBedAQCWNG_Gmxij86N96j5lXYbb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX/KyadWR6B1oo
 Z+YywlIRDHPsoYa3nnDgdoTjQKg6yVIxksMfqZux8klSTyZq870HKElD5dEfgtlwnfqXcFz4AbH
 n4vJ/GRG+TSHavd3pIV2Qkx9aAowwZ1zEatOWbfV2WwDLgiqko7tkPqkmynxp4enXnfrG6p5D1S
 wMieGcvsmMgVoxdql7O8k4agWwI51SJ4weNRvh7Vk3ZyXR1Hy9JZNsPmnUuBDeYjde8hE1wYluv
 XXc871El4C5ylOWKdVUHBH/AlqlXkhwemi/hEH0hi0xjmQos6OFDalOMIM37JO+zRTOWfefKL02
 aLlR5AcNZBiStMctYCVIBegSE3wjgzhTU39Nf+uk5LCL1mpj5DU9s7noIK2tqLgDRTiNX41H2cr
 LMC3QMHE0qqxxlH/SLMFSC4e64gPQ5zQGiLeftZ26yRD9gNCAfC5Pez8cxeDPVtA9pfQ7gqE2CK
 uD1/P83w2DfLG872W6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130526

Move the protocol=https into the SRC_URI so that both mirrors use it
instead of the git protocol.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
index 409a34d6da..15814676d2 100644
--- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
@@ -9,13 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 DEPENDS = "libnfnetlink"
 PROVIDES = "ulogd"
 
-SRC_URI = "git://git.netfilter.org/ulogd2;branch=master \
+SRC_URI = "git://git.netfilter.org/ulogd2;protocol=https;branch=master \
            file://ulogd.init \
            file://ulogd.service \
 "
 
 # See https://www.netfilter.org/mirrors.html#git
-PREMIRRORS:append = " git://git.netfilter.org/ulogd2 git://repo.or.cz/ulogd2.git;protocol=https"
+PREMIRRORS:append = " git://git.netfilter.org/ulogd2 git://repo.or.cz/ulogd2.git"
 SRCREV = "1fe54ec39a071ea3b06e6883e542dfdcf40d2840"
 
 
-- 
2.43.0


