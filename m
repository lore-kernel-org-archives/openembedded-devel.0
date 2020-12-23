Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.58])
 by mx.groups.io with SMTP id smtpd.web10.6788.1608715305252109437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Dec 2020 01:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FsSSxZJf;
 spf=pass (domain: windriver.com, ip: 40.107.92.58, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ3JvDbJ02ReUQ7iZE7yMeos6Ku0XAkdY33ntaAPda8SycXVCGDUiBrbpHhbm32mkIkRE3vRvASs8uBiZgQFxoZtPmoOV6jJAFbj/CY9dI4rE+eXxcPgnG69g09SVih8/x18g0IwbGXN7QaHmLEX5PNCiStvPtg5GFbXCm7CuMUPJ47JmmduQPYptHsW6rDMbwY4GSQVCVFcBwMhO6d9Sn92JdcDBB98WB1DKa5JZvSh806k9mnTrzflod249VU6D0kdmTu/TWI7db5KVO+zKj1frEyM4i3QUQhO4kuBizkjjhnV8OnptQVkedB8YfrAMPOXAxM4hYpr+1Ws4HWTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNNjQJRRWxc/8NGetYewa3Y00hmKDx968OWIz2m5O1Y=;
 b=ZR0xuLT0W0oSloJCz0sHaIdPNboySlC1Fm7EtL6ZKIV7QY5MDTSP+sNWEGAfal8zQoT76CfJAjj0jEU8BHFZIE4IJjC/sK3XBAANnwlDDc6h5XjVhcKT85VU16EcGP3qW0tMSfyrvVYsm7p9k4LEISOArYnNhju7dTh9+jTdog5TFRJiFRbVDG0xaGMSFGcS0+bCMTzwIFdIsaBYe5+eAxCJqelkdqxad3FDc02rWChq3SxkWDBQnlkwL5yDWQQSR4w/KDj9ZJ5eAUk1qmagkrY4dp/i2SozSEyXYtyUCZfJmKTjpZV8BtkaY9aWUh7aFsGseKBoNTeGghEwbMj/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNNjQJRRWxc/8NGetYewa3Y00hmKDx968OWIz2m5O1Y=;
 b=FsSSxZJfLwp0c6F6gjWOxpyDbUQUWeQSvIXZLgRWevXygCH3nFt58psPifoOv2W6+m2IGatKg8SNoGWpmYDuNiXKmX4Z5+KRBOtkRyDHv/u+BfGEhp7SqE6Fzt66ln0Vt4fyfRcgGu2KwGHxq6G6LOUnp3ow6thpzgl1r/Cf7ps=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2239.namprd11.prod.outlook.com (2603:10b6:301:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Wed, 23 Dec
 2020 09:21:43 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 09:21:43 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] traceroute: change the ALTERNATIVE_PRIORITY
Date: Wed, 23 Dec 2020 17:20:33 +0800
Message-ID: <20201223092033.37029-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:203:c8::19) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR03CA0014.apcprd03.prod.outlook.com (2603:1096:203:c8::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.19 via Frontend Transport; Wed, 23 Dec 2020 09:21:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3be1b1ae-1e65-4d83-273d-08d8a72429cd
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2239:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB22390F3B7389BE94FAD358EDF1DE0@MWHPR1101MB2239.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9XbjVo3dUguPLdbuVtzgoIXyS0wjFOw7uEGQB5HlMuV6mlibZzw5HO4WBuh99q3WTDZXZPb9pjY3BRmX2usu/vn2oBBOkw1RmBOg8S87DOsrq2WvWr8M2236arp4o6wiZ5JNsRL+i3HQSCRX45qkmlIXVJvkrOGzx5pVkcFG2gxfNwosaoQEJXYsbbqezxgwOKpnL1IQjagIBBHHkce2XjDr7G/pqqDVS9tedRjmtYFWYtxCKKt6Wgx0TZEVGFDMboM6FEXUocqdUxjBUc3bgzudKAUh4uQ2ldzweYYeBL24ymmpCcALLvA/rM++hA4jtaBwYB9G7wInMoqo507tO1p2T723c847wjHViiJ/LENBqsgxLhoOTS3Kgse9bgtw+kP2XGibycqZwfAQB3XUqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(26005)(83380400001)(86362001)(16526019)(52116002)(6512007)(8676002)(186003)(8936002)(2906002)(1076003)(6486002)(9686003)(2616005)(6506007)(6916009)(36756003)(66946007)(5660300002)(478600001)(66556008)(956004)(316002)(66476007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?K7SIqA7lAlud4wo5NFQNc0eBMIJhwqdS0yZRzACjgyXrazlCH3uPNj9ASqTq?=
 =?us-ascii?Q?ADqDhaMnIqJfw5r4EIGJdfeI5JXZ/X5ncsQLhyolTXE5TVM1BtKlUPdQ79ss?=
 =?us-ascii?Q?oP8H5FtPD/3b9tTCePnCqrcgmmBLsLW/mvgDRaOpkE0057iQSulsawtN3FIo?=
 =?us-ascii?Q?I0zlDszjt/NTr3aW9mPWpo0EB+awpOEr3vAbRoIg0Nxa+cYF+exN8Q2MOdYL?=
 =?us-ascii?Q?bJN0DFS1ON3FZ/csOdClzXPQn/NtUj6z9pOc1/GWDd9ZqCrbcjV/OdZP4hNV?=
 =?us-ascii?Q?D22OvzH3KwJy8GI8CNgvuxD+DQr4zm9Z+hmmZKmH4aP7gAGm0jCnBg3WwIBO?=
 =?us-ascii?Q?ry8VHmx8NHd/c0AlIkTmI32VAMWZ7eYWBpggTDbUtxERuytuoEfihCZ8JUKA?=
 =?us-ascii?Q?Ifjl1fq2jg+MFNzKDWXcmiwn2nrF12jEL1NjmDaG0zqptHBVBhJ9FBz2xtGT?=
 =?us-ascii?Q?NYffVFNOBDcR7bvUhc9FA8k2SOX7qIWLSTYI39SjTH3RjtooY/VkhDsvNO/T?=
 =?us-ascii?Q?/4D8FoxhF0egBluMTiu0FHEGHjty0xJe1XyrkRQa18Dx5k43q7TSUVw1XN63?=
 =?us-ascii?Q?VE8EgnYcyuh6KRAsUQjXLBmGZgZZTDs6IXLgP1nnbrzHGJmIruHD9jHDDWT4?=
 =?us-ascii?Q?aI8CgjyTPIOlKof0u0SGtFxhD9pLU2gADQUErssmfqhD9n7uGdNO3v/rcCs7?=
 =?us-ascii?Q?j9faC/a1uxv0uUXKGY8qfLexm5HrUrpCJKad9rJquY5omU0lp49qLaLbWeTi?=
 =?us-ascii?Q?iSw+bZQIoQb7umGKufwNL0cK5xMa32Nm+04Oyr4//KLrfRUGE0CwHK8qvwXE?=
 =?us-ascii?Q?d05MPZdMK8g29LqyZ37n3spYZojFOofUA7aglJnG6Sdc8dqBX1HriNzsXeqb?=
 =?us-ascii?Q?BObVPJprX5++nphDYhLJTZxumBz6XgtkuDfU7/0Qha/zpuLVYvqTR5SbhA2I?=
 =?us-ascii?Q?pFGZ9pEYrKsPWBBwkgPLTbquPDX7DIRjKT3hrttUtUa0NPjld3PC2zcpXFrf?=
 =?us-ascii?Q?MYUf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 09:21:43.3194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be1b1ae-1e65-4d83-273d-08d8a72429cd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQn/w5G6i8jsHLDzY8xeQpCUYna1Bey6sc/MVcGkF/+D+EJM/zwC//bfpqgjzDzvm7gUAdm8LwT8e7GFTRCD2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2239
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Both inetutils-traceroute and traceroute provide the traceroute
command and the ALTERNATIVE_PRIORITY of inetutils-traceroute is
79 until now.

Increase the ALTERNATIVE_PRIORITY of traceroute to 100 to guarantee
the traceroute command provided by traceroute when both of the
packages installed.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb=
 b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
index 993794492..c673ed009 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
@@ -40,6 +40,6 @@ do_install() {
=20
 }
=20
-ALTERNATIVE_PRIORITY =3D "60"
+ALTERNATIVE_PRIORITY =3D "100"
 ALTERNATIVE_${PN} =3D "traceroute"
 ALTERNATIVE_LINK_NAME[traceroute] =3D "${bindir}/traceroute"
--=20
2.26.2

