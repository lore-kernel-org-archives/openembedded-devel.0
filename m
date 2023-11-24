Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28125C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 07:40:45 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.105])
 by mx.groups.io with SMTP id smtpd.web11.131218.1700811641014490247
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 23:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=O3fw/9Lp;
 spf=pass (domain: arri.de, ip: 40.107.7.105, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldvUavKj4vYZUwwbwokCyQFlW1LZOSBQokvrIqUe9/RzUIwaei3zVIxah/1jLQxy75qy9ADCYpZrTQOTDwSybyxmC9oClR5OewZfvkVuCCTch7oeFmA0w/djOoBfXr9iqJGQy0xUgSf10L/DlpSdFsfb8WyReaexmELMr95ga2s8r+i/uONsip7/VZyNNOLgKySsrfo7X5Gsdj5T7BC/ZYfQhlZDnf6lYArfxclH2kid4RM/14M8cjLhenjhkMN0J2HOWGi6cPmjCoUETx2FjQQIacClbpoz0bAcl1V3jIaQWX4cBOuzboZ7PdRlD3V2ymOluoLlMGo5hSmPCzkq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g81zHPyARHJgwxCKbY2TiX+rjYX14UYr7+aewXjYMms=;
 b=hWSG7A3PcVszZ+EDi0wCTYYCUha2hzIiXGi0ipj0BQZ3Aa8aCACdbQ25MZI/jC8ZPhgKCakj8lS8DiMlovfOo4VjgDv2RjnEUWoTc48hqDjDgHUXRrzKlon83csP2CvYrDUOTsjqVtlGi2UQSToL2r0Ro084zJzgfqCWSmJzlaRGrnpfRr2C0RlPL2gStX3QLi02Jjgba+pVH30yw+yhqjT48wMVyMOovMk6QE33HoVTm0GtB7cT4apvAJsy+wzLVO1H+iwYvpOws7bcwIBne6e6Sfuqwy0De1cRKR7wqSwaBxQw4RYRJ47csI96A7nMqST/1Hx2l04U0gBZNf7SjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g81zHPyARHJgwxCKbY2TiX+rjYX14UYr7+aewXjYMms=;
 b=O3fw/9LpDOVPrdC3TeZ4OzOn9pHt6mZthhx5Nzwz06ImFiegf7u91Yg9PJvDz+aVDB7CZr09MHtUR0H3XEqSc5+OJiyoPzNsYygyeMev341OVjRJIzIMbfm2ORajEiYyo8eGpEzNi1ewKA2NcqGNhXdaHX5IkEBZWtY5d50FWUo=
Received: from AM0PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:208:be::19)
 by DBAPR07MB6775.eurprd07.prod.outlook.com (2603:10a6:10:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 07:40:37 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:208:be:cafe::f9) by AM0PR04CA0078.outlook.office365.com
 (2603:10a6:208:be::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 07:40:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Fri, 24 Nov 2023 07:40:37 +0000
Received: from N95HX1G2.arri.de (192.168.54.82) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Nov
 2023 08:40:36 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-python][mickledore][PATCH] python3-gcovr: switch to main branch
Date: Fri, 24 Nov 2023 08:40:24 +0100
Message-ID: <20231124074024.11930-1-ceggers@arri.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.82]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9F:EE_|DBAPR07MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a416eb8-e7f1-49ef-4a48-08dbecc0a669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VMi2qCbfoGMm6vA/5iDugbXwoLyHxmKjC7ng1vFy1B+D1Vvnqr6WHgJIzG1FvIrtmOtspp4k97ZLFU+3wU9bVqKI/uJdl1ucag1cg5bILFoT3eHxFFDyRqMKlrNQ/SigE155I3i/n6OL/F4QoTdLLCJDCuTwny9xZqPxDStq/vIUmnJU84AMAef3PFlT7OQQD65TcDzpTvKx7cB4KPpeA9I/eMIsRyc5TxiHsjtgVqjKm1rnjZ2DJXLMFcNnS9AYcHOnuSZWZqQW9UMps07rPr2Ox7EcUZ6LKJs1UahkQGmIEYO5p3CnBeqsqw3JhkHRjIcTBsd9TiNvk2oj7nw6NSu+m5mWn60EXsFc3Op848VtqzfkpdwQORqtlIhD41crvQWBRGgF/SbUw7nCa2Xai37VUXzeLvnl/gpSLSRdGZJVisj4IBtTkt+uCVNTiRCw4QSEDpUA2UPD6IDWzgfQSsqx1LL593qzkwIcVTEqpLd8OvyP1xSyW8sEwRkhuRpba3kO+alQw/c0CJ09A1QlqCMgoWfRfjQi8Dwk408sQF8euVIjZzTjUdp+cTVS4J+QS4QgaRSwX4f3zq60vanrYmMIIY0m4UGvFkrmXk1rHhE6SS4UPIaM+8p4cuD6or8NVtUJNgjiHetxw7Pa2h15CCqtIYkVOVYcxIdqYcNk2M/y9ZQ2r4OftO9vnUiLJkT4gSH1Z/Sl4LQYlZvILiinjDRTMue6LrZOLnPUV+f0bdmy7euKgG7yXU6wYO4GB7V65wVj/nfu5sGLDmLImAIcjLtVZXHcY4snx2oKMKJVb0I=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39850400004)(376002)(396003)(136003)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(46966006)(36840700001)(356005)(426003)(40480700001)(336012)(82740400003)(70586007)(70206006)(6916009)(316002)(83380400001)(26005)(16526019)(478600001)(81166007)(7696005)(8676002)(4326008)(8936002)(6666004)(36860700001)(86362001)(36756003)(4744005)(2906002)(5660300002)(1076003)(47076005)(107886003)(2616005)(41300700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 07:40:37.2538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a416eb8-e7f1-49ef-4a48-08dbecc0a669
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6775
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 07:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107045

Branch "master" has been renamed to "main".

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-python/recipes-devtools/python/python3-gcovr_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb b/met=
a-python/recipes-devtools/python/python3-gcovr_6.0.bb
index 21c36687e263..bfb0aaf5e79b 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D6542fc4ce5904ffb741ef56f8fe=
33452"
=20
-SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmaster;protocol=3Dh=
ttps"
+SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmain;protocol=3Dhtt=
ps"
 SRCREV =3D "1221ef62ff0de15bbeaf79e68e08a65d62c73ff4"
=20
 S =3D "${WORKDIR}/git"
--=20
2.35.3


