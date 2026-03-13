Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6DC106FD9D
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 07:30:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10648.1773387002818007913
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 00:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HTOhMIku;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7532e9d984=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D4b19w4081760
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 00:30:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=pQtGOx5TQY4/xmRw85Y5sNsCW229t/TNdQLnacyV3VU=; b=HTOhMIkuBxBi
	4Y9VFjto6sZlVR4sFXNoGv8TNC1WT3Dns1p3m7D1feiULeeCpHKCXcDcGPePs1jm
	iPXpMxTUEoRO4RDQqSmdJdBLQKMsK4XN6ZiXZj9S1x1HJCk12y+e1I7Nl5UeSgxV
	EPRWp/3tq8VslWxqv9C0Bp5n1PcDxfRbK6LUtr4k3KBtoJHTfNjyPtTz3zAFMlNa
	r7YK0JdlH5iZtLFVv332JN/9gqgYETS/Qi4kqhWjKrHBLoDKBcD5Wrxq9DGjut80
	vMmO4TWyLaoAyYPCZcF3FdYN/zrQtsXIdIAFaYeXYGljMacoRFRBTNP32YtvSOUx
	MxlUjQ4yGA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6pstfn-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 00:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORiP2jBKA3dOphc//402U3sWxIFfmJFAi4w4EA1zszGEisVNmf3iB4UVdIanxuEAkELgGhy4xgJ9MP23tRVg89z6MSfn1dmR3dhpshrZ3Cn048tQzJybc88Etyjza6VIrkehGZ0NNUzm8oY+nMkH8f3tTrHpO4ntFvirmtbJeANBGljD/ddKD1hA4yB1A44BxZRr8FZLtyVsBPzK+xwtdV5haP1iSVJh3PCjRDukyJzzmtm+2JBhWsn+kwrjWBz7kU46w7flrmG2HsvLRDfqb4hXX52JkSDJq1WTwcVEmm/IJ+T/zAijbfapFmJjMxVQxb+aiTiQWxmGhbvGBihtng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQtGOx5TQY4/xmRw85Y5sNsCW229t/TNdQLnacyV3VU=;
 b=Kx9mocjK6RJESFXlzcz4esr3B4F9UtLGz5WDbm+VW2Oha952LT6GVmfRttbQXquj3Htn03bB9jS29/g1DoKDo9OcYmX/FaQf4mwv7ibG0xiAkI9BaPSjooqzjPWI7usKWmN2B3OWsjS07sMukYkuEHMBJzKPLbpSJi7sNxy/yNFmBXKYbFBSmuokZWX/7XCCdruCaAagjt79QoMw5YZs9pMNcuI4Bt1vIPgpqzxHjzIjbzPIBxdmD9ygUuYNCiDrlvtnGzB+jIVelm2gM9TcOPWwehb+EjKV69HrcyZpQ1wPQBLyuuhRMGjvVPwvVpnc8LJ5GKXqjKOp04geE4/l2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 07:30:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9700.009; Fri, 13 Mar 2026
 07:30:00 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/4] gosu: upgrade from 1.17 to 1.19
