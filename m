Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11590.1621431801513487591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 06:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GAk/G9Dq;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=077372f3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14JDh45N027061;
	Wed, 19 May 2021 13:43:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 38muc709a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 May 2021 13:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbLBeHzBttqKPB/FhpE/vHhmqpmhVuSCWet39fCapaFR0aLJNV9MbIYQykB9+DbFs5h4D+/Lhvy1DiSzklQAdrQnj7Dc35R4FNh9uK/h0a+yuZYRJSLv5M/QwRJJl1pbCFK0OjSN5Y6KqRAFyOB7LHOSe2hoGGHrt80JeuX7TqsctbbEwM4tETMZ3AolKP2ST+HyOBA21nqHI07LH5tObSGo3PhB/ksBGUOfnzPemed4yFq9WOaRoNr/OfmTi/ywtb5WmX0hPw6pmF6GHCpEGnF2+Y3Y3s0sZIaUkngkRyBhViwE7UlAW7g0NwPT7gZdGPRIayiJfRcuejOEny4qOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqH2/P7gkv9S8mK9rM+pK3ergeTD3QLVLkx50sHUNTs=;
 b=HQtjoMj40N9tu8TIHtbPGl7giqlHOv6gZ/f8/CtWTbLlDk5EWkABTEQkKJVMrCl+trrPzVqcD4q++xWtbXD1H4wWCxaIQD97S+r9FZELL3OLLIHIERvom8VtbBRC+3U2c5sj3aedbZfCfvYaS7CluBybzQNa8fZbghkdTcltwzo94T2fzEzYR7SXWEtic/x3X5SxxE+ICoYdB+LXdFrgY9iEgWOPq5YycYtsapRpJbM8jPeWwZn+jSNkrq1O7U9iDvFm/Z7mkSQYJfc2jg2FQ7boJnF9USD2trnY+UsPZKWgxPOyGUUgqUAXzczkUfw5uPdCTn8VBVWqxZgOCfmCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqH2/P7gkv9S8mK9rM+pK3ergeTD3QLVLkx50sHUNTs=;
 b=GAk/G9Dqh+crcEfaVAqGUGOhaVWD+eckCH2rls4ygZrokg1Es3ClQAGlKPmp28//YCSWewmfXCr0Oe25sxlAWlED4m0mBZfDPpvIJUdRCulADGMA2hULLkm/Y8ZgwSXzC8noqs2Ly+yYGEA1qwgrT6uqWIC5htbdu7UajwAc9GM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 13:43:16 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 13:43:16 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [PATCH] sysdig: disable building for ppc
