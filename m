Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E030CCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:28:47 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.123])
 by mx.groups.io with SMTP id smtpd.web11.5042.1761647325320939473
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 03:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=kiDefkN9;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.123, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ge2b0IXVeBNk4/HerYWcAXtZS6pYYwT+Q0OZlaTvju2ZpwpFt8hRdgw55H+bBd1HoNWNib8iSxZZ43QLLU6YfwmGv5O/QzrGpieac0XfD7Jx5jPfc9ZTXVn8Vr52TUxGrRpaeY04hIcxttVCPJUeT3y+LKRu84SYA8DJrYkEKzB3IEZzA1nxu4PUtOzyCpTeXn/A1SYz8wCvQIhmY9/ZTClsP9Zud0My7g+ZzPX5dif6udPfkNbCbTDEqoCyOVCagqHqcIoWVvlZCUIku35yMby9gzwDxelauKilopf+3ruUtMIZiIbSezwY5d/081+OUnW+qUcgVRoYrd8arFNZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOzHPgmfRyeFHq4dY/xwtFG7nl06nPe3rhrTJhQabJI=;
 b=Px+DA308bzc7gx4wcGm5faeNRul7vvA+bsIvGqygCxC0jt7LnIvFp2hxCmpiuBkedAk6VALiMIZPEYdjoUKTE9LotYCC2iWF1xTDB1pmkITyxoTHnOX5SwNwh3M3d1kQdhmBdFrpz3qdxqvS3GP2KQrQUuH2B4BMT7KwwKqQZy3AUb8hJWozHMKUy7nWpPQ43HBjNGb1FY7RALfcUTX2SXINmiDNyU+ENhKDuWDuJetAuPol7qwSk53XRQacA0tLuI5pseGfIcpGyTDQybX/CWN6UuCH3jLHBWZz1nFCpqtSmDkfrG99m/iLqrEbn17Ni4yMQ+K46vf3KlxLgmH5bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOzHPgmfRyeFHq4dY/xwtFG7nl06nPe3rhrTJhQabJI=;
 b=kiDefkN9grxjeHrcei7xbeyWq/RXmwNvT8PBn920IUQWPvQCnaTG3LbyvhLJg10RGiXeS09eHKlQLkEiAd31xLSIJPj7CpFKNN70/EXX5aAE/GvovvTtgWEDCEX9iejbckCM+sGvRM5m038uNECCfALm8brAo1Pr7VtvBONb0uvknFStKQFFYkZk/Dgctcm15+w3m9UuZnfzhFf3RgLB1+HGJIpPrNSjJRFU4agTUEY8pa6c3e3RHlqwT15iDJ8cQH5EK/FPENOZcV5GoRkGumKikGOkIDD9Xtps9IKJ95sGycJo13BDtCp+/3ucgd0eIHRb2gXZ0JprZHYJCb3Row==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 MAXP287MB4222.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Tue, 28 Oct 2025 10:28:39 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 10:28:38 +0000
