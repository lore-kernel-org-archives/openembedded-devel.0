Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA20CD13D9
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 13:41:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24797.1762695660177596443
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 05:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WtC0QXYm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3408a6cb6d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DZ3To1402375
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Nov 2025 13:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Z1LQ9jSCRKk9XW7VjJr0UnANDZc3HKdq+gpzGP3HINE=; b=WtC0QXYmsu1X
	9lKzq7nviKn29ANUEKesJ0Uj+XZA3SLvso+qSSBWBvRlACFvsfo2+OBrSSYi8qKJ
	1khmMe+nrjsJ7p1/mBjqkQp/GK8OIF3mnhu5HN4n2BhWnkG+2NH3NoIWCWseW15g
	Gj8VEqnlQKAiN7OC+E4gJCCRovpJRhU9bh8F0Boc2czHVJ4ImrjSODivuSRDzgsN
	a/2zbw1cXAQ6qO8gvUKIUPTz6u1l1KEkQmFBgWw+qQgp2JV8NhVCKfl64iSBE69H
	WEPLTw2tSJIdQ9ax4E0amcULDESD7z+me6/IgN+8HOqqFrLfODxj0oKvZrreLuzm
	3LumSTx6SQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x12h9-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:40:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDtd2QljquI5LkXd7ITgaXuvhb22VGgHu9HK4grnR16ItPWtLlqTwn9d3OquDW9jyHhAAQs9JjjOk2bDUfKa425jqEMTpvFb4jeb65LOeLY4BJu+ehs2Ly8v5mDsfo/4zybiilERzkpgzmuUxsDH3T44ZcYU7rV6To5W0pb7iPVdGz4JiSpw5KhKkHGrYtazTzPW3XMJXNWCBTqL9mMmrbS+aoqR70UEhijs8339+xBWOaRTSALfdDuewbQtyLAqK0KZR/F06kix53mDRXOJ0Rgf6LEJHRup1XArcnECaT8At2DNbWc1oYsiX2q8gheQagj7heVxvg9LLVMensGoTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1LQ9jSCRKk9XW7VjJr0UnANDZc3HKdq+gpzGP3HINE=;
 b=RYl5l9mp43f3NXCV8xxC5jhpX3TDWIu3TOY/K7+i2JAvInQ+uMpiOAwr9938xLRy91o3SPDxjoLzPbWLJobM+Gmh9T3xEwMIW9KS11nySPfJK+cQSso+PEJa8ruTfYt6/kf2QMbNKY3RZhWOx1u/J3dAiuwyowOcGhdTiXvy1anBV8IHjsqOM3LOjLbVwiSqYBPwKDzLz7nt9wOX0c1ShQSSyrPIoj1DUlyBEK0DIKbRZRIv/qz0bnI1WdSo35zRIQxG58kcdUxfdHxLm+tfPNCDKvoKs++4atdlMJKGOsnRNLuxsmR8SkTmII7wKKKr4bmZmMy3n33knO4BB9JDmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Sun, 9 Nov
 2025 13:40:56 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 13:40:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 5/8] ptpd: inherit sourceforge-releases class