Date: Wed, 19 May 2021 06:43:01 -0700
Message-Id: <20210519134301.4175937-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519134301.4175937-1-saul.wold@windriver.com>
References: <20210519134301.4175937-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:300:c0::14) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR08CA0040.namprd08.prod.outlook.com (2603:10b6:300:c0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 13:43:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b254607e-6416-40c9-334a-08d91acc0e23
X-MS-TrafficTypeDiagnostic: MW3PR11MB4602:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB460231D46E285C20AF6B04B5EE2B9@MW3PR11MB4602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	flUwdawD+gD/6jDEf09o4G6YbwqYEpuWEuV4r5ZNfqEFm2SUrBybwEZMS62N8DySZ9pkZOUDy+WvkTOA/G4zKZC9XobEkWPUpb4MIsI2BBDr29o9Fdpnj64J3R7puEQhvgRz1pnLoRDMFCF1JQIJ7ZzFIgPQZziGYixYj5Oz9/hcmC+YDYOFo1HBJNa2OoGAmpYdBTHGpIzRDp5DVd6nppMoujoSQvn66OkNDclJsS1T9eZAq0q/a+2ApLnhwl+FEelgRTtWrP2N9jgw2sjibe0gQWUhhTHX1LgSNxiqHCchyxmzKKddxDogg3n0PjGTg7w3F8yjoqQsEwYTMmfzaOQPHebADy/CURGP7lsLkV1KudxN1bqne17aeLa6xn8sR56Jq6UoTpWQoLprRbyylwCssjH5IY5S4QBACyiGujtrEQESBHIj1XDpIt4JMbSRuGfsEQICZgkpORWO/Ltn45mazjnArodVVDkj41SDBYnq2SGbUtAIr2bgDcJrgU+EmPgKuK0Ml5/5m1xlvEA/3pz2yWAeV7rAqFWSZ7SnJMbzIJYvm7EHDA7LKvuzt0pRfE6RRwZgRn6S5KO9sWPIp7PLi0oQw3fREKjlyTEcE6bbB6jgIF0F6alFQkQZjfHjqSMdiS0899wFl3It2AvqlSnS0vC7r8f6czkwuHWJfXY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(4744005)(5660300002)(52116002)(956004)(86362001)(1076003)(38100700002)(38350700002)(6512007)(6506007)(8676002)(66946007)(8936002)(6486002)(16526019)(186003)(26005)(478600001)(2906002)(66556008)(36756003)(2616005)(66476007)(316002)(44832011)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fDylc/iZWCVY920ON/l8NyLt2FITiT7xtCITn3buxopqlzAptbluI7CU2Qbs?=
 =?us-ascii?Q?m7fJg40e/aSNukOk0AJcwdb5+hrJAKhz6fWBubW3TwtwYQrEVNczFvNkHHFm?=
 =?us-ascii?Q?3Dgh06I4wSddAirFm1Btt/NqsQyNvSNY1h795oRN1QK/mdGtdI82u5v/pT1e?=
 =?us-ascii?Q?lclJhbUsEQ7FXMXR++ZJaOA8Exp/vCSgzmlusqcCULenIeBfuabGfz6iImLB?=
 =?us-ascii?Q?CTdbVmPBEhwV7elaGty16m8L5R17xfUUPdKQceNsJzqD8+e0DIOzNYbpOhE5?=
 =?us-ascii?Q?zRxU41W5cqIr5cHGd9NrzQdDgoNfBYFgTzwe3HxNol8n6U/Eh/zZFY/lTy8W?=
 =?us-ascii?Q?COIeNRtr+k78FPPEJo/rgCSvrsZoef0+H4W0dx8SbNu9CJ1WQ6aaX6Hd9t4a?=
 =?us-ascii?Q?LtHrDuOoK5aO2mbUO0EssSTwzXXsHw0IBWrSTXY4OZoDP7VhOQ2zRl27+Fz0?=
 =?us-ascii?Q?JiiV2U/QzCziVVpurWVxh7Nr/ONv7kqW+SJNnxK5b2Ym2WlETaRXX6nVNBLJ?=
 =?us-ascii?Q?SHuvDWoEm+ZUpWgljO3uGaAvBBVNQacMxYRXzlnQ9OWTWA5JddzsU3XgMXr0?=
 =?us-ascii?Q?JxUr0JBPL50/ZkPJVy0F//cDC9zrTyo6Qb3INvyXE1wX0wmVmXFYUWQh2v0Z?=
 =?us-ascii?Q?ndYBwkokgcdI9alUcgh5Nt1B6DAlbRJSB/zkjR3dM1SXih4ihNXVKLU7VqPY?=
 =?us-ascii?Q?Cqmzw1AnVw4HizjBg9dbQQ8TLG7D8uBxrq5oVy75T55IzbUg4+EQZ/fG4HIl?=
 =?us-ascii?Q?1SPZX+qh70UQe2853SSuLRDh4QCLzDwo5xc0M4f9E9ArX2dLzFyWCJ9YSmaW?=
 =?us-ascii?Q?6FAH38+IZhxTmNBMnwZg17HiNOzdTk7iP/Aj1jOQziHgiksBJA6Ei6O87RPi?=
 =?us-ascii?Q?OrehWemrBH698PyIGlLBQEL1GglJgB6mSN3TS4TGX/4k0icHt2xhRv85Boid?=
 =?us-ascii?Q?zu6bTMDvYyxyD2SoIm3/213mDvi1fxmaSaA4GGt3oKS1iB6DjIKSYzJXn+BQ?=
 =?us-ascii?Q?KTKXPBPlVSGKX/jzFZzPG8WSVjRFoF6g0RUT18JkmuhEmp4vx4RwqkgrV9j4?=
 =?us-ascii?Q?TWoUwZqwuFyzuXLTKxtl0/14mXC3/Z8o7xoPtTnVhXjnbHiOTtkreDImWqUo?=
 =?us-ascii?Q?VpHAKQP4iNA4kECdCFHyTb94222tpIITb+AvvPL3IKOArT00SZo5XN/iHuyx?=
 =?us-ascii?Q?lIV9tUOvV4X9EIumnGQAPdFDLdElKEPE5N2GaultanF73VeM9bNW3p9coG8S?=
 =?us-ascii?Q?fCvG+iKwe49zvCK8w2NzLadnEx/bRaLNGb4sk/FuAhO2rO9NKX0rq6+QzWug?=
 =?us-ascii?Q?NL05mabTNJL0mxdcXxc0NJMb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b254607e-6416-40c9-334a-08d91acc0e23
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 13:43:16.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oxD87NxMFjaiyRHkiIkD0QhRleBb3KycEFNRWB8WX4XtJp4kqbGOdTse2IjcZCxndAXJE/rLzkkuDdxgvCLREg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-Proofpoint-ORIG-GUID: 7WGnxVrxsGPLzisCJMn_oATZSFjkO5T0
X-Proofpoint-GUID: 7WGnxVrxsGPLzisCJMn_oATZSFjkO5T0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-19_05:2021-05-19,2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=616 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190086
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Sysdig depends on tbb which no longer builds for powerpc

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index d9da19057..f1b77070c 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -14,6 +14,7 @@ JIT_mipsarchn32 = ""
 JIT_mipsarchn64 = ""
 JIT_riscv64 = ""
 JIT_riscv32 = ""
+JIT_powerpc = ""
 
 DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
@@ -49,3 +50,4 @@ COMPATIBLE_HOST_libc-musl = "null"
 COMPATIBLE_HOST_mips = "null"
 COMPATIBLE_HOST_riscv64 = "null"
 COMPATIBLE_HOST_riscv32 = "null"
+COMPATIBLE_HOST_powerpc = "null"
-- 
2.25.1