From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [scarthgap][PATCH v2] imagemagick: adds ptest for imagemagick recipe
Date: Tue, 28 Oct 2025 15:58:30 +0530
Message-ID: <20251028102830.3329011-1-ashishkumar.mishra@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN4P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::8) To PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:db::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB0358:EE_|MAXP287MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0411fa-07c6-4b27-f615-08de160cc234
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?y+H2CcLev1Lodj+M4EwQNF6JkbK5ur4C3PJuvUaN7eRtgJCAm32bu41903rp?=
 =?us-ascii?Q?1GNkGLpvmc//3nHG/F8ngLFE4o/PwauA4zh+EUz/tLtdl9aJ3axqo8uzIses?=
 =?us-ascii?Q?z3oUM4m7ohk8EdQzr3rw0mfHt5f1IK3GwL6mteTpQYGvcgzKmHvZrkkSO5TK?=
 =?us-ascii?Q?qMay9nLepri3Sd1XIzrwMzjOxom0eDsJILp7wWFVNTKdOLUHn8h3mnx9gcxE?=
 =?us-ascii?Q?vlPfUZVI6Jaq8/Q0/7EY9R7f3rASpVIEDRCNiIZ/39eRjH6mV9x85aHZehbn?=
 =?us-ascii?Q?E5qldIPRRHvJIb7+CgX8HWkHvqwQaAYaEqDBHIMMQEzXcLKYjp1Nj/zUJ22U?=
 =?us-ascii?Q?CqowUk3TFPPpSgufpQl13Uo2P5xfPy/WXTRYQ7MbpkR/xDbqq2LWEVn8yTlt?=
 =?us-ascii?Q?8Dui0NJrbzgQMi5P0D3i4ppct2MSAIFnnZv8JpCqLxbyM8/fgOS+2AxjiIja?=
 =?us-ascii?Q?gdx4+k9wG4KgZ8RSuIAf9r5frygea1dX5ljG6SnURtv38FZ//Xf2eeJ4ll3n?=
 =?us-ascii?Q?VEELz4Do2mN7m0Qfo06KyV7x7UPrRMDfs0pD1c1C/6D+SOHkktuFLzjnb6nu?=
 =?us-ascii?Q?YiiB/QLPIyLa/5gBWU1ZEriT+/KB+4mAhUhDJ6D0JUePlqMHjK5pYEZ0z2k/?=
 =?us-ascii?Q?7OHINC5kdYZK87Kj1ejeGDS+0ICwe2kQNpG8vdiAJrmQD4CH1kFCWUSSqYqg?=
 =?us-ascii?Q?9uQK/JoKvwHN7JpD6yUIAwHBEH3Z9JpaQ3OUx7j6f8WYj34b1XfWW0gfqvME?=
 =?us-ascii?Q?6ys4fKfGYSwTjYceo5LATwJHTGX5kvmyh3g46GgwRueUssWbOWF99H+Kqy7e?=
 =?us-ascii?Q?54uA+lFGhUjzRz3l886GA62p7ushlb6QyA0IOMC6Y8hVsOO4mOGUe7Bpy94h?=
 =?us-ascii?Q?KtQ8soQFptDUNCQLeTCt9qzsVg8BgYn51j4aSA83d6J00c9S+HATvVivn7NU?=
 =?us-ascii?Q?5OjF25aWVUYJxRDuZUgR1EzZs79MMCO+C7SeLRU1rIKEYWKMXuFc31O6gZvn?=
 =?us-ascii?Q?pR4pux+5NBMDXnMBnue5OszYHbyFwvdSZQU6eddwaXfSpnbUwcQVAifIHdi1?=
 =?us-ascii?Q?G3/n8BRo04DWypnjcb9sBM2la3o8Q/4RIW8gYkw47m9CAEnM2IZGl277frbC?=
 =?us-ascii?Q?GfWS+gBqtaWcp7exe69I1qECxwherhzwGVi6yPd5+H6AuQXiREGzMEPeCLyd?=
 =?us-ascii?Q?FCL/qs8cOJRTQFwVqd8rehI02Tmtgq30fxf/pdgJLd6ZagI9nt7xinfY/3e2?=
 =?us-ascii?Q?Vjh8iSKi+X4xd4rVNdhOSgtDi0P8Nc5svn82+lWiKwJHQbJUogEahPg5J9O1?=
 =?us-ascii?Q?KGs2OluboBAESsuLLX9NWcDIABA8n9/xXxuy0I7qawjvGE3vhWDoMxscYuFw?=
 =?us-ascii?Q?3aFjuTNtfsUp+P9YxcXekkOQ9ugUtWQTpTB/xXe7pr6t6tu+hGmvde154NLy?=
 =?us-ascii?Q?IZFk7RHVgoA6oTnrp0EYCFMMqRHvn5jHUXmFHmR0W+ntzlztbNACWSmgthcG?=
 =?us-ascii?Q?qa0iXZYbChl2gbnYaiJSkgOic623Ny0IFkjM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hs1tdOFfRSGkXwz6woDI+gYZALxAgTuzZZc9R7pTHWbFgpRp1pzJIf33I2La?=
 =?us-ascii?Q?xwMM/r3mJ1pqFEb+xnukm2OhHlDIZ8xZjynyQQEn8YWYS+BsqQcoR7eRo/i8?=
 =?us-ascii?Q?I2jNL0KjX92lTt4xMm1AMtX+qwXwcS2cLiZ9tq4k0x270wvR8gtpPXozwZJs?=
 =?us-ascii?Q?B8Reuj0YBq3BPHxprofalc4NCToJCdWeECFVxPT0yHMCC2+f4Gko9vd0Y/CW?=
 =?us-ascii?Q?LS5rTHeqJ1irgwUVkbSTGptz+sAVAbp+oK/R03wO6XsZI90ckgGIJeqi/mcx?=
 =?us-ascii?Q?Tx46eN2voBTbwKU+P9vcwg1p1N9zlWEIuM1TBM1ZaX5u13D9Oet8qeck5Wv0?=
 =?us-ascii?Q?lPRF9SQ27FyNM+26sMCv2mT5grOIpE90Y82GuBlUStshhyVopBipC6Gosh77?=
 =?us-ascii?Q?+b3rvb1Hprbr+scuB4s2S/+Oyaq4pRXoEwh0bGl8gry9TfGEwOKewFknBT/2?=
 =?us-ascii?Q?nmq4yezpgmvYWfNvOF2t5Ef2ZTp3iWtti1FuskX9ln8FJbltyGzAk9Wz87fR?=
 =?us-ascii?Q?fKOakJ5+IgiLPTfwiyMnrYRIJeOI25+47+kQsqSERqAcyb2/YpCFcofWUYCh?=
 =?us-ascii?Q?P96SfZRBwbjD21hAtchX+xSwIhi7S1aI25VyOn/OzpQCVr5r0+pJnAjoMvmi?=
 =?us-ascii?Q?EBbCyd6r8G3/bZuDyEuTIdJFYR2wBLGBRlCi1d3mda+eu1+qZLGZxPlgLQv6?=
 =?us-ascii?Q?dE5wNpvDzw2+0taVq2y768hl/QDoySxpeVF1LGBquO1fzzbsxHEQUiiev+B7?=
 =?us-ascii?Q?RiKfR6wBK7+l4lSRRt9SG15joPN5sbi/vJYQMuTDcoKcyqYeqiz9WPK10TZR?=
 =?us-ascii?Q?kVKAudVziySzfnXjzN89VfpYS5FcZ8UhoJAQ9EoMha9vlAO3j7V1UhqW9TYd?=
 =?us-ascii?Q?3iEO3qyddPQZFqDeaFS95yugTPTnk3j4paRIVJFLua41AYYI6FT7nTIoGKtO?=
 =?us-ascii?Q?0ZK81e9OSa70SdkB1EB8WXohqQt7v3rZKtw2Sc/ZH/aS19igTXi3tBTUq4FE?=
 =?us-ascii?Q?qHcdUx4aTp5msMsNGgnf6EAHGxfkZbD3Go+fiDVrztQwL6t0v+myDUbmU4tR?=
 =?us-ascii?Q?rcmK77T9Jsb75FiXbckk/eZqEl+Mi5RquaOtU3dQkKMbxLogAu02aOYhlodQ?=
 =?us-ascii?Q?7pFW1dbqBygZH4lE3CDrOEGiTu6Dfog2HMfLLGGXk6tguERN2F4NJquyqHio?=
 =?us-ascii?Q?9SzCcHlIHFePXAxuALqmkUllwMTrOsAA3P947JUlfEVUmM/Ir4FSE4dkg1r8?=
 =?us-ascii?Q?Ui7ad24ZU98lK0PGsRePlqEoV9B5bhdx13e11WygT8v0McWJ7OT71dbHHrYU?=
 =?us-ascii?Q?AcqfLKRLlbaX6MiHtm7QGS0dixTCdhn4Cg+V6HFpQIlPbuIA11//0uMEA5VS?=
 =?us-ascii?Q?kUTufjQkwI5FnhIOkOolQEJbfjWMEi38pYh1DCQUM7Fw4olBuGaa3rIE5cp6?=
 =?us-ascii?Q?isGswJDNUBBKzPIXHobh6z0q28mq+NtxXcvyyNZuPUAdmyC60mVHgFPlt9rb?=
 =?us-ascii?Q?QBAm4keH0PdUD6TVzNbSEku5X5fALuUPRCmLX8X1cK/OOyvUerIz7vmhhLpB?=
 =?us-ascii?Q?79ExETfwFFKGUAe3tK8d2QwufiS06IKk32REE4quvTfdZ5X4k4K5iDOMGbry?=
 =?us-ascii?Q?ul3/Qns5RiuysuVU/nU7p5E=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0411fa-07c6-4b27-f615-08de160cc234
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:28:38.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PC5EJd9CLyIhtXa8l9J2sqgZAHco8d4aCEboXQTsKC1DWHmmtwZVm1q4fLJaswR/FdWqI873LDpMAryfjO65FTy7cNk0npFDIx/zy+skBUK0D/WCAKh+uc03B/8OlwJ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXP287MB4222
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 10:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121074

