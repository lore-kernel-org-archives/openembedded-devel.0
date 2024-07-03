Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AFBC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 08:26:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45713.1719995200790811345
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 01:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7914f1615b=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4632e4nf013099
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Jul 2024 08:26:40 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4027fxbt5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 08:26:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvzTEbIUaev+BlZ/AmWhUsJwzXKXFJBybxe4b9frpF4qxoigXqZ2AKNnFrqVftH0A60GJrBpNFo47EW7DU+GezDFt0FVVaUeWM7gj7ho52uVSngnrW68S2UBj/U/vE9btrzLRO4fi7hzBKmXDBb5KtiNtXASFYnopnC9XQrvdni0ERJWrp2he+qDfoIkI0lLUIbs8Z3AFQ7EqgaE/2LFqhu29MlzjT3oEVK2/FN/B2lUfyg1IXyDJWrMPo4FrWhLeThb5vBs8f6u4WO6Ud8OzqKtsNYx9Kt3zizFaA06+mfuDCI3JPm6njYh1aT2m7fkv+4m26059TpSxROnjHnYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgxWVfBVF1RXCqYDLvH+a9h71C8KcqlryQsg+YAabnQ=;
 b=aWwYP1yKzhQkoWlov3EFJF5dXcHDeilAZNRJ2n1pFvXXotNI5AJqBMigdo7zce/rpSmKAykW9v3XuCY23NyU3iZiJU4cwm39RhAvD25WtR0hCzEyJIuLYzSaWZiyH4wvuuHk0dvFcDO7kWzjklF7/HxP2T8ahJRhIf5XaS5E9dXEvFYN9JWiRhTObt8HiXrmPh3NCGJTdhZ9anE4Gu/ediDawWqxPZz3pdXxDDci6NzJL2GEF84+nbt+zp0B/VoznRNQMOll2i7Jq2w620AdXwaKisrY4x2QuNSlD5p1Od14yQ9ZjJNaDwNwBOGTVTzZF//z4MV7jgoSLoFqM0pL0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18)
 by DS0PR11MB7577.namprd11.prod.outlook.com (2603:10b6:8:142::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 08:26:37 +0000
Received: from SA2PR11MB5004.namprd11.prod.outlook.com
 ([fe80::1985:3306:54da:fb9]) by SA2PR11MB5004.namprd11.prod.outlook.com
 ([fe80::1985:3306:54da:fb9%5]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 08:26:37 +0000
From: libo.chen.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] thin-provisioning-tools: install missed thin_shrink and era_repair
Date: Wed,  3 Jul 2024 16:26:19 +0800
Message-Id: <20240703082619.3590238-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::20) To SA2PR11MB5004.namprd11.prod.outlook.com
 (2603:10b6:806:112::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5004:EE_|DS0PR11MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9904b7aa-37c0-4e9c-6ed1-08dc9b39dafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AxQbU2R34ozBoPpeuhO4uk6e3Zoo0lZeG5w00GIWlbfqLm28VULzMXLLPWOd?=
 =?us-ascii?Q?Ery8IAYSd2TRzxMbXe8CjYjh9ZJkbku87LPzm8fzTxG8eqV/6dJnB7hSn60U?=
 =?us-ascii?Q?M3MtBpzJJSA5hEhM1BhAvpXnVMZM7+nneVdFwHm0BsBWkH1+EOoAouZWTsKp?=
 =?us-ascii?Q?PvoQuhje6SX1R1sj04nLvl4qGRZ6OKgOjVqigVT/TBpEotP6qn8nLU5ynVCo?=
 =?us-ascii?Q?yC20DFMXTQ2jnuNPB/1173HJ0AADlWJx45mLnIBlD/qDmqQyiC7JgVqjegIX?=
 =?us-ascii?Q?9RPJXjjoljedo4pNEID8LaTLhYh7EsQQ0ElQAG2EhRfKSCxA30tGcivP51mE?=
 =?us-ascii?Q?rFK9ykVEX/fYd2T8j5CaiqpMNJhTi3eVZkHBwHHiXUeYp/bp+Mo0DcKVS9sE?=
 =?us-ascii?Q?JM9AtIFfqbYI+jWGErTQaNMa8VUULhy0cqAel+ozqrpYvcgqi53Z7EINRo0E?=
 =?us-ascii?Q?7r4R2wN41mhKch+8GZ0+P1GeopxzLEbjcVlApTDgO1cr59J9rrV6l6pZmOcM?=
 =?us-ascii?Q?/5RF17uvx8eInjEEOEI7JL7nYg2MgQALyll99hAYRXSmFI7stvi29pEjdNpx?=
 =?us-ascii?Q?bABKRz2Ggb4omezLOtCw+fo6xM/YFqhMc8ywfSlDSipX0mhqyxEeLpY0ccP5?=
 =?us-ascii?Q?9f6xmSujWz3b7ZCEME/tXF/eFYdOk2/Rgf1ueW7ynRuH+Uosue82AcxcX9GW?=
 =?us-ascii?Q?m4C1K4lMDteq+H2Hb38gJPuxGyoJ++oSVEIolacoZc+cZKTNqANGcOxJ+hky?=
 =?us-ascii?Q?ZbOtye4n/Qe4Yn08kLXnPiXQaYg6s41y4NoBI/CPbQXKu2c7nHKttaO03sIK?=
 =?us-ascii?Q?aHC4Y4VXVNVa4FwuH0z0Lei5oAVTd6/Hake67A53FNMs2xdhAs7sH5mkS3pj?=
 =?us-ascii?Q?EyEZdscgfydSYJYny48D+9GOfa0/XHyE0YXARGJ3PoMY1bcIB5wx26bjoVX+?=
 =?us-ascii?Q?qDPMrd7rWyTu0PwK5rQ4NOci+KOm3BYm3L2to/HlX0FHVTUPLHp8aCNR952B?=
 =?us-ascii?Q?nT2cOpRnmhptOvXWC1WULDNABrKN1wmpgpV5csfTOYXgoBhpU/5oM3/mOJ0T?=
 =?us-ascii?Q?ZTEYjQLCyuuejE+GH54MrVXgrxLxhJa06OVhIxXHSRdYjDWefQQ1xWTutNan?=
 =?us-ascii?Q?UISLx+Qrp46j6elwvWdSOHXr3DIuepp5XcKO5UZwSw64bb/I5hSLf/pqvYKJ?=
 =?us-ascii?Q?ncYw0v75RcKc7BuMPoX0P9bsZ8H8ORce+pE9Q40coqHcHgqAsjO7wnboTYjd?=
 =?us-ascii?Q?Tnd/XlVVUOVLfvAWaffefvHtjJYVMJpBSqB40eORzHcPEOZIoNEv7o0hS69H?=
 =?us-ascii?Q?w724GqL/AaltGYa4Ej+QdvDZlsZpKMGDIWmCL7LY0Ntec3sx38SfeEpAO2wq?=
 =?us-ascii?Q?SFAx9YH/PqgW0oqlsMfswuagwqaz8Q2ggbxaNzOoNb7LdNw3cQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB5004.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sERwYq/eT6dAXI5xsZc54YWWXzV2zCLNpva5eDbFKIrAYxqBU6IGGxGznBob?=
 =?us-ascii?Q?1tnOPzc5qCdEG0Rq5sYASd981l4TCqUSij/FhejJc2niS5+d/ZxCct9Dn3dS?=
 =?us-ascii?Q?a/G/xMbLEDOzJCZXsm4IktfnH6TKlo4sJR8u7ju5lmlP/Jloq5tjZFw1OII5?=
 =?us-ascii?Q?enr2Pn4oAvICVSbh+So1ynZTN7UYemsrAhydfNlFPqbx+Hu/r3QFup+gUtky?=
 =?us-ascii?Q?slvHBZeAFfkEp0oiSIAh3U3DnKeaVa6WzuLC5J2yMZ4i6iQErx0A/jXd0/bq?=
 =?us-ascii?Q?CJFdOkp6tMAMjrNPlEObtu/l1lFuMzo6zPs851qxvN/sM7FMCYKi4SNXxGw1?=
 =?us-ascii?Q?Yo5ou671TpEvefJPC2Vx4d/EjCFc/kOZjJl3Jl57bA9d0BRdnYQdxe+Q+Uk4?=
 =?us-ascii?Q?wAblVTFmmU3fiHU8EXfBlm4XBCvEo1fVuDOfGMAp8JWhUNyzOQJiwPx7v63t?=
 =?us-ascii?Q?MftVwnGayOlYHUI0qB8O0Rw5rTu5w+kwblIK0wVdxch7jrr4Dz3R84JWN7/9?=
 =?us-ascii?Q?fDOMmQ0PwamfvclqmJoRoFXWTyDI57VB0OSiP68toSw5zo7NELK7mO10jKFr?=
 =?us-ascii?Q?/gHJ+2rrdk/1kjPoajEFs6GHHQCxggpdLZn7ofmix+NAEh3QOY8oiGqoy7xn?=
 =?us-ascii?Q?S8gkoBwTMPxzsFsdbsMbkF/0SeQ5D1IAjJ+6CYWYAalxql3iyJm6qQVLZqob?=
 =?us-ascii?Q?qrckDK0ebyLrKel0B6KIPqayysWkOulMm6XsU2Z4aXoFkak815k7fs4Qlyc5?=
 =?us-ascii?Q?iMAmS0vt0Nnr/l62OaSHFMosGA5hiGTAU3Zu5ryru5KqW70SFdGx5ptE7Z2t?=
 =?us-ascii?Q?hFzAOBLlJMLEAOqlu8S64+JUYSDMguA4pcJoGj9aZIvQiyE8nTIVtAdwoPan?=
 =?us-ascii?Q?ngctZWfB1YCZY9fqsRSk5GOnBUt+NZjTg3UCaI+6LUBJwlwDWDKyZCum4RPQ?=
 =?us-ascii?Q?+zpv83xdr3HCqqB9lAIZS3yaEgo3ZZ6UBUjXLZQxVanIh1W6hlnPtaTwU+kW?=
 =?us-ascii?Q?s+Mgxs3jKFUSdjKB9EqwtxHu7e/a6ZmMsPaKIuDUt2B3Kr0xMNi/QuT1MIXy?=
 =?us-ascii?Q?cb91PHvrOs3d/XBL4p9UxvjettIjQiQ+l/xQa55wJh25+x76slubpXiSQVth?=
 =?us-ascii?Q?zj9QV8mEmeUKVwisSTcOQWgXXVMKoETmD8+uYnuinMV4NEGT7Z2kzDTAsbLc?=
 =?us-ascii?Q?mPWlokPBHvDBSP3bm/UZQ/+lIl6qT3PD65D13C6ASJGal/IImuli8j94cfpa?=
 =?us-ascii?Q?m9OYqYA5AW6NuK/NU/JQp/tpkP26PcRNCQaYQ7OGElqThyGc7REi1J21knL2?=
 =?us-ascii?Q?Hfyb4J08va/kJQ+rfHni0Em/TcUb475CWjVTuJUEK3TsT6f2eEI6881AlPq/?=
 =?us-ascii?Q?KuZ7V32vWXyHOH2Z4t16vOUgKRNbl2vEJDxzbe3oZIAqCzQI0IXYcaQZipe3?=
 =?us-ascii?Q?UP/0LBYManNroHe/R/TyBTUjY55+pS6fQbclZ0/kSTJSORrilAYaGPy5IWaF?=
 =?us-ascii?Q?EWuQEjJ6A4gRIpY1XgVzJ95DJjKq5PxmfCj1Jffb6mMLDPDjWgRRDERt+2xm?=
 =?us-ascii?Q?SEJjRyMrvrmAJIv/S8RvagAOzaLnBDYwPUgezNIFfvbBIyXfiWY3R3AIi6Wb?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9904b7aa-37c0-4e9c-6ed1-08dc9b39dafd
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 08:26:37.1492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xzj8Z8Xjwt1RhrrQcq2MbbF+5BXE62qVJvxdiddhbQjEwDRyCwR1iegluqMYQoePySg8bwkjvG0FG4d4ZSuiUlWjIgeQEi/G8KsiiNMg80Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7577
X-Proofpoint-ORIG-GUID: J7_BBnDt9wVVbp_VU23tLK1vjDlEtvwW
X-Proofpoint-GUID: J7_BBnDt9wVVbp_VU23tLK1vjDlEtvwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_04,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407030061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 08:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111221

From: Libo Chen <libo.chen.cn@windriver.com>

Install missed thin_shrink and era_repair for thin provisioning

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../thin-provisioning-tools_1.0.12.bb                     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
index 09b91f6b3..51b4b3dcc 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb
@@ -34,16 +34,18 @@ do_install:append() {
 	    thin_delta \
 	    thin_dump \
 	    thin_ls \
-	    thin_repair \
-	    thin_restore \
-	    thin_rmap \
 	    thin_metadata_size \
 	    thin_metadata_pack \
 	    thin_metadata_unpack \
+	    thin_repair \
+	    thin_restore \
+	    thin_rmap \
+	    thin_shrink \
 	    thin_trim \
 	    era_check \
 	    era_dump \
 	    era_invalidate \
+	    era_repair \
 	    era_restore; do
                 ln -sf pdata_tools ${D}${sbindir}/$tool
             done
-- 
2.25.1


