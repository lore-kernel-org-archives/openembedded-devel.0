Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A066DCF886F
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30425.1763629556591517449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=qAIy3abz;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.28, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKUrCPZ5Ka656zuH+fngbKUMBMX6WdfGKfJbx3dzsTuq6axmy5ilmXpUwPMyXMgMdJDSYdC66LssJkS2/lLDWtD5IIft8LnUeAx8N367dYA1HY4zKQxANUQlLLIWaiNn/m6VGFl9BSAbwn5lBTQ+PB78cLFS0b7RdUbLGVzH+hLZ2u4pfjyYaa6M0wDHi7CHtQ4pY4HDZHC5mKSoR+cR2Stf2yTdBeP9xn5T1R1BETfUgpD3MW9q5gdM+kius8/NGR5/+6nPM+5aKVuRvrhmOKZ+Y8uXTVhaKcgyDODLTSki52Zc+F4Md6FKQDQbUdYAzOY9B56dIPIk2Z6lRsjnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/sSxgmg+t7Wru7RSuR3/E/kv8iUA7VnUBGlkcyYHto=;
 b=tPSS0VmTvkkt6qV1zIB9oK6xt77uWxfdDtd51bDLUPAVzyH30DTBh/ydM+D0Wt2jXMDxfgPd6kViCuK3csAI8HuaVSUQ4PylrV20QC5ZpsMomCCVQIDvb8N59gPMB7Wu0lS3noH6wJkAIPBYYWQ1eQTTLWxQphLSqopoJ3fkrVs2rijSXO23Emg2dfmKaT0vdLVW/kZXwG4SPk4lo540qSHSxYS15HZpf+MpIu+wWg5haEFjmCsi+nzzULfNfR7fQDmInE5MLeVCjP/9ZTwvl4pF5B3uupm21wlTiHdvD2rV77eYVJcKnRIg0Ib726O/OU1Xf+WcaCQcr3J+MTJLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/sSxgmg+t7Wru7RSuR3/E/kv8iUA7VnUBGlkcyYHto=;
 b=qAIy3abzyi3KlqvYLDIbnARfhxNk8MTn5upwbaqEOUuKKqcdqgK4sPSPl2DKKknCAaq/+gM8kywcAl4kpPHXt/oi7pU5GOtCDQwNnHIRZsnXemdefE3QqGdjnAJYP1mPIBZJT2bFasK29YkWgQp/GDAjPRogw+/yuUqLjCG06p/5AlF1OElkdpSWbOuyvb5YNBzITiaL2CyuMnzmDBRAOkdiv+AapdToIdKymg944IcHRFm68lbm4GEcRzxlsVV4VRlcU+2Z0mOf8Uot7+o4bbb34guZ+2TtygR35xXCKfgpQIwsvcztC8EkMgZmUMK0sTRQmlsZSi6znAyEERbbUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:10 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:10 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [meta-oe][kirkstone][PATCH 03/12] ImageMagick: Fix CVE-2025-55160