Date: Fri, 13 Mar 2026 00:29:48 -0700
Message-ID: <20260313072948.2254502-4-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: fb9b4b97-e73e-47d6-259a-08de80d254fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	WX3If4XwO7KwVWbGA1qp8qYtXMgd/it+sF3bQweZhdJnkmV6nAbUUoCSaLOMJg5rJaxI5dbkKDXhnMi1OSFGeYY7pU3SwnwKOf3DnmwUTmNqaaO3Ebi/ZVVzt71/2fNyPKm5+ASRGO4sa6juTPknbIPVI5vceGWnIjLnm3IYlNWmoco7g/rK50AIuPCVSvvpO+u96sMH8qzKXfZXqHNIWOkFLfDxQUYWjR847M6fb+4Qa8kJ8lvV/aN3Wy1qB6ShGXmnfy10a67PBMKgWq3kiA2K3CW1T8Q1kvmK7Udo7T06iHt2i55s+nU2DE32/daUUEQtv2XPL9NAicbNN38jKdiLkOX1rBJKquIkDh44j1mF1VPSfYgQ/f4eMG2mFrBQvrdzgrzZkWZb9NuJd2eTC4xVdMxBKQPXy8y8K3WTnWDjw4jvXQbSvykuOI1bE9lAKZnFkNDnfU5DocSEqmAmFQCWGdTGqZtGHQlgAqGhBSf8L1FG8aFxqwoG6QseFJNTdGv9f4De+GgDfmrVblta6v1biti4LWyVsQzz1Jwmn3MYhfDtLdIXH8qH7x0ICchtqvSNI62oA+qW0dz3BPTM69Frih+MJlMaDl8J83sU/xtApF4CWNIOYniyS/CcJI4ESFmdFORgCT76WiBORPOUXR8/i0/kVlD5paprWOaYL2ZkCz/23AM19Frt9Ey+io8Eovhqo1Oaqx7wfItpSNlhz/PQD8Sn7PNvFPCstVnEJLt7JKWKRbFU0meA2f9dffyB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NB12FYlnBzcRl9Rt5gE8Qofog+A+bWRhLkfE1RiN6HXO4fXH7CTwnOCa76sS?=
 =?us-ascii?Q?IDRQvthNfUEw3muf3MfwyhWFs0YnAdvd5MNzV9xeY37ufU2WtayPAg/P0f3T?=
 =?us-ascii?Q?Nm2IuYQqrjr8NSV4DNDLwBfYaignmLqd1ypecGWWrPSz0Q44KcnWhaxsFQUb?=
 =?us-ascii?Q?NMy/z+dMyj5RXuKY+NjODOWQGa7c52Q0xexKoO87TJ35ZcvWFhhthx9HnNcM?=
 =?us-ascii?Q?p6j8ZB5yH9wZNnj21BJ9ATIm9DNismJbTVg93lLF7HTM369+fqplinrHqazT?=
 =?us-ascii?Q?Jn0wGy5bPZBQX0Rl08R079OEpZkvy1j7OHrxvYbRsQRkYNg5X5r3JCS+v1kw?=
 =?us-ascii?Q?2m7o5swt6QzSxABJloc7Db8m9etZfeH2JJ5EEIU8v38gpo66ZnAN1jjcvOBt?=
 =?us-ascii?Q?T3V3txm3g7mAOr7Oz2O4W+fFsLOzQjOv7WbPLoqzrvOUjAprSEX36lt0kEwH?=
 =?us-ascii?Q?TtvxabsiJwty74MgZV/8R7Abl6nTATDAg6VHDt2Yi3fEdtEMunvhEoSQ/HWn?=
 =?us-ascii?Q?wCJab44EJRnpNFRq0OIdXbq2Mtrf3PTVbQ5v3prbzXpMl+JvEgjBAbuZWvV8?=
 =?us-ascii?Q?fuKV1VqwKyUIeyoCwc/sxbnDfEFQ8OukxbOb+snElF1EVpSe0Kjr41qNkULD?=
 =?us-ascii?Q?LA7NAV429YLl1JpWbdDYkiEHpcEF7q7OSSzRd5yheacVf0C6ixA+dIQx0gQl?=
 =?us-ascii?Q?6gqD1X6NsGnsAQus2D+sb3P1q/V8bsIByR5OWi68EZ9EYNCrnKq9aB3o4K9c?=
 =?us-ascii?Q?ICsuYWlZk+yfGz0wQCmgs5QqSVG8aRWj4C9aF8AorlZHuBT+hFzF7WqkfOQE?=
 =?us-ascii?Q?og5X03uxaLxvz4j6YQPzaSQFZrP8n3qYhEt164fp7DYWA27cRLDvTi/Xk/MZ?=
 =?us-ascii?Q?T7kZ9Ryxt4FJmkRFGeR7l3MvCl/XUgDfhrDMz4WauDJORsi6ZcZdKVvBhgJH?=
 =?us-ascii?Q?9rW3tYvEmQSqlL52QwC2mI/VFbziX11G/h1VRBH/FXQC3vgMW/0L0LNagUnT?=
 =?us-ascii?Q?jk6VBN/wXxY02QJFTCoW+s4jK0wj1Jsm8V4XZSxkuzBWj0EjRASrPnUqrQh+?=
 =?us-ascii?Q?nYzlUecS8W1ZaID5x9ehmht8mlHAg1Y0TFSI+xx4IkWTvDDX5DxBS0OgU07X?=
 =?us-ascii?Q?pMsXCLqerM+VmgcqSOSkvI96na9IxQSDQ652VqRqRT+wLY5lvHlxq5Kzqs/F?=
 =?us-ascii?Q?zBDRocd3O/6IH3mIgJ/rfX6oD4Tv8hvEiAv9jKw7udLuBVUzc/IlwKRJz6Te?=
 =?us-ascii?Q?N2SSlnyT5APUFpoRBCpx2pVIVeT7G2egObSe3Nm5snQvSgw73Jb2TfLMv8Qi?=
 =?us-ascii?Q?i1n58f7PZ7WYD6jg/EkkyAheX5BFSE4CWHBbEi14JjAzyobSYhvgylNFjcjR?=
 =?us-ascii?Q?5sevrDLzd9T/ILXH45+Q4U4jgypa7Wfi70+av0A2GHGOPBdFbXW6BSegVjVB?=
 =?us-ascii?Q?xxFl25Z+mvfh7D56Zw+AFgq9w4VBquzwSXH+TSuc9W3/AB0Kx4DCKMbIy62n?=
 =?us-ascii?Q?KsCilwePiB0WyXHp+/4Jraa6Njt75SHNo0gZUe++c4Fwo/usCoj2kyZWAJR7?=
 =?us-ascii?Q?20AbdXdztwAJe0o1WtJNQPsJgkgWatMJ4McxUtOfqmEPC3JGEk9+os7lfRLp?=
 =?us-ascii?Q?tZjbBqeTp1AtaoSslTwj7ai9RQpPGOnf/1ig+jbcyp/AAhVydeX0vI3t2ByD?=
 =?us-ascii?Q?YUGZDuujdwr8Zp5yJOcQLVuVTA+GLuFdLYyq2R00fKj2a1VXq2x4yqftJcY/?=
 =?us-ascii?Q?eL2jrwJhDA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	tNsvG45lffOcSDpIdq6fgueM7ya6l8Y07MIzxdsJEq1Hf2raSBArUCBzlE0Z8OfFLI9B8oHJ1OG6DR32RebfXm0Uf0H5u8VvSbnPkrOkpZ/sPGNrCOWMamUsMEVWWSS+l+oWCzycC0t2VgyX31sGJc0BIX0cuymn1mI3xWV+PxQ1aS3XkuwoVnQEivPdn+5qCJhCu9FQbQT1Va3es7yseJHpF1ruKKKIsHLnV3tCV9OzGWBgdW2ROrLUSb9vIW+PsDp6jISvYD5SvEUpbXRCcSBXeIRtJqhIyd6lWoiYzMd+Q8jQUn/cmxFkCB4LtVh7s6VgN7zm4tCFp8ynXeRZxg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9b4b97-e73e-47d6-259a-08de80d254fb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:29:59.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /h6tI7FD/PMLpoEax/9Pl6D4vRVXHunTIqWNGNeEZGquwpP7XxQharg5hnTSMpoGKwhZMwSCK1veXSaUYa6LEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b3bcfa cx=c_pps
 a=WVTIIPXEjO/6WBYygohQVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=pM9yUfARAAAA:8 a=Est_jyBsDJXb94-OiS0A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-ORIG-GUID: xXH41pLqjx2k-7iqWLqunzS2omxq0M_R
