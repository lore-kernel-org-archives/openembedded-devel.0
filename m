Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5E9C04A95
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 07:56:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.7857.1664438187533626500
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mYHScHnp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7271b02b47=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28T5iP5s028783
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:56:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=HmTjvdofDpMJsq1ZnSkNDKE067P1sUjuDMpZBB4klPU=;
 b=mYHScHnp3Q9FXlo+up2zFbfKj6XhFavERyi8ZeQsyTEVKo4J7AOzDEWOM0luKoNHBbnI
 GC6q+WiHhGbFIInTlxwLySx46fDdykS8zFCsHCywMQXl07Hx3hOue1ws2os/mDU2sOiJ
 7okJxWQKNQRjCjGkH09p1N457EgU9OEhTO4tUO7LAH2A7QnbQYYbp4uteZYtLH7S85pQ
 pWylBkgr54fM7fXSAmxVEDL38a+qCmgdPWiTT5S2nHTbXiLVJkddM6jsJhMrkBMYHW03
 j56dIiDC3yX9At/qR5qPJ/y5cO5bt1vFvpl4Q2wCAJ16sA7u4A3v9B/au6xg7IHZIxlL Vg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dkc21x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:56:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHPBNO71RcMpHyPDlkE8D41e0YiyT1fN809s4pCipOIB8fVuNKOdMsuC6LHpcBBZAE61kzc0WR8SCiCzavhYPyhw2ggKdpScfnprryxA8YO9QBMvjQJtQBDmI89/0/1t4ALjlhEsLyFiKKvimU8ei41bpW/ZWKbsIcyv9/mfFqDIy9gjkpU17D6LJ8f+6hfSyczF2nu281N5oKaUhyKM6Eayoj/JORRXekY/5KgnG094qBTCYC22sGCFJjitIfPRrAJ9AvmHMbKtO59QrPVnLSXv0K262HBIxJSJLiLLPDB/nJqaz1XHzYv7PLE3A5TfSiR8KlRcFWFLkn9jq7SgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmTjvdofDpMJsq1ZnSkNDKE067P1sUjuDMpZBB4klPU=;
 b=bLL2P8Q91jEFNG70KgPibIrS3WbWWMKNObBvQ8plCe2prxqkvgNVVQiTRkX1zz7Am2gp/JXOCWW/Q3tnd5IEHL0TSLvr7/oqqRA988YHIhivESa/eixrTf9ihOgz66QawtIR5ZZhtd/P30L/+5GsJLLqWALvc2ClypFO03U4gzz5NsLaNeIciEoRokSUrlC/iDPLCTmgfRRUE9Y16dK3EA7rVRkx1b/j7BfBaLagnbrP6SX6s6bnoxetjHUoOt1ub1hh65QdIqvvby21s1qV0Zrrwzv1A5racU2Gq2sYRWWJ0euvV9SkgbB7WXveWBGX8onZrDLXjIIXZigCsBd/dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BL1PR11MB5541.namprd11.prod.outlook.com (2603:10b6:208:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 07:56:23 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8957:e965:a52:2366%3]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 07:56:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] freeradius: fix daemon startup warnings
