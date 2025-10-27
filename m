Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A44CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 05:12:01 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.129])
 by mx.groups.io with SMTP id smtpd.web10.25446.1761541914346089274
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 22:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=WetNJgE3;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.129, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfkm/Uu+YVoMrMqrtNIwYeGMXTxufJ3BqogwegXLd1K/XkvzTzFhryKSEvwJ6vFGsMM70qoAbdbfEWVuxwslw3jRFZLUgt53OtyXjyQrNi3eKux7OgYzyXf3uspbyfhZa/+nFTENKDVQC/K+3YfxZd2Fo8RnWCHT3+2QdH6zNB/JBpYdxnlKP7c8r6vEUH0IIUE3YZvK50dcTUnAQoQ/7d22KsHUFpiIPTnND8R/EMhx86wuzRTId24dk90Jw798nyPaPnMl17Trx2K4iFd4dXdi443CZt2RDdZvv8Y9DFaU25x2STNKjsKRKkcuKnXrerwUzxHPUMIUazzoLYwRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXCnZ0gASmhQioE1jigeN9SHMG8mql1NeXpsN4xFuQw=;
 b=DYUeFXZmI3uNcoakO79WQOJC2SKkDgTs6UYPpe1hbTS9tEXckAqKsISdpQeXE1TmQgHSlWHUA7GwJu8zBYvq9awmSiqf73FUWb1VbeEXWkRIRj2JCdEIOqja8HAjuGqHqnGZBqxBKfTa6ZscQWRHZrOAulfpJk7Zu8xd9/SV0kThmjnJ6zsFPEthi3RKMrn8Kn+f+E854VTwNuIZCd3gOe2vWP60VWWhGIY3Y7FNveIWSOx3z/gQ080rQFTcHNJP1FffmBkZJb1LUIOokm8REs+tk3dI7efW1+o5zBHzr+qsxkX0F9VvB2EcCs7g8tECKZ051WQMi+oLqJh1davVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXCnZ0gASmhQioE1jigeN9SHMG8mql1NeXpsN4xFuQw=;
 b=WetNJgE3KzzPw/par5YUYfc9q6BkKsIpig90KJK+hEuC8xdbx7b/Nswl38zBzRHVMk/YtIf4x4hKBEAQlz5q5JbcWlQ0ESNAG7B0seap62oeL0cMOfJ4wdWDMrspU/GCQ+K7emW9PR2GTYRIser2OOjn+96Xz7mXjF7vNcvpSV1lKFiDtIZR3nA7YUQmo2kQJ6CbPq0qI7zSD6WMdyF/l8jz7m0z5Nc64nyZK2wkelQ23zGH3VVherfbuwILfYmvSJthcPbjAXiOx4MFped/S2rkBXUXa5ktPxfko8UZpodAH7EtfZNvcVNlOvw3hcBwTIXhvPthbNoOc0miy63cdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 PN6P287MB4994.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:300::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Mon, 27 Oct 2025 04:57:29 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 04:57:28 +0000
