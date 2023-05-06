Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082F5C7EE2A
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 06:39:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29387.1683355187551005776
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 23:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44906a2dec=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3466ZabK030769
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 May 2023 23:39:47 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q92rne7wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 23:39:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HROv3jDW1/wCkRumpDJJ43OaUQ+wjjntKzce1MThbbmiKWZe5OKO7s483SKEbVUiAFcRjiGHOK+yzAGU9ms5Acdj+xmriqi6zDGvqL3zHx5X5andAqA3r0T9TPI3w+WHA2IHzES/HlXnerNbEex67M0N+C8ta6h3xl9z3qvKMa90lAsRA2ZcF6nSqwtPuLs2iGycPM3X4o3FwCnWyvVK4lE/uRGXpC8y0IEKJbN51LxjkknSR/3zWCF128OQqTNo6/A3CrqQoPrgiI6tSuVJ0RYhuEe6n+5OYdHIO2O96lZoGxHbsGLqoLV3uUsvc4i+oTqIUwTBHf+dTrzj2DRjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crtUzux149FLJDfPCkLDVS5B9hyfI+Yaz6tY+KBd7P4=;
 b=m298s0vZ+hC2CqVDq6f9Vq8JDDNWuPl3TGVbH2LzgRjCNIqiEmYXllA88H4gfBAS/rWhMGO2ZwOICtlLD3eFxcPi7z3kDrZEv2QCtOs5ZhnBdHF+ZspywwIe+L0uFWd5z0rxlkZOrrC88PENzairYzghN3O8qjc8lgccTMtTGSh8d/oxQDod9U3Iw3AKAg00ztIBSIzjnnhUOAJPZa49zlEVOiqM/o2qjQCrBPRQmojgBSJiBQ1ZDwCNxUzdfE60pzSs6s+TVRyWoYtWBivXf3i+R4doa9auB52xsw/YPJi2FjRriSruhdZ1pYe6ftrdOCbE4Wq8wDhllSWJpLWatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by MW3PR11MB4745.namprd11.prod.outlook.com (2603:10b6:303:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sat, 6 May
 2023 06:39:44 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 06:39:44 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 1/2] libbpf: add native and nativesdk BBCLASSEXTEND