Date: Thu, 29 Sep 2022 15:56:11 +0800
Message-Id: <20220929075611.874168-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PU1PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:803:29::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|BL1PR11MB5541:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe9c522-da8a-4224-5151-08daa1f019f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lpj0rnp9141h1Ntde65AbFXfcdlY6tVMI0DgllvvMQ3IGZjRmFlNAy0tMXfyXKQZA2HHDzjW2Yf8qf/oJj/bob7EDA4NpUYecA0Ye/SG6MuBvwJPcrX1Q+5RqdKd9K7takJ0i15WPVGz0uhN0a1aJQIs2QRrpINICjX2MSM4qKoX5UvoGGZiToG4OVAjM0Yka1rrNO3YlWgz1gXh+ZgRrQmHiIa1dXh3KuKqDGAY0Ksg6J8poxC3ReRebL+r4n3eRpG36aWki3nrfvbi6BpK3mMfGTQhkwYwuFuDxLi1sfi2ID3oiN0CxJM3kBcipXv9SAaE/Yr2mZWskodrUFXxd+zNJBsB4FfFmJjNEcbTeYbamfXDgzAsEK1qSwy8Lvy78+Y5aZn7e+EGp3f74HOloHlPYAZYxbcS1Xcq7Gs8r57u7Tl2bG1BaELYHGlAD1HlFo1kLwSp8CGVNoh4XW/Yq3M9bxQ959rKdW3sV0Y7K5jEs7iH9MHeeV/VEbhF3ZhHO4sRuptqZ8ntOya6IiD5IjxXz2tjIB1AVaJYAM51gWR0CSNquLjLaANtbJFB11CxPbOgZd6JWSJlKtlhBNZj1A/ZNNiFvPqyZ8V42mIBcPAOZ99+fYTjhOXv3pBeHWCeHr4kZjKfgE7ifIydVrl8rDcgYuRcmCrABMMqw9PBfk9dkLc0cT4uANutXbByU7tkaV6Bxqrh6yCwVnVavukeRdhk6okbvgxsAAQhhNMep6Lmws+cxdT6M88D0mPLjQGkWElzeNG/3TdoFZFCcbjkTQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(451199015)(44832011)(5660300002)(8676002)(6666004)(6506007)(41300700001)(26005)(38100700002)(6512007)(38350700002)(36756003)(86362001)(83380400001)(186003)(2616005)(2906002)(1076003)(478600001)(6486002)(6916009)(52116002)(66476007)(8936002)(316002)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dU5/KzWFN6Fdo7mE4ukzf62yKEVvxR2EBl4YS+wX/X3x9AOvgArkBVUjzFDW?=
 =?us-ascii?Q?681+FOPouaVQb+eMKgNWmqj0ENIxfF8R/kayrFecBzkXEV/Lz0nWJVlN/Hpu?=
 =?us-ascii?Q?GpuMu9Edzx/49lraPtRuA00xIGWdc5Xuy7IeDLwX78V1gcO1Y/qmj+D1Mu92?=
 =?us-ascii?Q?+MROU4JvN2fRqoY7fRJgSJyufVBLXjZTHEAyrMziZKO03cGeyZ1FODyylWI2?=
 =?us-ascii?Q?GyFx9c0HnkDPx5HmKVMkQkRVd8M5zKI3wDpmuM81VfIrjovzwjE/rQQZXyhl?=
 =?us-ascii?Q?wkQorbKFaZRw3233acGBb+LGd0rqC5LbNFMsZmJEAryb/6Scsrroe8a7LN96?=
 =?us-ascii?Q?tiXpj7UqV/7Tdev6Bx1srzlVq0HW5lyhvxhAlvOHvLCofvyCJ0UE+cS7+R2v?=
 =?us-ascii?Q?BWJbfxB6Q8vHSTuTGLtMPBOB4iJhCohuPfBW3JbLElCPA1rmAJxLegt1Oxcb?=
 =?us-ascii?Q?D2OpBedjcQUUbVzpKUniDR6vYBsVke9/kWrJCS+KFx7+VquE9aN51Hjshq7T?=
 =?us-ascii?Q?Zj5723kSKKbUSPmFqgsN/J0CNC87kBwNwU61ztqe0cPJmQ1sQ36HhdAkVnUm?=
 =?us-ascii?Q?MVpttN9Vd3K2yv1ZBoz+qXumIsaYFvQtlEaQaZ9NDryRdILGVQ6vt5cr3qmZ?=
 =?us-ascii?Q?W3NWwqoP8hlN0ZjZIvCtZAcI18FznJzbxmv0dNZthPQos3/2+CRc2Xl6DbB/?=
 =?us-ascii?Q?wuQW/Yk0MThW5gDJddJ5A4lV5gSPVry84SIHx+OC9m2f4L8QFaC/1i0RZS09?=
 =?us-ascii?Q?2y3gIPB8aDizvWx2xK5lJQ73/uHIlD0IIXrrzzzZ8pV2NSqaPeRyF8eOkJsN?=
 =?us-ascii?Q?nTX1AzQwQi5SOelB0oFYsw52V7OMsqSCff3h1hmD4LG71wXKWF8QOMeSpZV+?=
 =?us-ascii?Q?kytw7RtF48rrkOq5fzjU7n68Z0c4W8FZklrWhuGPz6WzEBkOnEeb3jJWKNTB?=
 =?us-ascii?Q?mMmD6QblUmpVAoo9Quqjzs4Kiyjp2ETtgBBXqCtislwQkY0x8pNQNL1jtB7M?=
 =?us-ascii?Q?APy+ZPD8ulkilUDmPe8gAjSX7Otitj75oHUcbhtV1CvAvmRsp8vhLz2NM3eI?=
 =?us-ascii?Q?muQKr+dNjXD80CNcP/unB3G6m29mG391+TW3g9MT4xtojpy33f0Ma0sybyTM?=
 =?us-ascii?Q?fz+tzBoXXhEJRt0pIi1RXDe0JG4g9nYNC3ZvekK7yoti8LqMsUUqwAybvDUN?=
 =?us-ascii?Q?Psx0p5QUIjAlFVPaccMcClv/2fJEWPBXLSyfRnjjF4Gt4q5DfDb6Sr5i8ojb?=
 =?us-ascii?Q?C6cvX8SpRrmLbIXoi0dysSqE0hHGOpzf+/sheKvJl8DTdI6ulMufMGNvfD3N?=
 =?us-ascii?Q?Kr9tFruljOCO8Qi/37ZnowZx2DtZ7ccdN4RJm8abbwkEro1p8Ds5IWkAxXlh?=
 =?us-ascii?Q?H/xC8djigK028n1CVNRQ+u0yplcuNq9Bc1wRVWAND7GkU7otwixnEjBB1ieu?=
 =?us-ascii?Q?wkGp1ZJF87r11sbn06iF8CrA4SUmBuGmCojv+FPFBnYPwJ0bQKeVPDkdo5Qo?=
 =?us-ascii?Q?UCcdhNByoVWGKC6u7tGfSpOfaAvvnwCIgwai3N3OE/MCh0TM2+xU04ogbzbx?=
 =?us-ascii?Q?JptXoTaCbQ7vwfvmRMGDt3tKf29o+w1G6cxvPAKW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ffe9c522-da8a-4224-5151-08daa1f019f0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:56:22.9016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AYwkOsV+p5ssbsBaJVdVEC8Ui8zSc/YDAu+3xHieVEL4dpIu1zuQb1k8cIQReava8No8iFnZ+WOKGYKE05tzFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5541
