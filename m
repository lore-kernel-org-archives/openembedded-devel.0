Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8E5C77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 07:27:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21542.1683271653858991700
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 00:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=448933cb74=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3457K5H3012678
	for <openembedded-devel@lists.openembedded.org>; Fri, 5 May 2023 07:27:33 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8rf3dp48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 07:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNYTBs/zGp+7GjLNQGjsTV06Em9K0KGM0mdajl40Y9vccHGdOUdWrCUmpOXkoY5m5+dzjyVUz0u6bm7lUXRAE86lBS4zD5BotDwN7X727XEx7RsNsmMDJhdKzzWU/sxkUXv11wVI3ZOX0KeUbwqR7mt/SkJU75HifFnN/59G69ckbrkn+cfKXqLoaRLy52a3gXUG0f40AW6vpdGi5dvO0fIfF816huZYRLG1zPE7PzYzpV8Jy+V/39WWbPNscgr1Rx5SAamXF8QC9fVCuKDivtcfm9CTRR1A4bbY8eXfEiHl0uKewJA63dGDwwGUEOzqoHM7ji3+XGTx7Q8rvYKxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9muT2bcOsDRQ0VIhIdRLNnb9mcN0JUDKHCGUYDlI2gA=;
 b=WIchZKBf8A4D+ca51NMTKmTf9sv1CSnIkp1fFjr4OD7ElWXfD5cRow84WgjwBUQGcQi2R3qPxNSiXo1dR0PJhcZ+2SB0R9bIdAJi8LayxgfSM+9H20eZt5+bxCxfpYtuecqroz1hMNokX7fB21LeSwyVxZ2B2NRmv34hza9zTeNJllHbqgeYgpV5yx9SB2r7jhNrFueWkAP7xx7+XiQ7HzN4lw4Dh0lhX35LANRf2SI1urQMhZKzbjqWuK0NBYiPLnY7rkNWJxRuuHliTL6T+lFcSyU+8JdFd7KArvISj3Dmstpi/QsOptAJZpyvXsDyCxG0LbpEVEF3vfGR8AbIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 07:27:27 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6340.021; Fri, 5 May 2023
 07:27:27 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] pahole: fix native package build error
