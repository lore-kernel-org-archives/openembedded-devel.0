Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A0ACD4F57
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 08:23:56 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19207.1763022226149036027
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 00:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=gfzHkxF4;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.66, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuvYgux03NDN+CdygYXs2yUzr0dcxr5N36uIE1BE9DytPR849VRiLlwmA38C8eL0XLXBm4dsGEGiSLpheIz6ycstL2u8hnDAfSgax+W6GAMcNOwHb/FlwHex0pDnSAfrvN2RmgzgFXbXDp2CvdRessjxJMPn+m5OrvKAXBnCidSOz8ZHG6DeQuIcqUvBxXGXc5woKtQMVGPM1EHgKzgkYlDqD4BA74KwY5lcliE83u+uU+rhU7wbZmCsivmOsRYMhrX8wOulahDbzG2YaipTySKSuGiwTtxGzBjH0BNpMBeH39K5uiP1eGb3EQMY3IBiN17hSNIg22F45+wShwmNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvMc1OU6G9eI9s/yCBWUJK0DShgZ18z8A4kZlQnHFaY=;
 b=vnsOnJ6+uj++2GcZIjZw0YOsXXazeHCZLYxmdMkXvUuklukoNN1mUow7N30b7GertmjYbzYT+2CyjKgqyPgOstXzQJ9l1Gqw6cPhIoZHBZyeOhwZxfmbp6UnupzO1jQntYXm7o/LKOSth+5nZYyTE8xo6+MDb3wihTvnr5kc3S3PMa3GK+h9GEisDKoHNDMEQh5GvzPQ1HE35xImfe9YIpg+qb2c+F3xUN50Sjh4U7otReBpSdxXbavMAdtUJXMlFvs63taFZLRFhfL/bX4ghaTVVUoFI4ESTfjTvgTPXV8sg3pJqZtQn5jHSaJFx1KRyECCl/vjJi+Q6zbuPQ+txg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvMc1OU6G9eI9s/yCBWUJK0DShgZ18z8A4kZlQnHFaY=;
 b=gfzHkxF4mM+xG3lOjSIYzudyO7MC74NPCt2j5DUG3DFzRh3epjUWpo7vY0Zri4fjxJ84B3D0svZtd5NomlooJ0pMS8ZbsTB3ZgJBhW7D2+u4qdy7s+qXYXO0ZnEuHjfh7Y4KxGRi3gwEXyrFIHhIb9uHG3Iq9jXZQVfa1hK+BZ+HgmElRmXMHHoysnPJhBw7Up3xIUEV8xToPwNy07Lfdb3jFfksbaccHMdKzM4wA1TGS5WwB4QZzDlmsbq11Yv/Q1jlJ6qtsYJSyJtm/TYuFpKgo2UF4usadWn0HDBTZSO/audACteZSKZJmqlafc2oz0OA0cfkEWNsjasFfgjtFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 MA0P287MB1436.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fa::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Thu, 13 Nov 2025 08:23:39 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:23:39 +0000
