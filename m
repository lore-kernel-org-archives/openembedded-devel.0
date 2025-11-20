Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD8DCF886A
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30425.1763629556591517449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=zd5/LeVy;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.28, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0Qv0qc12WelXjum9nl15nj6syk2DMJk0qhUesJS6s4CtbxzorCKf+iEWl/lRWvZcKuh7wfhyQLNCaLY3eJeo6HCc6cCebPILh2GAhvbOi6vb0hkzG3+W7PiU9QyGjraXMGB96XrjO3LXNT7kuU5TtqyDJB3T7Q/GvYpQqGTBoIsg26V6MG869/unsHKZyMxrTN3GYSVtVUYTxxDKK2IzD3tkR4gys4o//jqmTfLF42QHFFEmo+gzMUZkOeN2qvI2N6Hw/VygZAkJzLpVg7XHN/1k7Mn0OzCZfxlZxsY195sxDfQoAM6n+xxYoRAO+1TEkdTjrqmuIDO9hk7/bRiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCAcXDxiEXs3Mx+Hm0E3yYZNDswDJeXhRWQIjLTpyL4=;
 b=pyDKaJ55tidy8uG+80DW5Vm9BZbuIUNH3eEQCLAqrMjER6cqYJRsFY79UREg5F2dzDw2ZODwzx7OqR8mTD1EXuA2a5as/Ec4685sTtimRX0PIOs/MGpNpucsfj6+EhreZozC40VxFlXekPyT6VVIl00BnYqes9ZAKDN5tiMPfExbfpsihI1OamoJuJfjUqDQDisZKOZqO6wQj+qI8oabhHD3j0AF8klTFKCN370F+FIpY8mzAIsUICQtxaQUM7mLkqjX9EIcwuaOnR07i0ql7VaeSXMHwtAxM4y63wruDEXshI13C4pZjFXzdkumApwa+tXfHl5v4olXkuklvnUb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCAcXDxiEXs3Mx+Hm0E3yYZNDswDJeXhRWQIjLTpyL4=;
 b=zd5/LeVygRyLReAvYVM+ECYMgF/SrHYVcsVSqrj2visZRF5OkV41t1ZJblDkmXDmyrvatX1A83aWC3jxWy7g77aNk5Y/Igw+KQFLjx/7xD+j8gwabB+y0Dv2vPOzrwvr8/CTMCwSCQ6NQ4sjbtLTj/i+n7hHhAecg0I/fHm4SiFw4dGdqTJLC44B4Zo4scOg3mqFcXUe6pKPiNPnC+FQiVCasZYhLo8Y042MvU9YvWx1fOLTdlw4Y+JWCY8298tnb2JZjCsk+Pl9Ln0BMAbMEEG31tnPQUzd7Kbp4jUxSHenG8qBk/WAq6JSrzQStVwtBXq37szKMnL6c5qEdu/Xfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:09 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:09 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [meta-oe][kirkstone][PATCH 02/12] ImageMagick: Fix CVE-2025-53101
