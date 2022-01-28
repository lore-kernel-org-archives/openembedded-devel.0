Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24A5C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 18:51:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.349.1643395873450598111
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 10:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LV7JlLFE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9027cf57c8=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20SEprfI002643
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=VAoPhS2WiLmhHXSXnSrmWp21A3hhnCKpkx5Yx/xJuso=;
 b=LV7JlLFESx2hCb0IMuVkRbIQ9x0Jjsa8/a0xWDggYvoT/U/td5bDhNSpbK+RsQIygceL
 ugVLhPthS0q8lKQFUgH4pvcduHsg3tkMp4oOghNgJAtj9EN9CD6hYpkrifKijq9TETUa
 K+tEZ5GrxLjXIAd+slYDoGAnpnrhxJrsi3ouGwDAK7izoQVGMpmpCEedVvCXzZ+8qdqB
 YX/F7/zrT555CW6GFvyeZ5h01wffeiOtBw/+oWJc/G36qnOnvCMAJxdTpHXJtUe0sJlU
 rVz4Vo4OYNZXoxVFbTc8/D3XDPaZ0wqzk0HpEW4BSfFNpB/nPWjmCMaVeEzo6NYDtvU6 Nw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3du1jet5sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJLPnFpH+lpfZlxbZD74G5vy4XZjPi2GNEmwCQVueVhFT0EDL6tTVLZGgKwAQrZ+7Lv1WtRFalHOFPPlsJn/HfJfggJXwtvrc4T7RsOV1xBf/O1c/+OEQkVuEOAuBa315ob1cyppLs6wyaCaXyeaCuxQRJB8YrNeYowWIWZJTV+XkEoE6rxJHTJsaZLFgQJdD17NOCwjmjHEgI0hxIMDC4SlnVbqJDyYcJ0VYEDv/l+2DRpJiuJ8k0Li5qEYWdhinrXc9aSnVK6WTva+QrmldUq2+STgzDw4xQ6Muo3hhHyOMsq9qy/cQT4SNnyIgfs4qc8WxmWxKLgTfQ2t4BERmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAoPhS2WiLmhHXSXnSrmWp21A3hhnCKpkx5Yx/xJuso=;
 b=JWWFqxCRFrP8uslQSotbtjoq2l4ditvkvaeqNGIy+gz6WJGPJoSuBo6riLxNYbMk5wWAMI8yFfnc/FJLtjqzCdvIPAYD9o3zpDM23LyF/cnp3Dok5a4UuDrUojCmXjddk8IdrRk628+CFanF/eYx/snOmKV242I5Tn7M4vuyx8Mhsu2kCuoA3voNgYYX2xuwch0CplQMXqquF47PV2tTYX11e+Rl4d3ITJMSZ9AvtF5NtlK9qMV2BAiJYGypPELEdR91aFoA0tILjywVWkynH5Duoa1tKjlD1iHUmqfovZFS1bQrIG8YwFiXCeb4ezjLBPVGhnUnSvdO2DFOQXTbDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM5PR11MB1963.namprd11.prod.outlook.com (2603:10b6:3:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Fri, 28 Jan
 2022 18:51:10 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::1853:d98c:5147:611c]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::1853:d98c:5147:611c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 18:51:10 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott][PATCH v2] python3-pillow: fix
 CVE-2022-22815, 22816, 22817
