Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB894106FD9F
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 07:30:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10678.1773387003252135755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 00:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M8Mxq3Xo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7532e9d984=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D4b19x4081760
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 00:30:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=h0DfyL46XlGwLrdecOChbPgl83cUaRlKfaFXwOktHeQ=; b=M8Mxq3XouFQR
	ywoQ/N403RHNEK6OVjkG+bGNVk26tyWMkVZyEeydav5xI8wZ7X0j3gp1kvZ3Ug/v
	84XETHu84PgHW9O+M8hLGMohqCU2QA2YbdvOReGwAATSX430DSKg/oaeUP9sVr2s
	I3Fg1yoo0Vj67oqS0m1k5kwr9zd2iY6tfzIeihp6SjKFuz06R/X7CDUbQV7N5eI0
	4nni70wG2z7l6FVEhh5LjLj7Jr9dvaXuCLI/bCxU9x3O7X9wmTQJfDLH7wOBkxKN
	6nQdJQmYYsXKgrNQ9JVAapZUFkklsduSh+ftkVvotwoBjFFlWUGVTallmz3o1X9g
	EtU0WagcQg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6pstfn-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 00:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2eU96smmVPc27JQUaFgZ8l48lnpbgS0d4NYTdTXU8leb3DQC092HZWVIUWWSrcpoqyuYvBR89nOhvmjK/vLpClMKl8b2AnwhQfxr5BD7G1163nLh4n9hq4FaPOLUvPMUQ+L5+VnRexUzR6swqNnxdvwCD5sdl0il85Enjb8RcpOb0I9JH+7KKlIfnHdTiJ8Smhm/whme3O82QBJ4mAcKl7hWm79NLPTbmUC1g71JMsv+/mj+3wPYu97Wv0JWi+c6gVbwDJmjgXvl+HWLo3eToT44or65zPIjbLAJ/dk6YUOkJfIf96vCB0hDQbWps6b+6QfeikcEiS15SAI5Z+CdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0DfyL46XlGwLrdecOChbPgl83cUaRlKfaFXwOktHeQ=;
 b=imCVn1q9nO11XSChYij2V6oGQza0883iw5R61Au84v4eARsyIU4pZWe7QjL+H5Ox6FUbzfdWGJEr8iOFgenhM0SG20fFahgpFdYnLt3Qnq4AyIk0v/m26C8vZFXwTkGni75EAcegNHjFQAujZJ5IuPoD0JQPWtTaTSmd4l2CMfyBrxI+2rQE11DKchqi/biJl/bNmSd8SkkEsuRzcGc5/MZgcd87lVM2t6W7X/+jTr5J+9CwoLAZtYj8a+uIB00MaLOsikyPbSXDln9nb7femFqnwCnW7m5cAk7otH4I/0N/t21ya8pt6ptoJ24IdBFmzw7aJaXJumRi/Aud0wLE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 07:29:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9700.009; Fri, 13 Mar 2026
 07:29:59 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] libinih: upgrade from 58 to 62