Date: Thu, 20 Nov 2025 14:19:49 +0530
Message-ID: <20251120084959.51761-2-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c98aed-bd5e-42a7-cb44-08de2811cf38
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7iCuQmWtFhHn18nrygQZ8mbCeJswIRUGltTvtEZWPuiuZvc7kJeCO2dutmc2?=
 =?us-ascii?Q?DrcMo4pqwaOztsKkh9IBrtk28uF3OAlPY9DI91XrcElgozL8sE1vLvstZWtz?=
 =?us-ascii?Q?HmATr8igUM4MFDaml+viANfz/AoF1n14I1TrYCxo+7AnntMirX/8l7gE5Vx/?=
 =?us-ascii?Q?7sm7tgI0fy8TbolrSHxh4+9zYK1uBGW3T+WPyQvOabR85mRe5qyUe+tOdT25?=
 =?us-ascii?Q?YbC5xxnJx2hZFHSf8pMDj0XyhyxqgTVib72ZXCvC2PUaFSaXTdkZYiyAaB32?=
 =?us-ascii?Q?CPqJBpYiBQSA2vpVA0MYpALOVzoldQsCDJhS0/Hceqf/2ZIhXIQOkXZat10j?=
 =?us-ascii?Q?qB5FrkyqLM6QpTYwxO/4omX3e468KdBBr81XKwjO7ZBO06XPSG/MRGih/0E4?=
 =?us-ascii?Q?yUkTMUywuIq9m/vDcKI8SxNnydoZpKIa15QArKOwEu9MGl+D4NR+/42NnYUq?=
 =?us-ascii?Q?LcfLcCI1DyDam/auGQRMJH3mBJu0/+krCLO1wuGj8nyxAZWlfbYh4nEZPe8D?=
 =?us-ascii?Q?dhZgzTSEg1z0dPFrhf0cmjAMNM3wh5QMhlcUsY1V+O5b45hHk8eoHs+RU/4N?=
 =?us-ascii?Q?vzUS+BBmhFnTDdG5bNYqO+owsV/H7wUK6sodAEfBAGzMLixSrAy81M8eBaQM?=
 =?us-ascii?Q?WLSso1FO2bhcQ2pCe7keo+Yrqj8drSKeTiDvXDSy+dIO+Jr0j8uAQbV1zfJf?=
 =?us-ascii?Q?RpohNjxnfta6soQjQgOqqc381QgN8bjv2fBzjNq0hqUWztt3s9dbyjkbVAvt?=
 =?us-ascii?Q?KRAc0cnOqoG7uxp6EDC6FNdIahLOnVSflkrmr7tf2QhRCLHXg5iFnkYKwBr0?=
 =?us-ascii?Q?OI/Vvra3lGPjg3OSR83FpHrvGxXCe2mMKfJiAIo//khDKu8Aui/vD/Kf1z9Z?=
 =?us-ascii?Q?an4E0DLiFg0aq27dLWBf3IGX506xBOWGtvxsH56J+e5qtd+D/Wfo+TuWTaU8?=
 =?us-ascii?Q?a0HIsZaLYx9Zv86iDqAUIAi268nkNM/r/YvfRM4BC8iwAiP493MB3IgQg7LU?=
 =?us-ascii?Q?Rfjvn1RcWxu9X4TwyU5eTDCP1A41P/5tkGuwVoTSuy6YRyHVOTp+XA1CysbR?=
 =?us-ascii?Q?VekfNhIXoGcxli6R169TOQ8bWGz4vIgdlx+/ByFaQ0+djYdCPmOqwp8zkzwy?=
 =?us-ascii?Q?XR24xZLMnGwGNM2JYGAIm32b5Cl0i4/v/Tf5pJP89qwV2fhD+KCYnSr3u26h?=
 =?us-ascii?Q?+UXlGmel5e6tJrheNXUNREKMVRZyJWziHFxzWiRju6R6MCewqEaHzj3ojUzT?=
 =?us-ascii?Q?i3rCngfOY7o9e0LfQUUexe9bXsDZ5UrCltxShiSNEtGmOF8IyA2OtgW0qQVK?=
 =?us-ascii?Q?Dm6N/r7rgeqxf8XI+pNq1BI3SsY8t6RAHV/lUkirwnn6U/Nm6lELtXOhC2rc?=
 =?us-ascii?Q?Jk9pYBHXWLF7O0V5B7EQWjZetAuWC9rEy3z7raNJs+bxfaJ/RbKWXDSG09PA?=
 =?us-ascii?Q?UOl149TcDeMM5hT3IAofubrHtg8hU+D2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DD2PM/hoFEBdVl1692eiQZqjiypD3oUIKi+fmuZeMkhSCeS4+XCIoMwSWpdo?=
 =?us-ascii?Q?JY6VaVmuRAWY/36LkvwrOmuSI2qoUGRpnf4QjhYvkXge9dLb4FNr/GVJlU5L?=
 =?us-ascii?Q?8pYLQnIgOTtZLvulG0VROCENt+IWDI72o+XbdIYLZSd8kJUbjTTmCwyceUuE?=
 =?us-ascii?Q?Nu8pGizRSW3Vs2BTqdr+7oqWWPlqVr5xBaZkSVC0efEI/j/ZfkYAVwqMCx1q?=
 =?us-ascii?Q?AeuxkDYY9bLGf8u4kdUhL+boDZSzvm1mOB3gEbUooBaUxPCiuTcbX2bl4t90?=
 =?us-ascii?Q?TBQ0d5UNYwpzxXwoppYBtPFKEIHG/+TgzpLIccpnTpgnJ3L3oaMV997B+NcX?=
 =?us-ascii?Q?IPyXEyn6RC6Mxtvai9CmKDcdkmpKGfVT5lYMuB9vIx1IEWu3aO7fGMq96wYT?=
 =?us-ascii?Q?fc7kTWvyZpSfwNMHQgoo/Bfm+qOEvaf5dtAtUKhijikAK9SGwps8zJ4LDqry?=
 =?us-ascii?Q?WCxfCdH2Z4uhN3loqpg9T/8Sxyvyrom1EgY778YSLlxMOiD6NhP785EkTIPE?=
 =?us-ascii?Q?AXjznRCQpVItNx+Glg2637OEEyMQCZ+jWGk51SfETj5ilH0AnL0u16opR8Di?=
 =?us-ascii?Q?uiXFNobUsgiEX7pqhmZ0KZDZgjQ5MKwEE2AeVqfrQ1oCgGnkpvcttl9+O2oo?=
 =?us-ascii?Q?w6jUXzoHwOKX1eHVPxR0R8PFKOlewgVis375Fs7+Bzp1phQWA2vxSrOoS2ta?=
 =?us-ascii?Q?kmQCJrcLxcC5iY4mDTAIQSYyq1lytOGIZMY4GhDIt6se5IeidIrnVcQHZmLR?=
 =?us-ascii?Q?otc2O3zGuNxfmw5gI4/fJl8YQcVidiFfmhlGKljf2KmRWlGWeDvenTgCM2KX?=
 =?us-ascii?Q?JNTLpV1J7xMVuKFSHTfqadWNVytuHVE6KpGWwE2pyiB6Rlsx+B+wQI7vqUo0?=
 =?us-ascii?Q?UNneyYMnF0h1jympxZWMTyViESC8zE4h2fx1GsXu/pdgbneiDZet5XbOKqze?=
 =?us-ascii?Q?c7SG140585ZPoSkHSKjoXZjz+gIynqjln78Iu3pEgL4xLQd1oieHfKpcWhnt?=
 =?us-ascii?Q?mPTmSk63oJboUwhxWmaLWr6vQzNgFepWAdqQ2XaLS/P7lqy3K/Z83BfFnl4s?=
 =?us-ascii?Q?3BvyHwqP39rIqTT875XLIlwRHkQqKjfqpoIdS/A7vJ+biSJnTGrAT7eVzkjV?=
 =?us-ascii?Q?BSETC7gNAOqESWVh9/eCelt6VrZ6Xo+ykbS31KkqafD21qQYhxpH6RzKy8Am?=
 =?us-ascii?Q?7NmObx0QSt6Xi71aVNiLd9Ya8zUQ4N6BSLDekIrJoP+iCkKWM85ixyV5delR?=
 =?us-ascii?Q?j9eMxoexQ5l4fXokciYuLAKVN96DjPHysUCbTvy41VnDGCZ2XXWsz1pgz56p?=
 =?us-ascii?Q?7jMEEE4hIITZZN/40d1sgAWdR1Qy4tLsxEEI17RzjklB62lYoCQg3J2GyFyz?=
 =?us-ascii?Q?sC4dyVW6bSFOBRLH50MDebCyiOBOn9cp/NXnPD64phFNiu8fZSysn4g4kog2?=
 =?us-ascii?Q?qGjznCX/HdqLKEpJJROLEO9DENXjy9njUvr+5+S3NrPZJn57wnwSjoqcWCHm?=
 =?us-ascii?Q?4Fq4zsVx7txbSTPEvLirwoU/qO+/Q2kpH7l8XRIsTZGXDg/wnybPZFsrl1Xq?=
 =?us-ascii?Q?GQMDvf7i3WViFGbDb2U+B23GvL/JbRmT+/Fwgvl7geXEZAh+bl11K0Yhob6n?=
 =?us-ascii?Q?Gss/zK0GAjck+nO/eCA4JqNsetntC6NjmOBTGs8Cgk/3ybzXPhH0HUhDK1XE?=
 =?us-ascii?Q?xoxfObaLSbtsvkyJz3tHBgulAAs=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c98aed-bd5e-42a7-cb44-08de2811cf38
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:09.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cB5ew62ln5EjY7KGoCTloDNAdtiIL/uv3EmwJoCb7zR59k0X6wfnx46VCFCkDx66j6lamQ681TYLdhPKO4jnFRhSzE4KERAVK2yfs7dxKoyaq8XIoExsoQAgpyKXmaIn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121945

