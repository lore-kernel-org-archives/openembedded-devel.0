Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E422EC531DF
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 02:37:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.182767.1723948656504537253
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Aug 2024 19:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8960570f48=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47I20aQN006343
	for <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 02:37:35 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xgp4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 02:37:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDXhfwAvvuf8xExvWBAW9xlcDoH6YmhlZWEVJQ473MO5Z5Xmx4H9mulIwt/AZdF4t8ROmWGJv5BlLG/jA5VDJTRR+fw+lw61D4cYK6vT1CCI75GzEbucnf7CcCdc7L65o17YVI9CsupHWZam68dR07vB4IdGVdrNt3PWr6ZbG9Ja7l4uC+kcRMQfcWLDLWyMaF9nDchMilVX3Zu0z/eo/6uIPBtYGU/kLrlLF4L206cTJVoc7vCHSeVndlhWq4QiKWxAGJsP8Qql+iDIuXWPR018qyeO9A4d77ib8HhAjyZWTTwlwLd6FOmCsuVDlfkyISrMS6Cc2rn5QF01ZKlQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tH4cflJEKq909i+M6hmNpDKKIWPJEa8B2UwRi/OEDUQ=;
 b=vy7K1eOriCxwtAqwoattICGYbCDeUt4Mh1ILyA4mXR2wgmNPHQ+pDYuFS4nMMS40BilKpLg4bvfDldFjR1yURJ/gXblUXbi+WDA9ONP7rKBeQcdAuOaCgx15SDsg5kD16nTDWep7I0EFTdjIGl598TAS9fEMlVv7iSLvr+r6s2t1Vm5OaBP5HxUivhjkJJXAsxbS7uZkuEC76Kjeg/589ru5cQfoG8CWAFLEI2j3xjRJHfaYiW61F2n6FOiFSMgg3XkSOkMyzQedrwBZa68/DQXKZ2vg2oW3cGjlPeJ5BAsOhJ+htTazu0pQAMWptIO7YmYjY9agtSecNmDBduXwog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Sun, 18 Aug 2024 02:37:32 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 02:37:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] snort3: upgrade 3.3.2.0 -> 3.3.3.0