Date: Sun,  9 Nov 2025 21:40:32 +0800
Message-Id: <20251109134035.2741548-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251109134035.2741548-1-yi.zhao@windriver.com>
References: <20251109134035.2741548-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: bc90d4a7-5327-4aa4-f82b-08de1f959c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XwhAqziV9K8k0dnUnVS3hcIpqiA7FJPWtBsiS1msuM8607HqpzXueO4cAIbG?=
 =?us-ascii?Q?nIMUxw02mUayMnRIMleA4rtfp/OzQDbjb65XOwhUlewzSDDkzMYNptofx4XO?=
 =?us-ascii?Q?gHMX9u9wZeoebM3XhtnLvrKqVE1nPcg3KG40DVDqohPNgE8EEFAPBkwmRJtT?=
 =?us-ascii?Q?tC9fB9c6iBSi/hh9WeN43ln9O2ph5Uu2oaXWC9b9t3ApvQdyEHNAs+EW9vb+?=
 =?us-ascii?Q?6Kv8dLgTf1vA2O98IPkN4/BQS+S7qEfUMLfb5dJI89ovlD2/HWTev7f8Apmt?=
 =?us-ascii?Q?wOQ8hAaN4qJAYV8KWlK+p/w4cgQWcmZG/Namv7Sa5AnJSHXtA51VbEb8ukDp?=
 =?us-ascii?Q?ze5lrUcxDc6Vye6clq8J4EKZgPVZfIzVx6gKiNY3QtB26qcqBN1+cgOLiVB8?=
 =?us-ascii?Q?wABEyTRY0fydgjn2CFbjlVzC+KnyI9KqNYp0rwLh8iMAXOB8zEkWR+0+L0oh?=
 =?us-ascii?Q?B2bbTr2trDFoYQerfe+q3O4/XEo1ufsFcgbrGktezCkQf5H8SMWDyhurgtBH?=
 =?us-ascii?Q?WvbELzX7ciVPcZ8wvC8Ji8hfDlxIy8Faga3JqfyqDZ7ojENUJOkKsMyG9i7P?=
 =?us-ascii?Q?0sXMC23MF1HYbaJrOebrubOuyy25kBV1Z1mULX794KQ0wpiB0F4FlSSLSX93?=
 =?us-ascii?Q?dXYymL3ld6jQKA0Nhi2ezpJGhYcofRQdbC2dkYOCqX6GNX3RzGrbXLxJ9pMm?=
 =?us-ascii?Q?Ic/XvyTT1erOI/JmOgUpSyh8dmECCV1ylGTZRyvXeTFuXbSqbR7rARZY4nwA?=
 =?us-ascii?Q?ha5m0Q+f5+/A95FjY3zwIB3jwoUm/mzrxZv6kaRinAi6FCKBFemyn7aBuzRM?=
 =?us-ascii?Q?oG9FIJTIheJV5TDZboZYwqfJbKpmqtyyUgG7aHTe51ikQXVtqYx0HBMdb1RT?=
 =?us-ascii?Q?8JERRuA71OvlPrFYoeL7l1hJDJH+eHBXPcEKduDoX6WD1lkL8/Gv7p9ZZfL2?=
 =?us-ascii?Q?jzfctVJoBNVSKsPIPWYa/zRNSTKeXeLvSOqOeZoDphVxtrMwLHdFXd6YPQ5/?=
 =?us-ascii?Q?7q7WiXQOlO3HsA6he8xi1rO/eC6BO9WCQg9t4CxL7a6Kad0JNMpLWfw1zIq7?=
 =?us-ascii?Q?OXiov/LIPafOWi5oyQpFTezbLvGVGhcC+uhbkJ7oWBOR4JlB2wU20glmRxgC?=
 =?us-ascii?Q?l3iXcFJLjRyV182VSGm47GV9tPT4l1U8dhwSB9vW+gz5lcK2Ccux8wjjSSFU?=
 =?us-ascii?Q?P/2v03PzFIOyt4cLEYmYBVmd+edqHA7VzwR3NIrI05cTnTLPKMlxQn6gn/Uy?=
 =?us-ascii?Q?U5mm46XYmz36EGvc1hUcuh8P7/ImZuDMJi69LJ2eBnFr2JhQRyOag2+kvk/F?=
 =?us-ascii?Q?hM25nluOt6gonTzI5S0fMUoQD4i0BpetWu/SdcbqYdxbqqN8FbxjvNRmcmSr?=
 =?us-ascii?Q?Pyz6h6hoEThuwB8Lf9kz6MxN9xh3FvjHhKvR5IU2Sn0+yHd91iRcPUatLu0o?=
 =?us-ascii?Q?iVN7wHYkAALk18E5uLYoqMQS5n7AprQHXfTY+NXNVPqbdo+yDoVg4iyVM+2b?=
 =?us-ascii?Q?6QMHCQYUrfEtnG+NJvBR3/3SjPh5lVFAs3Ig?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nulbu5/4djNSbo9zLMk5hGxi/Hk4VFQOOwu6Lqvmo78HeA0+NFsjJasZSXvk?=
 =?us-ascii?Q?VcVUiDEKlx54NzPGcBOxbnGcYfL4M23E+gI5G+7bbbzxUCpFov3Udw+CFhsK?=
 =?us-ascii?Q?Dn1wyG+ZKArln/qzLjF0VNeFvPxZSfZfht+M++j724ehaA6YuNpAFOabNeFI?=
 =?us-ascii?Q?KANgAKiutbjsWlIwtshfHPC5BAQVzc9I6juFXnsEQWkyUEkq6d+wm/tXZxv5?=
 =?us-ascii?Q?zRZVyLHobzEKZlUHJbgzcEVQ0HyE3xrwu88Gbo6v+KY2DRQixcpxBfPKKb/H?=
 =?us-ascii?Q?i5cpAl+csajrtr6kgwqKqJMB2QqYoOS+iRo1l9MT/VJ7MMsNw5ZBrDMY/60d?=
 =?us-ascii?Q?X1ZfKPzMpunLiQxljNOlU1WnDL3P0WdIWxmib2l3vcZXxH8cEgwBmU/WtwfD?=
 =?us-ascii?Q?5d63JUBq0KfG9rztzq6msrEg1no0zhuTyou5wPJZ7chTXlPg7fxepecVDQKn?=
 =?us-ascii?Q?yFPsYSF9B2Vert1XSEfi8zKczIQBSo0sPsNhlmzayoMUcw9sdt3199Zcnwnw?=
 =?us-ascii?Q?j2sGQKSNPsoact2Rrk0ZYc/2N0WzrJnzqcfkTLlLhspvmp+h6pkmmpEhyRY4?=
 =?us-ascii?Q?B7LsctvqqnUdeyLzMc+wN/QgBpraTSbohsJzalyEEFBOfp5T7XA9F2YpxpLL?=
 =?us-ascii?Q?+N3FUg7mad9c8Kp6/2MhTb6O7YhWWSoXGN8lsJ7vgnJLV5+vbbTolMtG9AN2?=
 =?us-ascii?Q?sNa9Vv1RzoUAJSBcHWGcVrXbYs2JZfb4HvrRXL0ESJy5mlO7Gm1AdEd53fnG?=
 =?us-ascii?Q?cvxe7/5k7/0SZ6lzOwCVR2AJ+Dhts9VrOCNBn07bKhuZCt2uaBTh7I7pMemx?=
 =?us-ascii?Q?eTfD+WIQ7jKjrFj8OmNsRI04AEyMpfXYfGx+J0cEpXpTdNr9TRnwOxmVc4JS?=
 =?us-ascii?Q?IFxSzgvOocICspiakg3J5Lved2PSwn4wRE5yBDBsGL49oKHJWD9L5ss2i1d/?=
 =?us-ascii?Q?beVX51aYysOTVI++y6jetdKma8OXUgSwAB18tO7/IFcSDDxCQoVIGKVotj0f?=
 =?us-ascii?Q?iHttjy4ZWqYrT60vVJ8EofXN0c8leOgUAfFTpKzepDHMXszAVBDyXGEudsCV?=
 =?us-ascii?Q?+cRYmPiWGsReV6jyZSFiBqqzdccvQpk/KBYOyy3tl8ZBW5udrNn8IYSRflDp?=
 =?us-ascii?Q?0OMfU2W+58NU6xE1JwfulFZ8JURVYy7n7quSY87sxEf+u+Py1GL4z86E2oiZ?=
 =?us-ascii?Q?lH62yKOqV46tzRxWPd2IMD0rY9iagjbdOk9SrXUrjn1UpA1CZSHHEJ/Uxhhg?=
 =?us-ascii?Q?XAXpkZcaeOFcwi5g44taZCNpKmrhCm5kxc2lhipa3T9qKXINXnX4or7cWIVM?=
 =?us-ascii?Q?XLumgbIrWsaae2byxa2Padm0XT3OiTG4V3G9XQN4idJHwgOOy4pFzKOB1F8V?=
 =?us-ascii?Q?19nb5ytLvDxVTUiI6ubYH0s7gVJFKPr+a/bdS7GYqMr3SZWVXlwBuXREKguO?=
 =?us-ascii?Q?sBagYSycEvgbgkswWjP5SphakTUoUMY/et8ES15lYvfpnU69UB9qaAUeYW67?=
 =?us-ascii?Q?Vsokx3qdKlXYS6BLgAAOvPMYoaox720S8k3KnY6KU0E/3RqkaKEA9Liwhl9Z?=
 =?us-ascii?Q?h4NcCSnhzV7vUR+2b8kTklPZnTbGpFcYoGKhgjaE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc90d4a7-5327-4aa4-f82b-08de1f959c1c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 13:40:56.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qj+pun+sBFmoCvqzdqM632PhiT9O7324CYBZ/SxMjCxQw0j+fuVL8KNzyKuz/vqwhE47sxk335yUQNoVqZ+/CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyMSBTYWx0ZWRfX2JUWOrBUjlE1
 nM+JeWeU4ye1cgYPsvnIULHzQgyslrmo4fOMCjFLUpnEqresmzQN+eXePpUC4VrC6bEbTw3UCVm
 5Z26Vaa1yiFU+J+AcTAPnYlhYuHArLoezw+le01qffXAdH7i3aptkvl6zoTnFtRga439ZuQQjfw
 wSBLbH6G5ZI/IZsvAt3tZpk9F7vj1J2zvG18lMcR8e2lCeHRgLicdZih8/YLZUG60BJ48ZqigN+
 jYjg3MwWtKRS3UfCX8K2ILjAEbJwDgs8vHY5vqzzPSinxbLJvz6LpN95wzmVBdhRRWBUY6UuMwn
 MzJNi2RLxYp2BrNzOkZwQZZONMl3+/sQfaW3vKORkRODtl5Ms26MEF2tqfvdehs4PkN4kGFCp8Q
 ZJJ1rdsRKatA72ASbJ9u0PfRrsEOBg==