Date: Thu, 20 Nov 2025 14:19:50 +0530
Message-ID: <20251120084959.51761-3-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: addea6d0-8075-4a8b-2dd4-08de2811d002
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2UY44l/sWzrqTMxGFFaMFwffmecoyLreJti8df7Ljv31qwWUAvxClJmI4Ls/?=
 =?us-ascii?Q?frP4c9GLs5jSIEnAOU2N+atBRVm8+20/opFwvaM036gYp1gTV2Oswe5cMVLA?=
 =?us-ascii?Q?uY3dfu0Z+6Bk9LFcQr0yTJVnI89rbi4XdTfeJD/O5Xu6ch9ruwluQnYTyUoc?=
 =?us-ascii?Q?ZImg5EAlHFDlD9qLvQ1UK+1JT6jDiXVIMdvbdTIPNr0pVl4OIMNAcIFH1l86?=
 =?us-ascii?Q?TY6U9MGj1HaDcHZLwtZHALvsw2f+96MXUxJ8CLstY1ovjmMqlf6m3urDCrkW?=
 =?us-ascii?Q?VAuq3VPGlRDt5+uxGjB2nHTByXqrl7Mf1JjZtMjGsqdLu9Sui4h0tw5s1G+b?=
 =?us-ascii?Q?u3TF0Ydq/EcGo2Xp9hZZktWX0x/auRpl0ExTs3c9Lv661qPSkV/Ef4Grimgy?=
 =?us-ascii?Q?zZxg/Q/TPcHr+F1/blq+zyXyQir41Cz9HGABeTdH1SoUL0qoVoIT9aEU1Qu1?=
 =?us-ascii?Q?eWnIt8qn+WWjM1u8SLHzBZsf0r5cvPSYIBftesEr1eboKUktJdxCHZZ3Jq/D?=
 =?us-ascii?Q?p+aSDtnY7p2IaYVNw326/8mvU6/tjTybaBPZSsYBDz+mIfkLQOxnhlrBR/nv?=
 =?us-ascii?Q?4bZeEn/6mBjXdD9wIdZ+WJewOngJGkwYw/1xZ25jND6zZhoxLMd01G/L0mtu?=
 =?us-ascii?Q?eTa3usQ83n3HZrXKLXsra58+j4pE0Hu/aEHW7fn4Eavc6jIoGSThkXnevlq4?=
 =?us-ascii?Q?oCe6k0uTxikukn8E6y7cm5m4iAUiXiKlgdUkbXG/1Xl3smLfRAdodcv8FoTL?=
 =?us-ascii?Q?Z85JNlISZs1MkGRcefy3Cx13obmF4gxgSil/YBMVsKfH8xR9WnK2G33zjumq?=
 =?us-ascii?Q?bIv4P++LbQJVyNFICy3fo4gn88C5TvMhU33iWe5mhx0vMun/cJUaQL6FhLua?=
 =?us-ascii?Q?J+akXjRZucyA8AN+t0O5DZDlWvpWaH4na8wupsMLwlbCgT+F6zDWH6pPAIdZ?=
 =?us-ascii?Q?uHnsebwH1M9VBKN2J57NeF1FdwFNYyR98rh9BWK/+HzA6KLGV8jIddH6q9nW?=
 =?us-ascii?Q?0wnxl43xFqlOiB6jJDNnikJ4KhC/UG5nXUo0QRMq8XEgGVUFKCsRsP75Eg4b?=
 =?us-ascii?Q?Zv3vo1vxpVGKV3actb13Tus/tuPawxkC2JlumjYj9547gvpjkJrD+ztoj6g7?=
 =?us-ascii?Q?wA7jJvUB31RO9IWhf51DggQ6sovx7G6SztDir99VInw/5zrrCbME4xKFWTZ6?=
 =?us-ascii?Q?7BSvOyAHgWabt3mHIdW9tyOYgMhpd7Kp8kqgdRyJh4g332C9dZcXtXPRWQpE?=
 =?us-ascii?Q?Li7fnyk3oh0Kx5aHnYEE+BWBAR7ju9e7ROj+k3JwTACJ1i4g1D0iGp5zyn7A?=
 =?us-ascii?Q?zrch7KPYPyVzTD2F0ggkN2E7pE/mV+IsnDRQbKdCJtGIuLTQvYkG/IGOlmjB?=
 =?us-ascii?Q?YWRi/9162BagzMuQNhNiRphJ5qq/JaRkOcijpF7JJ1U08iCMiNlD3XD9c4SM?=
 =?us-ascii?Q?omVZNnAuU5JOJcNgHrN9zOwE4d7XNLA6dMRXUPNyQy2XaT0DmmCp2w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bskCnSXhzm+8YUVjg3W5Y7P+KJDAkcoQzvGtbFlFHMmBgyy7UpnuWOJ3E3D3?=
 =?us-ascii?Q?TMNIZKjI0wCuuUFlLn4AkpUen1Pna0gGPuO+5FdIY6N+qdWIAr0rowJGL2YL?=
 =?us-ascii?Q?BDc7G5dE0wqbgQWcqDywmB/4Q5ffP5hjUNCs4T9Hctgb3KaCufiKY4eux1i4?=
 =?us-ascii?Q?+k1JNbv6pm/KJljaot1bKaGXPdB2xJ5X+muY5VBLFHFdvFpNHPHdtHHm7r+s?=
 =?us-ascii?Q?ZpMPuavQB+lg1dJubXJeWMkISSwnexRYd8ZfVpIHx+lBGVrEo0l4SvwSYPkD?=
 =?us-ascii?Q?smcHAc8Uu7AzXClZc+rOin9yySzDrG3KB+EmaXLPtMMHBpuxp2/kZACeNAKi?=
 =?us-ascii?Q?PJ3WyIAYA3HUXP/r+90XQoNah2iBx+zg8oQIokQ+Bq7QQ6bTHwyieiB1Oa5T?=
 =?us-ascii?Q?HdpkcRcvb4R7m4LVEh2Q02yDhbbYFn7Yi4es6hvbXKt8ia9e+fjJ5//b5LiD?=
 =?us-ascii?Q?Zi7BXFpP9X88vstLvcjfhXC5nKpUbFIbDI1y0odw3DFD8aJc8uyiYf0l6Ztj?=
 =?us-ascii?Q?hORKFit2oaKVE9ChK52d1e/gm1boddXmt3cnGPYjFcgUdnay2a/O9IgD6nDb?=
 =?us-ascii?Q?gsG6JwGoZVaAVKB1T3l5CQULOl0vJNqT9489UEgXVczb85jwqhXnbTtzhHlC?=
 =?us-ascii?Q?PtL6JMHCDSRsiyPiv1BKiQLhO7OyxwTBKK4a69l33gYhXzouSdfDsq3ATygZ?=
 =?us-ascii?Q?LOQdtWkvFjTOpSklPjYUWcQWETzqT0Vvi9ZyFZvUR6WhL/b3MDuK07DncOIn?=
 =?us-ascii?Q?qpts3eoP08ZbYT0KQG6UNlcsnHtYF4MABAOeiArcqrO5fDPaAi99k0r0bS8g?=
 =?us-ascii?Q?K4foHYVG1WwKodCCaenak+wjvxaKsY9Y/JPTkcfi/HitXfY1WxuSByj9Ol/z?=
 =?us-ascii?Q?vAi1YogoTPUMDi23QUmLzl8iYyjz0SOVfVRQWzaoy01UzL9U1Knd+DP4IG3Y?=
 =?us-ascii?Q?ZoMHHAy8638uFMkNl/8avRb3lRJB6G12D0EAxvQ7ouU44p8uWiV4iypFtUVl?=
 =?us-ascii?Q?xxkdePbQ0H7Axy5B3QNjUUcnroKB5AxJzmfMQ/pcW/BuFRDg2k3/hrSk6j8x?=
 =?us-ascii?Q?LZBoZ3V8zc6ST6B/V0ZJaBfdUPYbOrrHbI6aYyNIyjtFxAmiRHn70JIB9Yoh?=
 =?us-ascii?Q?DvktU9ZH1eLNF6rKQpGaiXTqPcSVTYLtf+/amYDSpU0J21LxD6ZSgeJA8O8n?=
 =?us-ascii?Q?rp8ae1DdEuboqZw8XAgcFG/FFaJNa9j3avwNOFcaXLrheNPs3+mbCItrAvre?=
 =?us-ascii?Q?RfzFniTyWSaLza6GazRIaGUsI/rSUd85SRXSlJ1Cas49ZSf3x6wxYitOVaTz?=
 =?us-ascii?Q?poLFZvnNj706K8SRwyGdG6DO3f82/u7hXS/Xce15zyQgz+vVyyW9nll9tajY?=
 =?us-ascii?Q?4Jnkcd3YkB7iPM/ahorVgVmUkvu1af9FnlHuabR75Drl9GiNSLoDSDbPAc+P?=
 =?us-ascii?Q?ceD34pklUXUe2HbPJ9x7Cjr86CqmjwvFiBZ6jaiCJ5aKIrEFCOrBvuGXxi6s?=
 =?us-ascii?Q?LOPe7UYA9NO2NBO6tm8ZZaUhu9UDdNtnErADWsixu8fDnT/NsA4lQ/8TNR3P?=
 =?us-ascii?Q?/oIWnCbe+D1PytqOnnh/yQS+mlBrwShEIujofxNLAp+kJ3s8gsJmowNRW6Dt?=
 =?us-ascii?Q?hCTMcdGOH9+6rXKzZoWnxRxQ0/uUWI0SXd96IZw89vSxCmkmTmVUmEY4h0pJ?=
 =?us-ascii?Q?ABmgfV83LYGD/rnn/ahl8YxS7gU=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: addea6d0-8075-4a8b-2dd4-08de2811d002
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:10.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBLkqK9QGeeffP7q2SJCfFG9WnGdnBPxqZFBz30DRbkYqiTSf4IY3axiKLFs12KXKsIylNaaPh4PbNMeltPaUX9aDRrDZnFnU2hmfKfHuPOSeAbhCQ1yWDBmaTAIt9JZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121944

