Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E0CD59D9A
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14954.1765552485003980206
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=QlfzUqfd;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.50, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3u9hrKxxjPX7uhwjyCtPnTgQy3u3O2CfFXKKP6ZB814MGsrRVuEavaScIIC7LF6/BZk1NahZS2Kr6WPBLHvwpmXfV5sP3W/u9BEYaFQ2W55feLGTWFAVS3YQ0scSoObJQiR//FKfxt1iHF3VeLMU2j6p0ZmwV4ivWhFdn5SyIAPNN/bgXcF9mj9uIXHCzj8GCTzAbtwVxQtELtd63YTYENfduO+9rAoQNsNTqrbl2BFODjKNsfcmdvne/JCEfVhBTg4bOnD5mECZG9kmjwG3tTo5KeNbrCKmCVN3seAW6NLgjvjN94nPKxNdtxgU/zUxI1t8N+fj3Ee/z4cRmiuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPUQuRwkaJI6h/0Ssgwdnl21qknmpCMEwVRMqk9CarI=;
 b=UnCEwicYs8f0aSNuEdBzTehQPguOODvuhEFrHpSY3EAanoGhPmvGh6zKYgRZWCLUDun88kYCsmGGcpxTKHNh/LDVlyWoN1c55RqLoQ9qa5w/yGvv8ZBdZKgQO3O2a960wizDLnmE1kc8+t//4Kk3DtuAwjOmSYL+e+nxZEt019H9uW+vB1dhqk1siqBix13thWhuAq60IFcpVTpk+UvM0IeNp1l33GJLT7g7gzsfOMKIqBezgDwxrKtFDR97KtaPiy+2ekrN7uIeZh7PC6csX/p7OfgZe9W3CFl5AB3Gf2+aIeKb8RBPp/e5JK9ZhAYKjOCua9lIZLgXDTEQa1jGcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPUQuRwkaJI6h/0Ssgwdnl21qknmpCMEwVRMqk9CarI=;
 b=QlfzUqfdYLspXAhLJ93SwWIXFPIu0C90mgPseMwkimK6uByCdyhuGGjXdjEZPNadHiNTAy79B/2DzpqLiz6GlB8RJlJh409nnp35TS8bBmbftr/hDkExoM5PzeEpildCiDieACc6HSGp98pISj+7SmJ4PIsDPeopOtjuznAUcYAJmH07h8fXlXBMW/IqYXWFXr7pADTr3adcpUoAXn++bQPDY1tl3i5zwSR9dRXndEWnMJejHpldkHVxHEjQb+AnHX1KYRupjg6opkpFmhkuOFzCZQJAQlJgbdhWmKWpe1ecVJPTLs327cnw+s4mH5qJyxGYyo4W/bF5M+FZOSMVQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:02 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:01 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 03/11] ImageMagick: Fix CVE-2025-55160
