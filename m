Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1875A106FD63
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 01:10:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5850.1773364202235432701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 18:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MOjSFg3I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75329b8642=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D0vBWf1595185
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 01:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=BU99HnKa2oIpSifHU3XB
	5PfEg4b3rl7EheHJ//ZT0XM=; b=MOjSFg3ISNPpYUT8CKC/ofXClIWAYBCzs48/
	TRtBNIUtuxtNHSK+0Ff2gD7brN5EpSMWHYY+VjeJniNcoS5Ax9MCxtwHB+MIcEYT
	W31jjtl410PoQGqHzEJA60ty3ckpKf1EUcRbFTSm3Sm5fy+e1r9AhvwGYCtGTZ2B
	VhXfl4HI3drh7qKRDzUaD4dp3uxbCxmcNAXrntf0nb512UdIG2YqL2BG7KiDNBvQ
	gEScYoMDgr8REJ5/fWjYi4Kku4wtjDHqkEA/SdBWig19bolr3he6r3nvemQ2y0hd
	1LC5LDuH5zDOTP0SXCT1At+VnlxmFtBgBRJH1N9F+lby+fmUCg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqs054-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 01:10:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frijXZVbecDsNynTvNV3j/HfZDe9P7Qkw3CRGw9qWJ22Beup4pAQi9saObvFnk139LGid/9c+KDkXm8Gyus6lZZDDe5r+cCeBRTavdnB3XjAXzndxWbGz6V3DFOFiwiM32nFmo2KMxBTJ1DwIKTevaR6hXaxYtEbcIe3TfYpcys5ufFEl9JyRLzmRUY+4YR2EkXNaNZL+m3uQ8j4YAiF8dljL7lSwUm8gfnXQ3SCqfECY8EuPCyIOihW0E1HLB2na5yjGv/6NFY8B2BjvtU4MRMwKfDjCClXd9K81gITF1XLqG8Q1QC7/EQPYU6/hqwVCj3HNOBCDVdhBvwPZAzYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU99HnKa2oIpSifHU3XB5PfEg4b3rl7EheHJ//ZT0XM=;
 b=W90aU4IoEFa83vSK+lUI83chqpj4gVCbDRk1eBFOJ2j1THV6Ye5G9Nl8/vZxeUwdfACVuVWLrX5zHO0hyV6Z6iGlWP0wfaK4twxXrDPUVYQ0IVk4SisIALddu9xCQLLWvMex0fTU3GsZqbMY8ERFpTpyC4QsjpYH7nxbTXUQcvn+l4ZhicD/ORouVRJtLDc2l7MJc+j9RPerBNkP9SG0Zoz0wkZjzEJdC4/vxMlCYSheSSqmlwewSwGw4iN7k/3Vl+2foQ5hm5Cs6gzEll5bw6prPt1GdwxsGaC6LSCRwMSQ+owov6GJz9dB2+ZVxCcnd/mnOoctrKeRoty0OdJoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 01:09:58 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 01:09:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] conntrack-tools: upgrade 1.4.8 -> 1.4.9
