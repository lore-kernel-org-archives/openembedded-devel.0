Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2767C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 14:34:16 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.104])
 by mx.groups.io with SMTP id smtpd.web11.6147.1648218853840472168
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 07:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=wfdPwbVe;
 spf=pass (domain: arri.de, ip: 40.107.5.104, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVikeVXyrTnPjLnzEtzKJ/61MK1M0UwW7ZauUS24ENw/GQoB/DfXfoBBidN0vdYBgsAzoqc4TFUVbgYHPmDQm1kVPbJJlEYBpqAQE6C+pv/iNtjNbAS7t3IDwmKU3iQUt7wydxoMe9LWQYnYzLjiXEgD17SCvyqyyVthnYX5nki5ygfA7QAUqZ7r+5zePOijLXCxzEnB1e0pESdDOtyHBRgo9j8US418o+pXVxXqjbgL0cUcU4bPEvTmyFD1hbmT4glBRzVsmvIvdGYlcHm9c4O2q1F0oaabjFD43DXpcT11latv8CSuu/dVCJzI7nSeJ13Dvkwpuhm5uQGSL/ojNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNm/8KEcFDos7hpm1RSQ4+NXDB4GkAbYO9tDgF+mfZI=;
 b=b0AQ8P2vZkfb2wtU/Ij6dexMTXP0ZK9WAMnWMRciOe0v3wLSLy0FsUcm0Sc1doYFbsRLTFf+mRP11iTTJyfmz0lUIh+GWYPvcwgP+awqU90qJ8Sx/vpR6ZN/zgfoTnjhsHVnlwDfuD2aWSz3SKVBFbUU0p9/+oTJybEU3xHF1vEmqjRoLOM5YKODtrqzAbzdQsSUFdXvO45s3kKG256IKMeRJ5+r6lbhI1jP9rifuGvkNi1LDzcY7+KP5MP8s2UKqKI0Yc76KrOmhF8nsrbSL4LROdefXewKkvG/B2kb1EznxOR1cvOT6NdoMdSuoEkawM1JPfL4DCHbXStLuSpzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNm/8KEcFDos7hpm1RSQ4+NXDB4GkAbYO9tDgF+mfZI=;
 b=wfdPwbVeSxm198M0It1nqEFwpDqFtdjP0bnbf251u+7eFrUOGYp/q9kXF09QcvT/jAVfKYRUyXVvehABUBTAaXrxwVuO9v8LmXkBhqcfTLZh+g6CBQjwntGrAj54yw91eZsP6H6X96AiFqSyeFUYLgdtWTwsbMbW3ILuaReAfCo=
Received: from AS9PR06CA0221.eurprd06.prod.outlook.com (2603:10a6:20b:45e::6)
 by HE1PR0701MB2170.eurprd07.prod.outlook.com (2603:10a6:3:2b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.8; Fri, 25 Mar
 2022 14:34:09 +0000
Received: from AM5EUR02FT027.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::c4) by AS9PR06CA0221.outlook.office365.com
 (2603:10a6:20b:45e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16 via Frontend
 Transport; Fri, 25 Mar 2022 14:34:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT027.mail.protection.outlook.com (10.152.8.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Fri, 25 Mar 2022 14:34:09 +0000
Received: from localhost.de (192.168.54.144) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 15:34:08 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] boost-sml: 1.1.4+git --> 1.1.5
Date: Fri, 25 Mar 2022 15:33:51 +0100
Message-ID: <20220325143351.12827-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.144]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4229992-220c-4d71-67a7-08da0e6c85fe
X-MS-TrafficTypeDiagnostic: HE1PR0701MB2170:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0701MB21709AA72BBF4580C52C2D0DBF1A9@HE1PR0701MB2170.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0jpAvfDSZpH/8G/2wmiOy7nCXsLIRwI3hVrJtgAnGOa4zOphop2CDNQfULG05Q5KzEZqKQ3uHG4ycw7Zn/9Cs69Tyx2diwWo8Sqy6trpew30RPJFZenZ2XyjUS8dhu0APjUHGn15JsbG+4lMRNAzvK+1Yxpsd+xZuQSwvhMpVmIxzpzjnFe21RaMti18U0gZhRShEjpm3nzR/bHpch7H0769/Ufhy0vtOcG030Ia1f6T9/iXet42RidoP/4n26nr0Td5hFe7c9fCVUCYT6RMfTCJxRz60XE5Zg8YRdet7RDNUQyN7w/wjmAJwyAEFSj1YpqfpFuNXkNwtiWq6DcKepKirjK8v++yCfxjSmPW12vsyNzzhkjzDEi9i2rLJahwoBs2e9yf22Qikr/iX+R5u8R2WiVzbstRbvzznx9iSvbIJVom1s4WGzjrnwPaWAJB7MqwsLV29sZnfGuX+Masx35iYFrs89FaCKoEb4Y67dx/s72ACN76Yln9WIOMYmROKjecNL4CED2/aY0LIWsUmkr9tYwRDTwJeFuijp0+rkDue3GY58vgcWQ4z8wRcb/zEtZjgBje9A3d4J4B71BdkGrhmgGZxJ/WuV+PAaoP8vGdREQf0q7HD82XYpCyd55vroQL8YkNPuuhgNugMIvZNriIrpD2sZ6maxTDy/5SCM7/7R9peN1Gu15I0LCPSaggnU7KyaaLT71xpn62ljea6g==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6916009)(70586007)(81166007)(4326008)(70206006)(82310400004)(8676002)(40460700003)(83380400001)(336012)(26005)(186003)(107886003)(2616005)(47076005)(426003)(356005)(1076003)(316002)(86362001)(16526019)(508600001)(6666004)(36860700001)(2906002)(5660300002)(4744005)(36756003)(8936002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:34:09.3177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4229992-220c-4d71-67a7-08da0e6c85fe
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT027.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0701MB2170
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Mar 2022 14:34:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96208

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-support/boost-sml/boost-sml_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb b/meta-oe/r=
ecipes-support/boost-sml/boost-sml_git.bb
index 42b9f1ee3c5c..97c04899bfc7 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3De4224ccaecb=
14d942c71d31bef20d78c"
=20
 DEPENDS +=3D "boost qemu-native"
=20
-PV =3D "git${SRCPV}"
+PV =3D "1.1.5"
=20
 SRC_URI =3D "git://github.com/boost-ext/sml.git;protocol=3Dhttps;branch=3D=
master"
-SRCREV =3D "bcc8dc7815c0d17ad3a8bd52b202f4e90d4d4ca1"
+SRCREV =3D "7ed8f85fbe5b5af87bfb818e9e0347aaf7f7056d"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