From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>

Backport the fix for CVE-2025-55160

Add below patch to fix
0003-ImageMagick-Fix-CVE-2025-55160.patch

Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 .../0003-ImageMagick-Fix-CVE-2025-55160.patch | 165 ++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0003-ImageMag=
ick-Fix-CVE-2025-55160.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0003-ImageMagick-Fix=
-CVE-2025-55160.patch b/meta-oe/recipes-support/imagemagick/files/0003-Imag=
eMagick-Fix-CVE-2025-55160.patch
new file mode 100644
index 0000000000..c548d95f54
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0003-ImageMagick-Fix-CVE-20=
25-55160.patch
@@ -0,0 +1,165 @@
+From 4335d1fe991e77dd6279e7adfbe5d976dc769c24 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+Date: Fri, 3 Oct 2025 20:36:28 +0530
+Subject: [PATCH 3/6] ImageMagick: Fix CVE-2025-55160
+
+CVE: CVE-2025-55160
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/63d8769dd6a8f32f4096c71be9e08a2c081e47da]
+Reference: https://github.com/ImageMagick/ImageMagick/security/advisories/=
GHSA-6hgw-6x87-578x
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ MagickCore/artifact.c | 17 ++++++++++++++++-
+ MagickCore/option.c   | 17 ++++++++++++++++-
+ MagickCore/profile.c  | 19 ++++++++++++++++++-
+ MagickCore/property.c | 18 ++++++++++++++++--
+ 4 files changed, 66 insertions(+), 5 deletions(-)
+
+diff --git a/MagickCore/artifact.c b/MagickCore/artifact.c
+index 0c376ed98..a27ebb8ec 100644
+--- a/MagickCore/artifact.c
++++ b/MagickCore/artifact.c
+@@ -99,6 +99,21 @@
+ %    o clone_image: the source image for artifacts to clone.
+ %
+ */
++
++typedef char
++  *(*CloneKeyFunc)(const char *),
++  *(*CloneValueFunc)(const char *);
++
++static inline void *CloneArtifactKey(void *key)
++{
++  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
++}
++
++static inline void *CloneArtifactValue(void *value)
++{
++  return((void *) ((CloneValueFunc) ConstantString)((const char *) value)=
);
++}
++
+ MagickExport MagickBooleanType CloneImageArtifacts(Image *image,
+   const Image *clone_image)
+ {
+@@ -116,7 +131,7 @@ MagickExport MagickBooleanType CloneImageArtifacts(Ima=
ge *image,
+       if (image->artifacts !=3D (void *) NULL)
+         DestroyImageArtifacts(image);
+       image->artifacts=3DCloneSplayTree((SplayTreeInfo *) clone_image->ar=
tifacts,
+-        (void *(*)(void *)) ConstantString,(void *(*)(void *)) ConstantSt=
ring);
++        CloneArtifactKey,CloneArtifactValue);
+     }
+   return(MagickTrue);
+ }
+diff --git a/MagickCore/option.c b/MagickCore/option.c
+index 99b43ac93..7047cf207 100644
+--- a/MagickCore/option.c
++++ b/MagickCore/option.c
+@@ -2187,6 +2187,21 @@ static const OptionInfo
+ %    o clone_info: the source image info for options to clone.
+ %
+ */
++
++typedef char
++  *(*CloneKeyFunc)(const char *),
++  *(*CloneValueFunc)(const char *);
++
++static inline void *CloneOptionKey(void *key)
++{
++  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
++}
++
++static inline void *CloneOptionValue(void *value)
++{
++  return((void *) ((CloneValueFunc) ConstantString)((const char *) value)=
);
++}
++
+ MagickExport MagickBooleanType CloneImageOptions(ImageInfo *image_info,
+   const ImageInfo *clone_info)
+ {
+@@ -2202,7 +2217,7 @@ MagickExport MagickBooleanType CloneImageOptions(Ima=
geInfo *image_info,
+       if (image_info->options !=3D (void *) NULL)
+         DestroyImageOptions(image_info);
+       image_info->options=3DCloneSplayTree((SplayTreeInfo *) clone_info->=
options,
+-        (void *(*)(void *)) ConstantString,(void *(*)(void *)) ConstantSt=
ring);
++        CloneOptionKey,CloneOptionValue);
+     }
+   return(MagickTrue);
+ }
+diff --git a/MagickCore/profile.c b/MagickCore/profile.c
+index d8924f7e2..254a11b77 100644
+--- a/MagickCore/profile.c
++++ b/MagickCore/profile.c
+@@ -149,6 +149,23 @@ typedef struct _CMSExceptionInfo
+ %    o clone_image: the clone image.
+ %
+ */
++
++typedef char
++  *(*CloneKeyFunc)(const char *);
++
++typedef StringInfo
++  *(*CloneValueFunc)(const StringInfo *);
++
++static inline void *CloneProfileKey(void *key)
++{
++  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
++}
++
++static inline void *CloneProfileValue(void *value)
++{
++  return((void *) ((CloneValueFunc) CloneStringInfo)((const StringInfo *)=
 value));
++}
++
+ MagickExport MagickBooleanType CloneImageProfiles(Image *image,
+   const Image *clone_image)
+ {
+@@ -163,7 +180,7 @@ MagickExport MagickBooleanType CloneImageProfiles(Imag=
e *image,
+       if (image->profiles !=3D (void *) NULL)
+         DestroyImageProfiles(image);
+       image->profiles=3DCloneSplayTree((SplayTreeInfo *) clone_image->pro=
files,
+-        (void *(*)(void *)) ConstantString,(void *(*)(void *)) CloneStrin=
gInfo);
++        CloneProfileKey,CloneProfileValue);
+     }
+   return(MagickTrue);
+ }
+diff --git a/MagickCore/property.c b/MagickCore/property.c
+index 9626d079e..1b42adaee 100644
+--- a/MagickCore/property.c
++++ b/MagickCore/property.c
+@@ -131,6 +131,21 @@
+ %    o clone_image: the clone image.
+ %
+ */
++
++typedef char
++  *(*CloneKeyFunc)(const char *),
++  *(*CloneValueFunc)(const char *);
++
++static inline void *ClonePropertyKey(void *key)
++{
++  return((void *) ((CloneKeyFunc) ConstantString)((const char *) key));
++}
++
++static inline void *ClonePropertyValue(void *value)
++{
++  return((void *) ((CloneValueFunc) ConstantString)((const char *) value)=
);
++}
++
+ MagickExport MagickBooleanType CloneImageProperties(Image *image,
+   const Image *clone_image)
+ {
+@@ -194,8 +209,7 @@ MagickExport MagickBooleanType CloneImageProperties(Im=
age *image,
+       if (image->properties !=3D (void *) NULL)
+         DestroyImageProperties(image);
+       image->properties=3DCloneSplayTree((SplayTreeInfo *)
+-        clone_image->properties,(void *(*)(void *)) ConstantString,
+-        (void *(*)(void *)) ConstantString);
++        clone_image->properties,ClonePropertyKey,ClonePropertyValue);
+     }
+   return(MagickTrue);
+ }
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 9744e1e919..f41e471f0e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://CVE-2023-5341.patch \
     file://0001-ImageMagick-Fix-CVE-2025-53014.patch \
     file://0002-ImageMagick-Fix-CVE-2025-53101.patch \
+    file://0003-ImageMagick-Fix-CVE-2025-55160.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


