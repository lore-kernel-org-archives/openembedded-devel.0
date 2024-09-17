Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D85C3ABD2
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 04:06:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13513.1726545970742663577
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 21:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=999099458e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H41FmN006034
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41myq1tk20-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SscBn2zoJ9vaiTY+QFYwK6CLhzglMRjtuTjbJmZjTON3cm2BAOVYbmbrDgN8uQ9Nmj9Bb5CL9VQkTlAGxHRwksiyDeVSNoZE/xOI8YURX5+mhnrlWh7xs0j7Dgzui84G357zwu70DZ6l/SrO3Ttw+mbsjbG8y97rGXoQr8szDr5iNW0vgA719LqNia9aotI1Hv27QthUJdXO1nca670rdymctitdCZpH9T3fsmXGabBQandnorccUgCsOkvIcbHkdHB7S8vAMihNDGwS2VdGOxhMB8GiOgtPqdr2N+w1xJO7QWATkDVhy8OilENCRqlsPSpNDKS+flJZr4ADFoapQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fI8mqNpEgkteC37SliumwCwiNUHGx62XJxNPkNKwxbg=;
 b=ytgFy+5yKNQdRijAZplBsRLbPkrvSTnyFzSUvFfX0BNSKPWqqH8Y0EZhZXWc27E2G0q0ppcToUXPuycSyHxutG1nyRxfXM+B1IUPsE4it+Tzxe2XSqvmQ1xlstyc6KcBNEf8QUoepjgDIkQTW66/T2JG6RrVLy63hsSi12tXnJsmq5+9uUa7WMVj03wSTksomh5BQNtc86zhCTgPpqXPmAJbWiBOM16l+mI96/K0b1CSr/pMqGED55mUKsvtug6McCmEs+zz7V9yqumCwj/wMOjvhN5rznehm9emNaiK/bJ0lvwADifj/MpixFhWxj+nrMPVq2BwAMRDkNrDG5UcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 04:06:08 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 04:06:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] catch2: upgrade 3.6.0 -> 3.7.0
