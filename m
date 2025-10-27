Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B357CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 05:04:01 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.74])
 by mx.groups.io with SMTP id smtpd.web11.25218.1761541435621508681
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 22:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=aJTXp1V0;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.74, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtfbYQl3IYxtz4hrzf26Ep/9GfJSBk5xhCCHVvsGT+zX+n2uoJHMxAwyHUIjS33tfvv5JFZijZFy9KqUTfnXcM4fh9c1YeXXsYoNAgMFtkayEtm3I1HC500GlqdghXXhGUNXE5SEVChko/0rXR4scthmASV76sLkKnrupTYVWxw/13UDoRmEdmlIJlk64gFpfdf/pYbO1+tHhNiDNE/M9987p6vRODACTT4yYw4hShbQLHMbT0V0wewRreglGwWC2SiQq40vGMWYcAD9vce/NfCc05zhlfqx1AR4vUO4uoq7bpbDDlhhVDXSX5jxXl72/b4GF3cBP74c7HdsLqhSdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXCnZ0gASmhQioE1jigeN9SHMG8mql1NeXpsN4xFuQw=;
 b=U7V5KUNIzXKZjAmx4GpZumtIMSPW44NsdaTxnM5r2hB3Ms082rymAY+3WakIF44NP3FVaWUMZK7yYg8xU1kJKbo72HFaZoHC0zGGya7k2us8HKMAuCT9Zj8yoADddyJ5qxJ0A3rP6dUH+t3xVIRbmFeCIu9CDsiEO0Ri5DpYomz65ZaHoQDL77UYcACTywB1v/43aILaVigT6l8xkSMUyqixvC25LqzlkaUFtZSzrp1yG8Cfr1ZjcYHIpLd9M3zFtay33GLrFNkqud4p88CD/wmr/CWAgXTb2klLK+vU5feAqs2o1f6KXcRUU3Ljm+Gd7fd1C9LbOAwevjro7N1TXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXCnZ0gASmhQioE1jigeN9SHMG8mql1NeXpsN4xFuQw=;
 b=aJTXp1V0jy+//kxflYWmAxu2Imyzv2reEPk7bf/gbwLKh2TcEQe31scBosbhP1uGoB2pSKCjFtj6k1gf//u4iwa93SkUAqDsZm8T4jTsJN7ag5PEQWso/j8TRgPejTXMOuc/1A6MduiONSLP5OYqioTLrqYTrW9fjNJKmklM4N3FeXGalN9gVu6aFfqyJdPC6ZWL0vj/SUmbIduPoYyyWe5wkSkWyWrOgH85yxbIfaxcpymAoDIOvkcCpDyX1TfPEEeZvsDZCMqTtDOlgtF7jFJ9uNnCl6PAC0DVjMqKK/HR8aiT+mu/N8xO0arcf0GrHR8IiH2C2Zy0LD1T2/urNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 MA0P287MB0618.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:119::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 05:03:48 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 05:03:47 +0000