Date: Fri, 13 Mar 2026 09:09:42 +0800
Message-Id: <20260313010942.3456078-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0187.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: de1cae22-3b72-4d49-7421-08de809d3ebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Y1asO2Kw5soAuTOAVuOm0lH91H0bi4k4nhloDyoxX7vMOfQSuowIKxkptw6Eyh33bwsE2d23OlcXI+r1zYWGPkvtpHO3xnl21A3y/tFgK9E6iSHzyRgJ5IWabJRwUU06Irxa0sMhHKpX1U7v4n9zqs5WHDvUDSip7oRiNFtML7gBT/b1QItHA6a/3AeYdZGemn99Ehxt1HnOZtZDfHGRGYGwaEzgNWlG+0Oaj2Ca5VXjOae4AAFhP7TVn8Il9oK6LF2f7ah3xjnPMQYpHTY4LHkuapADeRfEn3ZYdp8pLaXc/1NqWrYOIPWhQkMNfwhtbqvf8OgRrVO9uvFk458vZQ4/ypZRnSjmVpuuqfNCyod7MYJWfF1iYMwjC16uSJR1E9L5RJv/32DrRqlT0x7d6DwWrPadThO0sj0fced8xXIU2Q2QUwczr4zgME41pB/4gf112zdbSFL/KOipA9nfSMPI0r4hCVr7l3CcF9D3hrdKQnli2RP50Jkr3TC4xKQWnPTIem3511PNodPJbdEotbmGAR2/4tnIMlOUwgHYZDxEfkdhQSPElHa2ZYuy4SIdkDI0QpFqneXpJMZbwQpg6kvFohoeOK9teGk40gIZOl/BSCX/DGeDiXSA77BLbj/kN8nhWxTLt91AUHlTqRNTgGDzHZAOBYr4DDRjCvsUqDamZE4lJ52k+yCr/CSaxIUVBJWBXU4AvjNcgvdSOB5kl/uRFP0Tj0fB736TCnfeqsm0BsZ8fO1u+M1qTqUA3Fi282F3vy+Yn7PUVceqO8Pos+UyhYG4WlmB+6Se/n/CkfY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZzvqU9R6siv2KS1HEUvivprn2FoevOkuKxgvKXhWcAa+OYeKZ7iOxEf9TkqY?=
 =?us-ascii?Q?qskQBxgWIrTEI65TGwHBTjvG+n1mmxYi/m0U3LjSO98JU6hyngQp6VWZsNbU?=
 =?us-ascii?Q?sSHJLRNuWbfsjWXaWjcgkjRY7Po/mHCbjbx3WFzRV/cBEhFKmAw5h7OflsdW?=
 =?us-ascii?Q?jkU5V2oIzXwiP7CCk/XFwmRterERXTDNELQkRftsx4Vulr5c8NnSCKG5f9PA?=
 =?us-ascii?Q?IKCpQodwweZwaB1dtrwU40F7huWgk4MZ/a52hQqQTs/wD8Aqy7+l3c3KSoGl?=
 =?us-ascii?Q?fcA7QfglCG0Eh/ePKn6+sObIQo6l3wdyV30RPYMkxWgXatYpgNAbMVz3xPCj?=
 =?us-ascii?Q?Ui5j/REn7f+lvc6Es6N9cMeuD6AWD5il/Pt2P5VhbfHN0YeDGw8yi1QVKX6H?=
 =?us-ascii?Q?pSveJoaL49z91fV3/uHSL6StcYlS/i4DPec+MlfxRZjVea3XpnAfvDdAmDTo?=
 =?us-ascii?Q?v3veO6VWpapd93NtshGXBwq2dvuidLgZvvXoTB70kdXbEcT5qZyzp3hakEt1?=
 =?us-ascii?Q?//ukdY4BJM0MG+B7hCjnMqq4qvFeDSsb1WFGkECw4mC2Lgk7NAClx9vJ2PSk?=
 =?us-ascii?Q?J54nVk/GEfYo5jRqfnvwW//ykSSudroNAaMii1boZYzBT3DaDow47KbIkbtB?=
 =?us-ascii?Q?TEDRldnlIpRhXguQ4yTCM1mMaHmyDYCq66PCh/+poiBySCsCcEiEWE6G23ph?=
 =?us-ascii?Q?txYWr1U7fOynSB/Rj5do7XyqYtLmhrfZ2ZzeiiFxj0gRsNT1RcAlcq04bC9p?=
 =?us-ascii?Q?f+bRbDPfWSNYgj/RK1l3WXvqBOa3Tdkv/CImrRGddiXONyCwUbxVqDhZz5d0?=
 =?us-ascii?Q?Q0q25479GMmI462i4Db0Bqq+Q85a+KNBh9PkHxJaccKJhXO71IW7/gjGSg0W?=
 =?us-ascii?Q?Sp3XcoUAJsjVhBN6JLMfhmEU05m3UdTW511wbNVzYsn8P6H1UkjZur7cpHCK?=
 =?us-ascii?Q?4MxzGBYAupfXCqbDpdwMW2djycssdnJUmckGXlwxc9qH/6L+SpLywZcU3MnV?=
 =?us-ascii?Q?+fpIOJAGtdmXG/IsQFjvPdP2xZAP+MBE8hY4k8gwyRQEfM1KjaiTzb+F6EDZ?=
 =?us-ascii?Q?pzR2M1mBhBejpCLIRY4J47Z65CqmwLLl8+t9bRPYHovQX/8qwLWlCQl/hXAs?=
 =?us-ascii?Q?HkbQ0WUtqqEen8Zntx/h/HJgwsr6UTs0C3GGUm3VOGQhn+vbQQnY3jboqs7L?=
 =?us-ascii?Q?GdUjPOzr6bfGvECGKSo80R0XSlpFZIWKw5m5v+xOyDFNhqrNEi7cxGMw0oaE?=
 =?us-ascii?Q?QdmxMXw+p0gP5gCRcUVFVs0gzc5rlLNYis1k77/2RDawiiXzA+OKPPTvR3Ho?=
 =?us-ascii?Q?P7C62poJdv34GpyImZrT60aeGiTc9rd9u4dyTHaiHapnBh7f9ez4CoS1C4Sk?=
 =?us-ascii?Q?ygS/MEcY97KJngEMd6HmrfyqAwvmBs9PuqkQzRx8Rq0+yigfbCd6mk9H9ZJH?=
 =?us-ascii?Q?7Sui+c9NXCgaOj9whC5bmWW9HYXOlI5pVSPHH6gUvAwteW5uO73KUksZNSD1?=
 =?us-ascii?Q?mwjDa7l8eOpRZmdss/ac40cGlIhZZ9Yo7jVanDaljYKMvR1fyXwdTCyTyeFF?=
 =?us-ascii?Q?nYYBuUY2wUPMBVguk98fX8+ZS0l1CfCz8RyZDzR5lyLr0gYF1lZcuxU8Ik0L?=
 =?us-ascii?Q?9x5X9mxeiMaPbyO2YJps2ePDDLvgDdTkm9bST+UlKkBbX3++447nrQqrPY69?=
 =?us-ascii?Q?YuE8RMmX6GKqNcm6ZOGRgYwYohCDqMLnZ7t6cCcjjGu/D+tVTeXYMoB3dSpB?=
 =?us-ascii?Q?a/9pDLVwPg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	JW0p2JIDq4Al+tFXsJgLUcdLKdPEDJHOtyF8CU2F8r9ila4IzbB4YMiCKgmTqILJlhVthvDgfx6t5PjZFZYST2nUYTmyYl0iPAowboXID4cg3xsxhk/L/4CUlJg6IpRE5IdZiuBj2B7Iezk1MBxxwFAEJAq/KAApDTd5VZvInK0riNBWT7V39D7ifeLv96LRGj2q/N1hP4l1weuahoxR8isD7+8KktQWtoIcqaRn847KSOR9RD9OYTkLZxp0+OhrWEQZrBvl4kM4c/jsLL0DuYwy4RPvuAYRXee0VtZRQ3mDWn5q/qqwIuSeZ72mKk4jBizU9NDiIgi2LiHnSTMghQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1cae22-3b72-4d49-7421-08de809d3ebf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 01:09:58.7815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raDOBONiBwDjAXY4rnTWz5HW6mJr30ZaZaoQn7rUeh4uU5nRu8gK3gzIgJ3SBSCje5cHnt8YD5hA9BhuCqq7BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