X-Proofpoint-GUID: xXH41pLqjx2k-7iqWLqunzS2omxq0M_R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1OSBTYWx0ZWRfX0erdZoB8yOyj
 PjO7HuehrMoKgKzI1MHb7pvww9RwhbLQvkCpAXHK487GKWgmmy83ESk6aVX6rRh1uEdPIE6MB2y
 xFDG/pRVln1IH3YK3bvc6V6a1L9FOI/DhE5v/J2svtV04UYTy3vH7lwuBJvAapJIaqEhsAwcb7L
 xT04+k0LwbClglm1+/Ayxa8lBxn5inetJg7OY1B+EOgL6d3+IvQ44bXXVmHrvwX46qFEW06m/4C
 xjd3KDf2WMLuuG5jMqSdiK85EcucwCjRB97RwvLpwlChD7npKAY6xs2O3fUK6RqZikVT5zCE5nv
 L6b+w/Kx0Uns46SBKMjWW5W/RWXfs8j0vXYLLaZY38ibDL7RbxUXkoDMzok9+hWC9mapvjKns6w
 PNLPMszwfHZWKYkYHu72KCarVGg7UuOYfORk4tvbYVjqpvTPtK29Y0zog6sVrGDf8AurE43ZpD4
 mLDzpI2G9+AO5TedCaQ==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125184

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade gosu from 1.17 to 1.19.
Add extra tag=${PV} parameter in SRC_URI to ensure we're at the
correct srcrev.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/gosu/{gosu_1.17.bb => gosu_1.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gosu/{gosu_1.17.bb => gosu_1.19.bb} (92%)

diff --git a/meta-oe/recipes-support/gosu/gosu_1.17.bb b/meta-oe/recipes-support/gosu/gosu_1.19.bb
similarity index 92%
rename from meta-oe/recipes-support/gosu/gosu_1.17.bb
rename to meta-oe/recipes-support/gosu/gosu_1.19.bb
index 6a4441fc24..937c45b96e 100644
--- a/meta-oe/recipes-support/gosu/gosu_1.17.bb
+++ b/meta-oe/recipes-support/gosu/gosu_1.19.bb
@@ -5,11 +5,11 @@ LICENSE = "Apache-2.0 "
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 GO_IMPORT = "github.com/tianon/gosu"
-SRC_URI = "git://${GO_IMPORT}.git;destsuffix=src/${GO_IMPORT};branch=master;protocol=https \
+SRC_URI = "git://${GO_IMPORT}.git;destsuffix=src/${GO_IMPORT};branch=master;protocol=https;tag=${PV} \
            git://github.com/moby/sys;name=user;destsuffix=src/github.com/moby/sys;branch=main;protocol=https \
            git://github.com/golang/sys;name=sys;destsuffix=src/golang.org/x/sys;branch=master;protocol=https \
 "
-SRCREV = "0d1847490b448a17eb347e5e357f2c0478df87ad"
+SRCREV = "6456aaa0f3c854d199d0f037f068eb97515b7513"
 #v0.1.0
 SRCREV_user = "c0711cde08c8fa33857a2c28721659267f49b5e2"
 #v0.1.0
-- 
2.49.0