X-Proofpoint-GUID: 86K8rwgfNrjGti7e1x_azZN66OlnI-Dk
X-Proofpoint-ORIG-GUID: 86K8rwgfNrjGti7e1x_azZN66OlnI-Dk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_04,2022-09-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=866 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 07:56:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99002

Fixes:
chown[1483]: /bin/chown: warning: '.' should be ':': 'radiusd.radiusd'
/etc/tmpfiles.d/radiusd.conf:2: Line references path below legacy directory /var/run/, updating /var/run/radiusd -> /run/radiusd

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../freeradius/files/radiusd-volatiles.conf                     | 2 +-
 .../recipes-connectivity/freeradius/files/radiusd.service       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf b/meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf
index fa6296297..f3619dddb 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf
+++ b/meta-networking/recipes-connectivity/freeradius/files/radiusd-volatiles.conf
@@ -1,2 +1,2 @@
 d /var/log/radius  0755 radiusd radiusd -
-d /var/run/radiusd 0755 radiusd radiusd -
+d /run/radiusd     0755 radiusd radiusd -
diff --git a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
index 2d766488e..37a2eb3d7 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
+++ b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
@@ -5,7 +5,7 @@ After=syslog.target network.target
 [Service]
 Type=forking
 PIDFile=/run/radiusd/radiusd.pid
-ExecStartPre=-@BASE_BINDIR@/chown -R radiusd.radiusd /run/radiusd
+ExecStartPre=-@BASE_BINDIR@/chown -R radiusd:radiusd /run/radiusd
 ExecStartPre=@SBINDIR@/radiusd -C
 ExecStart=@SBINDIR@/radiusd -d @SYSCONFDIR@/raddb
 ExecReload=@SBINDIR@/radiusd -C
-- 
2.25.1