Date: Sun, 18 Aug 2024 10:37:22 +0800
Message-Id: <20240818023722.3575910-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::30) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS7PR11MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfbf062-58a1-472f-0642-08dcbf2eb60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U1/bKf/6UDjFwg6i0IBG8feH0pf4uhn8elG4/26m8kkohfbaj2VMB5+4yjMj?=
 =?us-ascii?Q?VbvA7zcqlEjvPw24unbr5JDESrFfRF6Bu6799IfnaeB0NEpDP09sWREsB0e6?=
 =?us-ascii?Q?DzbkL1Al7YGJzwGIm3xZk+lu+D1nS+z9SReRRvFGjB1DmsXFLGINWeREvfwG?=
 =?us-ascii?Q?vcoo9F4o9DHQVLxwTKkKL43uUbNVsA7Vuml+W14B7gZBjO2H6GwkT1IJVxjM?=
 =?us-ascii?Q?aVqVmwAnjnGRYAA4JuKaJN4GOmKac1OM/VKvjlOCwTbN0bMd5VAudSkyjpPX?=
 =?us-ascii?Q?Hy8EP2UaxjwFHxjAEAO8G4gRkNwIXcIWKU5zgo06H7Zk0Eb6KrZMAuttUuMF?=
 =?us-ascii?Q?ssAYSBiv6/wDsv1bnsd+P4o6defS9UHjGO7njlmabBPZPMrJRp1dQQh6ueP0?=
 =?us-ascii?Q?cGCVRJT0AWIWsbe+SoHR4VZ1bS7fWTxVgvr6qeiaWkAePUNcA4Eh/G/Yu/j+?=
 =?us-ascii?Q?39B8hjiRl2+MFdAHAmGLMRnodNNmk9u8LodP5OjTt9Mc7tRgPqyulci6+Cu8?=
 =?us-ascii?Q?YoAxltu2YokLr0cuOpYAdZ2wV0mgbDu4Jubr62x1inmF5lJbBcbjEqmJtAf7?=
 =?us-ascii?Q?BFzejw6oedX1+i9sOQjAi8U2GBwNkYpnt5ao0JWWG0mUC+3Av0RbTqiuNcy9?=
 =?us-ascii?Q?KX5fBhMRI+sSrjFBu3q+kzBJGWhsqoUxzHqecctAUBEgNebK+a0L7ppv+gn5?=
 =?us-ascii?Q?PVkf8Ck+me+FmL8eWL6Pq9EguJo3vRMmTz7dWfCg+xqaXTgimVqMClIu5cpu?=
 =?us-ascii?Q?rGtySa/RQnT+FzZVQmsn9aFZjJnw1znyjOC0xXQjIS9k/rdInN9+DBVANcG1?=
 =?us-ascii?Q?p9418bXlvBNyUt/m+s3yhyNkoo2oFzjSdl+hoPPdEXHBsDZgnNHYpZgjSvvk?=
 =?us-ascii?Q?t1HLzWPls95VqlNKRDKTr4TgKc5C/vKBaffAE54a7iOaCeElQedqYc83jGTo?=
 =?us-ascii?Q?qAhL53c34p+CFZ1EGeeUUy7gg7/grkt/hLwbY4rLfrPVXOYK8FYFh8cuAQk1?=
 =?us-ascii?Q?WBofmg8CUXWg0go4fmqDyn79AWYwF9HinEnl1ezm3hzb9PRAN0ZzC5pzhzYz?=
 =?us-ascii?Q?FqBozkWzGUxkUwEZJq1NUGtqp+s6/jUCxQjKx43Re80gJp8en8+VGaaJrmij?=
 =?us-ascii?Q?yq8S2cDvR3N/7nvHKTF8PNeKvTiRXyYL1S83BG8kcVyzUfThuo1/CJOw5TC0?=
 =?us-ascii?Q?x1VYKC99lUcPPvtisu3btnNLnLMkHG39IaZ28M7Aew2tD4XUTTjCa+aVs6x/?=
 =?us-ascii?Q?NlZxZw4PsRUd4naHH5IxfXhnswt/kfbqv/qdX5g+9OhH8rPZfqfDgevF6pB9?=
 =?us-ascii?Q?0uQj47Zpa617i36VGLvCbc6R4hjFUtYOi9Eb2bc8u3dXhg5FM9tJhzUprz4B?=
 =?us-ascii?Q?4MJQ1SI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G3s2alS6kkHjFdS+zhiLjR6jz3RKuvySkijfHo8RrkQJvwweSChL0Fd3IXeG?=
 =?us-ascii?Q?P8e+Sa/t96FV97U9DcMODRH4hF85/5EmydDdDqjPlI4bESNR051AOMetdi1X?=
 =?us-ascii?Q?yRigUQG/LNG36lr3dLYEmqEp95URckg0HTQiA6z1oCima/GGcqsYXrBhdDBH?=
 =?us-ascii?Q?vZjH9+OmfFrBViNQqPoL9nDCDYz7EMcEtbgazX6VaAd9EgWa8bzNo57+tPpU?=
 =?us-ascii?Q?Eqd9YQvCwVyGKFpIsgffb0PVVgYVVJfD6Kvgw4zCXg/8gCD5+MtzEAhI8X4P?=
 =?us-ascii?Q?Q2vY947feR4TxO9qHq9aXY40DIUnasoogvECkEVBYHO4pKRfIEAQ7/yfjqq6?=
 =?us-ascii?Q?b6jWzw60Gze6fgi/wt6hHeBnjuMUga+g4J+UXFA1M8cw93Xt6u8LSYWGOb10?=
 =?us-ascii?Q?FbI176krK2O9jUqRzCDrGkaVSZ7+4BxvKFivL5ionFN5wy1pVxxt/7Anw61U?=
 =?us-ascii?Q?9SZuzkEj5kWcmJw+qVKdqQZNVZpILJ9cnGr+W41ztYiDAuTegQcvT+49ign5?=
 =?us-ascii?Q?raUNGESeA/SxGPVy+wBqarNnyoIgWzEQ2kjyNncjcjwFDA2XOkS+wSN1x12b?=
 =?us-ascii?Q?270gtyPrOyEpVmSEaOswuesw3cscZTYiNYaUOkcEyjT+wZKW/MCF/1Ytdsx+?=
 =?us-ascii?Q?ur5ZEHKndaPYiEeVdyg3qFQI8K/5ImdDJpZfl5RfHPFkVjLHf+rTb5pRUjbY?=
 =?us-ascii?Q?/QW0zHVsHPSTZYsailh/aan3On+6+msLKeTHizG5tO9t+nfZp28LR4ODeDwN?=
 =?us-ascii?Q?8cm7dbqiR9CzuWTTUFtopolKRNWw+yjuZYbFSw2+0njEQ0rUFvK5HmgmmxzA?=
 =?us-ascii?Q?pslE1gdB/BoaDlPMUaTfbNKiQh8Fq8R1aM+Of5dZsT38xmxDfGRD+Q8Yqxgc?=
 =?us-ascii?Q?fw6EY/Y8ZpP6jhoePwXzLDny8Fpykhzrjy5kqpzmJbVNY1CwMd2vKT+hjqFY?=
 =?us-ascii?Q?4+XEEWj+Jg/IYrhQH48/nLYAmzbdpnE0unkXwqVgjtw3pWbwAoe1i3MZn61j?=
 =?us-ascii?Q?a+7eCTFFR4P+sfmBhAA0bFerj+91kpOrijtPGV2LvY2kPRXCqxz0S0NHXpss?=
 =?us-ascii?Q?20+BaXrbwlNAnTEXq4r0hU3SjhMHfprUmZnFAGSK4eBPZCKl/2eMSyXBzXEN?=
 =?us-ascii?Q?uPb7dBA8Z4yjEox3CZsmspjWuSk/BVCsn82PPvnMrO6Bct/f3cMrLlPs/1at?=
 =?us-ascii?Q?JzivWkX6rNv+HDGB2IUrp9LkkyWhRT6zG+uVIbJF2DCdJY5uM4WUHq6Y0sRw?=
 =?us-ascii?Q?96hPKjxeL+dcPspIUzgTLapSBaH5Nn2vUG2BZOUIBQXJFdmzypOKnohI+9mN?=
 =?us-ascii?Q?HylKecUCM3jdEZhzuWkuIjsxuugx66RdsGaitOHBq9q0G1+QBIfrCZT5vOGn?=
 =?us-ascii?Q?M+xp2q/w+/qO7EnMnm3uS3X1sMJu5u2pZ9mme+hZJ3gNfqlXOImUF09IK0c2?=
 =?us-ascii?Q?ZAf5QpIdhl2wGhHouIHY4JmbPTDyKIJeymoxUg+a2R+TaBZDEkjEzKRiMFKz?=
 =?us-ascii?Q?P2mTFlAz1Xq5XPC5eR/X8Yw5XStwzu4YAw72neM0hsA0FOJ0hWkC3bi01ZaW?=
 =?us-ascii?Q?kfBa2DU+tTco5vTLCi83zRtAufxY3wZrelqsEz5p?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfbf062-58a1-472f-0642-08dcbf2eb60a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2024 02:37:32.4842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhDvMA961ksgND3PnNTyXJwDf+KtqHFUPP/ZLFk2wpOsvZBe7VmGxQan0DN+AJz5cmt8Xc2zvmnFFpETg3v17g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
