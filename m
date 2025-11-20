Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD217CF887C
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30081.1763628751698612110
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 00:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=QtLabqXM;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.41, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GB5xa2YcJerSXij7ozTbE+9OXZ0+rR0hjkvegzqeP5mRuPTN94HEBWhGKTkiBO+WyKCEfsZlCx8GVA+HrZEQ6FswwqZvwGu4tdhMKjyXyf3GyfZ/FiPVyS8TzawUfJ+a7NNhKBOUHDr16FwKG5qehaIMBc0gu1R5Vy8MsV2bIJHbkUMKmtknn/3byHaT9pkeUe/QZQm9Xr/AIfQr841GMLdIZ1gIBkM/LJY/Hkt41hvNdi+VkXFFROJtY7NwPYutlsn5TaRHzQfqvWawdwu922iEz1QuwRR6HPespTy2Zd2fAN4UzQDDQ/8MJO1t9x7iVHo59T/1vbgwNSdzcXO0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k9XTxF/6c9ESM7TF6YFRZ5yTJJJqIioVGReL2xbjz4=;
 b=KbWiRc3ySFbGOgLX/YmUIaZrcUsI/TvytVZQxp7n+Z0x4U1wc1ZORG9Fbnd8pRJfL3y2o09Yd9gP9DCo67jT5vSZSzlA0tu163cXa4m4XJZ9ECXgV7uvtOknEIoKEO0OyaLDdpamRseZykwD/UhD0OzgSjmCzGwRSGu2FYi8aLFQHTGwDubkcXKkjdnZNzkJTb3iBhMBuDLIlw8u8xpJgNGwcmMS8O9n03KMibR4nho8vfs6qrHvytn3x6tBV0bCOukitR2kqAf+0UQbDcGs+X3mwRya8xvyHM5bu0S+GUsjpC6twyzsOwvU2c/4nzKk6GCgK6vjsOoctx+HTjJtEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k9XTxF/6c9ESM7TF6YFRZ5yTJJJqIioVGReL2xbjz4=;
 b=QtLabqXMB4OUy2hcfjXG8wOoOupKg7lcu6TPo1jHhxCLnRkAnRSGnHXGi+WgUY+ufD5vdZk2jf5jZSHZnj8VQABTARFOT67gHM4r4my22d6uc3p6jD06XIyAbcAJU5cM4pMwxD5n7kf6a3bjwoYnRzk4qEFGSZsJNvK8Ch4YBtG8VBciFUILi2upq2FLs9Zn+FqtG4fw5co66dMz2Q0HwVqgr6S6gKC4U02LlAJbkh5PO0tvzDJH+i/TiQDo/dX1xDmgvyPRGFO/+E8GOZHzIA7h4aATD+w7LYqhIxr6oR9LgLxVCRxyJacpvSMUrJ/Sq7vzpJvIYS5ZIEloe+GFrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:13 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:13 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [meta-oe][kirkstone][PATCH 05/12] ImageMagick: Fix CVE-2025-53019