From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [scarthgap][PATCH] imagemagick: adds ptest for imagemagick recipe
Date: Mon, 27 Oct 2025 10:33:40 +0530
Message-ID: <20251027050340.3396959-1-ashishkumar.mishra@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN3PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::19) To PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:db::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB0358:EE_|MA0P287MB0618:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa2ab48-20b1-4a39-28d3-08de15163645
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NfUd2gUYutWzm5jW+QXsYvjv8/34/B6oJTmMgWPkCUPg/x2VsqhNZ2AIbDm4?=
 =?us-ascii?Q?06xJq5Juw2s1lFl4QDvtkr5zOfp1zoeoa0hSv8m6VGaDO5rgA++UcrZdV91b?=
 =?us-ascii?Q?Xmhc2inVngb3UMr8NYyvDse/yq5Hs/B9+tJcBa7N7YILI2H1fqeSWSnsZJ91?=
 =?us-ascii?Q?ADk+FR8xdH3UQNxLpjOq7j7zhF1jgVGyYfZ8EORahkrNf4oBDGYLXue8cv1b?=
 =?us-ascii?Q?ynrYkr6FXIFALZCd4MVigeXqHNaKacCwGORMjqRsK20M+JX1zadeKMDTlC7o?=
 =?us-ascii?Q?kVm6lYbS1UIhW5s0V8PfS5yh2giDnwk3FvwjLZqk2+oWx30CZQ3a0jpJP/jS?=
 =?us-ascii?Q?iXsR/PNnScF8UI1peIgRePb+k6QlcRtAQlcSzwewCG8PGirODOe+bDsIut5b?=
 =?us-ascii?Q?JEqCMN1sO3YV9r1alPOvuYR/aBf63dCi9CgNLBstg3CGHAT6nJVXtWyTQrgp?=
 =?us-ascii?Q?ASNW7LF4CV81MpgpWqGV4dZ6EL354MUE9t51M3461ln+0hmcl3j5N8VWx2Ih?=
 =?us-ascii?Q?ZrCVDmpkbh/A9UwaK4sdUEzK7z3WahhMeI29vVPGMlPeYSgJR4/O7FFO7fHD?=
 =?us-ascii?Q?5lmsebz6XsNE9jbZ4HAgi7gPLhwE2pzjex+LFNFJ4xy9zeJmEzWHRZ3qD3ID?=
 =?us-ascii?Q?irMw7RoqgiiEhP8+zB818Hac76jvn39AAnGC2cA/xMJqs4aVPl+cxadwaqCU?=
 =?us-ascii?Q?KoRfKLMTQnwiqQwEIYFQDxy+d9O/NEbaaL+dSiH1AkfI/Ne3LRDxXGMXfQ6Y?=
 =?us-ascii?Q?0f69xEVvOPuzPeHZlGMRsm8j09PmrZ+XneYeSEuZZqCgKNADN4M0o2V+W5rI?=
 =?us-ascii?Q?OiNxm0dp3UGTQPru/u3clRZ6Nn/zdqo0BDkGDgn8Fii29jIMz0cwhA/ofh8s?=
 =?us-ascii?Q?qArqWqBul0h/lxW5XmFuFgF8mZBjuQNknUHBsmjplhVTwCvEI07IUm8cLlKl?=
 =?us-ascii?Q?BE9YyJftQkU9pZq1txKWr9zTh5vuOZqnlUbUHSkxFUv6PHUPze8t6tm1tvwN?=
 =?us-ascii?Q?o/NY+Ib737OtAm3g/SXg60ZUXusI2Bkx+8TagWSUN5VpdRUC+5Vqz0Mxm+Tx?=
 =?us-ascii?Q?8PsMI58Lm4AmoZPmq1oMzoZrY5as296x6PWhZQO8rzNcC7IawzAR3HmKeTPD?=
 =?us-ascii?Q?gC4c45heSHQ4KRjIVqOnhVQuAIvy3UhmhPnEdfoJXHuEIqDoGSC68Ui1UvWB?=
 =?us-ascii?Q?JSJaIQmBxo+cp3690aKK9J6P2JEuK6d6KA0UcradIdEZKlqKcIt00I7BrE8Y?=
 =?us-ascii?Q?MNxhdW7J0UZDXc4+geRm/ddQI3tKEVHyL9UoC1grjnQXiom50DFTkjxOAjlS?=
 =?us-ascii?Q?RjyBE6kgtmliNlwjziN+3EGhprqV9RYEz2lzaxiYkaaEaOyhaGB3e11YYTU1?=
 =?us-ascii?Q?b0NFqrdY6QwyhPIN+VA2ikEP/b3WoY0BOcdEfzutUA+dNgjGrXxSVltXEqLj?=
 =?us-ascii?Q?zmBJharHoz6gqlHHpZ5NehoE3vU971f12ww/hRzo1oT+yAt3lUh18GqqjXL5?=
 =?us-ascii?Q?wEwlF7HWqcH910u53wOa7Xp4xtMaF2lbJ8e8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L/yCOtSQnOXcA5opQHIh1RacaLeU7avrh2SicuyPw4zGwQ+41EN3ZvzqjjIF?=
 =?us-ascii?Q?768f3Yag0yzlXIKz0QKX+iHy6EwNfRwoQ22d9j3555RzlLbdIPHnm0CNYILU?=
 =?us-ascii?Q?rAheSz9GR2KFYgXTos2XD43pFP7r1h6PB8ijE6LAWZxTI3oKIz+otv83t9HU?=
 =?us-ascii?Q?S6HpnaREV03nlaNRJeiOofR7dwGL612YJ7fb97iBBvjROnuaBbHWNqFzXZ8B?=
 =?us-ascii?Q?FTeUg5e3E3G8hm3Kw5ZQIfuGwJ5X3720cddCe4xJZrmnuR2WgdisYqTuE2yg?=
 =?us-ascii?Q?SIYtI1JqXMS3U8dddaNWUg/0aQ0MtPJoEHygZytE7wWnLGwRnMkbFsisXoYT?=
 =?us-ascii?Q?fnSuEY7wRnelQIgJXKCyH2cDl9/4+Bp4SsItJ4TzThooT6VYmpmpRfmjqpbP?=
 =?us-ascii?Q?fogCCfDHvRA2VKULLY0wTU9ZpIl8xRrXdQQVAM9Gfwv4gFuEfVNpTXDSPuC1?=
 =?us-ascii?Q?sdniInJ7kfUb3i4eRKddPp58FSP/rbDoHJ8IW6wZQ3QpFv1FbYYM1D5fKWJn?=
 =?us-ascii?Q?cyvDX315yqScY/i65eVpgZ8X8AyFz7FZ6mEYsVPTdfeAUP6LFz2ym5NOdlVv?=
 =?us-ascii?Q?2tSrBit/xDXd6kozFU0QKsGFACY44WMFdr+djDrRd8DWaYQzZHza19LKCh29?=
 =?us-ascii?Q?J7JNMRFj+JbZfHTBzESJr/Yc8Iumu9zgE9gcLnvDneBv3/T9mSWZps0q2wyf?=
 =?us-ascii?Q?oXOSY5Z/5CGF3ed6BFlt2TSOIrg0vWzayvl7DO0LxrrgigUReziqqG+E2juG?=
 =?us-ascii?Q?/9HdKmD9gRL/0J97J/dgS1kwIbTeVgHbUIBy7eT/FcbC6WuC1U+TCFs/Hs1+?=
 =?us-ascii?Q?Wh0gvQ132yPFbO5WjjwSBEccVEU+EqWDLjW5dDFIxH3nwEHRtVw5hYC5zSig?=
 =?us-ascii?Q?wzyg3GzvYsyiv2z01c/LfGYygPorGM7TEo8Tg7ZIY5KxeZKQHr3qqff8Ac3F?=
 =?us-ascii?Q?0kBcBozmSz2ce+kDyaHwo9f8zEMDnFi7tMKOV6frJaq8pvzC2gNoFyTq+n49?=
 =?us-ascii?Q?3xSS+6hi+GbMeUbzQ+Q7Vwb5kYKEOjoyG/FZgL8Qdv2oe8Mc+3D2sk+eeQI4?=
 =?us-ascii?Q?f3vwml4HOMcsAJA+hhcisl8NGRq29ZEt1+Brc9ime8RhoMxcVf9Ps0wRiSCQ?=
 =?us-ascii?Q?yM56OmaBlXyRnuTdP4gKrq/+C5MONaqupa+/ufR0fwfp48EhYN6Ckc77yFES?=
 =?us-ascii?Q?7n4zXCJNsWSz/OW0hxOi1rEkTQ11UObJ2dEEbKniXm+ETAiNeEorQyzenq3v?=
 =?us-ascii?Q?QTz7eMWXXe/JudGYp/7vjlMweqMqZE5ZB8ejUvpK1RbEFIEXS23tPrezlrMz?=
 =?us-ascii?Q?VscaYyX+2GWqTJJ3JFtqAQ7y1RgnS/l/AH18REi4gyUWMqFH5gLdNm81PDCl?=
 =?us-ascii?Q?GnA/7ZSvNN6B4L7l43ZAL/wri48ZWsw+u6hTOjxp+Y7HYzt1J62L8r04mKt7?=
 =?us-ascii?Q?jlgvEC93S73sGJHD9vXE+JQHRmQotYRc+JOM8qAXEvnXJL/VgKAYKHxvfN6q?=
 =?us-ascii?Q?rdqs5ZH1e4ebCG7j5v7IfU8tpwvtOGaihx8rPGjFy9Whf5+xFzYnx2WYlgns?=
 =?us-ascii?Q?PrLWrAHrWmcro2jp5JDM49/fnTeoYUxj0InFJE7tzj+kvNxriJW2mGCF8Fa8?=
 =?us-ascii?Q?2klpoVLOCvbPFU1iXP3BX/0=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa2ab48-20b1-4a39-28d3-08de15163645
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 05:03:47.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0sZHPA0gy7R3SjmDDQI6RasXqMkOaa/D2d8H3fcO+mRyfM7XLMxJxqWEsw/KzXCfx2bf5ke1W64c9RytCoNpFD4CrL8tAxv/XFsYyeaBBHSUNgdweFpBMPJm+Ch87xc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0618
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 05:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121022