Date: Tue, 17 Sep 2024 12:05:57 +0800
Message-Id: <20240917040558.2231178-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240917040558.2231178-1-yi.zhao@windriver.com>
References: <20240917040558.2231178-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: a55f9837-ad9a-4653-3fdc-08dcd6ce0ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PeXZcmrgaZeRsHku2y4Cj/QyqliT4YiVHU3GSi1cGoyWSUfJxeeUZFUmf5xf?=
 =?us-ascii?Q?Yy5k1sZCY8hwYheq563aOsHtmpc/h/77Bd6f33mOblSzMIAxxIddQHWdcSIf?=
 =?us-ascii?Q?O5Go4tmeVbwjUIe8QnJoXMyJeZH+Uu42v50Vd6PrcUoCSxgdnQl1HCpl/pCR?=
 =?us-ascii?Q?3uPItx+WR6b0fJbeMqCQHTZ3L3Yrx3g3JiQ7V52Zb9+GI3tewAJs77iWf1+X?=
 =?us-ascii?Q?qPwasiVWq2sjEjKEhgkYluJW8KttOu1+Uj5l01W6Mu60MNFaIJLHg77xzZrX?=
 =?us-ascii?Q?HxPGZi3jqCCJzoiOBAbjT1Ne5XW0EodYufu4fbZxluHC4oYAEUaat0aAB2Nu?=
 =?us-ascii?Q?TK7uBs/WrZUkkWVqDte8z1CCMCg8zWtW+gq3oshbtXviNZ2L7zXVOhsr4ate?=
 =?us-ascii?Q?5ewiJxFiUpDkV8Yowot8PhJv0ozLyexNDa6Dj848T1tRQ9hu9pH8oXpG27gd?=
 =?us-ascii?Q?XrTZGgUODKdCINGP3fBRezb8VRr+NEa2Eow8NXiRcv6tv8MbwDaq4VEViW2Z?=
 =?us-ascii?Q?SbvIVo0cuzfQ6YJds4o0DpRMpO57/ZV9ZC+CSVS7pr62sdUZTaTLGN9VPb2s?=
 =?us-ascii?Q?c3dkq8LitLpcTooP0Oay/K0sCnfn1QARjO8C6y8bx3p13p9b5jJpphU9in2o?=
 =?us-ascii?Q?TP6yLle5MERvAlXi8vS5tWywFzuiBZZAcRaj9MkH36OF0ARvNOaFcPzmauut?=
 =?us-ascii?Q?bA4ovYn8k1AM7yZ125lgmlNKoAkBeab4O9Pt0LQO8sEFxd7cEdo7erTKHrzu?=
 =?us-ascii?Q?9yJZZy72QXudrpt4qXz6QWlZxGsQyue1Qwqv+Oyn4WyhHl+LYaajDte/qxBl?=
 =?us-ascii?Q?qD59tyHbPoRnANsdfBFn5ZVVFjnRHBJhJPWmyccTWR/YR5t1/J/m5l9VZnRT?=
 =?us-ascii?Q?YgnRAhF7SAw7S+Bm6WukTPK5GEBfkI1RZMZVhmBqW2qzC/vtw9+GwBMin4no?=
 =?us-ascii?Q?QRJ5p85LVkNxGN+DLL338/6CCk8JJnpoMFxfr8O2CLPofD9xFFtW3blVaeBf?=
 =?us-ascii?Q?FVKxEFX0XCyHpzIt3q7XHi12nXihFnC9z/uoPv8ZmPfQIR4P2tvqmNG4ojNu?=
 =?us-ascii?Q?tzqqv2kWaKj7wbyX9ZpLOF/at2OhYqGfPDJOgZN4x5Q44JaxuJXvfl+x4kow?=
 =?us-ascii?Q?rr8kUBqu4ZA1nkgSa3v+TTNnny9uACECzRIMkkGtiimkoFWl9jM/j+WE4qou?=
 =?us-ascii?Q?fHrtYLAdyYrvzI1UvuUhleCxS9PAmSb9HmvJhDkXOPmNciRN3HVZBEb+HsD8?=
 =?us-ascii?Q?puC5VGVQmQ6kYTQJ9j+EhQneinb/50ESdNxQmLVelKFpTY3DsXW3SW+X4mHC?=
 =?us-ascii?Q?wGhObgVMRF2IEHXa2FBN/tpcjJctCQIk/x1BPX2hUoeyTQB9pCJifC81584P?=
 =?us-ascii?Q?ndTogxmq/hkQZqOfU5CneTFiHIIjZ90IFK/HBcw+iB5jG+sxCA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ngKsEwzAQadkJ9me0OuI1rDpTI/mhzP7ZkKtAFDXAvqxXIgpGJxn8BFZVGS5?=
 =?us-ascii?Q?pKgQxRt2zDS6vxXg6px3q6JDf7ijqYSg2S75MzuWKlZjN4ioYOzqW6uu1IBZ?=
 =?us-ascii?Q?NfGL1ClofIDLMEIVEtMB0puJ+o2moMIZF3+7DiUVnnCr490bzFcQGVXS2KGN?=
 =?us-ascii?Q?VhLnZiQ3wYTr5W6Cpd4Gcpov6NLNXKCPHSWqqrcQiSqcextJrE7Erwgxa4gu?=
 =?us-ascii?Q?Fm+uIfF8YUJvFq0kNz6WW0QXVhnvhkz9xA4lzeSY8P0v8chOKXzIQkeNWj6B?=
 =?us-ascii?Q?lyKiOlkrJ1iSd98mNKQCvQ1xIH/byxpwDc79Q4oaHcg+Vd3UOPnDxJMYzeN9?=
 =?us-ascii?Q?XfMZmXT3P42LzO8uLcCbp75SoC6EJBH/z+cvpQFQsR1dXLffIg3FPHtvoL9f?=
 =?us-ascii?Q?Dmo0vpFmQIjhhbklg9byIKuB7ArWzraNK5TJNjC/3e8Z/hzOmf9wsAEGiA1W?=
 =?us-ascii?Q?skjw9jZPZJ0VPupzxvCzSHdt8+ZA2Ag11zQblNVkX6sigzbHz45X4+xZRfwq?=
 =?us-ascii?Q?lL4gRyuo8T3js2QtaDMH6ayhtjQXEZ1AmCGvu/avUik7I8H14GYt3SJQyx0r?=
 =?us-ascii?Q?zL+7Ty1ZQBfFNjxULNnzfPYLDQmlZgcRkQ4KQGM0e1I5taLGcZrU1vbpK/0T?=
 =?us-ascii?Q?oUR3HO22/5o8C5/GJ0LfVaNqRXtvfHMtlGfTOnEIEkzV2pkBup8G6mHM630/?=
 =?us-ascii?Q?06K734j7F5hsXOKxTcIpwinlaE2BFPPiv/BH/kCtOP4rlxihQ+Z6CDdDmubQ?=
 =?us-ascii?Q?O9lv9qr1Fx2AoAMJLEOyLb1sRQmGrOO3z9SINB0ZzXGx+dAojD4S3AWgyY05?=
 =?us-ascii?Q?ad+II5RwWXPU3n+S9Ff44coW1U4uKCJjNpV8rgNXF1OLSL5IQwy5YcDdYWaQ?=
 =?us-ascii?Q?5BrDChCMQpVZ0z/ANTMnfiaYz2hcXSdGJXKAOZHviQoIXL4L0JMLLCbTnsHE?=
 =?us-ascii?Q?ROB+1UkN/juwuZkS9EhO+mGmeGggdhVdxnlCz579StjAVNRzrBxf+/r6nhgi?=
 =?us-ascii?Q?7tOY9YXA6bpu9lr4J17ub2emAX19WVQs2ku2J/DQUBD598XjxMyx6Lub67aH?=
 =?us-ascii?Q?FhpFpqpWbmrMVoPKt5XYFyuRLYCuhaYE4+Xm5UhlBnQX6lrEv7GbZOtTEE7b?=
 =?us-ascii?Q?UeITkSFePMxfFyhQ31sRXHWtAUY1m9Ng0Y1y34vlZ75XPsRRCQd+QvR1KUhp?=
 =?us-ascii?Q?mc+H9g5vKBj73ukgVsxEDyxP1HvcAJNZ5wsdoz6ob/xeV897YL/zEY6q+4Uq?=
 =?us-ascii?Q?h+fOTtY479yz8/TdJbnFI4QYUACB0ahUe121S7PzNdSFVo+yo5KQ7nGrea+y?=
 =?us-ascii?Q?ube6h2QjhZGQRcBHg3mFuCmfQxB6HYCT1xQoy+JtPY7uzf2rutdlkNrujWlC?=
 =?us-ascii?Q?ZKBdhuXGATeO6TiKxWo7EFHVPGQj32LFDHq+EMMc+5xd+dIh/Kg9J9piDgWs?=
 =?us-ascii?Q?cS2XX33P7q/NEpL3cPuq0fXfnqgqKVtHiyBmjPokwSTRxCcAj3w8Fnw4kkgI?=
 =?us-ascii?Q?x6GFScbOjkNEXvN8YGOWLxbgCMIRsBqJLg/GvTtLGRZv3IerOZk6M5gKcH4v?=
 =?us-ascii?Q?sk1tpxhPnUcNqT57HtTEDcdLo/WnVfviN9BcqGsB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55f9837-ad9a-4653-3fdc-08dcd6ce0ee7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 04:06:08.3861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ufj/68VDq1vBNhg7uaB96EGH9CYAeZieJ80jwFEz6G6n+MPBBE/BSFKOK+P1MtiiY3ZTmmRblqF2VMABbjiBcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
X-Authority-Analysis: v=2.4 cv=MYM+uI/f c=1 sm=1 tr=0 ts=66e90031 cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=cxuC3OuKxvjhVYApjNAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Gb3dcRECLhyR9tV8DcwlX2ihRLgqpLsa
X-Proofpoint-ORIG-GUID: Gb3dcRECLhyR9tV8DcwlX2ihRLgqpLsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_01,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409170028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 04:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112324

ChangeLog:
https://github.com/catchorg/Catch2/releases/tag/v3.7.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-test/catch2/{catch2_3.6.0.bb => catch2_3.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.6.0.bb => catch2_3.7.0.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.6.0.bb b/meta-oe/recipes-test/catch2/catch2_3.7.0.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.6.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.7.0.bb
index c4541c4d5..2d571a9cf 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.6.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.7.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
-SRCREV = "4e8d92bf02f7d1c8006a0e7a5ecabd8e62d98502"
+SRCREV = "31588bb4f56b638dd5afc28d3ebff9b9dcefb88d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