Date: Thu, 20 Nov 2025 14:19:52 +0530
Message-ID: <20251120084959.51761-5-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a0de35-44e6-4c11-da5c-08de2811d1af
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4tkWGOqqPEDB+sJLGT1mbhyqhW2NaTEkSw10M0lBgnecbm1/gpolU0Gn5eKX?=
 =?us-ascii?Q?abF4Dz1NjUrePp5X37/g4dCaTiZ6ZQeWoM6pry2tb90X9lW7WVM5SLpo4dT2?=
 =?us-ascii?Q?dW3pPoO+P3Es3GfXOifcn9MXaChBtsmBkuWubT+nEFX0Un8C9oKGdD7IWG2D?=
 =?us-ascii?Q?hmSdCzu/p4PfTj7wQN/pXVxC9W2gxVy9jqpYxu4tJfeFCpj9NB9I0pKfrjkc?=
 =?us-ascii?Q?w7QwaEOLKY1V279inCHrLfsJZ6h49ACjBbR6yDPFTQbvl69JTX6IxlRZGjVO?=
 =?us-ascii?Q?bzRNM6dtV8HAkCCfvV/CaKYFu6nQxv7a+svKujFwQ9MHzKVnsxd3ei3YYiH7?=
 =?us-ascii?Q?7kvE/Lf+boeGQzUHXUQxHKFvm3yJEQzLQAZFqoMJehWRhOUC04Mvu8ijgnLw?=
 =?us-ascii?Q?DCyZJBLSTFCWe5wJQEYzxZ2w40hfYHZKOfME5Y4/NLeUDJMXrRep5Gy1M1Js?=
 =?us-ascii?Q?DIkd3f2/whZ0h5zWM1FzO6DEWx7phFvjJSZ4bmlcAD6gw9qX+MRIDVTsFOBU?=
 =?us-ascii?Q?d8fwiBfvjxzuQaDyWFRo4aVoYdls7RpN6fvr2l+Jxlcy+fADb46mMqmhVY8h?=
 =?us-ascii?Q?X5V2/Iz5RFwJKvEBiavyBY2A5+3BaIYgDdrjTId5r9ReEZhNbDVn2CxvEQkt?=
 =?us-ascii?Q?A62/5agw2p5Z/2oL1L/iVDnFXmK+qfBPb3nxGt2H2Bm5f1H5KK9LIn90ySy5?=
 =?us-ascii?Q?p4gmNCxa7EW+gNOe5Q6YtlYLO/CkH7xkwFSanKIH1GEMKXtcmeJLa0OUMz7w?=
 =?us-ascii?Q?t0zZT5RF250sPLxqEsCZAnN1IN7R1bOQKQvXmo7SmyqutMuWVRIjYBNyvVex?=
 =?us-ascii?Q?cH1CV2RDEXuRq6nwFbUc9LaifiP7oKhGSiVQduvRs05iew6E26AM3BuJLtPS?=
 =?us-ascii?Q?mphjm32VJ5WSXw5YoeHdete7IzleRpXAxJmXAzi617ANPk/JlQLW2bRqZzxi?=
 =?us-ascii?Q?y8geeleQyf1joJNlKxbzF+aJco5z72Szl432EUiGaWKoSW42ZCSqLggubpej?=
 =?us-ascii?Q?8kltsWDUH4OQD/aSTpSeWy3QhPU9cUbhz7o9Xu+65ZvudORC5VG1XL0NnHwy?=
 =?us-ascii?Q?Hwd7s4E+2qdnz9Yk2fKrKEeP56W/r6IBEP+bcPmPG6yDceu8U+lZUd170Hbt?=
 =?us-ascii?Q?9b98MvCSfeF3HAUtnHv2Uo8DSimu5/B66lWdiVrkbfqm87477x1r437IkeMo?=
 =?us-ascii?Q?0xb7pYekMRx8+i45N3zeEKX/cm3tl6BMY2jXwCyMHcFwNZ8xgBDbsgZmaoJg?=
 =?us-ascii?Q?tbxzpTfhfBNN2QF65HDanQByZ6PDCwDajzZax6saSpKeryurXEBARl6PYCwI?=
 =?us-ascii?Q?Q9d8Z5WCn603ZNS0JFGs2Ps09X/M9P601pGzKtHKYGpYXW7e09OkKhBu1LLm?=
 =?us-ascii?Q?/uNjr+quI6rCgP+vjd/BeGy2BftNHyw0ia3zVkt48IHtfxeT4RPZ3wmVehjT?=
 =?us-ascii?Q?JXUrp8xFfimhNh4c0HMFUqkVFwqirT/d?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EOizpbPKKvAwpLBlEyZeXTgWOx3wTvBY2oixXCDrqfGImLe/L2PRQeLz8vtV?=
 =?us-ascii?Q?sBDBxU/geVADhp/nkATOiWCqt12K72lOJ7rH9yNV6PhvARBtzpsOWf4ptWSe?=
 =?us-ascii?Q?df2iJ+n8P1dM+IgVeR/U3iathR63YibpHQzfgE7tmSxG6aY5mSgHeWIsy0Vp?=
 =?us-ascii?Q?E5rCFhTT8IdL75Bg/MInAIYz0XiGXMnOWiWW/XXNnDeg7HmqkcTulDRub5wN?=
 =?us-ascii?Q?ijw1BzmpElnY06wM0DvcAwS2lbhGCPznNICbf3qkJyPlWDzXmP6j6mth4BV5?=
 =?us-ascii?Q?JBqMVk+142JU5ykpvxRqw7PsSv+jD+mT/xaPQD9aekbq+CBRpfOmrObdCw5r?=
 =?us-ascii?Q?zHFHe8O8dqCdTvpLeD1zw4dGFJ6tsoiJdOrQK/Eg7ZgbnNLU/wrn01d1yGbZ?=
 =?us-ascii?Q?HRw6wImYcqG2BFEpZmSkzGECtcbn0js72F9rTENUb76cN/Y1Jo3c/GJVNWM6?=
 =?us-ascii?Q?S9pzwD0t7vnycybPDn86XOSKCNH3s44wVhr3/PP/0BbUBOgWfErV9HPq4YbK?=
 =?us-ascii?Q?bEyzd5YrI1tOG8JagUCCl512+cRygbr+gINBCMFA3MWvKh0OcfP9nVhDBdxE?=
 =?us-ascii?Q?3A5Csf4VVR0ujQcoYGBQ3SDa7Ll6SP24aAhTo33dt53il1k7QOn7G7P6n3Jd?=
 =?us-ascii?Q?pzR+/+ko4eXBhWs/JbaGjOiy1H+SoBJIAlSMLE8oZhUu288mE0wtkBiZ967j?=
 =?us-ascii?Q?+1neL9YSz1k/Wf4hMlzvBg38pWR78ulK2ScoVrnK6kdOx2j1kShtKVCSRokj?=
 =?us-ascii?Q?hJ09DDC7idsENbsv7OkaqURCe8OUWzYDIEgLE7MTQrIHScBtLhzDWO/gAEFV?=
 =?us-ascii?Q?Bi45LsZZnhp1j790OpdCEUch8uYKcOac7Qn7L7UQ2FoWXv1ULMlrDqRGUaOK?=
 =?us-ascii?Q?erO7vh71/HRx0mQ8LEISm8ELiIdJvvOZw7PyhiwuVbxpgMo2sGLyb3ZrNMlR?=
 =?us-ascii?Q?Eo9bCxAYw6M8iBUpfjBYbBWELaItXF7KpORn/OlZoKun4qI8lFMzzeIgZJaH?=
 =?us-ascii?Q?HiJzfOtbDsOTSU+7fQqYbgvHCJ2/OSQFd69DZsEQAdFRZZHTEuV+MQBrIMxk?=
 =?us-ascii?Q?DBXaD1zB5B67qRsJKBWxF+dScRkDalUc0PsauIlGRXJ3KkTyQbGJpLfdG2//?=
 =?us-ascii?Q?qV3PDA9t1Ng7uuvCyQ+j/AHHGcsgy6STHE4HmOEGMYaO0r5c4duORWtT8RLB?=
 =?us-ascii?Q?DhGMgpNtDx2NbX6U2rcVrI4URxfalR0JdiVe5SSL0jJAL+G1g8vWQSiIKXsa?=
 =?us-ascii?Q?BRrR9Z5+kvGiFY9TlP5C9YAmEXq2m/MWSSwJn79stzk18mFTjT+o96SvM5E8?=
 =?us-ascii?Q?vbla7sLPEeDOP4iKVwMuoOcObY0h1lvCn4+Q66jpTQwHDjGs3mOclHAf6D6W?=
 =?us-ascii?Q?F3VGEpIjCi1GIx9m5Bpw+/WFBwcwuj77Cy/I0Vj38oIHMTnpidQ0l7GUWxEI?=
 =?us-ascii?Q?JbNgLSXIdPOdr9Ah07bwJfVKBZeyd6hNcwdNBfIbvsJoMFGHImtnBZmI/iTP?=
 =?us-ascii?Q?mo/O/mSvJSfG5ql2EikcWKqJSfltgkiE35+yx+dwCxwVRuwHdJYZo6UChrju?=
 =?us-ascii?Q?VLJa4kH/WIf9IhRcgRGkU24DKH2jXkeW7hL7RKLarMpIPTRsGJa52fmeDtth?=
 =?us-ascii?Q?dhnkz1mvvvuTGe1mvngTnKV4poqpcDqBURnYBzK53vgycBCFbeiep7nd3v29?=
 =?us-ascii?Q?6LMrWIEYDSMnms0LHlQyrMqgvr0=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a0de35-44e6-4c11-da5c-08de2811d1af
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:13.1511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xhlc30gIt+t+41nyGE22HxijdJ2llD2e+feCz3ri/j/tZhA51jMOqhtcLhFNsf655btyVz2pz5H/5PxlWDubjsTjbQdmU+PZ6r316rJMibng9CIe7OovfJBA5vyS4O0G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121941

