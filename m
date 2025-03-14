Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75A1C28B28
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 01:58:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4333.1741917508861283802
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 18:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51681d0977=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E1ms1h002631
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 18:58:28 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45bgat1rwd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 18:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2NanHDEQ8tI8PYss7u5pT5sIZOxV9lpmuT3xsxWMEwCvxcKdFiKTFCRZT9J4p30CNvf/zRxnVTbxjYm6IrJeVnJIPwSPpL8fT/zgj3z8VlZHf36aj3M/buxNz/iRj0S+XgdLJlJurvQiqlN/J4Fii4vtmNCB0NdwwNZhzPcC3zwRyYMD70sN/r5DGrt0X3ryWZa/iG6+g5pjtISjSyFD5Wax9vq+g6uiorji4WPPC0vN2sR9KucSPZv4V8drWY94n14QPIzSPNSX/4xs+I1smvh1XC/BuL8DTdqkgh+9YDs4MSHn6UI+oQm7RyS1UKJ1AKzAnqHQ17grcsfAYFyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl9W1/VmvIHIV7WVT4yr+zre1a4nJxv4vpJ/kU9aSno=;
 b=fMwpSFGOxMWoOrE4b1DbvpsX+K2r4cCVWg7WScCTJL8cbar/PMFahZROaw/K3o9duD8ErepFQQiiM/NkxCqeu4npWwgKH1d6TJeG4/6eoV/LBJXGqYmbc32E4ETpc+BS6Cf2VsMwAWVwVrQ2IZIZseE7gNdCujgZ2wWMsiGkDo+w7gpUbEWbvlsVWtH145c2PgoHr408IcHKGjn4im/O9+/Vq1uceC7bvprV94kYOpWKz5s71lhhT8fgJf+pRTYOhtISpVP7XT76cerZQQK8P0Yahe9rw9T6v0spq09hA7m3Qp++vtSPXFtf4O4sqPZ9sSzo5aqCZROzH0wwJU0bqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.28; Fri, 14 Mar 2025 01:58:23 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 01:58:22 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/2] php: drop some unneeded patches
