Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.87])
 by mx.groups.io with SMTP id smtpd.web10.2008.1620070144087994359
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Dp6Ta0jK;
 spf=pass (domain: windriver.com, ip: 40.107.100.87, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwNjegVWjNuNt0QRCMpXz25/RfA1emVzrn/MmZHaQsmRbAnNqMm3xKLTeguicjdhFeI9WRpUNELHJpMo3rZXJPunAU1mMVELW6a0WWQi378oBwrcvOHBV+WvqV4BCnXp6apzzrbRzwlQXJQaI5WKje2ydU9/TmRPDAEHIopRZo7ttaljm15n5yb8VpE16XxmjcvkujBxKorZccXiQW9/RDjatuM3zgxLrxLidw+LKseTmpdUhExWCA2y+c7zwnuRbkaBQCcmFlKtr/+ZtSXaHlAIwUR4IHrfubFY5SVN2unD/TZEicGtF4Fb32fghJYZsBnp3aumhmUlgYxWevtHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOXwQpc0jCWLDLo8d7I7nEzPKlwysqXi5b1HNm13hAU=;
 b=mjjqY7dwYc0jj+6kaKr7yozBUALjioe1/MPqQFlIjq6knvy8CfA3dTQ/iH1wMJk5t09AJQWXGnMlrfg6Ke8RTYZ2tbN7F5DqlvAP0nU78jvEkSbidAFBIZZO1V/rLaPJQySW+CAuD6+RKWHrof06SmvOpVmGpRInTnvC8eKDR56zRoJSLovfkrZq6hZpwderommRCvpxy75vKAUaixjOfKg/Zz1dIsAj7bsOn1HsN+Tri5gD55BY9NyLKgaTI36X7QHxw9CmglT+NHYrqHkpEabK5GEZf7TalgbrJ3jZqGQkDnMtZIWpookS9QvQOrd9rsZMMj4WeIzBaXYTiF8a2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOXwQpc0jCWLDLo8d7I7nEzPKlwysqXi5b1HNm13hAU=;
 b=Dp6Ta0jKA9Ktbnb4noBz2G+wsnvYSxGosFZYbbiKPUYfxnia/ZXejnjAxfr2kxI8ZUX5pVWTyqWSsaBMAVdqpne/MZvGi6K5NDtuA5bIUqnUbcQ6NBmvbuBcmEYRikE94IbtdxUkUXO66V12o/SZxHOggQqNNr0FJsyvoCAQg2A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Mon, 3 May
 2021 19:29:02 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.039; Mon, 3 May 2021
 19:29:02 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Subject: [meta-oe] packagegroup-meta-oe: conditional remove tbb for powerpc
Date: Mon,  3 May 2021 12:28:46 -0700
Message-ID: <20210503192847.2387489-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR03CA0052.namprd03.prod.outlook.com (2603:10b6:303:8e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 19:29:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 784da44b-d49e-407a-03a3-08d90e69b4fa
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50731176E24F6FA0A2A5482BEE5B9@CO1PR11MB5073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HAuk65IOWzPclvbLaoBx5fY5T71G+Ts2TyYJyvbuqUArNjlQ/Znw5eayU7evfLYPdTh6yQI6GTepXjDEiYLr/nf4GLZ7o/SNitH3pqnNsI4snDyDsgvrbIZcaW4CiTQEE+tHw9PQbIPjXJk14dX7oHiOyCkWnKat257hfNlvLU3KwuCZcGdfHltKbzx1in7uSB8eVlE9MoPH/3MQrJpelcuM+dw1QY/+m9AQvbtRFpr4JjRzbB5STPH98O9CVFwU4IbCQRyJKAcUggT0VAaM9M4kQpRCTnmwYBTi7H0Rz+SxzQDbj2cRfAPP8Aj5aNZ9LxiBcpMesZQXaotR87/ZrAkE/mQHKHFcC4iwPvMrS8uV+zn8tLLWzo4GQ1jO6MwVq+eVHyGVBScnkRi4tNOtUpEu8DgfatitoYMHMnU7PGVxOGXqoVP3yKPxbGinEMlEZJyysJrY4Vw13VsaJ9U6hS8SDP2WRB/Y/lpGmsuivvqUkO2ByHUGwE1vwDqU4wnnLNw4HWmBgs0OLs41YOmD0i4rgHFg+3Yg6ZgEzEiMzH7FCNvybl16mrk75RPYKaFu++ig62bMfSi8m1cQFUE0SvY43YNUVPbi2C2JWOE6s3RRs3WZ+xSb76bBvQfXmdYcFaOuDoPBQRglDF4M2fsQgQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(5660300002)(36756003)(1076003)(2616005)(6666004)(66556008)(478600001)(16526019)(44832011)(6486002)(26005)(6512007)(2906002)(83380400001)(38350700002)(6506007)(186003)(8936002)(8676002)(52116002)(38100700002)(66476007)(66946007)(956004)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?V62rELowVf04QR/pYHwKgYPpICnvXLVgc3kv5FHdhND0eBJrabDJ/mUh3IX6?=
 =?us-ascii?Q?a4MoFWQT5ynZkDnH/efYc6+08tlmsv3WxsCvKJGjeF1xXkH+J8qT8XF1zan5?=
 =?us-ascii?Q?q6WXp5YcCbBdkZLHBXRKkDymIiLz/+itlV5h3eXLarEIItCddQ4IiILORo/3?=
 =?us-ascii?Q?58NzNu9VR6gNpKALi6l7IFa6dtyprwuowLfLL8zFfh6XVSOuXLrpEgOzl/9s?=
 =?us-ascii?Q?TFdEgKfpSRsTKkz/87ybEckGDfYJAIWKGPLVv4NAlb+rTSo6XO4+KoTJTkkK?=
 =?us-ascii?Q?VQPQDf23PSAAFx83r+FRjhr021FxrciUFK5miPeTthK24HiDXZeuPw+lyGnP?=
 =?us-ascii?Q?0myDow4AOHpEFZEb7X2PtE2rmkVlWH4zdI/ECBfft7rFZc1Bp1q3YsAljYSo?=
 =?us-ascii?Q?i3jS72ycj9k0m1V23OoMyb76QjUD+tO1nikl1ykdiAI0Dx2HmGUEV+CAC37T?=
 =?us-ascii?Q?Cp1Hu3co5PiRyefElfN8xBorYr/CyjBwCQHAfcjMQAZaMI0a3WFbAve6NaDt?=
 =?us-ascii?Q?BMv1TSj9ybbFlSyUrfyajAg+dir/HqP68IwBwRDsaEIOq1Z8D/BBgOWOIbRh?=
 =?us-ascii?Q?5f6C8P4Y2o4JuzD+WK0dgqhRMDVnTjL84KbJEnOVFlcA0KNEgEYQ0juNaZ6h?=
 =?us-ascii?Q?lQ0WeN4/tkDDe6Av/aBzpPG4vA7q8XsVmlHv2Lbq8Gq/I8cg6ZUJUtojw1X3?=
 =?us-ascii?Q?PYdgF0vu00rJJ/lnLLGoOXTq0LspJtB6T1KsWvqdxeKttADWj5sTio0iCIkL?=
 =?us-ascii?Q?tjcrKChH5CGgY7rbY6WWUNBmLd9ijTzNi/MHrxoiEM8ZAXYycITPVyfNZR31?=
 =?us-ascii?Q?Aj6hsvJi8wK/c/FvUn7aWMLRlbuRCFzOm5xnWhZ4+46klw+HOYHEzHH12szz?=
 =?us-ascii?Q?dsurfUGpGM/kTJCQvDHIaLYP4XYwfzIw/rSfdwVcO5+VTX60gDYNsCqFxovQ?=
 =?us-ascii?Q?wJjCDnJ5ISn6/sBkT5/c8xAF2z4nkbK3Jlfpz5t3PWGTra/aMQXPaDzwMGVm?=
 =?us-ascii?Q?GvZD8QjNJQSxSAT8imWnFthImSbJt8SKHQdG9t+z+1aXB/tid/66IasE0rj3?=
 =?us-ascii?Q?XP+dEFsprXn77SteLnNVehZveR5k1eJhgjiiQ8iTW4mDKLCYw2qTpli+Cwli?=
 =?us-ascii?Q?DfEOUKsUNjBwrsTQJci4yVddSV3ZNHgazGsEqa9IhvO45qAUppzHCAQIjqEa?=
 =?us-ascii?Q?Ku/KBE5eSurBhc6WmnyQ/BNkxyIRCMe4Ciy4OoppEwirtwfKxvZVRw/jwEKN?=
 =?us-ascii?Q?TQC0RgRfRkMJCYUDBo7Kvt93OkPCV5c2GR1yk7gQkg3G/PG7w1yjJ0KYq6VM?=
 =?us-ascii?Q?QSlAQ1VmwVLX5x+8vWWFDr4b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784da44b-d49e-407a-03a3-08d90e69b4fa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 19:29:02.1987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sl+jsH7F7/v7gTRFOB6JV1OnuxG8rr4ACKJjDjQzWrP17/y8rBUDpFTJv/Lpf502nEmO0pxevtqskZ6Fsv76MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Since tbb has a COMPATIBLE_MACHINE entry to prevent it from building
for powerpcc, let's also remove it from the meta-oe-support package
group.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 59908e2c0..eb095a237 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -921,7 +921,7 @@ RDEPENDS_packagegroup-meta-oe-support_remove_arm =3D"nu=
mactl"
 RDEPENDS_packagegroup-meta-oe-support_remove_mipsarch =3D "gperftools"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv64 =3D "gperftools uim"
 RDEPENDS_packagegroup-meta-oe-support_remove_riscv32 =3D "gperftools uim"
-RDEPENDS_packagegroup-meta-oe-support_remove_powerpc =3D "ssiapi"
+RDEPENDS_packagegroup-meta-oe-support_remove_powerpc =3D "ssiapi tbb"
 RDEPENDS_packagegroup-meta-oe-support_remove_powerpc64le =3D "ssiapi"
=20
 RDEPENDS_packagegroup-meta-oe-test =3D"\
--=20
2.25.1