From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>

Backport the fix for CVE-2025-53019

Add below patch to fix CVE-2025-53019
0005-ImageMagick-Fix-CVE-2025-53019.patch

Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 .../0005-ImageMagick-Fix-CVE-2025-53019.patch | 33 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0005-ImageMag=
ick-Fix-CVE-2025-53019.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0005-ImageMagick-Fix=
-CVE-2025-53019.patch b/meta-oe/recipes-support/imagemagick/files/0005-Imag=
eMagick-Fix-CVE-2025-53019.patch
new file mode 100644
index 0000000000..fd2a604916
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0005-ImageMagick-Fix-CVE-20=
25-53019.patch
@@ -0,0 +1,33 @@
+From 5e3a3f3656b04d964330efb33827ecab5589ec26 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+Date: Mon, 29 Sep 2025 15:38:57 +0530
+Subject: [PATCH 5/6] ImageMagick: Fix CVE-2025-53019
+
+Fixed memory leak when entering StreamImage multiple times.
+CVE: CVE-2025-53019
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/fc3ab0812edef903bbb2473c0ee652ddfd04fe5c.patch]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ MagickCore/stream.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/MagickCore/stream.c b/MagickCore/stream.c
+index 28fa0f25b..bfa29f25e 100644
+--- a/MagickCore/stream.c
++++ b/MagickCore/stream.c
+@@ -1350,7 +1350,8 @@ MagickExport Image *StreamImage(const ImageInfo *ima=
ge_info,
+   assert(exception !=3D (ExceptionInfo *) NULL);
+   read_info=3DCloneImageInfo(image_info);
+   stream_info->image_info=3Dimage_info;
+-  stream_info->quantum_info=3DAcquireQuantumInfo(image_info,(Image *) NUL=
L);
++  if (stream_info->quantum_info =3D=3D (QuantumInfo *) NULL)
++    stream_info->quantum_info=3DAcquireQuantumInfo(image_info,(Image *) N=
ULL);
+   if (stream_info->quantum_info =3D=3D (QuantumInfo *) NULL)
+     {
+       read_info=3DDestroyImageInfo(read_info);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 224f55d03b..829ab2e525 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0002-ImageMagick-Fix-CVE-2025-53101.patch \
     file://0003-ImageMagick-Fix-CVE-2025-55160.patch \
     file://0004-ImageMagick-Fix-CVE-2025-55005.patch \
+    file://0005-ImageMagick-Fix-CVE-2025-53019.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