From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][scarthgap][PATCH v2] [Backport from master] imagemagick: adds ptest for imagemagick recipe
Date: Thu, 13 Nov 2025 13:53:29 +0530
Message-ID: <20251113082329.1279411-1-ashishkumar.mishra@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:db::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB0358:EE_|MA0P287MB1436:EE_
X-MS-Office365-Filtering-Correlation-Id: ca827f68-b5ce-4092-de62-08de228df2e5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7uReAzCHIu66rklFClvYJrsW0MwfMVdBgKx0NPucdUUrd8k/z4r72y+POEzW?=
 =?us-ascii?Q?EtK7DAtXy7drbnnHIEXRB0komhs7nFcUI37kdkPoxYCbcq84N1bOZqsI6FOd?=
 =?us-ascii?Q?xRP+CCK9DeNTen8tXIZKz1G+24gpbVIHQibYTCReZOFupz165Py7QMyokk97?=
 =?us-ascii?Q?kbd1WjQKQCFh+b0pnlwa6Lz+E4kFAelT+VJwGVl8AokqCwQ0nFVbU62Y/hUx?=
 =?us-ascii?Q?fHD5IJwaQfIKsmBkdF9B9IPOXIf+lrjGfjIQwj0xfTUwjP1A/+krJap9SLwZ?=
 =?us-ascii?Q?UXAe1pY7ADvDl/qXxt6+7dgigwGj5+qLC+izntUvwxlYobQt3CCpVLxyUn3a?=
 =?us-ascii?Q?evoSiAuGubNeqRKuCXdiHeRYh+jzu2odDnRZBgcdip+g0BTkPH6lvp4b2CKZ?=
 =?us-ascii?Q?JugKH6bBmfMOMryjG6gwi+zy/hcKFsoUHgTvJ9y3K3hEYTN22RX3dGhnC1s8?=
 =?us-ascii?Q?iV8NvNbHtU/61rEdwFxej7fvRk2k1txACR64KjB/ZE0KfRSxYctiv1CqZL0G?=
 =?us-ascii?Q?UIRTE5O1SEYuAeneSpsjZXRYbvr7KY8g/FBEAzY3p61ylNKHeEXVJy6Opt3w?=
 =?us-ascii?Q?KnY+ndLIqqLT0i331n3Uukn8/mSR7le2pGtjYPvYLUe0Tk03uhkaLCGb8d3Q?=
 =?us-ascii?Q?QQCiYJVHGGJoAWLguVYkA6+V506SzrYYDosnkKhuxdTFycSyFYs2OsTJfAXP?=
 =?us-ascii?Q?Gb6eUptKMbpuepDoCv8NNZc8kOFUi7GnY4H+eZhCb3U6s2RDaUWYdLI6nuva?=
 =?us-ascii?Q?XV5yavDD9PmOqst+r9stJ7bXUa3VcYF1N3vxXlLGcjTm4disWT4EIWfuggYr?=
 =?us-ascii?Q?pGfOVrpMf5YNFlWpVl3aYX7Q8vgNXxfNX2gmPYdw0ekd2+fVMm+IiPYpgHhK?=
 =?us-ascii?Q?ZRo1NJCcFkz/pluuq8f/RlVXFl6QV/9WIH3ShS6y2whPd3GO5EP0YxJYQrJY?=
 =?us-ascii?Q?VR0XZxO4thLElrJ8Z3hnLox6bUGVE6hza1uywOrfXnfeIkZO4kvJAxW+orwG?=
 =?us-ascii?Q?ARZ2E828KKhlKLuZ2Uc15nrFunH1/2IBf4S97qh+xmkTPB3qiWne6HqjXTF6?=
 =?us-ascii?Q?Xe9K7nZDhlUIXvHeu8AqteohbXE89/QpuIQ+gdB55C6+TIbToLR7cL9s1U6i?=
 =?us-ascii?Q?BplGWneNxABZL8tH7dhlm/jjsfb5hkNlAyEnspqReNYXZtfUaZR32XAOZKLm?=
 =?us-ascii?Q?UFpZzYgfJPSI/sdSsWyxurkhw5Swp2e872y5jOK/vx7AW5pn62KHjTxL08eP?=
 =?us-ascii?Q?jKr/kZS73GzktiEO7zvz/Tq0MgfPvN7RkHgYEa57yGzfSpQw1zz86qJcuBlO?=
 =?us-ascii?Q?kdVCqCdzbjLvwr0Qsp7/TGlomjoov3gm/uCP894RJ5RiZa8ikrowbDS5JrZQ?=
 =?us-ascii?Q?VTNQGtFKUo7kh3TstoGNyWPX0gLq0NuoFw4ueMqCl/yVReHY1l9SJKQ8fqNz?=
 =?us-ascii?Q?51r4/ue8l8s6cg731B/Vn/BTAvbLJ0NgmrJxhGHBoiepfD0OWqbqH1+Xhks3?=
 =?us-ascii?Q?8tzcVVjpTPIWyP1exEYCOdobR3VN6XbM5mQ8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I1M6uKBSHHYOVY7bOrHqru0BSAhHkvkuTFfVGPdwxkr8JUqZIFk7DgH3MTIi?=
 =?us-ascii?Q?XQAt+64l5UeY9i3dkuj8QWZuJAaBBEpxN3Z2bf2cmx72Wt9t7qV9CHyq26zC?=
 =?us-ascii?Q?NHnEWiGNA7AdErFF0n0kHnZsX2M4FJi19SYArpcd3mw70MNUzhytjldrHoBe?=
 =?us-ascii?Q?tvw5NoSz5IX5uFEpjJ8I6fMjJEqU0kq1w2rh9Uam75bMklMpRsLuJgsfvtRF?=
 =?us-ascii?Q?9FFzdEV3V0kkBwPq/tS4sPtrwLR/EkSMNxbiMJHsDKYe1Iy3laifxh3eNGBg?=
 =?us-ascii?Q?DCz8d/69TeXUpnO7phxq83ds1KPxKLyS4+8uGy+UVC93I0bT9TT3P5uFXXRP?=
 =?us-ascii?Q?iwdh63YSG0NDUwWwhHkcjDTcdtb0cB/1FAdrTsE/frJX5LdpcwXGfu45mfJi?=
 =?us-ascii?Q?IQASWZJuo1rXz69LX/Xjse8NHFJdbbUQure6E8Vapp+yO0Kl4Jdrl4QzdFO0?=
 =?us-ascii?Q?0HMsxxihqIxM14P7MOKxTj3j4TlbPj/SnjiNG3O7qiAJ/F8BsxZN7merlTcf?=
 =?us-ascii?Q?Jehg+Ar0QiHyP8iI0ge2JBu2Gdnkc7E8wgqXr4Gzn1ByM9P22GzbpsVXJDsN?=
 =?us-ascii?Q?MHG+WumIqsnLKnGGOaAd2FyYyP63b1rJ7CKdFQQAho4wnFmVfKGqOVaa/y2H?=
 =?us-ascii?Q?S/Ffd/OkKeeoZKEUvTpZ3NZeJlF2ghRO8OetDmh6Mw+YrQZ8paaPCJ6b9tCn?=
 =?us-ascii?Q?3JfXXtp61JNi+nDtqM2TmxIUJAk4iNOSFZnj9Crb2gIhCByQDVWww0oeqYAa?=
 =?us-ascii?Q?ixnWMSLb2JP1uGFszdAXaJJpJuoB70mRA0cSr8N/o8dSDdcc8mV5L7BdOpiS?=
 =?us-ascii?Q?+jljJYe5C8e2wV1X2tsn+J4dFh5ITKmYC3QiW+ZcxtJ+Q2XUHGvlYkxkmYkg?=
 =?us-ascii?Q?SqbpC4dzZ/peMpvPCmhHc9ma7SB1Fn1fKCZaCRp9YcLP0Y0gVvJNpTBhgS5O?=
 =?us-ascii?Q?nbLBs1XW1djTV1UQMSm9kzGkHYmv5QRyi+3BQ1+MvPuM1A6tU+n2wRSDeIqP?=
 =?us-ascii?Q?dPmf+Jd6875c4YqHMSIHXJOqMEqk0LSISdjJE5RNLwooykpx/EUfRQhZmLNQ?=
 =?us-ascii?Q?x5z0Y00Y/kOJ12AJUkQs2Yu1afmZRBStmjve0CkjamROUuSF5+4OnWZkQz2U?=
 =?us-ascii?Q?4olRcepEQRIkveaHhrqJ1boHQbASY4TnWznu0I36evGy+2uEyAAfPvQcCqFD?=
 =?us-ascii?Q?rCQvJYez5Zql0hra0gnss7TB569++DXq1aoe+DkX9klKnblxDC4LSszOa53i?=
 =?us-ascii?Q?FPmuNaHtv99D32rlBWa5EG8xlxB3Hco9oPo8zJ6+BA7TEu4vLxJwQCyTViNL?=
 =?us-ascii?Q?WyQbwx5PGNY+m2M2riGHnMrHyE4D21+EU4Y4Nc+VWsRU/pAcpUKBYmTHgBTb?=
 =?us-ascii?Q?7HNM3vc+RMZyxH1qNvq5kuAlAUg1EjVldYUDv6MLGVZrNZ/bjPmhFObA8ajW?=
 =?us-ascii?Q?6LS+VcEeqM16V8TFwXwjaTEjD2ANvi0zyRcJLKMDeWZWDzYPWQw+f677zWSE?=
 =?us-ascii?Q?614dwkQUxl1OXPK1Jhb0sf22B8Z+yzO2oQKrmBpCMJRUAOxLDv+WowYIxDFE?=
 =?us-ascii?Q?Y3qP+bStG/W1k9j1fbg6j621J/9Fxl0K4pfgakWbNgHRvFqlWCV1AGjjj4Po?=
 =?us-ascii?Q?DpXS4cineeUtTE2DTEkJtgM=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: ca827f68-b5ce-4092-de62-08de228df2e5
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:23:39.5240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V7P5j2q6BSlGyv9RpR9wHB29bE0q+Vp33JJaNoOEx+x+ZTLhglD3Nog4LC1zZS8Ii1LXWBDbvdrtvfB7BZUQv7gXhO8Y6NyJGMT0zFg4UdvswzTO0kNYblC9ic3+Vqh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1436
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 08:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121640

Backport of the commit 96b97c0c6490b713b559a4e82bd699a2ebe357d3 from master

This patch enables ptest for imagemagick, improving test coverage for
continuous integration and runtime validation.
No functional changes are introduced to the core package.

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


