Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717A5CF2579
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 11:50:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30141.1728820215462126124
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 04:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00166a7a54=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DBfi1m006150
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 11:50:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427g38gym2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 11:50:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=givCJZPocQvZYnMUoen5QIM0io23/Jwh/TxBWKG7chN7R9FF/UQ7Bfdc6GgacAfjA/gDTakG2xLFEpotCVLj3ZzplXj28N/LEuTAl5Mt4o87tzOKWzATUqrT9yISaY5PUosobj4N4dsmPlWhGtWkX2JWj7ZCrci0kgvBSjkaW3zA3X47YkORVLZDzF+M0BVfnQ0I3H+6sedwN2gKwuPejtD7URYLnxjTUmQCjwhxCPs0a38giVvDqUPgw6o6fyz2SZqYulgl8Slq3wdVHtVI1h6nqU0phVy1JNsDIcSd51ElniUrtIvBZxe+8iU6rLwZR3ZVflHrNA8qwvx15WWnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5YGLyjO4P7lMkuOJdb5XVBOzGcKWt5COpvRSlrTV5I=;
 b=hNjN/VbMQ2sCGa14SwTqbN17kcTDT1NNLTl7o1CqR8n15cajUQRb7+fOqOTV7T2ULo4NPuP/Rau6SCZYplcRrkvLhHnsIQ9e+6l+Oj+UbWJawWNTI5ZNhewqBnmgHZJ2HI1/M4HAXeHMuiXQ21tXU7XCitr2snAN+oAHZM5qfZ7Nf4N7c5VfeswObZnl0wGbxZg6RSXEDrDgnZbiOhNvV8CEWbB1mN++HoFCWRSuuDzx0GkV0xuPpH4uZkXmO74SNK8qix81O7Gh0lKlcRQAX0C1XF5CIiDhlEfBn4c/SdJ/8wtmhTxig+56HqRN5GKAh2iFCZgko8aZ5vlB8LSkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW6PR11MB8439.namprd11.prod.outlook.com (2603:10b6:303:23e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Sun, 13 Oct
 2024 11:50:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.020; Sun, 13 Oct 2024
 11:50:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] open-vm-tools: upgrade 12.4.5 -> 12.5.0
