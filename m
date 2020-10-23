Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.88])
 by mx.groups.io with SMTP id smtpd.web08.12371.1603472589630647234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2020 10:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NblmzIBx;
 spf=pass (domain: windriver.com, ip: 40.107.236.88, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENeOsNgZIfzwT4a+YWu8nXN0QmLuommFNRaQnBbZmI/BsEjcTlyjapYp2YVMvAdkKROV/SGnQMJPZd0rNi8ZW82XCs15cVOsikNN2XTV8Ki6MHR3fi8sG20aTtu2aH9xT9f4iioEzCBPDltJ/lw0rQcGEl60pOZYdylTNsaikRMK83iuUndRiEdNdbbqCJ3/I5jDCuqc7vpWCk6BWyemAhmsFrAdccOJUKmlYAKS2V+fuoHDuyH+TpIQEdJ5AiCW6vXviKV9x795J+dWvNJax/CXd5aqBITJrvSe3oEsKyNFfZCswbL3hweXQg0RjNAArH5TIIXJq4mZEJ7Dsj1cIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PT3WFiAyAu1DVQDuzIYVgAPKotbQb2HDlTCDTunGfw=;
 b=GeeKJT2RM6Z/SKQbd338ai7abCqYlu8F/SQb6n7rB9TGYNgHv09oG34gTYii52GlRakrjbhCyV36htI2vc7uSj4X7QjhlU9PEdILhGrS6DaEjI32xBXVPvY3U3nPM0nhgn6j2quzQObtDgxf5bmrhVEp9OgmIGyvdPocgfbo/qvNSPKpyBtHNQUqgpXhfkERP4L7aV87HY722k0PN/4Da95M+Kqd2pRKTmRHj6/gtSPd32pcfdfHkNN91p6Z4GBp8CWcQW/kn0238u5draUiNHJjc38qQYnYRgCta4CmdhAUsoBPPC+nR09HmrQVf7RV4I2TG25uN2CEiFqSdcvzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PT3WFiAyAu1DVQDuzIYVgAPKotbQb2HDlTCDTunGfw=;
 b=NblmzIBx4aR12wHvoIvFXEZ/3E9zieeis+TGBDCdFKuWDU+Xu0qEJ9cIgVBf1/WKbD11s41WsckWNxEH3v8zMdUCweiApMpDIjcCoWIUC1f/dUYTI2twqrZqiUeis+tnfU9ficP3deCKDDJadwLZBqWn2qRNyoneB/MXqz1k3BI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB1578.namprd11.prod.outlook.com (2603:10b6:4:e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Fri, 23 Oct 2020 17:03:08 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 17:03:08 +0000
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [meta-python][PATCH] python3-prettytable: add python3-wcwidth to RDEPENDS
Date: Fri, 23 Oct 2020 13:02:46 -0400
Message-ID: <20201023170246.7708-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 17:03:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f23993e9-5374-424d-4a7c-08d8777583e6
X-MS-TrafficTypeDiagnostic: DM5PR11MB1578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB157874EB5DF436A2EA35D920F21A0@DM5PR11MB1578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:67;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wWYrPSBJO7WX28gP9NClgWnZN/VzIbsrEMp/8vg/dSg64tRo9BW16T4mhMwfivjwls1gFNOBalK2E/M9sfTh7L1+jWIQRDeBCEOnm0hUT5dvf/g8PQ2UeixgmjluDY5HY0uwyXlvTBM6cNPlpsoz6aOhL7ZlSDypL4zReNFsqael4ffl8UXVGgzY9Vhy8vEEpKUQX5LV0lvZGEMbwEsmPZ1ZwSZo3tRpbdTbfzixryVqygnYyet8/cj8LBpFRsxsDCQqIcayWNTAj9sOxSol5aCqX9AhnkYQKhD+gAoc0HvjYdXABouyng/65zOf9nKnjuOc4T0aOwHdzmCOI9y8Vg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(5660300002)(6512007)(6666004)(4744005)(66476007)(4326008)(1076003)(66556008)(66946007)(52116002)(956004)(6916009)(478600001)(8936002)(2616005)(16526019)(44832011)(316002)(36756003)(186003)(2906002)(86362001)(6506007)(107886003)(8676002)(6486002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qfzUCDBbP7rP1AdjVco6n9Z7UliJN9lzzQMmueDzvxuDgzdaMXXyCZdDn0GyJQKEssnP12Xzrn+qFNRkmk2+UoQdWvYEnxz0wGOZNoWF3C/TCS8i6TDtmcoMC+UnHk6adjdq5OijjM6aZHNruSZWC1Zfghyu/cSCUjwjqflk1/Sk1jDQaV+o05WyYk9HPH9dqHUs5wmd4BwDyjAo2QsHAzqrgf2wns2//bZgIBEryKWwZD/QgEDLGOAPDxfUbNNcQa4P2X7ChM6KR9ggzXIaYZ2dJCheACxX9KlPP2Ru57hA3cyjrEi3nGaCCrEjcPSpoJXcVM/uENL9wFcHNX5LqkC1+a9XuEHqvhI60tQEhrxedjnHMuHDX/78a0E/dG2DeVTll4f/FfbNZVX6w1cxi4UM4pGkUJ/a5eGDhxkpB4+pMcX9nrhO34RT4l0mswstmLjMk7mElzgLR/ZVXMQM1NdDbKc87K5ZNA9kBpcEVjGK5npASJmp2DvS/H/yJ6sLfjPfdPFmEbElvbWpoPCpxQnXFngovrL/XP1YVuHQXX9lqfwXueONoIl8TFTOHhvOiNxg0cRLFzfQd4tHY0QBmkwezMfAMsq1pXFaPrMS+nQt5n2OvidQkguymzY2se+lBhhgWU3ozsQHCmGVV92eEg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23993e9-5374-424d-4a7c-08d8777583e6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 17:03:08.2150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zABoWOFwf6wPn2mNZA8H3f5Ssui37dKO6CKG/PyhCowi47otac0YP1Bg9FJnWJevQDmYWFf3a29jrQSprP3+++tfNXYc60PI8zTGsdWqEjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1578
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Upstream prettytable uses wcwidth since v1.0.0,
see commit 83689922af58c152993e8ef5bcf7dd1464371272.
Hence, add python3-wcwidth to RDEPENDS .

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.=
bb b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
index a065b6c47..79341b9d2 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_1.0.1.bb
@@ -28,6 +28,7 @@ DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} +=3D " \
 	${PYTHON_PN}-math \
 	${PYTHON_PN}-html \
+	${PYTHON_PN}-wcwidth \
 "
=20
 RDEPENDS_${PN}-ptest +=3D " \
--=20
2.26.2