From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>

Backport the fix for CVE-2025-53101

Add below patch to fix
0002-ImageMagick-Fix-CVE-2025-53101.patch

Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 .../0002-ImageMagick-Fix-CVE-2025-53101.patch | 60 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0002-ImageMag=
ick-Fix-CVE-2025-53101.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix=
-CVE-2025-53101.patch b/meta-oe/recipes-support/imagemagick/files/0002-Imag=
eMagick-Fix-CVE-2025-53101.patch
new file mode 100644
index 0000000000..3b31886ae1
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0002-ImageMagick-Fix-CVE-20=
25-53101.patch
@@ -0,0 +1,60 @@
+From cb29701ae86c2a5b46bdf705bf0df7db152eda68 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Wed, 5 Nov 2025 12:54:53 +0530
+Subject: [PATCH 6/8] ImageMagick: Fix CVE-2025-53101
+
+CVE: CVE-2025-53101
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/66dc8f51c11b0ae1f1cdeacd381c3e9a4de69774]
+Reference: https://github.com/ImageMagick/ImageMagick/security/advisories/=
GHSA-qh3h-j545-h8c9
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 34804e522..bf9d53325 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1650,7 +1650,6 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+     *p;
+=20
+   ssize_t
+-    field_width,
+     offset;
+=20
+   canonical=3DMagickFalse;
+@@ -1664,21 +1663,23 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+         p=3Dq+1;
+         continue;
+       }
+-    field_width=3D0;
+-    if (*q =3D=3D '0')
+-      field_width=3D(ssize_t) strtol(q,&q,10);
+     switch (*q)
+     {
+       case 'd':
+       case 'o':
+       case 'x':
+       {
++        ssize_t
++          count;
++
+         q++;
+         c=3D(*q);
+         *q=3D'\0';
+-        (void) FormatLocaleString(filename+(p-format-offset),(size_t)
++        count=3DFormatLocaleString(filename+(p-format-offset),(size_t)
+           (MagickPathExtent-(p-format-offset)),p,value);
+-        offset+=3D(4-field_width);
++        if ((count <=3D 0) || (count > (MagickPathExtent-(p-format-offset=
))))
++          return(0);
++        offset+=3D(ssize_t) ((q-p)-count);
+         *q=3Dc;
+         (void) ConcatenateMagickString(filename,q,MagickPathExtent);
+         canonical=3DMagickTrue;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index e0d584f165..9744e1e919 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://CVE-2023-34474.patch \
     file://CVE-2023-5341.patch \
     file://0001-ImageMagick-Fix-CVE-2025-53014.patch \
+    file://0002-ImageMagick-Fix-CVE-2025-53101.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