Date: Fri, 13 Mar 2026 00:29:47 -0700
Message-ID: <20260313072948.2254502-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313072948.2254502-1-Qi.Chen@windriver.com>
References: <20260313072948.2254502-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 104ddb92-2d2e-459a-3619-08de80d254c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tqi9k0R23CRRuduzvJ4e7EU0gnDayaBD+jrcVgj65WvCuy+/pyHDSYxMYGsTSQXUBQx1ivYM+jiBhK01uINNt8MBjtFB79ADfoKLC/6Y0x/rH13js1GvD/yGcB1cjC6fJ+FK/gTw2z+dW8nzkEgVQtu3lG//u3PHk7oKVEjLugWuc+Gy3yqSSjIg9Rt3KPfY//7cf8az2SqR17QvBb5AhNvsGy9V8SP7F8kMCut0VbvGaHVAhIERUpDHdtRJ7l6PfIG/Gi9F2fisn36zBhOLk6cy+5v1C/27+kDJcImyDqY3JoAt2zsZQVWBy0MvwHfY1Zug5Gg9L3SEQxgtkMnRBZrFZPSDr3y3HGIfgV77NCGeCQLaPKbggvbGl3ZYHZCbnw5KX9bLfjVBLfkaQwPHZThXuXiQ8eQuj9OIlCwEeBr5oAA/Xgdq4wcAPll2m81KKrpZAOkRL3eENxIeTCPQsj7cYUw+98ZEvBrt6LuQgM/SkD+Gg/v88ZLhonUU2H5K/4Nd5Jr1ZTcYr+E+YzJRuRBQy0jtIc61rIo6B1SUNuomCj9t5kPTkufkgWhDDJgJPSmRJASm+hE6XzLgZ22jW3cx7eOUr+MxfBqt29BE1ykppB86oaGW4SUyoVoka5YoQuV6ZGt8Bn5weepXE069B8cRV8stP1EHBYVp42t/oLNyG9lU39kL2MAe//x4a0YVl+9QLUpdipPK0S4dSZQlFddX/VTtxaIfWcAEFmmw52UHXmtbP9OAzzq01nla5N2ePQNvUOKp5QJhkuQZN6mrPfkdrp5BSmFjFZtNGn1zplo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rqR0E0tW/Ve7rdE1zLqm7iWVYMxn06jO821STvNzfON3PWK1lXLw12nlSuL1?=
 =?us-ascii?Q?mecmc82mNPoV/UAPNIsS115vw8gdSqsPV6ZU3roEqNW3eaE6tx6sNMh4IPCo?=
 =?us-ascii?Q?KMAz6jw3kgSU0cwMZijajSNFDlm14IM03tFdDpYHAc8kr5DhwgkhJ7rXw+hM?=
 =?us-ascii?Q?ivuXOCX8z0FZjiTkYi6bg8cm5cgFm78IwcRYTaUsgZMQ96q70rYeS3jEXDJP?=
 =?us-ascii?Q?gIRqTkkx3eLpkjI0caQvH8rEp5VUXSkGhnrp8nhkVOchnJb8PRe9ari+2T/F?=
 =?us-ascii?Q?7CK1YtxXAkCA+VwcoG9CvC/JxRNcKE7p0xIhwKYtFUek3Lqze6i7JXcmfBXo?=
 =?us-ascii?Q?I2dLDl/JbTX5gp4E6fmgBWbnaUHE101WK9aO6bS0iSaV5SFwtAE3SFBKFqa0?=
 =?us-ascii?Q?pHx2C0ZNZVnBErxT9gWYNmC5U+j0+uheWNXjQRpIS6ZWxsFhVN5wkHS3Tx18?=
 =?us-ascii?Q?DvClDAcjbYM2ErPPNZWL6hmwFNvwBaiRJoNPscW/WqtiV3fEZi/PdiszL7M2?=
 =?us-ascii?Q?1TGYotLKDufy53MSamZJnFiynciQ717OfshWZ50eeruRa5PYQR+7l1f2Wcki?=
 =?us-ascii?Q?PHvySNW/iZzssYpHHYXOyGRmPZmvh5GufyQLOeu+ntyY6uTBd7fYMXoZeR8q?=
 =?us-ascii?Q?FJ5H7ch2Tvt+8gmhL90Q9QmYj52AdaVzymdY1fRgoN98WojTt9r075WNMH1o?=
 =?us-ascii?Q?9U4DtWHWLRVOb9yrgJgXE/1dbcpVEJcQiu36R6RRNkfQ1nMGkx44bTp3LC3I?=
 =?us-ascii?Q?eVOyIhGKPLD0QXpE//oVEAgz8Z0i6a/0wyJDbwl90zUEyNdVHeV8/+u+SZBk?=
 =?us-ascii?Q?3mVY9ByoGdrtmZpmm/NEgZbCbaGZkFhbI04G1XjKoDxv/BX6WuWUffzocwj5?=
 =?us-ascii?Q?lV5xdqmIqZRCHeL/sQQZ00XdiKcOBP2ODe/49KsRxb9wsDyfi2zRbQWQYIX6?=
 =?us-ascii?Q?3YLJFAcKIM6VZq6CUrrsBVINBOdy8apyPgZATqtZno95P6P0vPzblwzKzSIM?=
 =?us-ascii?Q?onsszmgmn/E5/2VQ1bvOApBkJY7nEnhckKv1sw/Ndgy/6nSMWOXVg9uiRfEX?=
 =?us-ascii?Q?HT7RP6Pnoz2wvPPHXtypFZQYg36oQtfz0mQk5uRtR+2Ke/TbXotU2xGH8+1A?=
 =?us-ascii?Q?GeDJc5KvJbynnC1cgYnqVDbh0DrJmxEv9YPz5cgEPqoOUe4dmS3vho76A40Q?=
 =?us-ascii?Q?8aFpuALEfy6FTr2hiPhnNh7OIL5/lk5nhnw72o+IxW2nfMMUH7121QGcROXi?=
 =?us-ascii?Q?VGcg+SD7Nx9Nq2tyXZNv2BxLI9sVuzw0kwA3BG4LQKeMY87u5nZMrn0uvbRZ?=
 =?us-ascii?Q?83kG13/aBytYPSogbswwkj9L94dIc6sVa0Jfm4OH/ZSf4RMlM1ujx62dV8Ln?=
 =?us-ascii?Q?ACLqEGB6vMo0ZyKZAYz6cQicKOFpIbWc1tEnsh+wCUOCsUTHU0ML6n4Z0ogI?=
 =?us-ascii?Q?5O0kXwzbvNEWKM32Bn/ocyiFSthigUQmSLOP0fOUuCNKz44QswzvK51clZmN?=
 =?us-ascii?Q?8ooD8SFyUoNZSfna90UD5MV7StQkXkSKSbko/RVrsZBCYWGKMhrjyiI/iU93?=
 =?us-ascii?Q?bkwjPpx4hDP+SZ9EhUPUbqd22GiOQwMTCxNx798vGPWivGPX/FuVG5TLRH8u?=
 =?us-ascii?Q?Qblst1KtfNvjuebh3fjvudnqijyocHwtaZP8LExN1LSI+dOPsFr9a7KwekIh?=
 =?us-ascii?Q?DP4caO4kVfpjyZPZmP2JHdC9AB+xi8DR324PP4oZqQnuJxjnbyJbtMmnr5Wp?=
 =?us-ascii?Q?T1yypCXV+Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZPwmryuuy+0QtJuRfO0GBy1cRLtyyEje/k4kaFCyRI2EOLILkaRv0UMtKnztS/Ne/Q75GSb6ZXWnI41iPx7WV4IMJn1WQ2CnGPilsSTn/CaQRhV7XQAN2YKZ1J4mREUT492+k9/AMU0zfWOjo5j08WzmYNWfphnAwHf+sz4EdYfn9fO9EkGR2xMBMNmRWEFXAadWjWAP/whXdQVm7KvW6ASjqh9RER1EvtKvjmwnVHc9GmV1Zt+D329f4Vxo/f7lhYpp6OpL3034UWLmobK8xLGIUchjsee/H9n1+RpglyiGYLmKkktn4xhKsrAi1rcb2L2jLY0esJU09Ve6KDFL/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104ddb92-2d2e-459a-3619-08de80d254c0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:29:58.7824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fdfQHfJaV7pfYg6jRvctl2T1aoxXML7v1XUDQ0kwajftknIVr+RRXVLo4pQi9KBo1GTWlGemcVX0TdiHv2OsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b3bcfa cx=c_pps
 a=WVTIIPXEjO/6WBYygohQVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=B1g_mI1oSHGHyRoNfmMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FinlXuWEIJqt9MVruc-7KLV2fD4xf8HA