Date: Thu, 13 Mar 2025 18:58:08 -0700
Message-Id: <20250314015809.3587400-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:408:f7::22) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 8322d8d7-447a-4821-4b69-08dd629bb312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wvQkpRjCEH7lNYKjSyUxyx22pNi3IeumIT/oylAbl7faNBF2XbHrJqJ8i3lL?=
 =?us-ascii?Q?gkNgdatQcm4YHTQmEZPCiAzYudapbVSKOEgNhJX3BPQ3paB0Co0ag0dGrCPl?=
 =?us-ascii?Q?xTCRiyQffWAcyoOVdRTmKj21StppnffKa5FOrgUPVl6nnKDrYsEQWYxZdQs6?=
 =?us-ascii?Q?TKNWJ9ZMrkKMKs3C/7HZjIMI5LKGRCQSKmP3O/MSYEqOhpiahol8fIrIkGL3?=
 =?us-ascii?Q?2SohGFaT+zLq2Dtq/5ad47/y2P5gX3fFQgvww0cFUrvD9uB4nlznCXcqP5B3?=
 =?us-ascii?Q?Wb6sEQme4cFVJNSSZqhrrSOGwMamJflj4v7VMrgamNXk/3c6zKkEfCy2oxh0?=
 =?us-ascii?Q?5axr2VgMO8vIH4JIgX25yDK2m2cX0U6xzkgGnebWtV9aBTp+foOhct6immSh?=
 =?us-ascii?Q?Kse4Tnnl0uJJrs2YeVHZT20M8qSfC557XxWGJtQwwAZUTR0SmhWT6hpL7VCX?=
 =?us-ascii?Q?hAX0RDSifeGSRhQ/smxP2zIjUJEL2HrXiZC/i7j7s7zcgf9eW9dxm4ENVYfH?=
 =?us-ascii?Q?sIR2uYEdAJ1xyLQTeDLjE9OWQbur/S5Z+mMo7M2++eRcYQorhxg3aM033/2n?=
 =?us-ascii?Q?Nwz4cZ3eyfRG7Etx7AtnKaMzdv9laQUNuTfQINgEHb+imFbkyCRSvcY2mPeT?=
 =?us-ascii?Q?c0crAoXyWNwcxzMrFtG+qZNHjBxrO5S/wJ/M7N3J6iaxzaGIJnOz/pbKs9Ft?=
 =?us-ascii?Q?k2lFmORjZdjDmqlPvGdqjadkM5SxMrkdPahKaStrGk7eovgIg3Yn2+vW0rw+?=
 =?us-ascii?Q?S8WTwvMrHQBk9hS8YiQM6Fbs1JGhxkSAicswgmcIrQh0nghmriwpzVoGjNLd?=
 =?us-ascii?Q?nL8H5Z5uB4sGefNfUOdNV6L0fgE8/qT3xNDfRh+MwbKVnLQQ2xyoxhrzZbKU?=
 =?us-ascii?Q?0wtSvlTcGREb2RO/ZL+pXJ0kyYJqpP8tq9RtmhpaKoLD4QcWv2RQs2FCdWS6?=
 =?us-ascii?Q?hR9+J4TdQlqSmu5q2RMwIqzJc2JsydTetpBXCOri8gU00GaIA9+sjrKu0FX5?=
 =?us-ascii?Q?93PBtcc8isd0PgRr1HGTvTfhk6V/Oit+hsL+N0e6wO9Q6vwnKvpA3/MTin8F?=
 =?us-ascii?Q?JZhDvl5r+FFWAHDO7xW+HFfAcB6hRe7wxJbCbRtPeLNoBE2KaHCPruSPwVCb?=
 =?us-ascii?Q?gaaI5Js2eHdVTmXU0+JvgMJZOiAjCgQqtjadFdGAK+C+dzFs4zSLM/rYrNMg?=
 =?us-ascii?Q?vEgGMy7Y4slaLOa9JihDKsVeBdFA/KFwLCEtkTLMk82aBeN7F+OmTf2jq6Ck?=
 =?us-ascii?Q?KavZhihjfNMTYX/6xFmuu5Mvn8xeafmQs0C0uTgHW8TZfZiMGgPzxvqasKSe?=
 =?us-ascii?Q?+0nRiQXBOI4shLN4lp45LRHbhQhgWVoQ13CBiCkIqaEKlqBSK69kiwLk/0U/?=
 =?us-ascii?Q?60TaNOsToJvR4aYq3WKDQbst2vvTYdlyTPEuDHfEtXDRtbuNjNT7KzoME0so?=
 =?us-ascii?Q?F1XWiptk0spkjfy5bZNREYKO6XbcpgCA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A3kDJUwVEQldjiO/v06qGargww+7pzmpGEHrlpcmpto7RRhySwFw4l2sLV1Z?=
 =?us-ascii?Q?tcQGY+HtxvwmWutSYtlyRSMyovfw14rkB5exxnObzIpkCq5JgY+HANyViinJ?=
 =?us-ascii?Q?1qs57FxAsfDg8S16XZreWuoXsYC+FqpW2RfJ/e6p7HCH0/wy8y11m9U4OqRH?=
 =?us-ascii?Q?c1Gu185F7L7Tu5PuRhP1iwcTmuGuZJlHHaMW5JMc8E14qnbjarweblHrlI5p?=
 =?us-ascii?Q?Tfh7frEyAt/At5kQ285tnUXbH3WFUdWK/eQtMSr09+f9ZnXbIuEwFdqnMBxE?=
 =?us-ascii?Q?Kq2/FTP+GpGAkr5ZGy11vx59WuKmJWNtokeV0y2ZsHo6H7VfZJAF9lOaBhh4?=
 =?us-ascii?Q?0BsLkhp9HAEOwgvflTysYTA85K0Utp02ZFhALsc0Pao7Hg4oNTowl98HSQJZ?=
 =?us-ascii?Q?h/Bxnpzm2FC1l3Pn5GE+yPA8wr3nDTWWpiU6YlZSYGbiXefluV6EfadfQNhn?=
 =?us-ascii?Q?7uPngRWacRjcIfqf+8poUugGLveYXk/u1Bj0n5Y9t6K7PR1kldymW+NCEGIe?=
 =?us-ascii?Q?21pcFZT0CmOJK5R4hxncZ0+iBwLEDMGNcWpWgR5G4brFG3SeNvjrEife/R+k?=
 =?us-ascii?Q?WAdmuvEa63xK4nZ+XXRmREyYIooKY/+zT6XFuWzm/1DvgOY11Ch3ykxNpe62?=
 =?us-ascii?Q?UteiQxSLcM2bTXmZ/zSKHlpBonsMfQ6kzydIYjjwBm0flSj6radASmEXwiur?=
 =?us-ascii?Q?jpCoHBuphMZX6r0hjEQxygw55pg0aCKEVSvCmvYn5KREvkcvbtBSy33ecQlQ?=
 =?us-ascii?Q?OO+sY2xwMWPyYX1JCJqLIdGr6Vr5BgNbGuQSBulCWAOxTVOq95GwWtNdiaxp?=
 =?us-ascii?Q?ZPvf4SUDWzjkXiNFcvIPXTOv4FitQaPFnrX6XMIEm9Vrq5RcCInHUxXb8aG/?=
 =?us-ascii?Q?hejWAoWDKGRMkJel0ntbkNDMPZ64TAjkWX/h7zG0J9Z7KAsaYnJfyaK1hQBj?=
 =?us-ascii?Q?Hpixssyztrwc3EPxVubFciQ2xNv8kd+6QBuH4pscuwB6foAFNjZ2pxDZUvEx?=
 =?us-ascii?Q?RiuveEeiu/61eMDQ+WStpfjgS9zI1g8Sl4bMHYovWpSz9MYg/4WjaAt8Z1sa?=
 =?us-ascii?Q?lRHrBDALaSyXQOA65/xUnp18t0Q/BHT4xM2MGkOiN7/Wt37fkHbEjTPM82j9?=
 =?us-ascii?Q?5R+yfdxd6afhCPPErwn7c2rdzAykwaZ2TVgbdTa3yvW0Lw3wGpj4yaGLbk6K?=
 =?us-ascii?Q?9QwWx20UEEvhpeqNUuGGztvXh69yZhuAEP40iyPxFDU9CvELptH5sPPRVWhE?=
 =?us-ascii?Q?mkfpMOTxrDkUCVWrwJ2MzVrLe2IfWhY0gDU+/9Vxf4FLkt+OBlP9yVvIME4B?=
 =?us-ascii?Q?LMCQDxfEcaSJbSgnrvBUktVXTUFnaibiNbxVNOWyFYzh6f2H2ZmudofGXzQg?=
 =?us-ascii?Q?6pa8B9POWVROBHBBj58q3h/kxbb8ICWKlVkX9lK4JEdqMpFd0J43fb7OHi3h?=
 =?us-ascii?Q?0Vq3QJhr0YauU5yPorxMsPP18nC3p6J79vrIGohez4Cl2P4HudQOIC7xZIJO?=
 =?us-ascii?Q?vkmhk8agRYth/+4h2Auvl2Nrdayti0G8bcaLozHXF1Vju8t/9ctYA/9pX5N6?=
 =?us-ascii?Q?0keHYCzGkdJvUiJK8kxA3YAKAEh80jg4xm++PF3/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8322d8d7-447a-4821-4b69-08dd629bb312
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 01:58:22.6888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MO7sDGtPkq4dyd9KdM9dsMiklPjYbqIDeWD5jU6vx4/m/mua+sS7G/5AVADqmQdEZbhgpCC+ACPGV2nP04DuAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
X-Authority-Analysis: v=2.4 cv=VYX3PEp9 c=1 sm=1 tr=0 ts=67d38d44 cx=c_pps a=tyvwN2z/Y66O58r8mq/nTQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=xNf9USuDAAAA:8 a=67BIL_jfAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=svO6gwnVAAAA:8 a=QyXUC8HyAAAA:8 a=k-42gJp3AAAA:8 a=GNEw3xDRAAAA:8 a=nHPcHFrnhFaxN3WkrXQA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=5awQwY9Y38-QVGG67zo_:22
 a=uCSXFHLys93vLW5PjgO_:22 a=Gbt7yw0KH3r5R2uzA50C:22