Date: Sun, 13 Oct 2024 19:49:46 +0800
Message-Id: <20241013114946.3456718-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:404:56::34) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW6PR11MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 3577d432-e57a-4c9d-77df-08dceb7d30bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dcPFPxiPaOIlED6GvCKOYl2OakoFuh28xQ24+jICzTeRHJPm+h9E7yIWx3in?=
 =?us-ascii?Q?ThCtx4d46Clf/oyC6Ex0YG29TTiIIVEmapJU5k/CYASrVk3slAw+Fj+xJw0n?=
 =?us-ascii?Q?6KvFoBBNWMlbXzBgNM2KdqCW1sAUutrwXMrx57aDrkZ6L+dnxfgzmn2dJ8m8?=
 =?us-ascii?Q?wsIpBlJJUc5SH87zdlbtAvL9/I+nYpRohOyz8MSOCAr9bscasv8Dclinj4EZ?=
 =?us-ascii?Q?OZD9UATh8TnsOFhfnd8aF6fqt0LD84SFXUeHD5lYSoxzkiHm9INmZDWEad3X?=
 =?us-ascii?Q?cLWWyPqbvuqOZjHWeB3s3RolnvNuAGnjYbFFhWI4YavolxqqZQ5uPeWun2x8?=
 =?us-ascii?Q?AYRTQIacozIqGED2IaPsVBxd24kGNh2xQzPwygIHOOMknlURjoJU4zHFa0W1?=
 =?us-ascii?Q?073ktxfhoazTrTRfwmR/VmdXgV/UZejdMGGLsePF2GjiJbofa5TndXAPFSea?=
 =?us-ascii?Q?+oWbDeZCKpFV1dgPjL5qUeY6iN1A59m0YHEkkSwYjaq94GQ/KSZl2l6Na5co?=
 =?us-ascii?Q?LXJPEfp94DCQ0tA5LPZ47iF4xo9IoEDx7H7CzW7LjjD0okONwsvwPIH7L9gR?=
 =?us-ascii?Q?hTVH9y5L7lorVEWcaqhv+NW9kgvhgAMTad4oyL0cz6yjJcBh+RDcmqU4VI9E?=
 =?us-ascii?Q?0w+gcGASyUzw7xyeTZsDUOpE6v1NsqQmkjxn/6AvJ1ebv+MCYQqE0wzwKOm6?=
 =?us-ascii?Q?FPF/AF0A9xAnvMrlLt3dcVjDYC+2YWmyXi86nX3jORaM90bZtRdDEB2KpB+Q?=
 =?us-ascii?Q?lf1Fen3qQYTmnx0EDkbyy6ljw+4vww1OmyGqS0u4rbS5cfFm5Is5Q7MGYMRl?=
 =?us-ascii?Q?Ca61yotXo8osE1s7E+bCEHbCdtbs/yHo9ZtmcjnEWd4HQcWhz90s9EIk2yW7?=
 =?us-ascii?Q?WJu6qPFayvYI8dTX0NWxFdRXcGsjxag1x185GwGALQkgA1lOJb5Y/Fmo7Fvv?=
 =?us-ascii?Q?e/BCMYqVWV1l57e/zn7QZtpqcwzB7w4wWqD1b3kADAM4j+ginh1WkiCbkBaI?=
 =?us-ascii?Q?+iRtRjlNimfIVOvnprgPJUBegqJbUdPPleLSJoGfta1DeAD8AOS7aYlMtLF5?=
 =?us-ascii?Q?dn8xUHykEASBlFPq5/M4c2gTMEJN4+aE4JvqVxmhkKxn4C2XGiIKL7eAxR8u?=
 =?us-ascii?Q?Dgij9KvGtxgsnLhomnMSyIEk95pfot663/Y9ATQ1EWk8yXVfOERzV8wp3ZoL?=
 =?us-ascii?Q?Yg7GZNNiLEAqYppdXUrSfqGel1QsblUQxTruDT3R/hGwPrQJi+F/8VulWXsd?=
 =?us-ascii?Q?fntMIlYvPWuVsJGr/SLDWOepoHb2TsrmtnIUa8KgWHSLhl3AIUzHILsf86dL?=
 =?us-ascii?Q?J7qoAi0SK3MYriispqAKwDwsJsCkyaAYEI4GK+29/pf8ng=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QngBUR8Wbjmw+vYcCUQa9gFPdZ02gxUsNW8KTo89O/B3kbFA8WoCdj6TMx+/?=
 =?us-ascii?Q?vaVCkeezsCrz5uSkeHHuJUf3qsaCMwhYqhHGAPCzMyCsMbACqo5IpB6WBvz7?=
 =?us-ascii?Q?XrG4hNis+GWfKenGjJQz4LVctgLcSrWWG2ZD2tfM3vhlxOmoAfCBkcplo55F?=
 =?us-ascii?Q?iQUJIGld+hDAdYAgOme+i8H+SeIR64MYTPuZkLfDIxkXcHAZJXJnA0NqBeOe?=
 =?us-ascii?Q?3PvJJAkGUwQq/KYoEpArvB3nwX+En58Ys7tkMEykeNcBOA9ijAxVsPiw5xfE?=
 =?us-ascii?Q?kCO1zvHVcAthqXlTlfMaBpPV4f9131RA4PkHYs57EkkdL7blU0UB7o0EUSl9?=
 =?us-ascii?Q?eALOLo6IagwHrEM1Fm/3QroVDi1ALDBWIH8KHqCN58pbLwlKiWCF/n57B5/5?=
 =?us-ascii?Q?NQN0Pof+tUQpRpFaHVuX6CAusZzJRHZyvTUTv70wNGExAhx2FmMHGOz7PRNI?=
 =?us-ascii?Q?F8HJEKsJo8yeAo+eRFQx0ZoGerOajkS69ioyRdsjmS+JlPP6PnYu/ZqUjrRd?=
 =?us-ascii?Q?qH+5JPMdHWnhs0KcvfvuS10lzGTLP7Uj4iFmw9Osibsmw4YvNs6BMlwabeC0?=
 =?us-ascii?Q?OX4276Y/l9EPBDKf1vgPmR/qzkvHULDCPx77wIeUKTV4nzAlf3cCNQkaWguK?=
 =?us-ascii?Q?X7H+NZlymM7VfaGA9ivcIKlNJ6NfKbLZAMIEh1OEBE01LTwclwfRHBoDDKYU?=
 =?us-ascii?Q?nKOkD3i76059g+m390Pm8TdRvSNB1uLmV4NO5xNTipZlKxgygNUjmUbzaotM?=
 =?us-ascii?Q?vzzgG6av3+6YXi8Irf/rcZx/Ng5RfXj/PeQPxUmfOJxkiCo/EZEb/xzUqNd0?=
 =?us-ascii?Q?HcoyZWKRLNWNxZcl9870P2YgrZvx75udXCMwf3pDKIUyp14YLbURkpXYd/Jj?=
 =?us-ascii?Q?hf3sTfn3LEiu9OTn0NOQPX66m9EaV6nESwt6ZywgxGETKSbpU27bUtlQDEMq?=
 =?us-ascii?Q?sGBvCYdLYzIeL+yPJn/3AHMW7xw3dwi7ocfLEJjS+RX1KIUYJrE3160H23K4?=
 =?us-ascii?Q?JccA86P6aHRk5iOoUoTSxCJ3OqgzfVEp70QOeGjdyi6E+MXdysZHGxA41I6E?=
 =?us-ascii?Q?0JdTTUxCnTNR44eXMD4CvHcOiPAJkfeZRdcbF2liZolYnAM6cQ6wgH0EaQk0?=
 =?us-ascii?Q?KT/Y3Nedb/ZE/tzMgF7+mAhw0I8sWMaW0x3M/OeyqYLHgwdRjLvd9uNtT6ye?=
 =?us-ascii?Q?+UgQEiuQ/VYhmzAxQIXZOcMFmu43sGLm7WH/YKJxHKKyvRnzmQzVlDpMwie1?=
 =?us-ascii?Q?BKYj3O2niTDGKEZZz98m8FtcT1YeiQuohO7gN+outJJqsS64UMD6lzO17VnV?=
 =?us-ascii?Q?gmTGNOx319JBgaRBYnnwP4PZYVvP6HdwTLDhxjyk6Eb7y2Up7CvOh2mZgDZ+?=
 =?us-ascii?Q?or7qBDmmdJAYDWcf+FrJGLtKC/F0vRsHf7BZm6FxYsufaFC67XoGDKYB00CT?=
 =?us-ascii?Q?Xx457lQgK0xH7FqgiBtVCnJvkhSfyCTK+QUOyEn90C0kn/45FXVFtv7F79Rb?=
 =?us-ascii?Q?Q+sohQx0l4wdPuY6JcnSW4l59sjmKT93dfY75UPaVPAxvheOLY1TIvpvGBI3?=
 =?us-ascii?Q?kH8pbmexzTIMopeVYWP63oTkdu8QXFnaKhXSJp3R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3577d432-e57a-4c9d-77df-08dceb7d30bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2024 11:50:10.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocLm52javynvVUjuibUnUUsUF1V+QxItHVK2dlEJgZLEKUMDqx7SVZgd2RfsTM2SB/PDboDshiru7GLnOF5Pgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8439