The logic used is :
- We check if the required tools are present or not
- We used convert to create an raw RGB file
- The created RGB is then converted to PNG using convert
- We re-gerenate RGB from PNG and compare the original and re-generated RGB

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 .../imagemagick/imagemagick-ptest.sh          | 128 ++++++++++++++++++
 .../imagemagick/imagemagick/run-ptest         |  43 ++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  14 +-
 3 files changed, 183 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-support/imagemagick/imagemagick/imagema=
gick-ptest.sh
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/run-pte=
st

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-pt=
est.sh b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.=
sh
new file mode 100755
index 0000000000..fbb26d2741
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
+echo "[TEST ] Starting ImageMagick Ptest with ${WIDTH}x${HEIGHT} pixels "
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
+    echo "[DONE] ImageMagick Ptest completed successfully"
+else
+    echo "[DONE] ImageMagick Ptest completed with FAILURE"
+fi
+
+
+exit ${RESULT}
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/run-ptest b/me=
ta-oe/recipes-support/imagemagick/imagemagick/run-ptest
new file mode 100644
index 0000000000..70c0dd8cb8
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
+    echo "[TEST $TOTAL] Executing: $(basename "$t")"
+    echo "[DEBUG] Launching test script $t"
+
+    if sh "$t" 2>&1; then
+        echo "[RESULT] PASS: $(basename "$t")"
+        PASSCOUNT=3D$((PASSCOUNT + 1))
+    else
+        rc=3D$?
+        if [ "$rc" -eq 77 ]; then
+            echo "[RESULT] SKIP: $(basename "$t")"
+        else
+            echo "[RESULT] FAIL (exit=3D$rc): $(basename "$t")"
+            FAILCOUNT=3D$((FAILCOUNT + 1))
+        fi
+    fi
+
+    echo "[DEBUG] Completed test $(basename "$t")"
+done
+
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+echo "[SUMMARY] Total: $TOTAL | PASS: $PASSCOUNT | FAIL: $FAILCOUNT"
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
+
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