X-Proofpoint-GUID: FinlXuWEIJqt9MVruc-7KLV2fD4xf8HA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1OSBTYWx0ZWRfX+iCLoAP2/mmG
 D7Fh8vhLME+1e0bksqVMVPqiGzWWR5WMf5um6/wV3KlRQBHaV1BMikDxhg2d6qo6CY088bbvdj5
 pNSZpuOvsiC7DdVhzWEChSX9HWeYPGFFaI+TXyrH+TRnyKM6dT/ACp39XYaFYRF3MZboR2zXQU9
 SFm9V1VMuVVN6NyBewHLnZZBXt35ZeqceuU+ffu9hQMG8DII5/3j6/6pI5AkJ/LBXxxEsjaw5xW
 MKsRdRT6Qiv06RvEnyskhz6qe5kLESByaicbtlg8pzBn4blD5rYoEulsM3ZOXPFxIUr/GDVYInT
 TMVlPi9hB+hLvMx5viX97t4RDDZh/ZroG8haTzJ/9jR9C5bhNE09Q3I7SBV/e8xHocczhpoEbIk
 HAMwGqQsUuEuGlVdKyfhuItLZ3N2XE9enWJxb1Vzfz5mHqEPs4JohEJRhNbAf5Ii7afFdecgSwg
 Pfi43+vQIBdKdL2zpNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 07:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125185

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade libinih from 58 to 62.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/inih/{libinih_58.bb => libinih_62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/inih/{libinih_58.bb => libinih_62.bb} (88%)

diff --git a/meta-oe/recipes-support/inih/libinih_58.bb b/meta-oe/recipes-support/inih/libinih_62.bb
similarity index 88%
rename from meta-oe/recipes-support/inih/libinih_58.bb
rename to meta-oe/recipes-support/inih/libinih_62.bb
index 0ebeec6851..2ec64c7e69 100644
--- a/meta-oe/recipes-support/inih/libinih_58.bb
+++ b/meta-oe/recipes-support/inih/libinih_62.bb
@@ -8,6 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a7a95d2af90376e85a05318794e6f202"
 
 SRC_URI = "git://github.com/benhoyt/inih.git;protocol=https;branch=master"
 
-SRCREV = "5cc5e2c24642513aaa5b19126aad42d0e4e0923e"
+SRCREV = "26254ee9de7681f8825433415443e7116ff24b98"
 
 inherit meson pkgconfig
-- 
2.49.0