Date: Fri, 28 Jan 2022 13:51:00 -0500
Message-Id: <20220128185100.23269-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::33) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fbf3571-2e71-46bd-3f38-08d9e28f26a0
X-MS-TrafficTypeDiagnostic: DM5PR11MB1963:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1963EEF7F78B1D4DF994AC5C9F229@DM5PR11MB1963.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6eKR5R9Bc/tNSjnYjZxD0zEUnAEMR9RqLvJ5+0PLu96h2eXY+c7v7PORxlCQYBYlvlx8E9EC7N/O66q+Bm5tOt1MxFrhfs03eW2/TU+2NriNJELIO3Z0mDoEoGqHbZwmruro3MYVjysW8s1CXtY3I5PxKaMtCzNwwFKRp6JjSaoS+2XnypPwkMPJxRSOiwV+2alpIrP9RKcMTDmzLdBRk1ymeI3+0sTXW9WZIw/QQn2imfOiCRIC6DaAuTL3eUZ6LnEvr2/WF3NBIgoUh0vNur6eZfglrk8aRUqNNkR8+uMEbB1YmlG9ZqllS1Ew4Nj82SbAjztejxGTlOdkqt+9jBvCxRrUmu2jPMP3ogLPWXgpevQfXKAjzlSlOBDWFmkpQjzou2L+fEG1w/hT07aaADIy+Wx8UNX3U8PQovZG11eWhdNWuYaQmy5thTFZQkIPD3LVDvuhJzHgtYUnTOIhMipaq1fv7+Bzp8CbGu/7cPkVXqm8O0UEzJGT8bHFPmaskWX5FQpCA8QwiqiUk/OIPaChqp91N6uN50CVgRay1huzQol5iTWKPyzOIyiyMBAtbgqa9QHj/moYHsCZ0Jrl1Oqaax2oX2zMmlU/QSDuv4AuMTsow8A/JcJ4iraBjYRZFTtJzVMcWici8o9gmQsdniGr+ZKvv4mRdnpWJAa1navemwQRXoBnZNW5RYc+pkyO8NlksDQMTbkcRHR/l/VhQfrq/dto5zRQBslFWauOuUM0mbFBe2I0z79fn0jyVBci4nO+EZFI76mH3Wl9TKYGTGjzByxOh0x5fV/lS6AJ3EODWAniAnEOJIdiMRqy2ZPQoQF0HtrHl5k6lYuAlfadXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(52116002)(8676002)(66556008)(6506007)(316002)(26005)(83380400001)(66476007)(6666004)(44832011)(8936002)(86362001)(2616005)(6512007)(6486002)(66946007)(38100700002)(5660300002)(1076003)(6916009)(36756003)(508600001)(38350700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j4usl2B6kk9tThO5TGfxElRHbyPzi72fwnF086hETcK/6X8P5BgkL54ymBIm?=
 =?us-ascii?Q?U/UBR01Ak2+vFt8XOg5UL8ksGnUeLEuuC5BPcM5B2PoPV5yTAKegjjxPTS0r?=
 =?us-ascii?Q?xA9HnO/YWyMkFwA+D3GwX/KbA5QwhxTYfWvFumf9k6YXADpOjDhLQRPGC3hT?=
 =?us-ascii?Q?eMARZANcU0tctgzPH8RSJsp61R9Ff64QxPEKlSU8GatErPj7jY9GJxutyJNE?=
 =?us-ascii?Q?w29D/uExofC5DOYLAOPolfD//gh0F37JQCscrvhRm1Ic98lSqPRhfI7B3Mh2?=
 =?us-ascii?Q?M4s3QE9gbMFTiywQJERMELGhsQRAFm2HYmInvvLOjBKJh668Qa5Raq2JgglQ?=
 =?us-ascii?Q?TQFb8Pg8ZRoCOURIyBKbeuQm7+31owyPHj4s2ZC0pgfcl3A6GJUjIyGbHDFa?=
 =?us-ascii?Q?FgXktYmnRqZoRz2exP4k5J4Y5eUT4VxxMsA97EJBvc3xTdP6irtXevHBvsZ0?=
 =?us-ascii?Q?PHpiJBCpVv4yXU8VHCx6W+AfwBkqzDw7l9bjvLolp1DoBPVmn7AZBwzo/Zl3?=
 =?us-ascii?Q?VlC6MZ0X83+D29PNNAyaYtsR7QdK0lMflsC0BnBgTBmQalL+sg7XlKnu2YaJ?=
 =?us-ascii?Q?qjWD1i64R+gAVebLwnAjGruXzB8L6ExYOCVXjz4+hC+Cy9Oeb9ECUmrT7Z4w?=
 =?us-ascii?Q?3JKOhqOpdM7inCd0k04TBmBbv6c/mvhiXpM0/shhQgkGKTRlZTklUITYVYBQ?=
 =?us-ascii?Q?1iVmLJrZrYiGZzsBq2Cv282UFawZm0actk3XecQumwkPKSiMLXGQviDCf4BB?=
 =?us-ascii?Q?Uw33evjyht3UXWnqG35pDND6VXfMbshZ0GRPxsTTYhVldHjheCBzacMxDxwf?=
 =?us-ascii?Q?rOxOkFrSJe3EsNYxPQqyiaW25GDmPQYL6d7iJsaQ2STI+5qGytpKT1oaPSnm?=
 =?us-ascii?Q?P9CKHj1Qvy5nZK0+x7+VfGcaOXZjRA+kXdLMAdL38oTdyQF7nfQagkQm6bH+?=
 =?us-ascii?Q?ktS0qQnwLZ+QgxPi9lb16kDOd5L2BEE0rpPDCpxVjwJSh/D4jIxpeF/bF0fM?=
 =?us-ascii?Q?c/oEaulPkiauLWNGVhwXRxTuwFn83aoTl2Ty2TrCD0FTnjGgUwvqyKLN8Wnz?=
 =?us-ascii?Q?zMctTMEUGlOYjEsnLoQT35J7qLEMtAXB6vFZh5iPVZ0vXhPEbGOEcSdSqp4X?=
 =?us-ascii?Q?0Zye44jVnzDZ9zw6wDUEgakAzC0u9uHaV7P2hILAiXcATdGnxQAwv3c862wk?=
 =?us-ascii?Q?+21rqSmxe3EpxrM5OUDuFKC9Gdo6k4eFr8Utj/yTwiN9q7RpbXtVo4rAcGTy?=
 =?us-ascii?Q?4T/LpYyikUbZWhrLhrT0f6p0odV9+Cljd5+uFaDrsmHuE3SqxsFLvUXgTf7L?=
 =?us-ascii?Q?G3qa+Ss1ddvawbSK46V5uDST+AWu2qY2vn26zQ5OVy0R2kLdmovUmK3O9kEp?=
 =?us-ascii?Q?ry92MJaGoWtFFHs2+QeA8YYmcItW4CGzwBQGrHllrhbcQMAknZy5oMBhg95v?=
 =?us-ascii?Q?dCg4aedlZbrE9zHtZ9ieBlKKBhlV98XjvztSRg3rhTYAA9uCfx443AarTuZi?=
 =?us-ascii?Q?MBq5xEx0jAoPdjGzX3UrK1s97aff7b6Au2EFFF91IZQMMkc8XGnTTl8WskQB?=
 =?us-ascii?Q?XOQyM0QN/HAalEsRZTMctlv0X9mI14aIsallQ62qfnqV9iYDGiPYPYcP44bu?=
 =?us-ascii?Q?7VQcxNAPnlkGw0fRPnu8wB9uP3X0UdCirG+I4oWDOlcp9Jp13CuIGkn0vn0z?=
 =?us-ascii?Q?yBmqQg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7fbf3571-2e71-46bd-3f38-08d9e28f26a0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 18:51:10.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NVjh6g/m5qs5LxOIdxtHWUVFkjGTxXMqVjd3o06F4kGiDeYY2Dd2zdYx9ghyTN3dGnKa2FqsJwdQZBPJ/ptEYo0qYPK1+3H9wH2EeCUc6RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1963
X-Proofpoint-GUID: V1Wq-b5XvUYRhXvy-T-QbwNn2CBO4S5y
X-Proofpoint-ORIG-GUID: V1Wq-b5XvUYRhXvy-T-QbwNn2CBO4S5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_06,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 18:51:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95161

Backport three patches from 9.0.0 upstream to fix CVES.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...Handle-case-where-path-count-is-zero.patch | 77 +++++++++++++++++++
 .../0001-Initialize-coordinates-to-zero.patch | 45 +++++++++++
 ...Restrict-builtins-for-ImageMath.eval.patch | 60 +++++++++++++++
 .../python/python3-pillow_8.2.0.bb            |  3 +
 4 files changed, 185 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
new file mode 100644
index 000000000..4c4f3d51f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Handle-case-where-path-count-is-zero.patch
@@ -0,0 +1,77 @@
+From c48271ab354db49cdbd740bc45e13be4f0f7993c Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Mon, 6 Dec 2021 22:25:14 +1100
+Subject: [PATCH] Handle case where path count is zero
+
+CVE: CVE-2022-22816
+
+Upstream-Status: Backport
+(https://github.com/python-pillow/Pillow/pull/5920/commits/c48271ab354db49cdbd740bc45e13be4f0f7993c)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ Tests/test_imagepath.py |  1 +
+ src/path.c              | 33 +++++++++++++++++++--------------
+ 2 files changed, 20 insertions(+), 14 deletions(-)
+
+diff --git a/Tests/test_imagepath.py b/Tests/test_imagepath.py
+index cd850bb1..b18271cc 100644
+--- a/Tests/test_imagepath.py
++++ b/Tests/test_imagepath.py
+@@ -90,6 +90,7 @@ def test_path_odd_number_of_coordinates():
+     [
+         ([0, 1, 2, 3], (0.0, 1.0, 2.0, 3.0)),
+         ([3, 2, 1, 0], (1.0, 0.0, 3.0, 2.0)),
++        (0, (0.0, 0.0, 0.0, 0.0)),
+         (1, (0.0, 0.0, 0.0, 0.0)),
+     ],
+ )
+diff --git a/src/path.c b/src/path.c
+index 64c767cb..dea274ee 100644
+--- a/src/path.c
++++ b/src/path.c
+@@ -327,21 +327,26 @@ path_getbbox(PyPathObject *self, PyObject *args) {
+ 
+     xy = self->xy;
+ 
+-    x0 = x1 = xy[0];
+-    y0 = y1 = xy[1];
++    if (self->count == 0) {
++        x0 = x1 = 0;
++        y0 = y1 = 0;
++    } else {
++        x0 = x1 = xy[0];
++        y0 = y1 = xy[1];
+ 
+-    for (i = 1; i < self->count; i++) {
+-        if (xy[i + i] < x0) {
+-            x0 = xy[i + i];
+-        }
+-        if (xy[i + i] > x1) {
+-            x1 = xy[i + i];
+-        }
+-        if (xy[i + i + 1] < y0) {
+-            y0 = xy[i + i + 1];
+-        }
+-        if (xy[i + i + 1] > y1) {
+-            y1 = xy[i + i + 1];
++        for (i = 1; i < self->count; i++) {
++            if (xy[i + i] < x0) {
++                x0 = xy[i + i];
++            }
++            if (xy[i + i] > x1) {
++                x1 = xy[i + i];
++            }
++            if (xy[i + i + 1] < y0) {
++                y0 = xy[i + i + 1];
++            }
++            if (xy[i + i + 1] > y1) {
++                y1 = xy[i + i + 1];
++            }
+         }
+     }
+ 
+-- 
+2.33.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
new file mode 100644
index 000000000..758531f67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Initialize-coordinates-to-zero.patch
@@ -0,0 +1,45 @@
+From 1e092419b6806495c683043ab3feb6ce264f3b9c Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Mon, 6 Dec 2021 22:24:19 +1100
+Subject: [PATCH] Initialize coordinates to zero
+
+CVE: CVE-2022-22815
+
+Upstream-Status: Backport
+(https://github.com/python-pillow/Pillow/pull/5920/commits/1e092419b6806495c683043ab3feb6ce264f3b9c)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ Tests/test_imagepath.py | 1 +
+ src/path.c              | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_imagepath.py b/Tests/test_imagepath.py
+index 0835fdb4..cd850bb1 100644
+--- a/Tests/test_imagepath.py
++++ b/Tests/test_imagepath.py
+@@ -90,6 +90,7 @@ def test_path_odd_number_of_coordinates():
+     [
+         ([0, 1, 2, 3], (0.0, 1.0, 2.0, 3.0)),
+         ([3, 2, 1, 0], (1.0, 0.0, 3.0, 2.0)),
++        (1, (0.0, 0.0, 0.0, 0.0)),
+     ],
+ )
+ def test_getbbox(coords, expected):
+diff --git a/src/path.c b/src/path.c
+index 4764c58a..64c767cb 100644
+--- a/src/path.c
++++ b/src/path.c
+@@ -57,7 +57,7 @@ alloc_array(Py_ssize_t count) {
+     if ((unsigned long long)count > (SIZE_MAX / (2 * sizeof(double))) - 1) {
+         return ImagingError_MemoryError();
+     }
+-    xy = malloc(2 * count * sizeof(double) + 1);
++    xy = calloc(2 * count * sizeof(double) + 1, sizeof(double));
+     if (!xy) {
+         ImagingError_MemoryError();
+     }
+-- 
+2.33.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch
new file mode 100644
index 000000000..4c266cc41
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Restrict-builtins-for-ImageMath.eval.patch
@@ -0,0 +1,60 @@
+From 8531b01d6cdf0b70f256f93092caa2a5d91afc11 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Sun, 2 Jan 2022 17:23:49 +1100
+Subject: [PATCH] Restrict builtins for ImageMath.eval
+
+CVE: CVE-2022-22817
+
+Upstream-Status: Backport
+(https://github.com/python-pillow/Pillow/pull/5923/commits/8531b01d6cdf0b70f256f93092caa2a5d91afc11)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ Tests/test_imagemath.py     | 7 +++++++
+ src/PIL/ImageMath.py        | 7 ++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/Tests/test_imagemath.py b/Tests/test_imagemath.py
+index e7afd1ab..25811aa8 100644
+--- a/Tests/test_imagemath.py
++++ b/Tests/test_imagemath.py
+@@ -1,3 +1,5 @@
++import pytest
++
+ from PIL import Image, ImageMath
+ 
+ 
+@@ -50,6 +52,11 @@ def test_ops():
+     assert pixel(ImageMath.eval("float(B)**33", images)) == "F 8589934592.0"
+ 
+ 
++def test_prevent_exec():
++    with pytest.raises(ValueError):
++        ImageMath.eval("exec('pass')")
++
++
+ def test_logical():
+     assert pixel(ImageMath.eval("not A", images)) == 0
+     assert pixel(ImageMath.eval("A and B", images)) == "L 2"
+diff --git a/src/PIL/ImageMath.py b/src/PIL/ImageMath.py
+index 7f9c88e1..06bea800 100644
+--- a/src/PIL/ImageMath.py
++++ b/src/PIL/ImageMath.py
+@@ -246,7 +246,12 @@ def eval(expression, _dict={}, **kw):
+         if hasattr(v, "im"):
+             args[k] = _Operand(v)
+ 
+-    out = builtins.eval(expression, args)
++    code = compile(expression, "<string>", "eval")
++    for name in code.co_names:
++        if name not in args and name != "abs":
++            raise ValueError(f"'{name}' not allowed")
++
++    out = builtins.eval(expression, {"__builtins": {"abs": abs}}, args)
+     try:
+         return out.im
+     except AttributeError:
+-- 
+2.33.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
index 8279544a8..4393d9356 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
@@ -11,6 +11,9 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x;protocol=https
            file://0001-Limit-sprintf-modes-to-10-characters.patch \
            file://0001-Use-snprintf-instead-of-sprintf.patch \
            file://0001-Raise-ValueError-if-color-specifier-is-too-long.patch \
+           file://0001-Initialize-coordinates-to-zero.patch \
+           file://0001-Handle-case-where-path-count-is-zero.patch \
+           file://0001-Restrict-builtins-for-ImageMath.eval.patch \
 "
 SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
 
-- 
2.33.0


