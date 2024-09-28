Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84C4CF6497
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 09:34:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10467.1727516051887774597
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 02:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=900161c346=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S9YBxK002547;
	Sat, 28 Sep 2024 09:34:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x8s889j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0JWc5YUAUeVkpXc7U62gOh8YYa3SHLqeYA3yE90Djb8+M4pPMkShPKuIQeo8CRooRhkve6WOe4x021/SUQbY047E7qrBYhzeqMg/wZzySiWVxeM+iqvuTN+hjXulGWt/Jokr6JezAGMuQZ4z8wpvQYqD74b+plmbJi8E6iNDUBVnmernjqB/096SYGZccpl1mqhViz0+xvzWV7fX0IWiyDphyNKNO8+rLd8AyQ6kNrR3C3CF1Y1Fb/t9h6mrf2pArPjpL4bnCQqoS00O1CF+xV+QG90e8OF0bH0tppX/zPZ6sEGWKDWcn23Hkw7cb453swtluUVa+GhLI0EiLptng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz7eEj3YCssm+osY63HVWfHJJ1cFuLB/1XPGhWVXLlY=;
 b=eWRwrj98MqqmzJf/LxqQ8BQGo+hfLFDSU0XmDK1ZBShnDeDyqW6c9HELwttVEh54nvTDg9XLNn+dRpV0KpRR8HdBDvxQjjFNTgix86kv/EEP9KraCC0CNKZrmQA7zPn3lYzTl5Emk1mxWF9BiyGLp22XmTjHfe+lg4br/L6AqBIZfln462tezsE50hkW6UwDHj3Bhl42zrR2a2QCi21LtoOp8cfi1YA3LlqvP72mhP3BrJx8UrTi3FPxIlhCGhtj5HVtRUR9UAGePg52OLhYRPiKagDuIzkwqSJkYjBQndj0lMwZ4D2ZvHgLrK+0pwZAKrGW348BSacLOPvNDbtg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Sat, 28 Sep
 2024 09:34:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 09:34:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/6] gnulib: upgrade 202401 -> 202407
