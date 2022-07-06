Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D40C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 04:33:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2548.1657082017523541409
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 21:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TWLtQIRj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4186396729=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2664XbSU032044
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 5 Jul 2022 21:33:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Y2Gqi/vFbbTOuVGAJnqT6o4VD6c2fkr520JYU5ph0RQ=;
 b=TWLtQIRjeWtffWO1Iytqbx5vVhA1R1pLlznou4OGt8c1iFLfGACVdP4w+pHkPRnOrT37
 zmAERD8C/Ptat1TiM1n9hhPMPZw06Kbh9AYMDleEepKcM6wBn50jPe5xWQwmLH2gqs5/
 5JRl0UWv4XVkm2l6k3Q+9GJKTPcmSVTQxh82c0dhIxC9bGBHQFi6Wh4N+F0J6lje29Xr
 Nn0YsoVdqEkX9j7E6yplltomux/Oh/YJs1TBA8CSvgNbJjiYQi6G1jK/hZnZgXOEy3KE
 VPVF4PdGOvgJEMJaDoJZp9HZ/SUD/dLsQbKFuVgOn5s56jTLoYJrfum4Zw/tvy9GsLkW nA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uy0r86d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 21:33:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffYnZMVzGfvTIl6bBwiXyNCCzkSR9aSFwGZOinbwvoqIUxQx1b5jKZOhyr5L0ZxJxbvk0DDqxihmkpTSMX5ojgplQX5a6/psTUBnCqQ9IzUKFBjBX9HcJH9h4TqMiD3vAebJddIHiXuDnQGcYO3B0L+sC6TXCvE3wXQ0rmEGFGX8lag3ugY1eBmOki6J1dgGuoCVbvKt9VvcFQykQpJn5/KTr2++Ni5YiOQGxQoVqUYGFk9CrobG0i8LUwnFkRaEp5z6PQPDKPR8ClRkJKxEU5L6pJL3Ogfr8ItW9KQfa/HoEgvpm+6mrEDSUMp9P+YS+AtRgfpKIDATC1udl4rlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2Gqi/vFbbTOuVGAJnqT6o4VD6c2fkr520JYU5ph0RQ=;
 b=NZxJuSEGKRttEcBCM5JOVhYvB/iSLBMxU48mAYtcQTlsYvMwr1SQqd5fP36+AMxMUjkq6IU6caSHC8+IhC94hl6P+oFOcLaJmna9AjzKJdxmTpEkQAGWB7mLT4gYV+Jl+7Wo+3uqlUBN2hDoAxP98hQD4HvNCSuk65AK6sM1P8rkUwR42JuZBtISnZswikashUyYpG/uGOyuYO+79zfUv/SYlRPCoxYdauAghUsZZJK/gcIGE9A2WnLuGprxdyVED0xDy83h7SXH7Als6H3zWbc4V7SXDnyCG5XtBHOn3hMmyGKyGUgd1CvMsvN/gHlFxBRuEHgU0rTTO0Wzr4JMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM6PR11MB3049.namprd11.prod.outlook.com (2603:10b6:5:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 04:33:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c4dc:c0e7:a0f2:7a0f]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c4dc:c0e7:a0f2:7a0f%6]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 04:33:27 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-filesystems][PATCH] ntfs-3g-ntfsprogs: upgrade to 2022.5.17