X-Proofpoint-ORIG-GUID: _AWF8t8XpnAfxzw_vJhwMOY7jKzS6IwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAwNyBTYWx0ZWRfX1jz04LYlvdKZ
 A8O/wlqdb4wFil1ite1gveYFQtI2BaZrciBRk3Zvp8Am2gg/9KiCqcO/3ToRgZnSf4wbsxejJm3
 iiQkePDpj3VHSf6UZG0b9Lr6CWJEerhMfsLHnkBu3R2NXuUgSkh6/MN9czG2wyiydjo34999CZK
 5EyKPOzG4CueDX+uTLFTb9cAni1ddsbykg969K44p13xx+cF/GfjMwkjPrEIFrA/aWTFMsb2tDz
 9OXqC+CBnaJOZQtWGBDBYOENzbnFQiDxZAC/CoOYp/ni5mMHNI+62eW8HtNtMuM6AJbfvmgRoZ6
 pNP8QDmk8lYb4hbCu0K/5PZdUqa3rzFtUwCLxmv9ZoFFWLh8a+kDYm5NefwnhHu2RTZoC9gWQwY
 uJfrvj+WLgFU8kTMmOCHDfg2Alo66BHIqMomOtYtjld304KRWiU8YjnJ7lVEkxX3UgWBQ7ITJ15
 MrWbldK1jxUm55FwW5w==
X-Proofpoint-GUID: _AWF8t8XpnAfxzw_vJhwMOY7jKzS6IwM
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b363e9 cx=c_pps
 a=eN70jGNn7EKSdYhrfilGAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=3HDBlxybAAAA:8
 a=t7CeM3EgAAAA:8 a=4CT9MthDTeFyUcsjdNAA:9 a=laEoCiVfU_Unz3mSdgXN:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 01:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125179

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{conntrack-tools_1.4.8.bb => conntrack-tools_1.4.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/conntrack-tools/{conntrack-tools_1.4.8.bb => conntrack-tools_1.4.9.bb} (96%)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.9.bb
similarity index 96%
rename from meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb
rename to meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.9.bb
index 524718d56c..798939863d 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.8.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.9.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-too
     file://init \
     file://conntrackd.service \
 "
-SRC_URI[sha256sum] = "067677f4c5f6564819e78ed3a9d4a8980935ea9273f3abb22a420ea30ab5ded6"
+SRC_URI[sha256sum] = "c15afe488a8d408c9d6d61e97dbd19f3c591942f62c13df6453a961ca4231cae"
 
 inherit autotools update-rc.d pkgconfig systemd
 
-- 
2.34.1