Date: Sat,  6 May 2023 14:39:25 +0800
Message-Id: <20230506063926.2042225-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:404:e2::21) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|MW3PR11MB4745:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0269a5-3148-4dab-0e67-08db4dfcad87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j4gvaOhYs4T6E3vON4h7umsDCdOh3w2PuuxqYisd4HiD4cMU55dF/B+fNET9nLUxc8INvRcaKPDrIebyEbl/2mvvsAq5oEu5LoiqVP9+R216jm3GtVrAREOol2gBt/h0opPh21/Pke6rcU5AfRcKfb59ilaEM3R+SMwe0rL9ECgz1/BdA6Xq9frJcVWQNBTwKjIGwWLiC2oeROj86S8E6V+zkLOwcK60vhsd/GFtULe74bZr4sp5+Qhj2H2bRW239YL2vQPOvIB3AMGJgRMQk64u5LnN51LUfhSpcOkDptLk3elhGH7TYQnnHYrN5cy5a7U2hh2KQEDhssiuutndVEI3TMNnpPTvsIDVe7LzGXqWpMaTHX0SacMr8Ie6rJmAW2kfzWj5lfxaeWRBryeQmbKVu6c+G7vEvu5hGIP6hWD6AP5bxG2bsMHg/YUpMxEyd0KTyaJzXQXXcxf16VFDuNaPp0yhTLX3URaqUQIGDrAxn4fZ+M4OrA8CzaOxx1CC8YSAjDnJE0YVTbuiauM6yS+vptkNnbBMA3F80UwSS/PQ8uN0qxzyEiVIJzrgbWIeDD09WKeppzbSj9q/9OwgFKEYbNo3HQGBFo5sys+xRR8Bg57SGzzzBY88++mryOaT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39850400004)(346002)(376002)(366004)(451199021)(6666004)(52116002)(6486002)(2616005)(186003)(38100700002)(38350700002)(83170400001)(26005)(6506007)(6512007)(1076003)(4744005)(2906002)(66946007)(66556008)(66476007)(6916009)(44832011)(41300700001)(5660300002)(8676002)(8936002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/yas/Mlo8VdNFNkPX/51pjneXGhtCH/dXthrdy90O7ARhwxyWWXdqjq+OwaI?=
 =?us-ascii?Q?d4zpAqqKfTGzwHBfYrvZiLASPt/R8fPdBnj1JD60t1uY3DY2T2q+TTkfWxNQ?=
 =?us-ascii?Q?EpQAuwd0YfM9TU3Kvb06HIMXIcRTbDKOS5QxI44SQdGvevrzf1gmJ6mm04D7?=
 =?us-ascii?Q?g+bnVibPTTTnxRP5mV/0wn02Tj4jqT0+/8b0y3037QWuVsX13oAM6cQQbyZv?=
 =?us-ascii?Q?oap2dQ2IZgE6nx3/ZLQ+9QOB7iOUSU5djyN5rmEukNKqte/T+QYi0eCt1ksa?=
 =?us-ascii?Q?couj2YSqI1/2R8RFAveMzXJGJUJ/CPF/8M7tnSpf4AXQVQ7LjhrvVEkqW6rV?=
 =?us-ascii?Q?fS3dWTaVYX7TR9O2UC8QPhuSBqwaZOR/3O16768isDHmTXzapivzoPoT27fJ?=
 =?us-ascii?Q?rDMR2lWbcYidPYhlTMG6E0yxxJtumcyPzJd6k9CDxxt/q73bw68mHdNJ7l8c?=
 =?us-ascii?Q?AcaXoLqvqqYmFPovWtlaRetUPkHNna45R01ex0Py/jLBldTWTonwHq2K+tz4?=
 =?us-ascii?Q?EklkT+m4kf1Nlp02ShhCkWWc9V4fxCiS7FJd8NrSVX7Q/gTBV0c5tGi0JjOG?=
 =?us-ascii?Q?Z2tXjL5+psGKj1sdnvjSgG/oXED35riRxuM6GesZ9DaGxN+7Q+cbIa1EnU7s?=
 =?us-ascii?Q?6DNYzFcGyFkkmS/nTDYaWmsErPZeTETCVs3+vTKxbpHEflFmHLv53fxFm7Mc?=
 =?us-ascii?Q?bd/O4uNMjihkj0A+yz6hRlvhPE0EwWqxTEOzv+D5/QZ/qaWmBDAl4E3QkCTG?=
 =?us-ascii?Q?4bsPxd3InrrflybqChjLvgP8U6JWBew5bZzg5jzq/IlNlrgXca5NaXqw3jye?=
 =?us-ascii?Q?9bqxpsfZzC90w9PALZNns31CkxoxYfH2Tr8llZFNHwnYXlXU/WYOJtXR15JP?=
 =?us-ascii?Q?FPlZOl4jw/mZFG0GUhfzvi1RnNYN8qv6u9xfAiaSnJ6Pk4aKjqB+R7oTbTIZ?=
 =?us-ascii?Q?3rJ6BimUQXJR0d7KucEb9gYW9hxfIetjBXn52HmAtnluNC8ovqWYbg5+gkSF?=
 =?us-ascii?Q?35nFmbqOQrdNl7RGIuwh6m15StC0+fqfsiaYKQlIvxo1hokH3qA7ZtHxohxl?=
 =?us-ascii?Q?F2HmJZoiyPxBxTcHqn+xpuAg2yMpNMxBkwOcIFflG1L7VMpl8bVnxcU53MB2?=
 =?us-ascii?Q?wfA3qTQwCwD6buRDTQCNmcnv3MEKv2d0DtjHqmmUjCK++6JxT+46uK5BeOho?=
 =?us-ascii?Q?So6o7BdPA3wriJRlsoD5osPVAmJ21fwsnrzeHgbWxzveHR78LoM4dykblaoU?=
 =?us-ascii?Q?pdmf9XGpEriVUEeV7E0bupuqEsFcR3P7l6jCJF3Zso5wO365Z2UGBEHYY7gi?=
 =?us-ascii?Q?xpgXtJeP6O7HsmLxSSsDoj/H70QZ6atmtp+f+rUROeK1EgJoH9ilTQT+2pji?=
 =?us-ascii?Q?w9fubaYOTOcg9W5wzg6czZlO/jhAlgjGl5is0Xy0nTrFSXCDfH6C5Wth5uxL?=
 =?us-ascii?Q?39K+xiWc1eLQXP0pA0sz0nnZu5s92nUQa2cC5Go8Sw6s63OAxgg0AMt327mC?=
 =?us-ascii?Q?b76am7tGPWrGg06R8kqwvTA2QI5pHKz93Km/PKyC6eZ9raSRGWcis1zWdpdi?=
 =?us-ascii?Q?TaY+7n+OAS9Oa0YofN6nvnQyRgKlXRDZb9KM1ggxSIU72rD1uhQi/6GCziu1?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0269a5-3148-4dab-0e67-08db4dfcad87
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2023 06:39:44.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQisXyBlCd0lQ4fxOBwrmWu8wGq+GUicCMtmjA0wqzUuYdFmX44mmsH+XB2KL/zvjhBr3cnPpVpjwX+U1c2ABa/pV4LG3pCP4lKu7ombH0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4745
X-Proofpoint-ORIG-GUID: 9TKQpRItPZIrn4dkQ9CLPzV6U4mYO-dS
X-Proofpoint-GUID: 9TKQpRItPZIrn4dkQ9CLPzV6U4mYO-dS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-06_03,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 mlxlogscore=771 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305060050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 May 2023 06:39:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102323

From: Gianluigi Spagnuolo <glgspg@gmail.com>

To build pahole-native we need libbpf-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(backport from commit a28b7fdbf4bf973112530219d63f7559060ec8c7)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
index 461e6b05e..4df920f7a 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_0.7.0.bb
@@ -27,3 +27,5 @@ do_compile() {
 do_install() {
 	oe_runmake install
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