X-Proofpoint-GUID: 1Qyzktj5rcHcuFGPPBT1xZKHHgUupTt5
X-Proofpoint-ORIG-GUID: 1Qyzktj5rcHcuFGPPBT1xZKHHgUupTt5
X-Authority-Analysis: v=2.4 cv=DukE+3/+ c=1 sm=1 tr=0 ts=670bb3f6 cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=-fUQoOGy2F-7YDJDs_oA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-13_11,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410130089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 11:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112836

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{open-vm-tools_12.4.5.bb => open-vm-tools_12.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/open-vm-tools/{open-vm-tools_12.4.5.bb => open-vm-tools_12.5.0.bb} (98%)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.4.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
similarity index 98%
rename from meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.4.5.bb
rename to meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
index 217829193..d44709a64 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.4.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.5.0.bb
@@ -25,7 +25,7 @@ LICENSE:modules/freebsd/vmxnet = "GPL-2.0-only"
 LICENSE:modules/linux = "GPL-2.0-only"
 LICENSE:modules/solaris = "CDDL-1.0"
 
-SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-12.4.x \
+SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stable-12.5.x \
            file://tools.conf \
            file://vmtoolsd.service \
            file://vmtoolsd.init \
@@ -50,7 +50,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"
 SRC_URI:append:libc-musl = " file://0001-Add-resolv_compat.h-for-musl-builds.patch;patchdir=.. \
 "
 
-SRCREV = "9b94132f54fbed0b86dce04ff4402d1d8fd059c3"
+SRCREV = "f2ca37ef3510543172657b82493d1eceefa9a134"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-- 
2.25.1