X-Authority-Analysis: v=2.4 cv=PszBbBM3 c=1 sm=1 tr=0 ts=66c15e6f cx=c_pps a=uuboLt+qr3MZZMeqEnD08g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=On1SizfoRApgEmU3Vj0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NEnV7ds7nPHsGzuTOOj0HdFjGtj2JV8N
X-Proofpoint-GUID: NEnV7ds7nPHsGzuTOOj0HdFjGtj2JV8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-18_02,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408180017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 02:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111837

ChangeLog:
https://github.com/snort3/snort3/releases/tag/3.3.3.0

* control: code cleanup
* control: handle control commands after packet threads are fully
  initialised
* daq: add outstanding packets counter
* extractor: add flow hash key
* file_api: max depth is set as part of initial config
* file: remove unused variable in FileFlows destructor
* filters: update dev_notes.txt with details for event_filter
* flow: optimize timeout handling for different packet type
* http_inspect: add peg counts for gzip, known-not-supported, and
  unknown
* http_inspect: log normalized URI in extra data
* ips_options: separate main thread pcre counts from packet threads
  stats
* memory: account memory for profiler only when packet thread is
  involved
* src: resolve various warnings
* stream_tcp: make sure ports are correctly swapped when filling a
  meta-ACK packet

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../snort/{snort3_3.3.2.0.bb => snort3_3.3.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort3_3.3.2.0.bb => snort3_3.3.3.0.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.3.2.0.bb b/meta-networking/recipes-connectivity/snort/snort3_3.3.3.0.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/snort/snort3_3.3.2.0.bb
rename to meta-networking/recipes-connectivity/snort/snort3_3.3.3.0.bb
index 3f66a6b57..ebb041575 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.3.2.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.3.3.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch"
 
-SRCREV = "1c574793564fd1256c08be1177b2e595d3592547"
+SRCREV = "276ee7604f84f393033324b624421bef1622af66"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