X-Proofpoint-GUID: Go4YW86uaO8XNRO3VJnbhyeKwW0m0QGl
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=691099eb cx=c_pps
 a=FLJGh2IUmjoo+n/grE3sag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=ZxIGIFm4wA_1sedahvwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Go4YW86uaO8XNRO3VJnbhyeKwW0m0QGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121411

Inherit sourceforge-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version ptpd
INFO: Current version: 2.3.1
INFO: Latest version:

After the patch:
$ devtool latest-version ptpd
INFO: Current version: 2.3.1
INFO: Latest version: 2.3.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index be0652dfbd..ed57ea8962 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;md5=0733e1b3788ab2ebbc63bf33a020da1d"
 
 DEPENDS = "libpcap"
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd sourceforge-releases
 
 # return something like '1.2.3' or '1.2.3/rc1'
 #
@@ -32,8 +32,6 @@ SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptp
 SRC_URI[md5sum] = "253bab7ab51d969616ea811be1f132f3"
 SRC_URI[sha256sum] = "0dbf54dd2c178bd9fe62481d2c37513ee36636d8bf137cfdad96891490cdbf93"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ptpd/files/releases"
-
 S = "${UNPACKDIR}/ptpd-${PV}"
 
 EXTRA_OEMAKE = ""
-- 
2.34.1