The logic used is :
- We check if the required tools are present or not
- We used convert to create an raw RGB file
- The created RGB is then converted to PNG using convert
- We re-gerenate RGB from PNG and compare the original and re-generated RGB
- Enabled the ptest in ptest-packagelists-meta-oe.inc as
  suggested by Gyorgy Sarvari and incorporated logging suggestion
- This was done as standard imagemagick test like drawtest requires manual
  internetion to verify the file.

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 .../include/ptest-packagelists-meta-oe.inc    |   1 +
 .../imagemagick/imagemagick-ptest.sh          | 128 ++++++++++++++++++
 .../imagemagick/imagemagick/run-ptest         |  43 ++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  14 +-
 4 files changed, 184 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-support/imagemagick/imagemagick/imagema=
gick-ptest.sh
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/run-pte=
st

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc
index 639daec992..36b2723e1b 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -14,6 +14,7 @@ PTESTS_FAST_META_OE =3D "\
     function2 \
     fwupd \
     gcab \
+    imagemagick \
     jemalloc \
     jq \
     leveldb \
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-pt=
est.sh b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.=
sh
new file mode 100755
index 0000000000..2afc2ff246
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
@@ -0,0 +1,128 @@
+#!/bin/sh
+#
+# ImageMagick ptest:
+# We ceate an BASERGB file for our usage using "convert"
+# We convert this RGB file to BASEPNG
+# Using BASEPNG we recreate RGB named REGENERATEDRGB
+#
+# BASERGB to BASEPNG to REGENERATEDRGB
+# - Then compare  BASERGB with REGENERATEDRGB
+#
+# 1) We are checking if the binaries are present in RFS or not
+# 2) We Created an RBG of size : WIDTH x HEIGHT pixels
+# 3) Return value is captured after every major actio to capture the statu=
s
+# 4) cmp -s is used to compare binary byte by byte data and
+#    capture only exit status
+# 5) Important parametsrs used are :
+#    -depth                     : How many bits for each colour pixel
+#    -alpha off  		: Don't consider transparency
+#    -define png:color-type=3D2   : Make PNG work with truecolour RGB
+#    -strip 			: Remove all non-pixel metadata og PNG
+#                                 so file is reproducible
+#    -set gamma 1.0             : No PNG brightness correction
+#     gradient:red-blue         : Data moves liberly from RED to Blue vert=
ically
+
+
+WIDTH=3D16
+HEIGHT=3D16
+BASERGB=3Dbase.rgb
+BASEPNG=3Dbase.png
+REGENERATEDRGB=3Droundtrip.rgb
+
+echo "[DEBUG] Starting ImageMagick Ptest with ${WIDTH}x${HEIGHT} pixels "
+
+# Verify required binaries
+for bin in convert cmp wc rm; do
+    if [ -z "$(command -v "$bin" 2>/dev/null)" ]; then
+        echo "[ERROR] Required binary '$bin' not found $PATH"
+        exit 127
+    fi
+done
+
+# Generate raw RGB
+convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
+    -alpha off -define png:color-type=3D2 \
+    -strip -set gamma 1.0 \
+    gradient:red-blue rgb:${BASERGB}
+
+returnvalue=3D$?
+if [ "$returnvalue" -ne 0 ]; then
+    echo "[FAIL] Failed to generate RGB pattern "
+    exit 1
+else
+    echo "[DEBUG] Generated raw RGB ${BASERGB} for test case"
+fi
+
+
+
+# Convert raw RGB to PNG
+convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
+    -alpha off -define png:color-type=3D2 \
+    -strip -set gamma 1.0 \
+    rgb:${BASERGB} ${BASEPNG}
+
+returnvalue=3D$?
+if [ $returnvalue -ne 0 ]; then
+    echo "[FAIL] Failed to convert RGB to PNG"
+    rm -f ${BASERGB}
+    exit 1
+else
+    echo "[DEBUG] ${BASEPNG}  generated from ${BASERGB}"
+fi
+
+
+
+# Regenrate raw RGB from PNG
+convert -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
+    -alpha off -define png:color-type=3D2 \
+    -strip -set gamma 1.0 \
+    ${BASEPNG} rgb:${REGENERATEDRGB}
+
+returnvalue=3D$?
+if [ $returnvalue -ne 0 ]; then
+    echo "[FAIL] Failed to re generate RGB from PNG "
+    rm -f ${BASERGB} ${BASEPNG}
+    exit 1
+else
+    echo "[DEBUG] ${REGENERATEDRGB} generated from ${BASEPNG}"
+fi
+
+
+
+# Compare original and recreated RGB
+if cmp -s ${BASERGB} ${REGENERATEDRGB}; then
+    echo "[PASS] RGB data identical after PNG round-trip"
+    RESULT=3D0
+else
+    echo "[FAIL] RGB mismatch detected, printing their size "
+    echo "[INFO] Base RGB size: $(wc -c < ${BASERGB}) bytes"
+    echo "[INFO] Round-trip RGB size: $(wc -c < ${REGENERATEDRGB}) bytes"
+    RESULT=3D1
+fi
+
+
+
+# Checking the identify tool from imagemagick to get the PNG metadata
+# True is added in end to ensure that test script doesnt fail even if
+# identify fails for any reason
+echo "[DEBUG] PNG file info:"
+identify -verbose ${BASEPNG} | grep -E "Depth|Type|Colorspace" || true
+
+
+
+# Cleanup of files create by test code
+echo "[DEBUG] Cleaning up temporary files"
+rm -f ${BASERGB} ${BASEPNG} ${REGENERATEDRGB}
+returnvalue=3D$?
+echo "[DEBUG] Cleanup exit=3D$returnvalue"
+
+
+# Logging the final result
+if [ ${RESULT} -eq 0 ]; then
+    echo "[DEBUG]: imagemagick-ptest.sh sucessfull "
+else
+    echo "[DEBUG]: imagemagick-ptest.sh failed "
+fi
+
+
+exit ${RESULT}
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest b/me=
ta-oe/recipes-support/imagemagick/imagemagick/run-ptest
new file mode 100644
index 0000000000..75251a803f
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest
@@ -0,0 +1,43 @@
+#!/bin/sh
+#
+# run-ptest =E2=80=94 ImageMagick ptest harness
+# POSIX-safe and BusyBox compatible
+
+PTDIR=3D$(dirname "$0")
+TESTDIR=3D"$PTDIR"
+PASSCOUNT=3D0
+FAILCOUNT=3D0
+TOTAL=3D0
+
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+echo "ImageMagick ptest: Runtime Validation"
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+
+for t in "$TESTDIR"/*.sh; do
+    [ -x "$t" ] || chmod +x "$t"
+    TOTAL=3D$((TOTAL + 1))
+    echo
+    echo "[DEBUG] Launching test script $t"
+
+    if sh "$t" 2>&1; then
+        echo "PASS: $(basename "$t")"
+        PASSCOUNT=3D$((PASSCOUNT + 1))
+    else
+        rc=3D$?
+        if [ "$rc" -eq 77 ]; then
+            echo "SKIP: $(basename "$t")"
+        else
+            echo "FAIL: $(basename "$t")"
+            FAILCOUNT=3D$((FAILCOUNT + 1))
+        fi
+    fi
+
+done
+
+echo
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+echo "[SUMMARY] Total: $TOTAL | PASS: $PASSCOUNT | FAIL: $FAILCOUNT"
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+echo
+[ "$FAILCOUNT" -eq 0 ]
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/met=
a-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 752fef303b..dd199902bd 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -11,12 +11,15 @@ DEPENDS =3D "lcms bzip2 jpeg libpng tiff zlib fftw free=
type libtool"
=20
 BASE_PV :=3D "${PV}"
 PV .=3D "-26"
-SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;pr=
otocol=3Dhttps"
+SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;pr=
otocol=3Dhttps \
+           file://run-ptest \
+           file://imagemagick-ptest.sh \
+"
 SRCREV =3D "570a9a048bb0e3a5c221ca87be9408ae35f711e2"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools pkgconfig update-alternatives
+inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits=3D"64"
=20
 EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=3D.im7 --without-pe=
rl --enable-largefile"
@@ -56,6 +59,13 @@ do_install:append:class-target() {
     fi
 }
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
+    install -m 0755 ${WORKDIR}/imagemagick-ptest.sh ${D}${PTEST_PATH}/
+}
+
+
 FILES:${PN} +=3D "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
                 ${datadir}/ImageMagick-7"
=20
--=20
2.34.1