Date: Tue,  5 Jul 2022 21:33:17 -0700
Message-Id: <20220706043317.34066-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 910720f4-23d1-4cb0-026d-08da5f08ac15
X-MS-TrafficTypeDiagnostic: DM6PR11MB3049:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	maxdA89HkZgm2WLca9W3EaxN6suubvCVoCVLuOtWEXGWlRbuECcqnY2erbYKQ2Tc/BD756pbzk1WSn9HqbrcaSZPYIF1FXYqTYv/2X/Wp/BKdFtK4Vc/oWeRLz3pW7u0hdOGZC5QD5fSbNxkkfmpxm+3oOWWX5b6nmmgT/Pkh0Kl7fgxmstEh9A5huOc7zuIqEwlpywvfA6E4k/FyeBBvq93IS29H2u5VC+FNilS8iJC28jqw/rb+jA2rJMRUS+BGsfr7P7HBNwGseF1qr1UnmOk1Yt7jsC9z1hpXXjjdb+sws0S/so3FeCa1f+4HsZJcwyV23LJlb+PTmPAXLtb4fmXrTZuqZEpkcM1EZ9vl9bLo4B7DNem8lc5mxGevmMClTGEDUiYWO+m1dfg8uEycvr2nDw1utPK4q0NvrhiJtlpr+K9btDv1vY2IjXQnP9Q4EA9u9xrvhyuZ3GnuFpakc3ENYm4zD1EJp0bGh7COKCAj5fSKnBR1mO0xspu99xsBH36gCWrna9WjxMfUCasfeWcO/Lb80gG/bSSlHgz+7Ov9iLKMNDnrxSUXnKwjepsTkOfeKeY0cgXFrPb/hWkwKw9TUME2nmCHhKtCbMr/6SVAlwgnsh6jWMgADI8aB0F5uWQr8HAI+lrZj2evoSfwTIidCbBS6p7wEQ/4OHP7feIXZ7gkZsQLqhCQdBAZ1zoHtAwHgNtJ1xlwW5wiGg71slWMqvQLsqNNmV/xmiy4bcDDZrn9wMNl2Yv3Xmo/ojOt8rqNS9uQCMzB0Ev/DEPOdvlkD8dkJi3Wsxy5bFSAngWSrAqjjBhkf1wPtNO+0jRDkuPbqNNjbT8Urgiokwd1ew6UuPKZ2HwiNyJH1KR1mBCkM8vZyJsqRxxpXuEb4QB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(2906002)(6506007)(83380400001)(41300700001)(6666004)(186003)(8936002)(1076003)(5660300002)(36756003)(316002)(478600001)(966005)(8676002)(2616005)(6486002)(38100700002)(66476007)(66946007)(6512007)(6916009)(26005)(86362001)(52116002)(66556008)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qr/h+/ypXtjQEtHcbeb0Ew1DuGMCE9E3TSlYV2AlTrdgxuBq7q+jHZSvb3ur?=
 =?us-ascii?Q?plJoRfNYTWRd9yls6SGA28O8u2Pi6J012YQcZaS7pIlX2l2VdnyAAvTV8l8e?=
 =?us-ascii?Q?iMIVG0oc9SZUz4MN33LXgrWnZjsvPjnz1kof0kUOIKmYXNv+8IJkz6TNV3t2?=
 =?us-ascii?Q?QOv2wJIoLMuvJmQBST0iy2kZcrQsOMtWT8pXmqwf9NMH3pql5TaGHczeisbR?=
 =?us-ascii?Q?zCPCIPsXHqGw1zxzuEyMGQymqR0TJD5T5JPT7lhMU1Y/Fo7RVQ1Jxkt+hvp1?=
 =?us-ascii?Q?LezHUoFz2Efw5WSN+KgHObnM9hPZRbeoiLPAHotlrRFl1LQxLxVNapUV7HFb?=
 =?us-ascii?Q?pQBkPbmJHUXPitaZEkHSj2fH8aIGgShR31mvxN6gVsSuR4CHgYb1+C6+hmN6?=
 =?us-ascii?Q?hHRtPzqE8mV2CAzijOuQ2XR1627TclFMNnwnUpiVyl89qt6RNDpLej9xeH6j?=
 =?us-ascii?Q?JbO0vcYZEHAI5beDQ2RKgc+iDLH6X04LCNvj5iem1egrIfNUs7/miT66Rvhj?=
 =?us-ascii?Q?/rkULYzvTlNEnTpDA1yM9JvAGPyZcBcDtG94ReEqjOLH/nu/1or7HZht6XWq?=
 =?us-ascii?Q?kVOiIMzheJUy0S1NhBjJyL+96Dpfdfnwe1BfwtqG/vh4YKeyHmofjZU0qyD2?=
 =?us-ascii?Q?mq7vFRXlKPWKCrKIR67oGC2A3wdteBzBWcJHBIkXztw4AQxP6O6686rrqnFD?=
 =?us-ascii?Q?0NEjVWSQs3I8Ksl/BDgVKhJKGalfLId8+5UyhkuQixPWurhEdhJBotEJ+P3E?=
 =?us-ascii?Q?mTHNnx0Ae9ZsX0sW7Q8tfabhdyteSsleWhxY1znlJnMU3DR5R3m862i6iSRo?=
 =?us-ascii?Q?2a4hxL+uSGHdvLVDupqdFGyeGu0/UUxZ4WYeFpJ82NemcAGWZjVKDFVtTVlI?=
 =?us-ascii?Q?ILbDlmp/fGAr4Q6H9iWqoTa10j7vNX0sIybvArpDjifqTjpMLBvDmCo8WA9P?=
 =?us-ascii?Q?n27Xb0dacNnAAUElmoJMQRdFOrM7pL0i+Pnko/lf1L/EzqsdEPcBn81XiYl3?=
 =?us-ascii?Q?5+BxEx908V+yGUZAf8fu73Abqpi6n3e+dWxjqTp5P5Q92wS8qhaez3oeFlsG?=
 =?us-ascii?Q?eITrTASLFBR5c7fwSwM8aqSTWNj64pRiqrtHJk6F5adJ69uXsxR/YZ7jbN3i?=
 =?us-ascii?Q?I3hRJTyTI53hDRKaFblKWXPiHmTumgSkrOXUS+zat2Kqu35gcI4M8uuxCX19?=
 =?us-ascii?Q?hRMxciO65s1FndOsO1kD9KgF/ChYm3kSRqFonR1tQ8BfZE1vpU2GjaMmtdAQ?=
 =?us-ascii?Q?QwwvyGi6r6Yca8kFI31JRrwITau4Y94IiO+cWfg/GQM1BcRrf4FW28RGu/Wg?=
 =?us-ascii?Q?dVDUOaFMz2kyq4fl8wkuoDO33koZlFN2F8lulcFgqAUAEiED2KqYYV2vFv+Y?=
 =?us-ascii?Q?J9+NjeSdw8JEt4ELcpByOgVcMw6r61g65MehDhyXZWeSq2FEULBx0jB7BVUU?=
 =?us-ascii?Q?p65K5LWLdXd7q+Oxl0avXCxxpZwMZXxhnjfwsO3XAmAZHTXnMeeJyqNPFJEo?=
 =?us-ascii?Q?aV8vTiCiyrcwdQ4ugqSL/+uNltxewUJIrVRoSSgYdZ1M8EMLimbP82gWixQJ?=
 =?us-ascii?Q?2MnNnp+wq4VpUbr9gVZ1Os9I4zdxr6BFvqbaN3IE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 910720f4-23d1-4cb0-026d-08da5f08ac15
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 04:33:27.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 STFqa83lUMffxmg0ECZ4kjTI4qD0vD2wZA6xWwpUYUwlwBDQm9/LD88fJA3UAOKLRpuGqDW+en+HCUmHGQf09A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3049
X-Proofpoint-GUID: losuM22XiucPXIV494JFAU7jx-iBiA-a
X-Proofpoint-ORIG-GUID: losuM22XiucPXIV494JFAU7jx-iBiA-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_02,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=738
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207060015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 04:33:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97722

Upgrade from 2021.8.22 to 2022.5.17.
This upgrade mainly include CVE fixes.

According to https://github.com/tuxera/ntfs-3g/releases:
"""
Changelog:
* Improved defence against maliciously tampered NTFS partitions
* Improved defence against improper use of options
* Updated the documentation
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...g-ntfsprogs_2021.8.22.bb => ntfs-3g-ntfsprogs_2022.5.17.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2021.8.22.bb => ntfs-3g-ntfsprogs_2022.5.17.bb} (93%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
similarity index 93%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
index c77028785..b29716ad4 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2021.8.22.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
@@ -10,8 +10,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[md5sum] = "90da343e78877d388eb34cefae6799ae"
-SRC_URI[sha256sum] = "55b883aa05d94b2ec746ef3966cb41e66bed6db99f22ddd41d1b8b94bb202efb"
+SRC_URI[sha256sum] = "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93"
 
 UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
 UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.37.0


