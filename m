Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC100C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 11:47:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.112])
 by mx.groups.io with SMTP id smtpd.web09.32980.1644839266369197060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 03:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=KheBJDbX;
 spf=pass (domain: arri.de, ip: 40.107.20.112, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjOqRWvwWibyWJpOf4pChEejQJ2eJJQJdS3JbSTIP4TWAr/imnNG/NwOXqzXLG1Mu1HnQfvuGtLM+3GbEatIfstCSBn4Av5QWaIlk/EFUzLxlbK6XKSAsTr/qwvo9btwZ1rqRGoYn6eUrod0206FNXp5lzjYADl5t35c9migQZfuTWsILJ8e3rE4NJk5Js5utBdSeKJliLoCWBwcbezWJaBZhmVP6VJxux9Bd9iqvtFNa69lRWtm/sHsCYCpm6puLtfxbYNC7P3E6kvyoO7rA1ytwY4zSgluqKDdhEYvxdGLEFeI0TZvRBGM2lnkAZRnRlvEZqBMyqKqqRJ/0ObLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br+oy95f0iPUd/2zfupeaA1at1+P14z7OY+gNDXmwMM=;
 b=BIQ2i2hsYMrGCCvZHdlHbRF/SHnLlwe6IGak3RH2/6Sy4kQOkrOnn/uqG5TZWUCmTkOinLyx6Z+cIGabljNC/tSkmy29dzS4m+OfVUe1PatNwNcNLYAB7arHIxDLgtg7DGeV7rclaMOs2+WNpOT2pNqom5qZbPu+UxQObVn8za+nfhri/PzIyzYqdIP3OPsvMf+CJ2oJ09tXFW+6fckHzPUz1QnOarMKNRXKW/SSsUwMV7kO1WbRGrGEJmss8xxbhRT1NbKJMWiBDV7R7MbQmEBKGyFCfbR0rWxYFoNPwcLSJILw51+T9hOMd9JsTcymEDdq4tH0bdEqAAwcrM3Rig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br+oy95f0iPUd/2zfupeaA1at1+P14z7OY+gNDXmwMM=;
 b=KheBJDbXIBINWxedmoeNWqF5bL9GKqX46VUvrfo2C5IzFIDwpIwTl9bTcz5vN3R8ux55wTP2W6Clva8zFhM1sbwrjNX02Xg/0aII9bqHkwwUaO/rUxjCaAZCoWom2Znq3i7zAdCSI50ubAxNqZzP1LBNBR32bXH74RYFZtrYN9U=
Received: from AS8PR04CA0204.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::29)
 by VI1PR07MB5743.eurprd07.prod.outlook.com (2603:10a6:803:8f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.13; Mon, 14 Feb
 2022 11:47:43 +0000
Received: from VE1EUR02FT018.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::a1) by AS8PR04CA0204.outlook.office365.com
 (2603:10a6:20b:2f3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 11:47:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT018.mail.protection.outlook.com (10.152.12.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 11:47:42 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 14 Feb
 2022 12:47:42 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 14 Feb 2022 12:47:42 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.54.144) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 14 Feb
 2022 12:47:41 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-networking][PATCH] ebtables: remove perl from RDEPENDS
Date: Mon, 14 Feb 2022 12:47:29 +0100
Message-ID: <20220214114729.18964-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbc79e11-698e-4e5c-ef3c-08d9efafcf66
X-MS-TrafficTypeDiagnostic: VI1PR07MB5743:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR07MB57438E39FB924C01C667587ABF339@VI1PR07MB5743.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	umVk5V1R7xjM2hmNAOh0pWHhVwkuSRiIIRmBQdMMXhs9nsZpF4P06bA4cQIqAYj5vaT7RVCJd8iFDu0Mzp9jZEV5LymaXbJmuflQ6eyqz7vX1P707sTysHrZTdA9++hxz08mMK8B2KGSaYYg5UbtPaD3Isg3N7yU37ldSuxrIGk0XxPgIc7jeDk+yXgwbI4rsG3z74geXHdBD82ysRnBJ7n8RKn1cxF/yya0QmzJtqS5MGBavXr0w/1KY378hbQ1wEh5y9bNpU4cGkB8XZHvKTdeecv/oSluJXZ3MSVLjzhXIyoNQrS2j8LRgn6NlyXSZQGmojJY9NNW2piyMHa5hUtEthim5ElqOndgc4RajUM1FINQidZwxkK/P7JhQY68BQsUEOoiSKozM/Hu3oblTSV+JOMY4x9lO/n6jYozG8OClR+gIXVWgDDpDcRMs8H5UNOUyo++qylo+XOPYgqmhCfKPoMJ5wfQe5inu7dOPqjyCBmVMt704jXy7kC0EiC5x1/HeySBEnVz4muwKuCwNHwpAteKtb9LhYZKgJRIaAI/COy1PFy6QckpKUA676/etwRyXmAdkk23cDhGIKXEhkVOMmCMNxR0CPcmZyh5FuMEpRST4tX9x+CMFHO349c5qmwCdapyTswxCOXN2ioQOMq4Nx574fLEs9c7mm/HXvsOfjiA/CBTe92DD3fmWlFf
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(2906002)(4744005)(70586007)(508600001)(70206006)(36860700001)(82310400004)(6666004)(5660300002)(356005)(81166007)(8936002)(4326008)(8676002)(26005)(186003)(6916009)(16526019)(426003)(336012)(83380400001)(86362001)(47076005)(2616005)(107886003)(1076003)(316002)(36756003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 11:47:42.7111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bbc79e11-698e-4e5c-ef3c-08d9efafcf66
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT018.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5743
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Feb 2022 11:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95307

The upstream ebtables-legacy-save perl script is replaced by a bash
implementation (taken from Fedora). So there's nothing left which
RDEPENDs on perl.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb b/m=
eta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
index 21e5c1877ef5..fd837629b551 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.11.bb
@@ -6,7 +6,7 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a28ab1488fdbd2e73=
e"
 SECTION =3D "net"
=20
-RDEPENDS:${PN} +=3D "bash perl"
+RDEPENDS:${PN} +=3D "bash"
=20
 RRECOMMENDS:${PN} +=3D "kernel-module-ebtables \
     "
--=20
2.34.1