X-Proofpoint-ORIG-GUID: YGzD8BpKGvj6uyprS7Bw8xvtSdL5mw3P
X-Proofpoint-GUID: YGzD8BpKGvj6uyprS7Bw8xvtSdL5mw3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503140014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 01:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115983

From: Chen Qi <Qi.Chen@windriver.com>

Drop 0003-php-remove-host-specific-info-from-header-file.patch.
Instead we export PHP_UNAME = "Linux" to achieve the same effect.

Drop 0002-build-php.m4-don-t-unset-cache-variables.patch.
The related ac_cv_lib_xxx and ac_cv_func_xxx settings in this recipe
are also removed. This patch is not needed from the my build testing
result.

Drop 0009-php-don-t-use-broken-wrapper-for-mkdir.patch.
This patch says that the wrapper is broken, but does not say why.
Without this patch, things still build.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...d-php.m4-don-t-unset-cache-variables.patch | 45 -------------------
 ...-host-specific-info-from-header-file.patch | 36 ---------------
 ...p-don-t-use-broken-wrapper-for-mkdir.patch | 30 -------------
 meta-oe/recipes-devtools/php/php_8.2.26.bb    |  9 ++--
 4 files changed, 3 insertions(+), 117 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch

diff --git a/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
deleted file mode 100644
index 2e1e752d61..0000000000
--- a/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1af203e8e385d46ad3e33b1c253b1c564aa99034 Mon Sep 17 00:00:00 2001
-From: Claude Bing <cbing@cybernetics.com>
-Date: Tue, 9 Nov 2021 13:01:55 -0500
-Subject: [PATCH 02/11] build/php.m4: don't unset cache variables
-
-Unsetting prevents cache variable from being passed to configure.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
-update this patch to 7.4.4, acinclude.m4 move to build/php.m4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-update patch to 8.0.12
-Signed-off-by: Claude Bing <cbing@cybernetics.com>
----
- build/php.m4 | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/build/php.m4 b/build/php.m4
-index 9746ba28f3..93551d9ca7 100644
---- a/build/php.m4
-+++ b/build/php.m4
-@@ -1568,8 +1568,6 @@ dnl PHP_CHECK_FUNC_LIB
- dnl
- AC_DEFUN([PHP_CHECK_FUNC_LIB],[
-   ifelse($2,,:,[
--  unset ac_cv_lib_$2[]_$1
--  unset ac_cv_lib_$2[]___$1
-   unset found
-   AC_CHECK_LIB($2, $1, [found=yes], [
-     AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1604,8 +1602,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
- dnl HAVE_library if found and adds the library to LIBS.
- dnl
- AC_DEFUN([PHP_CHECK_FUNC],[
--  unset ac_cv_func_$1
--  unset ac_cv_func___$1
-   unset found
- 
-   AC_CHECK_FUNC($1, [found=yes],[ AC_CHECK_FUNC(__$1,[found=yes],[found=no]) ])
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch b/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
deleted file mode 100644
index 1aa28e2add..0000000000
--- a/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c81d0bd3491a6c6371d9df2f43956d109f984310 Mon Sep 17 00:00:00 2001
-From: Claude Bing <cbing@cybernetics.com>
-Date: Tue, 9 Nov 2021 13:02:29 -0500
-Subject: [PATCH 03/11] php: remove host specific info from header file
-
-Based on:
-https://sources.debian.org/data/main/p/php7.3/7.3.6-1/debian/patches/
-        0036-php-5.4.9-fixheader.patch
-
-Upstream-Status: Inappropriate [not author]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
-
-update patch to 8.0.12
-Signed-off-by: Claude Bing <cbing@cybernetics.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1eafd62a44..90c94323aa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1462,7 +1462,7 @@ PHP_REMOVE_USR_LIB(LDFLAGS)
- EXTRA_LDFLAGS="$EXTRA_LDFLAGS $PHP_LDFLAGS"
- EXTRA_LDFLAGS_PROGRAM="$EXTRA_LDFLAGS_PROGRAM $PHP_LDFLAGS"
- 
--UNAME=`uname -a | xargs`
-+UNAME=`uname | xargs`
- PHP_UNAME=${PHP_UNAME:-$UNAME}
- AC_DEFINE_UNQUOTED(PHP_UNAME,"$PHP_UNAME",[uname -a output])
- PHP_OS=`uname | xargs`
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
deleted file mode 100644
index d329387e6c..0000000000
--- a/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 8707720c0aea405f0e06d67354f239232cc823cc Mon Sep 17 00:00:00 2001
-From: Claude Bing <cbing@cybernetics.com>
-Date: Tue, 9 Nov 2021 13:10:02 -0500
-Subject: [PATCH 09/11] php: don't use broken wrapper for mkdir
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-
-update patch to version 7.4.4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-update patch to version 8.0.12
-Signed-off-by: Claude Bing <cbing@cybernetics.com>
-Upstream-Status: Pending
----
- build/Makefile.global | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/Makefile.global b/build/Makefile.global
-index 6566d052de..eb39421f2a 100644
---- a/build/Makefile.global
-+++ b/build/Makefile.global
-@@ -1,4 +1,4 @@
--mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
-+mkinstalldirs = mkdir -p
- INSTALL = $(top_srcdir)/build/shtool install -c
- INSTALL_DATA = $(INSTALL) -m 644
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php_8.2.26.bb b/meta-oe/recipes-devtools/php/php_8.2.26.bb
index b8e96833f6..1f1b91b22f 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.26.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
@@ -13,11 +13,8 @@ DEPENDS:class-native = "zlib-native libxml2-native"
 PHP_MAJOR_VERSION = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
-           file://0002-build-php.m4-don-t-unset-cache-variables.patch \
-           file://0003-php-remove-host-specific-info-from-header-file.patch \
            file://0004-configure.ac-don-t-include-build-libtool.m4.patch \
            file://0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch \
-           file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0010-iconv-fix-detection.patch \
            file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
           "
@@ -34,6 +31,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
+
 SRC_URI[sha256sum] = "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
@@ -52,6 +50,8 @@ inherit autotools pkgconfig python3native gettext multilib_header multilib_scrip
 SSTATE_SCAN_FILES += "phpize"
 SSTATE_SCAN_FILES += "build-defs.h"
 
+export PHP_UNAME = "Linux"
+
 PHP_LIBDIR = "${libdir}/php${PHP_MAJOR_VERSION}"
 
 # Common EXTRA_OECONF
@@ -71,7 +71,6 @@ EXTRA_OECONF = "--enable-mbstring \
                 --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
                 --with-config-file-path=${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION} \
                 ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)} \
-                ${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'ac_cv_lib_pam_pam_start=no', d)} \
                 ${COMMON_EXTRA_OECONF} \
 "
 
@@ -82,8 +81,6 @@ EXTRA_OECONF:append:riscv32 = " --with-pcre-jit=no"
 # see https://github.com/php/php-src/commit/70b02d75f2abe3a292d49c4a4e9e4f850c2fee68
 EXTRA_OECONF:append:riscv32:libc-musl = " --disable-fiber-asm"
 
-CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=yes"
-
 EXTRA_OECONF:class-native = " \
                 --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
                 --without-iconv \
-- 
2.25.1


