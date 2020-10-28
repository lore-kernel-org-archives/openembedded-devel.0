Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.71])
 by mx.groups.io with SMTP id smtpd.web12.10907.1603899639059854571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JJ91ldJD;
 spf=pass (domain: windriver.com, ip: 40.107.75.71, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiHYfNZlDaVvNK0I032wybXcIRgsxbjGAv9AEO6mYWTm4dsSeKszow4XvqMJOfJdUEPXXv3+WcIdclrhiY3pxEMBRFggl9WdQPomRLkoEP7V+3fMHS1MpLR+6XLVCcPmNMQvfEpIXtY4ulYaWLIzAqsBNK6jNKXwo2S1e3Cs+qtfQBQV4DVQ9pr4K5YFQ1x5CoF4p9bRlZVqEbV8TtGEEHGp1oHg6FD42fMmm+ngP5+a4fTPlR44em2D5bVMeLRQqHQxWMNw501+L8mhynEPoz2QyDFXqoa3E4hrUu1UVHCoRKOTEjVqrF+reGfthGvjlYiPqy6HcCaHir+u4c6QpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uftzup0T2gfgwxacAC8JQco9/uMAXCTYFJaaWJFDUVA=;
 b=SQGbGPpSPjoLu27NFk4jKVPtiJA2owq9WzSocuUIE4HRHD0vxRIes6MH9TKTVj1w5KUvzNUZW3MhbxuodVTnSYoTwptI6WfsCRUnXI9fn2xzIgnVIg57RD9wm61yQoPd3JB2BUaxm8thWh/MK+c0vnAI8MmCStDeBIOaT7lqDfapBRk1U5bOCezX9SZWHdBi1p7FMMqXjN1BPOd464AIpOXpy/+QhnXb7cHgGvIQvZCxTXx1EDRJ4FzZPvK+RmE4MR5RRiKofKlcu/P+01G1q6vtVVk/kmkivCnT2JqAIn9M0BNgHbd4xk/rMgh7OLoOA3/8K+sz+kdaF3npuFU1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uftzup0T2gfgwxacAC8JQco9/uMAXCTYFJaaWJFDUVA=;
 b=JJ91ldJDkXVHVahgQolDFmw7tUuGWRx9/xehpfoqhEJ3JqGPBCGLnpL9EPa4lEcF0usGhLPN6gzgcJ7rlEclU0HoPfslEfqZF/l1KPxqLwpMjPZOglM6fHCSHk3Wt1UigX6N353xT+5Ul+CAUMl03IlUVYTRiMQjUyDu0OQdoPc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR11MB0028.namprd11.prod.outlook.com (2603:10b6:4:67::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Wed, 28 Oct 2020 15:40:37 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:40:37 +0000
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-prettytable: add wcwidth to RDEPENDS
Date: Wed, 28 Oct 2020 11:40:23 -0400
Message-ID: <20201028154023.3027-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 28 Oct 2020 15:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cbc186f-d595-4062-c9d5-08d87b57d125
X-MS-TrafficTypeDiagnostic: DM5PR11MB0028:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB002865D70DDCE22092D55757F2170@DM5PR11MB0028.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:170;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZmOT0P7fH1ENsQZBn/7CYXOKfr4D3GcJ7QOVXYVtR6WYtfruAtmc/z7TfH9rIW9426JqDGG7sgehm802o7HbFSuyNMIecn1QcsoVyRh0jFauHsHwSMA0eSe1Zq7XFN9fRvHx2SpQ8yK6bs/DIP4fr8ySVhRUOULbZGgpt/cVRuVKzSbvmkNQHgywrn0vlS0G88rlIvKfVpXGPQsdO5UNsnRpkif6+zMf0JyissN+rE2IYvQHoIQLJSdYw6wrUVi0jtxQCzR8gyFBsUT0babWHkgemakhi4yQ7DxbfuqCsOFsDeYc1Ww4kuhs7/5hIt+K4pQZ6uLkVE5r77Qu+87gbQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39850400004)(44832011)(6916009)(26005)(66556008)(8936002)(16526019)(956004)(6666004)(66946007)(8676002)(6506007)(478600001)(66476007)(2616005)(86362001)(186003)(6486002)(36756003)(2906002)(316002)(6512007)(4744005)(5660300002)(1076003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	aenDq3sLJnYJW1YAS+6iFG4rf4osN8NMFKL/MXICNrW/fTtKWsjLizwwC+Z4guCnh6SUGGxfzNZtCNfpGcSLvKTCxn8ZD6CpNYC2eb6XkPWNRlZv4EwP+J4TWYnbkpY4YlRztXxx9pA6H64gsk7U1eVRfMKpykChWXM5/Fi+M6bNxzDJyQNJf9iX/YBFcJqUwv0Gy2LMVOrSlB1CxdMW3lryCI4Apt3XJtuCjdpFMXrteHll6XTLJOP3LcybjgfWmW9RjBqUk5LsHOzVCa732Dc3pLMRLx02k9TD+spbwKljc9yxVzE0we/8jWl/Fw+/XF3RG7ZCNSQnMXsxLqivc9fnJQO/0s53aP/RoxyxoBkLwsxwmnpRWQLYxsQnyX1phxdh0uNd4OJMtI1+drvRAsAGGQDpaAMqRGC8Vn2u4Kn2hXUWJtHhFxdkEVaokFFLn34c5gNCHT9oMu0/HYVNB0iWVLY/hb65mJm5Kki5qKOF/7mY2fIj4aUOdGi5wpTRKazcAKgwDOkgOPDJDQMBHLk21USpDCUz5Qvw//ioc4JhdQCWfaWMmM/DRa8WeORWBxymAcJa+1cRmuVv0TWTszDRgP5aNFldOVRxcqnwxgbbku5JvxCz+uhJtCdHrzLOrg9sn7AEie2qfQakVg1T5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbc186f-d595-4062-c9d5-08d87b57d125
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:40:37.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etT3N99vyaxCdtqDbuqcQeYhUxA1u07RlU9psq86PCB7ohEZB0Z9VtM8swZJIH0BOnFk90UNmbRrpy0x54ce3yUyhB5gm/vIeKLI48Mut6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0028
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

prettytable uses wcwidth for better wide char support.
See commit 83689922af58c152993e8ef5bcf7dd1464371272 in
upstream prettytable, hence, add wcwidth to RDEPENDS.

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
2.27.0