Date: Fri, 12 Dec 2025 20:29:39 +0530
Message-ID: <20251212145947.7434-3-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da9cd4a-537b-4234-28ed-08de398f2040
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fq90NCj4pFv/3vn1FLRXbktkCiEP+zEBTDLbc6dMqCBT3pwWeIVtlmSR6K6u?=
 =?us-ascii?Q?b7LW7vftMgI86d7M2k77toBtrxrnl1o1Jvw5tsqaHe/OtV2goojOa6sV5woD?=
 =?us-ascii?Q?1bxCOQuL9hBioCRxOZQqmgZ38nLh9oDr6hEfRGC2RMQnq5CYF5auy2XkCHjY?=
 =?us-ascii?Q?3sTNmCAt6Fy4Lw341tsXRhDNFfL5HctPHtP6HfbFCO4UZ0OjmT4xmM2QE2PG?=
 =?us-ascii?Q?KZfa5LVmphC79yLbLV+fiqjYx+BGgGCVxiG2L346KHaW0Aovt9++FGZ90Q1V?=
 =?us-ascii?Q?RhRFGpGkgyqM72ZAtoX4+e/+XardTWp046XrGs6wxn5TumT1lfL+9QqMNwh9?=
 =?us-ascii?Q?pNzzBcEoWfJlAfYqABOPJvJQ9BpxMbl7g+JBjkGwCZIqupVZNbOSTo9jlyKu?=
 =?us-ascii?Q?4tbxwoF5KURKBqFn4AieGidY29Kmd6pQzxYnG4AtF8iHnol0OYxLShj2+bCa?=
 =?us-ascii?Q?jvmFUVE14jr1E45/kmxGi0k8xZUj6i141Z41S8b5NbGKdkehpxYlb4CTpECt?=
 =?us-ascii?Q?wS1DMaQNQ8bOnJGiRf3JYyfXhDUMp1AlcZ8Jg0HtOpM+olsGGYQWDBShOc2/?=
 =?us-ascii?Q?lXyy+aqieP9WQ+zInE6jZo9xjMzrnfZOn3sl2RxJB8HCUgVajgrR+CMcpUKM?=
 =?us-ascii?Q?m4SNZHVPQvk3H9cyOWcDTuWqztugTTUkP5ayi/dcUQixxxlVoC806P8EPb2n?=
 =?us-ascii?Q?AH6pTJXkhwdJj4OKJSSRpHCcYDlpOFqWlRIxCBlZ+7TYUHdcmTegjoEX72YB?=
 =?us-ascii?Q?N8YrcI0Fg4iWoJvUlUeGmFgxSMyrOl4GL1+Tfy+amyuJOH29pq00i0ontOa6?=
 =?us-ascii?Q?vsIBBGnK3vdJ7Nfy0GUeMBqKRoUo/eVoaDJ1hgK5LZZuIwHjSgek0gMfqjPi?=
 =?us-ascii?Q?K/fU7OGWSSEpooL5aEBgZyGciHez14eu3Nj+5AkTjnHnItJnh7PhJThOe+uT?=
 =?us-ascii?Q?ZvoIJ6v6yqIBzNT6yNvuy7/x7L9RoszmUjCXvZY0DCbg4wnpzuNm0dOSCqwz?=
 =?us-ascii?Q?4VqQFJCE1QcIJOMkk47CjKraZJi+Tz1Od3Likt0U3NZUHuH1pkn5eeAmMbNf?=
 =?us-ascii?Q?xNz90YYd0C689kNkAeC+NHik1cMtt7WHzQXVyJrK0YjBonjzeL1c6pNCn0CO?=
 =?us-ascii?Q?z8nD9ZMMSjDemO3HtbXcyfEeUv1OBOuzTlbNBciUc7HApqEyZMqFRKp2sUQQ?=
 =?us-ascii?Q?y2Hzb3MFDoftEYs0cp2dEcqF+F3+KA9Y1gUG7sYUC5x+96OAm8uNlbR7IEzk?=
 =?us-ascii?Q?jEGTwRvVM+Lo7K08WwUZysHzvKr46LGK4CzycBHG+1bInspjW0GfPED5miVR?=
 =?us-ascii?Q?a5+xuTV0D3NkXYrR58Hg2PCN0ggwkQbWLss4+41kflcY8KfpZc4uOfymQ1TJ?=
 =?us-ascii?Q?gVvnniiY9PkLL1hH+2khnxnoqm0xOrmxfOCgJ7IhkYCewXB2QeYxFLfArSSt?=
 =?us-ascii?Q?gc0ZfQxesYcF0P7Qo8Zw69RSS+WWEBCfF80WtQfKUtfNTC/dYUYVRg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QMFu6uvzL0hS+biR25MtpG2tUX1WISQCIGzIvLUl+bCbfMDFmZ8h5SBPVSlF?=
 =?us-ascii?Q?qkvYraNV0hXMI86aXwSCe3TEOC1/B/ZLqvSzAO2dQgczsh+oEKQyy/Pb9r7R?=
 =?us-ascii?Q?xJzxupMlXbKVyAk+GdkdDOR1YKeH9raroZlM4wTZysm0rXc+wyBKsl1UPdRn?=
 =?us-ascii?Q?sPJb2SiF+aVry716KQuhH+M1mi84xAdy98STABV535jNVfXXoGiHkSE4yLGe?=
 =?us-ascii?Q?Hn8vXU2kG+wzrmCoyXoQkP/88o6TDYlwj05aTJ1ATYztUvJDHy5EMeetgq7L?=
 =?us-ascii?Q?ynTVZ++9EDlqr90MkPWbL1o83YnhbbygQc5o2R+IT/46YETgm73SD6Uy4Wol?=
 =?us-ascii?Q?SIrCOReyyn105+MliDxxXJufMe9AT4M4raBd6tXwD69iCI0ZU/bC5u/8KrWD?=
 =?us-ascii?Q?lm+Sn1cyuBKasm3yDBlQqOXThkJJXD232qhESpXjj9CjWmwawGcDJUGxuGgh?=
 =?us-ascii?Q?JWSc3YyFSYUJQkRUESu2HPcUatsgrtfO+D85sNsBWKFgWM/MZfUMxj5pSNRO?=
 =?us-ascii?Q?B5DMXu8+sWBO5c+01O/2Gv6YdbNvHtfbCfbFyj7Y/ea9U2HLPavqGd0P4PWD?=
 =?us-ascii?Q?9n+QIboJf7ssLtdlTTfhgGH3yv7R27QWHQt84yqWIpnt1/UQU5B6OzF4jm8L?=
 =?us-ascii?Q?QNPFFtkXeiIZ1A8YPmU70h4kg04GXL+HbWKekPa0FXT90NdryABfECVlk/io?=
 =?us-ascii?Q?l4x29cFaKpk45DqiygllVJNHK3dDs7T2lbzUhz6ibwynXL082e7KM3VdosTQ?=
 =?us-ascii?Q?zEGZCAkUuumn0DPEmFb4WMPn8OdYTSfMiTiNCYh9JPSuMGRMqw5Xgx+a+gg5?=
 =?us-ascii?Q?mb01yyDYdpTYkS5vsKq5lXTsNq/kE32a+tRb7zj0sTrhjp+5W484q/7yU9Gd?=
 =?us-ascii?Q?N5WlXCAUdDlDqmLPlz6MgNpX4xGFMBzfukm2jxUg4KfAgwzzDYOHZDtNyddY?=
 =?us-ascii?Q?QIf5qM0YFB+6lsr7oJvMAaSFU05zJqR5ewFJbVaMxgRelKcFM0vF8ApQ8vFw?=
 =?us-ascii?Q?v/O8k5mecyty2v9pEKTycplBRIeqho9AfZprATKBYW4wfVteH0EDKflX4asL?=
 =?us-ascii?Q?5Py9uY8NajVcpxgVzavZN0EAu5hv3zvmOGiUbXtvnvdplxch3uP70BAXI+92?=
 =?us-ascii?Q?NvHqa2QtL7cVF0dhb1wrfyuChMIWvHubRM1QVt9/fn63hu8r/yZ8P0bfjC5N?=
 =?us-ascii?Q?rbSYSrlE1HYStXh4QiX1UvsJJ88bh/8pcQUH+NS5g56+37ZGiUrvRe9gZwH8?=
 =?us-ascii?Q?jr6hw1f0hy6Fzko839ehBGQhEAWCZuho6LHdCseNV2bzO8xmdVM2oh7hr34A?=
 =?us-ascii?Q?Sig0CXrvyKP47Qb20pKYLf8HPerptIOWvNLEG5sat22xBf9fPBgAbWuUJiGX?=
 =?us-ascii?Q?OjoPuc5ldSmfRt8A716PQUZoMUFJRx/cwmFnRD7BibdbGKzh37vi3nblKHtq?=
 =?us-ascii?Q?AOliB7pAPZxbepFX4JcYvTUMYdxRQ0tDsxFKutLUZWQVRQLLwyD+HhNCx2tW?=
 =?us-ascii?Q?qX2R2THCNQZINGUci62gz8b/2At7t0VTKb3xrtKP5kxYrxPtbC9ZbcSrIK4U?=
 =?us-ascii?Q?dfj4DnniGJN4POwk8fdPmhAYWQZzLI7datr3DrQhx/T8zFFOLcFKNZQ/8l7i?=
 =?us-ascii?Q?/uKtbDW4AbVDskFV4BoOKWA=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da9cd4a-537b-4234-28ed-08de398f2040
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:01.8310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pndCLrV+2sTp3NTXTxgkTcRkal3mil3qt3USKU7E8VXKQ7ogdoEWxh3TRR657Konpe6n6kR01kxvAcAkMnYM81/KKY2o1Q24yAu05bXP3COxDXqm4NV5RnALfaVJYcmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122617

Backport the fix for CVE-2025-55160

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/63d8769dd6a8f32f4096c71be9e08a2c081e47da]

Add below patch to fix
0003-ImageMagick-Fix-CVE-2025-55160.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
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
index 0000000000..567eea53af
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0003-ImageMagick-Fix-CVE-20=
25-55160.patch
@@ -0,0 +1,165 @@
+From 6089533c7044416b9ca491d550cfd1c971d39c76 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+Date: Fri, 3 Oct 2025 20:36:28 +0530
+Subject: [PATCH 03/18] ImageMagick: Fix CVE-2025-55160
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
index ade10e1723..9b6ab5c7f4 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://CVE-2022-28463.patch \
     file://0001-ImageMagick-Fix-CVE-2025-53014.patch \
     file://0002-ImageMagick-Fix-CVE-2025-53101.patch \
+    file://0003-ImageMagick-Fix-CVE-2025-55160.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