Date: Fri,  5 May 2023 15:27:10 +0800
Message-Id: <20230505072710.666230-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0243.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::17) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: e8784ccf-788a-4f53-f314-08db4d3a2d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pmta6xyRf4okaMocMqQ1VF6Dkp5gtqV8mEBs3sPFTn3+pKwagiX7sAmMDdR+KtKCJ/cNCrSj2z+XBx66VK1d0NSj1OdOginGMg/i8qSK0h+V86uLRf0nvngPAxOZWO5dIrA9hBXVUgXYDosjWl9fJt3ilydE/UOrCC5JySCyKJRe7YasisldJReGTm8yDQm7s5ZjMdRJF0ho1kt0CjU0zptsItiTnPlCI/bigKaF3L5b+TdhU6QemBhc30KY7Y8BcrLn9acjJbR8NbFkvrd+E3lIILVokoVoHv/85vdnP757MNecY0/1dxyUPsfv4iIe9mJ4SOwNQLOc0jiPDwXthlLl0EIPORAJ4M7G9pTx8YH/dgosQHpXmwCY/FrLd0FuNwEy79RhYDfIAV5oB3aSFu2z5jmMgkj72Kd5/+dk46USjWZZZaOu7tZp8nI0sA9V9ocQwN31aBjQyU010asSFxhqr4qndEfNCvcyOo6X6ds1tczQOmY4cHA6yg8wlgUC1O31XcmCipsf5z2Wiy84s7OMQltfjxs730Ql36aUiue0RwcqTRzsXfWxFXrq5qwkJNeH2hRyuNDWSbJcORNDJ6niYFvsCkMiuO3azW19NP29n9zbSj76EXqJvkf8WCNe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(39850400004)(346002)(451199021)(83170400001)(6666004)(186003)(478600001)(52116002)(6486002)(41300700001)(2906002)(4744005)(316002)(8936002)(8676002)(38100700002)(38350700002)(83380400001)(5660300002)(44832011)(2616005)(66946007)(6916009)(1076003)(66556008)(6512007)(66476007)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1grWEVGUFE0SERaOXE3cE9NSkkxVEdFZkdWbmt0VXpHbFVnTHBZbFdXV1ZE?=
 =?utf-8?B?bDZEWDhnUGhtMTZJNTFVYnRmNEdpNkNKSERVa21uWitCcDlzenYyUWtBM3FN?=
 =?utf-8?B?ZnR6VVlEZlEzWUxZZDd1eTl4UHJrVlpwUC8xQzdKYmYzNHZ4T293dU12TEpB?=
 =?utf-8?B?RFZJd3M3ZGxDL1ZiQW1vNzE3aWFKa0xBM096d2JhejNYWXFjWWlNRW0xNjEr?=
 =?utf-8?B?a29DUFFWelFrRW1wT3lPVTFMWloyUWpWQzh4S3o0c1RFbFlTeDhJKzlyU0d3?=
 =?utf-8?B?UUFIaUhpKzk4cHo3NUs3S2ZCUVh4TEZqOThWWm9JQ1NUR0RiZWJNZFUwWGN5?=
 =?utf-8?B?V3lMNnJYVDNvc25uTjdFVzNMWGVjMWdvWURQYk5icjNzaUhjVmxPeCtpemdU?=
 =?utf-8?B?d1N1UmhGSU5SVnVScEZ3VWNjKzd5djdXWitaMW9HdmdiSmpPVWI3ZWc5TldV?=
 =?utf-8?B?eXRRU1JzeW5DUkxMRWljUnA2eWo0bHU0ekZVeU9UMnFHQVgra3BmK0pDWnRV?=
 =?utf-8?B?cmtRRlNVZHV4UkRHZGw3SzByeUpTQXJRcUJ1aUwvSGtXWFA5VWNyV3pHUmxZ?=
 =?utf-8?B?ekJtTXd5SmpUMjZ6U0ZyM0lFOE1GVDMrcFRhb1lVRW9LNzVzWHdiK1Z2bDJQ?=
 =?utf-8?B?TFFLWWNNOVM2Vis0ZHJxSkM1MTk5TWRoV01FaFo5U2gzUEVXU3pLbGhnSlAy?=
 =?utf-8?B?b0puNW5tdmRzMHVFaVdLRzZpNHQzM1B6bG9iaEFsRHhLd21yWnY4UGluOHRH?=
 =?utf-8?B?NkJhY09BdXhOeUlvS1h1cFZVeWp2K2VyUWl2VG9OZjVyeFZOcWFuRGpYbnJm?=
 =?utf-8?B?MTBLeFk3bXZyUFNNK1RKVUJzdC9jQ003dWNRZkxSbzdMQzdWdnVUWDhUVXRX?=
 =?utf-8?B?MkR4YlQ3UXV0T3FseCt3RHF4UHhyd3d3bkw0ZGwrbEhzckRnQk9maGFPbnEy?=
 =?utf-8?B?UWNjcjY4RGU0eG0vWmFNcjJLTDJIMlpBVWN6SVVSK0k0UzF3YWlQM2ovT1pU?=
 =?utf-8?B?Y1lxOUFGZTVBKzV3NlE0cXhwSmdLUVFDUVRydEt2WG1Bd0g3cThXL210Rkcv?=
 =?utf-8?B?cWFKbEpBbFd1ODdha2F3ZGFaS3lhTXgzTkxxTElhYWVaNVhNNVVUZFFmL3Ir?=
 =?utf-8?B?UlFCMjdleGpNTmljdmN4RTdXaTZ3dXFCV2FoOSs1WElQd2pGYlJrYlUySGJF?=
 =?utf-8?B?cWVPWThWSnBWUVZZbXVJT3JBSHUzM2t2S3cxd1ZFQnZJMlBZQ3FrK1k5RStu?=
 =?utf-8?B?cnhkaHJqcUZpb25qYWtDYVRGZFZaTjFIWisvWkw5SVhkWFc5THdEdnFTdmpG?=
 =?utf-8?B?Y1NPbm1OM1haV1B0VHV4Sm9NUTZETlg0RjV0QlptVTNJUE51c3FwVjdNZEVa?=
 =?utf-8?B?OUowb04rbi9YanpLcTNwZmx6YU56K1FlaklQWHZ6b2xnSGhlaG9KaGx0S2Jx?=
 =?utf-8?B?a2x0U2kvUDVPSXV3QW1XU1ZYSEd3byt0aEU1QjJ6c0ZHeW5sNGFQWnJBS1FR?=
 =?utf-8?B?czZEWHFlWC9MWjZ5NXJlbCtsTjNTSUhENE9mS2tyTEVoRVBVYjM0RjNjaTJR?=
 =?utf-8?B?azZ5QnBEY2lZSERuQ0l2bDFncjZpY2pZcm0wQ01BOWxvQW1SZUFiVnpJR0NB?=
 =?utf-8?B?NmJHKzVJQ1NlU2lJNjl2aUJmWjFoRkJnNTlGdlJBZjcwc1RwR3Y5c1pSYXJz?=
 =?utf-8?B?RGVpWWh2Z2ZPdGZhRi9wNGFFVmdETkcrNTIraUpHc0kyQ0diNlkyMnVJb3Zn?=
 =?utf-8?B?TUdCUTdEMTdPT1dmNzRXZ3lZVG9jTmNhZXZqU0JSdFY1YnljRmtlQktxMjhE?=
 =?utf-8?B?ODAxWDRPV1FEUzN5cHNzcDlVRlNVVGhIU3J0Tm9FZWg2eklnOG9JcXR1UDNq?=
 =?utf-8?B?ekxMMm1IV0xBejc0OFFXdFJua1F2WXlZTUduU0hPN3lqY2pBRDhtSTBHRmZH?=
 =?utf-8?B?SDd2K0E2UnUySVpxN0dTRGlmSU9HQWYrdnN6OXZOcmpmZ0s4ODVHbVVadWpq?=
 =?utf-8?B?K1JTWUVGYWo2WkJmRGxGWmFKVXRBdk5tL3NrNk8vTktoMmhPWFhLZHZ6c1NE?=
 =?utf-8?B?SFNsc09EY1NDVDY2ZjZ4YUd0V0ZtR01xYkxiVzhNZFJ1Tmk0emJIQU5INkpH?=
 =?utf-8?B?Z0EyRVNaMElYTDdBWWk2bHN4MjducWxjR0JESXppTFRVWlB5Tk1ERUxZSkdT?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8784ccf-788a-4f53-f314-08db4d3a2d7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 07:27:27.3607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nkxH274B0PD6w+ujStE91zZK0f5KsP/oOFailRM6TPnsHcC/mt4dM9yRw9rEZb4LE/wpfVwIHhMa9wcgjPikbuTgRva5VfSxBW0XWRm9Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
X-Proofpoint-GUID: dnQ8kf5z8f8xCtNPFqoDOk6-ZYrvhtBQ
X-Proofpoint-ORIG-GUID: dnQ8kf5z8f8xCtNPFqoDOk6-ZYrvhtBQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_15,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=843 adultscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3457K5H3012678
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 07:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102316

From: Xiangyu Chen <xiangyu.chen@windriver.com>

pahole-native package needs some uapi headers such like linux/btf.h,
otherwise it would report error as below:

btf_loader.c:342:54: error: invalid use of undefined type =E2=80=98struct=
 btf_enum64=E2=80=99

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb b/meta-oe/rec=
ipes-devtools/pahole/pahole_1.24.bb
index 2bb73c3eb..93ee7f30f 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
@@ -3,7 +3,7 @@ SUMMARY =3D "Shows and manipulates data structure layout"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
=20
-DEPENDS =3D "elfutils zlib libbpf"
+DEPENDS =3D "elfutils zlib libbpf linux-libc-headers"
=20
 # Depends on MACHINE_ARCH libbpf
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
--=20
2.34.1