From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [scarthgap][PATCH] imagemagick: adds ptest for imagemagick recipe
Date: Mon, 27 Oct 2025 10:27:01 +0530
Message-ID: <20251027045701.3396903-1-ashishkumar.mishra@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN3PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::21) To PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:db::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB0358:EE_|PN6P287MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: eef0c016-1b27-4839-aa9b-08de1515545d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fNYWYKSIUnrn3cjcxdymzdSvjpM45o1YM64iHq5GHd9bKrW5rFABENN6Rvke?=
 =?us-ascii?Q?wYevMbKE9lnTo4UHBFBqgbtHldTA+6gX54+qIVgKt3HfDzUh4mcd5y88h8Pv?=
 =?us-ascii?Q?PkxspKriYi4+GWelsJnuQ2FK02i7jVJ/TgTsJgaYo7Rou32kJwd1p5oEFzdI?=
 =?us-ascii?Q?dkiNXjF5kFIyEe4/o3KmMo1vTB5OeZxKVX8W2Ki2FQcqF+LlMlKCClAqUqJk?=
 =?us-ascii?Q?suQFLp/uECcfVt3Wf31+tUrmYctJ63d2kBsxOiRGeX1a/SeK4nUTWV+5Gxsq?=
 =?us-ascii?Q?AwIbJTNrn7jDa2P6TYaqBGMVVgYCP66UbqmaO6g7gblrjC3EsXoyRK4l2/YT?=
 =?us-ascii?Q?sjUwCvs0gOEu38JCZHhyjEuK+1ucyaLLlQq05NwAhYshwcbb3n/myDw8XOD0?=
 =?us-ascii?Q?SM4cJ5dw+As68Fku/kARFVNe6I/+UbU3sJw6pXLC5uUmrTYajWhDRLyLTkrU?=
 =?us-ascii?Q?84kMwBh57mqaT5ptfSU7pUmkepdl1rwxJAagnk8HiX8gfhLm35oWzqD0WrOq?=
 =?us-ascii?Q?BPncBncN678awEOEZ0czb+PvULHkbm9N3wsntooBscLt0eXm9KLuz+3USeXm?=
 =?us-ascii?Q?DG5umxmwBXEDjrmLziSuAtB6KflrL0fWVDuV+PZq0/Asks9joveRSCQRvB4H?=
 =?us-ascii?Q?2WQMVq0YhmwLbxlizEJUfaA7c3yGE1FLZIUkL2Yk+cXwbIXe9DLXPqhYYdMl?=
 =?us-ascii?Q?gmNM+DYES8hZANTeFtNWGTF8mas0/fH36Fg/6ugdmsFYdHGyTMvRxlfhjnfL?=
 =?us-ascii?Q?U7qoGdO/5bldDLRKiVSfGr/E6bMo/TMiWzTmZUjjMqpwM/gBhS4WlXbHh9JX?=
 =?us-ascii?Q?PaN+RO0PONWoAlVxhWx/3WOGjDWeVOH553Sd4G8ZxmJb99UErpBMGNWO0TXD?=
 =?us-ascii?Q?cTd6yYmjRNTsjPJc0n2Cm130MoMeUjz+C0LbffdXhUuozSePq+WQv857GysQ?=
 =?us-ascii?Q?uqUraR3wtorLXR+wIja8+BzZQX+MptX4cewGX2fq9lqaZjK+LCWOhc/p5KC0?=
 =?us-ascii?Q?B4OtP234wlAGWk3XO1CemftPpUE2gih0/rgpSGdLjJ7TP7Su0+35NK3UXpOD?=
 =?us-ascii?Q?fZys+FkU/zRgNckJ8xATDNAw20slfA5KGJj3vS18BlYbyEUuH3GYL8AAfuKB?=
 =?us-ascii?Q?EeJgxPQ/nILkvc1nKGXTks1Ad0jabSk/n3JXcEnlDD85HOu+5b8H2+GWj9TF?=
 =?us-ascii?Q?8oqIp6iw8oqtjRJEyIoLcvP6/S25L70QVy07HC+jfHaf2vwtNYdlfuRxH5JM?=
 =?us-ascii?Q?9dUmG1fqWEcttqyQcehUfou96MldIjSDbR+sDPXHz3S637f9+CuUQAeIyhLL?=
 =?us-ascii?Q?dq76AYAm7LVmQqXC9/h8a9oGtMYfqQNPOMyVd5+ObnwjFcx+sNVK58qHeGxZ?=
 =?us-ascii?Q?TAX8EGDQxr5tyOXUjOmgMQrtQJ0iGhszpAJny5+5BoiaMTF0EREvcZ/vMi1e?=
 =?us-ascii?Q?G2OB9kE7mufPB1mmrwWfQy5fznUy+KQNUnB87QNVR8f7jgBjdRLDCtOrUWrP?=
 =?us-ascii?Q?H/7OxXUYYewSsXnTFNWQk6rXbZ6ncNvnWWQD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hhZkJzYeMAFvu2kWK8zjXults4ygRuOAJDmly7qOh5xadA4UDJi1P4hMGKv0?=
 =?us-ascii?Q?qqGfSN/nykJbumg7AnGCH4s+N5QtsUtzVE4cvrrBd7fcLLhqdYp2vU2RPhpS?=
 =?us-ascii?Q?WEWrnaRyp5A4WmMOV1p8ED8f3cuNS67TeiHij/K8mOcooU9ZgO/TcRm9KvmQ?=
 =?us-ascii?Q?ndpvMXCa2vt5kZeWMcA0D3oK6cD5tH+QDr6BSoLOwy4elCKkBNiJBHIKlVj5?=
 =?us-ascii?Q?uDq19pG0sYAMjwWQXfX9ArM+GniTmkAF+d87j/YrRvEsF7ueulxEiM69Hsi8?=
 =?us-ascii?Q?uuBDkYmiOSecLPW9jyv2n/2W1zniQO6c2MwJWnyVxVuKwaWTu+xERInNMTyL?=
 =?us-ascii?Q?MWhMmM4gfhFilRbfNkZli2Lmym84mBZVgBxv3zqE7qlDlh2cH113DXBVEk0h?=
 =?us-ascii?Q?2SCzb9E/S2Lz91PyeSDQekStBV3X9/xz//BPR4BL209G80fs5aQ1LyeBKEBK?=
 =?us-ascii?Q?T9g/zDLemhPvBZh4DDNkbCgKs9LvNV2OLe8mpTShhi+lrJh2x3aBJSC7Gcsj?=
 =?us-ascii?Q?x5bXRQmvCv5k9t1vC4zdf8I3y0kLelAoK6Lrr8MRzTPZbLLQ3wzEBPWC32Tt?=
 =?us-ascii?Q?TcswyU+WQwxK83bqShQQp0zBQkOE0rmPxwcbg8ptS3H00riQsn7/ywpqIa2S?=
 =?us-ascii?Q?XCT78b6OLTGKz+/YDLXdSFZm9hNAVtJJETyYulO980zrzLqjyymO5kcCHiSQ?=
 =?us-ascii?Q?HZRKAT9dCqPJduEshOMOqOWOu3CWQ0ChQA30pMAZWd7a9z6Dljs+UUly9L12?=
 =?us-ascii?Q?SqkXSjcSLVM6JR8uhUzhKqrJ4aNY7u3TdXlvaRtfhbHz5PcPz5mGV/O3umky?=
 =?us-ascii?Q?4wmFBevTvz2L4zsxyqRxJUGt53o5CczWPXxb4Mo/s1IZHzUjDfshyUB6RcIV?=
 =?us-ascii?Q?8tr72sB12XG5TBVtdAUS0Jtqkdb7cL19ccwI+v9qzpWZfjScneWiLxvcuR0U?=
 =?us-ascii?Q?OEQpKva2+lp3PDLZhGq+1vMdCjI+JoRNkIGVsGLNdfjRwkAcDekhuwaGq6Rh?=
 =?us-ascii?Q?LsfTok6BXhg6V3jebur82aL4Ove3XYTc0MaYtTgSP69N4S1k7cqChEb2pOja?=
 =?us-ascii?Q?I6nYqv8ApxlsNt6XEdZ67tAejW5iSdsPzgOofv9jBGWJrlxz0smj6TbWYha5?=
 =?us-ascii?Q?9av5dWKPFCEjwa8r+XFO8dArqP/hPkdq+K5FKK8O06EGF9j47zF3sw+XKy9v?=
 =?us-ascii?Q?huJu5u5yWAAy1QW8Agesm2Yz//y8i7EwyS53JfPUkG11eFD8w7xzjDQcRQOX?=
 =?us-ascii?Q?h/OTyWLC9ybs4TPWjbxAuoDLnLP/sEtOHkwEj8jAF0xliEcKnzJSkGHYXTgR?=
 =?us-ascii?Q?Q8sHsgi+bpsguKZzZX/0dw2FB+DplNND7wjucOdEcqvZZEJfs0tT9EIhJZKE?=
 =?us-ascii?Q?9ZhwTbsXR1l5F4kVV54sxumrMT6kAEjo2mTEWstLsxmot8CxoieTTPUOf7D/?=
 =?us-ascii?Q?ReFjzyD1tdhwnV50AiLhbOGvvHBUY3JMh1z4Wa4If1wVLcWNiS7k3EeasTMF?=
 =?us-ascii?Q?0m71QkyJO8+PiBQ2I1qJlUVyRZV7+sfie/wg82XpphlTWN6iXt6mAC+Zmg8z?=
 =?us-ascii?Q?ZNYuj6FD7YcR4vJaX7jamR5IpAqUFfcI0aCgZpAYeqIuUaF/RDz1E1p46Rq0?=
 =?us-ascii?Q?+fxIv14H4keGXRAPo7Fef2c=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: eef0c016-1b27-4839-aa9b-08de1515545d
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 04:57:28.8587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JYh33onBv1PtOQqz8P2rjSFp/YbRXhi2yFgYaw3zstW91wYf4brWMzoFrouk2Xja4MGmmhMNXpqii8cr/GzWLVE57n3bf7Wmb+OynCcr0IhuNlhT5nv+JP3DqqoYmux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB4994
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 05:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121023

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