Date: Sat, 28 Sep 2024 17:33:52 +0800
Message-Id: <20240928093356.3992191-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240928093356.3992191-1-yi.zhao@windriver.com>
References: <20240928093356.3992191-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: af7e5107-1d26-48ef-b301-08dcdfa0b344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IwFBz7AjGqg4fYyFt5nfDfIdzkCDT9rBDfdY2dAKK6oGWZrPwNAGikp3IniW?=
 =?us-ascii?Q?UOY8VtiREWrNyRNd9xGt9EFiw8GXSFokzLEGVeN7Y0ucs1jIyY+YAiJe0F1S?=
 =?us-ascii?Q?d9MK018tzj9QXzvFTY0plyeZe/pcTgfCa0jLmFnVyIFshF2pmRTwAksG71PJ?=
 =?us-ascii?Q?OY2IEaduENeX6+jzIfSwd0iMDzkR39N4/Jr1KuDgg+Um742MvRf0wjsVGhx+?=
 =?us-ascii?Q?LUy+IYncFP+m+WhzhOmTul0zV1WPCpabxQ91iygs7yYnqqBfYZYHoG4XldeA?=
 =?us-ascii?Q?arfq1+9nKbZBpNebVMuA/Q/p+ofvfKyz/MyYCUuqK8qxPWHpUjnOMsSURjHh?=
 =?us-ascii?Q?Pu/SG/zwWus+Lh+hpdjjTZp9RWHiWChi7cXypqWBrCYDo8qiBk+IsRDyP1KR?=
 =?us-ascii?Q?fG0GxpW6XoAtgD4FFj/5Bki4HknxxacWFxYZ/og5YzBOMHTL+yRQtp+r38u5?=
 =?us-ascii?Q?HDursyfgaZU3TYNd1lmxBojeJXSSa3TTO3uiwEMgJb5b0jwpQX3ScPsCJQz9?=
 =?us-ascii?Q?jguphzMlsz4EUl3txuRbjaWuHpfqAtXTvuJXYb3DD/SToQV4mK3D1xk1qZnd?=
 =?us-ascii?Q?Ms/ZRyx221LBeezUx0Z2w2zLre6ruVYmDlnTGquFaFOeg69o2tgpRgZvHu8Q?=
 =?us-ascii?Q?FQcoteHp+in4KNb98gH5T9qZIibOFm05x1EpO2fY1OiHVkn9de0O05FZ3jx/?=
 =?us-ascii?Q?vd+qEqm9vX73FfiOs6E2lLnseGKizxPZTft6bRbGH2gFhInnd/z/Po0mboSC?=
 =?us-ascii?Q?7hy034AsI+/zFk/7UljFkgphLdOhxaFutK0487b+5AdRNNGWiquibYICM5St?=
 =?us-ascii?Q?BT+fFxx9TN0NQCovnFVFM8CFpzGWsEzk/FlInehmUMQuwSR0DVT+c1MsvqT+?=
 =?us-ascii?Q?HUaG+w2APch3xBOWwGOo5Lkl/wAENbVnKCeEIbdu0gSqIdf6koqYLknj04Hu?=
 =?us-ascii?Q?0+ZfTDIoCYg3Z8WE4qVhBSOkLPEP4CPViadsnMyv1LA4yfCCzn6wPOX+F+GH?=
 =?us-ascii?Q?wfwsmIPWRGc4Qpykvzy5ixYEuwsq0WR2SIhGiikBhVqodGx0/t6DpA9OE4Xq?=
 =?us-ascii?Q?LFeirlprynmWpsrPKPmOZxf0i4LozrwfaK2MdQFaWFzv+SSLxD8tRpJoiPzg?=
 =?us-ascii?Q?Pcpl6fExbtagbDCVlAldYF9y0i9vqGvTWi7pOhOxGaBO8Vx4dEDLypbleH21?=
 =?us-ascii?Q?kNu2jlBIrsVq4hGSpKMeHEBIptlfoLxZzt9dzWumgVtU6hBh3ium0FbLPDjn?=
 =?us-ascii?Q?tmPc47yd1AmlB/3txowdypsH9k6D7K3Q5j/NDFfPe5dK5ptBjAfs325EmZQ3?=
 =?us-ascii?Q?kNo1tRwMDXGHEb9KyxCAQZsLwgUSiU/HS/JsaJEx9HrQ1Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fl+PBhTNCbfFGfKWXz7pFPhkQPw/CkjR3yNRL4kiBPLY7zZlyr8WOhcndr/h?=
 =?us-ascii?Q?xt6Q+LbMo1rVYrUnygB04XbqUJm5tXm9goRsolKQ7DN1kMTWg0Z/ZVSB15+X?=
 =?us-ascii?Q?u4L0W3TTD1KU2PzHOJTTSwwDJizzjDzYZy0O1Iv+9/y8XvdMzPkwQ+874b/W?=
 =?us-ascii?Q?hDqKeS8JW6srySTw1vj6j6qmCDdclX4sKb220S1615piUnGIlNv3eYBj3eC3?=
 =?us-ascii?Q?ErFn3gUOVadsxjIW69ZynpduNqWJKPKP5XxNodfYsjIWGpV3jUrP3ZMkurx2?=
 =?us-ascii?Q?YrNHj4fHG7d3ZPOwtBYuF8QrNfCRHxQW2dxVel9KvCzcvj7Kbq84LZ0stuFw?=
 =?us-ascii?Q?0Zj2JMIqhChS2a1MbLWjJj+LKQ/05afQR2o0yFU5g/K9A3ApSyzqkXMgKFlq?=
 =?us-ascii?Q?/32ulpEsWTt2BwdJPx1FemQsUX8qlwSK4F/tc1OFlWhYr4XojFWAaskH4+Id?=
 =?us-ascii?Q?UZEhgsX+fihm/hyOEyDDxZtigDraN0d3VuKFN7gOAwD3FKbqDRmm0BfcoyWY?=
 =?us-ascii?Q?P4XyPrzOzV7gZJbmG0+Zl2wD31GARrN1+BPVXg+EWUWrBphLDcYpuqcp3vqm?=
 =?us-ascii?Q?Ic55Dcjr5oQhbNKOeWsCs43eUvBhbH9ydeqXKdG6mp11/fKn7ZVml+dSjtJf?=
 =?us-ascii?Q?mXL5wt7NIVq6JlaSnL2jN2UWwrBVV6ntClv+/ayB/FeCb4mD7LIu8J0jxipB?=
 =?us-ascii?Q?cNpR8su27vz6pQkDMaVQIHhcPCm+G3wIB8nTFtJe3hoNMxAxr1ZC7msuzRCo?=
 =?us-ascii?Q?nqcvCrl8BTverhIOdfrnRrabslQwBrRdVmCREFjbmqJDa3sgi+c0mQt4f1Vq?=
 =?us-ascii?Q?ZBjXf9sPvP4Z77SZAlUIJIKlDZf+PhvxKLkidHcIylr2e//0uTNmwINCDAok?=
 =?us-ascii?Q?YmHyx0fmE3xzT3evTEypr3H+g7q/irlP55FLOFYQoo1DIgqPckdgOsw5am07?=
 =?us-ascii?Q?FpVHoEHd0rfh/BwZvEcKo2Tk5Ml0Tvg9XMuLJcygY5cZjtacD+cp3lnZDYZT?=
 =?us-ascii?Q?UfN6slMlRt3oeCofhZ9GHw0WmlQhK13b2ZzY1LDWKPPBmXVLB5R7VoKsUyav?=
 =?us-ascii?Q?MP7JDFGsiAThuiMvgGjZ6STZL/Nd4tPPrHB63daPqU5pJlM+/EWc7tFrbEek?=
 =?us-ascii?Q?PgRCo0Gl40yBdlnq+nF/hrJkUrxkle1eJRQP6APO6SO53DTD4zLhFZXDMYRs?=
 =?us-ascii?Q?blL+OWguHmK8Tg27zQkXDbSkwIwM9WnTVwPP9PaRYVya9kb7z0xcU7E4PVwj?=
 =?us-ascii?Q?U2tf6OvkmQ+pheSdSkzqTIzl8lFfEoXGXadX9kavVkR3GW1MmEK/gdWkwpuS?=
 =?us-ascii?Q?+FHAmfliRT/lipillJ16LOLg5NTfZvmTOSWSpkZAe7oj8oNoGoB9czunvRmz?=
 =?us-ascii?Q?niH1x0jHrI6T4bVqmWpaAutlu1YpPMc2qPqYBEUx7zVxsEZIrJOT1gERemtN?=
 =?us-ascii?Q?nn8XOuqNkSSofT/d5YeOe7NRYdTcZ0YrDb3BLdXwVRhSj4Zk+jZ4P0EDytr6?=
 =?us-ascii?Q?NocaIBE39hFe1YjPLA/GENO2I6mNlZqrNfQ1JnCTCNVkSonyHegiAr13/arX?=
 =?us-ascii?Q?ZfVTincOIvWFaanIY/+N6cHOQqxdcKNgeE3v07Ua?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7e5107-1d26-48ef-b301-08dcdfa0b344
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 09:34:07.7722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztVVq69LThyDwcQ4oYnjldRKHeby+F3OFZAeuWjPZRO4qNCrkV1ipdxlqkI3kMGaACeIwx4u3YQHEIzXN8avaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-Authority-Analysis: v=2.4 cv=VaulP0p9 c=1 sm=1 tr=0 ts=66f7cd92 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=yk4_Bq1XnfGXVRKrWggA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: prBkcKkzKphovnqOrr6DnmIMXGo8AZit
X-Proofpoint-ORIG-GUID: prBkcKkzKphovnqOrr6DnmIMXGo8AZit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=939 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112534

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../gnulib/{gnulib_202401.bb => gnulib_202407.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gnulib/{gnulib_202401.bb => gnulib_202407.bb} (95%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_202401.bb b/meta-oe/recipes-support/gnulib/gnulib_202407.bb
similarity index 95%
rename from meta-oe/recipes-support/gnulib/gnulib_202401.bb
rename to meta-oe/recipes-support/gnulib/gnulib_202407.bb
index 41675d358..6a8e9d222 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_202401.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_202407.bb
@@ -11,7 +11,7 @@ SECTION = "devel"
 LICENSE = "LGPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
-SRCREV = "c99c8d491850dc3a6e0b8604a2729d8bc5c0eff1"
+SRCREV = "02ba2f41c6e88f1c0ef2f90e042dd0b0e44997dc"
 
 SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=stable-${PV};protocol=https \
 "
-- 
2.25.1


