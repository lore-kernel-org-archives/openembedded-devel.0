Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971EDCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 05:20:17 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14095.1762147208855321073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Nov 2025 21:20:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=GbMX3Pw3;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.33, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eu5vtLdHJ2Mj6tUvxyuRILKTIA2H8E0rtGQrealwcjLsjVMi5s9kcdox+hfxFt5Gn2OpsNT5adkb9zMEmRbZtUWfY8Nw9aFFm9m5QEkR9mzZ4dPktumHRdia0rlGi1p4RXxIsfXkTfyBgmH1Dyeah5CdHti6wsmDsF9ClQ/MbTaSh3rLg/QEM4TmQFLeXtCd1gcEXMaZYK/dL3jUbOZT40ouekqB3e4ddmZ64cz2UQwGdfNbRyS++MDmbkGrtynZalVq5wFSDkW2/OXRFgpqeGFydjpAEecfljwmpSbh3inP08OjWYTjUh5GTUeTlER2usTFxpJikl11+3elIqhQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfJj4Jy49NxmIyT0dwGvzQR0WR33Na13r4eu8obxLD0=;
 b=uCgQHJFQnvOyMqveL8bM3QmOLMYa+ey92XZ48CONW8sMPH+NmTVeKz3OTEkiYDkQk6JcN1mAi/2yv9hlF0jtJxiLl2Wioema5uwWnGCpQKE/DGtkuHeT+rLKoc9rnNJenu2KpwxcikwYdZ2ML9c3Ot1KMrk/1zUXr6rjnkxhm+NCBOz2HBAkFG8ee5E8GIOjaSIGH6DrWhDzorypmv3K8bi5+bpdh5t2fGxc7nueIMXhSffJMGagXgStu36d61B99wtVxi9CG2UdGV/+p1Xn62Qv3fuMrNQiMSjtcJOY684LQG6ghSvc96DBBX63QEHs6v8u3kWmv0UfQiI1qHsldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfJj4Jy49NxmIyT0dwGvzQR0WR33Na13r4eu8obxLD0=;
 b=GbMX3Pw3j0cqeZzEHA9UqqOQ3SHFejUui1vvF38MdDv0dERkHbmEXMbHU5VYfP3bV1Y9QLVF/xhLUOMl3W6sjJU7JbIDSoKSYwZZmaIi5XYNjfpHswyIPnHQgNQZtYc4cskfPeyiH17k7KWs7oJWYqteDV0eRUyZHJyA2iQcWLPdspIgUvUvony5zsmNnil7dHBrrG1alY+6la705M1D1CVBVpqIKunkEGVtFMFMo+1a/Du4uSYaIxWgJMdii8fhIdstUvEzsqrNjidX1ubacpycFF5WzDnErblDY5dSgXd37KHIAStpqeLG1GKAPbB0m4wxNYBwL9i4dYLPi1cz1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 PN4P287MB4942.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:308::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Mon, 3 Nov 2025 05:20:00 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 05:20:00 +0000
From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][master][PATCH] imagemagick: adds ptest for imagemagick recipe
Date: Mon,  3 Nov 2025 10:49:45 +0530
Message-ID: <20251103051945.1615774-1-ashishkumar.mishra@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA5PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::11) To PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:db::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB0358:EE_|PN4P287MB4942:EE_
X-MS-Office365-Filtering-Correlation-Id: f84fcf8e-e1e4-40f0-d68f-08de1a98a2e1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sYAsvEBgcY20dlXergUvlyeDr8xXDGDMt/SAK55Azh0oQqCOaoEbdCEzrssE?=
 =?us-ascii?Q?GtiqJojcq6T6FJhMnCuKX20ZXBF5LBYw7oKFF/KBJwfyNLPW+H7JJbG7c14G?=
 =?us-ascii?Q?XlUECKuaNPl6wzI5VeETC0j7ovGzDvZtE/X6BTpFLOQhXmlD2pQJvBelKebO?=
 =?us-ascii?Q?2y/J5hhVlAkeVHJ660eL9CRYxiRpzGaUQivfGtalwLDmPD9HXsRlN/xNzLzW?=
 =?us-ascii?Q?SeajOTuH3ccASW0B/OUNwYtJlQQNlnelYufLYGL1uHLxA5gZeibFv5awprU7?=
 =?us-ascii?Q?0bU/HOCiqNkgZJzZ8+uY7fYi51CL4BLdOn308mEv2STJA2ch3McNfBfwTTRi?=
 =?us-ascii?Q?s2aZFefEoy7GW98Uu0hGeA5xOS6skzGImnXlDsTPgA9fZkkewxA0cZuWjqtf?=
 =?us-ascii?Q?5RdXj7KCt6LfQJ6Iq8xMHN4wv/N8iOfSeptZH3TcoFBbDl4P0rl/GzQNL8Nm?=
 =?us-ascii?Q?AWrMXjgsPSegqbh+hhXVUnumelMhrMERvhdkSVlMb/XMRZ3t3qZMhme5Ypt5?=
 =?us-ascii?Q?WUbHTsD0VZ2DqHGr1Eo5BP1ZBjGJ6MRRKvQ5mZGaT7eMHsW3JzoSqlZ39w9/?=
 =?us-ascii?Q?pdVzXNS0kJI4VqHyGumUrPCI6cEbvuSBVvhAMJfFtD9Qu714W2jEjOf86n7J?=
 =?us-ascii?Q?8KtGJTLk/jqYOgC6x6itDQq+DOjApf4wpQMnyjGNicKxCrxKFlE1vIMeey+3?=
 =?us-ascii?Q?hbw1CJH58xiuD6oXPlWBqVJBb1LYJ5C7odBkJijmCskTDlh99YWVOT4xD9AH?=
 =?us-ascii?Q?Z2abFBClWxegqHT6cewZsF4l9A3To388aF1QMOK6h403yvsuRBX7lCY6Lt+F?=
 =?us-ascii?Q?k/Q+fDHiArFaGTDoEUd7drG/mXnvvVyuSehLfhAZGWNfWGuKzTXb6loLTiqE?=
 =?us-ascii?Q?FUexLBX4LTdW3f0iXtBwWqGqZDPVwqY+zxPjOANiRj18FQnTMQilHyQ65/bs?=
 =?us-ascii?Q?hGhHKWuWDgiMJo095RWr3hBVFZyrsKv4HEOQQfTMWSXuPMq6W3tZyGOc+R2w?=
 =?us-ascii?Q?9lsjbtU+7wTOj8Y924ltNCIICMdLtVJS++H39BfhDjBcQARIhJytjnAE5Khg?=
 =?us-ascii?Q?U6yfXEnluMmlvJ7hWJjxYtP6EtCG/GpQdDbLv15NBdCHAFCzgTdG3nwGEliL?=
 =?us-ascii?Q?dbDI8PoNdzq/W6pfCj+XCOZC+cRT3wXt3Wjv8ck0L/YoyRJUjh4F7ZJvueGz?=
 =?us-ascii?Q?3lzLb2iWs/hbrLquJh9CuKPD3UElwhJ3vX1rlWF3d6fWsJo39jXGoSf3XO67?=
 =?us-ascii?Q?bLcyYvnAoUhjmrHqgaoHFIJF2dGyN0ZBjdbrmA91suruCc+RvChRu2rghvmg?=
 =?us-ascii?Q?i4P0pnzwxL9VlHK3nFc+m2wz6hHyC1JioGckZBJTDYSwBpDfBgwjzG1YVa5x?=
 =?us-ascii?Q?WOC5s2zjz/+S8BOyS/6Hxsd82xf439KzuBxbYdSXF2HBve13munDjt17DOeO?=
 =?us-ascii?Q?wn9KC5LCdA4fam1KlX9vb/IrHWaVnOhm7XAZnMFQIiwcilYUvnnGWFPnW6d7?=
 =?us-ascii?Q?6aQ5lQ1/t5OxOhjplOfEdusBs020asHQNNH0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tf2vlqt6qU9dFep9+50UBai3BP/0ixJFqSVLmAbSiBzyp75xCOuVOQRR6970?=
 =?us-ascii?Q?Clgu0J4BPM4v4z1RPsDSHilT3AR396WzmFtGP6Q0hjFazfewj5gxNUO5GcWz?=
 =?us-ascii?Q?pO/JSaS2FMR6celNk1FDbH7rCjPL9ajLbSGahRPjI0EfBZq6wPMxPbyKh4V0?=
 =?us-ascii?Q?zCr/Dqf9y/PLtwB5npu/dqbhQ9Q4sJa/cqwHSd4MuCLNm3mUDTFdk5Rn2lqq?=
 =?us-ascii?Q?7giAIQ/1Qch7X++moA2HhRKjFvF4uIn+FBIBHJ9n2WQM1jaxue5ntvowkdA+?=
 =?us-ascii?Q?eQT0LTyfoak3HEiSIKUs3geegYpMAcslfCCc8gTWuUVXIWZS8sYdegze8OJi?=
 =?us-ascii?Q?/eX+V/OBt2CgpxHRMfVuaHuKOePSX+yfNdxXdGuUVw/T3KNQp2fHQlTRoCXO?=
 =?us-ascii?Q?RE/hhBgNF2vGLqBk3h1IWBGFhtqnso3I0kWVPrV1tv20zQJHFaUngsHWTLWP?=
 =?us-ascii?Q?8vrXR4P0MdUX/CHKkkQeUycJcyFESYj/6zao1jChIj5gToeHKLu41HXpQrCs?=
 =?us-ascii?Q?adAHBrzBJlqly+3j+hj52zpT7LFH5bNUcQkyvOnbbvmZ52HmZI//iB4x68sB?=
 =?us-ascii?Q?47ucUZFEalaBlZyHjKPRzuREFu/8aI4bpuXeNCyWlKgUJOLE9hSgUj85R0Z9?=
 =?us-ascii?Q?ALZ1pSRB8hBYcawjR64U33SSIIXqXpHuEcqBGxSZk1fvi20rKYYxhhgBPZaX?=
 =?us-ascii?Q?hj8oV+l59AqWXiSXaKhKYC9F5gq2Wblq/A6PsUKXS9OJyjFOI2SdyndVmsZ5?=
 =?us-ascii?Q?/EDtRYKOpWd/Yqvn9hC8PQKhwlcHybtUcAyJzRlc0DvqWuoc6Yfc4Miwt4QE?=
 =?us-ascii?Q?SpWvF+Dg62f6cSnjmJdNZCIPJvxdaYwtX33jIlooJQz4laHcKrsysMtSKHD3?=
 =?us-ascii?Q?CCvenERx50FvRqEfa+BLqRjoLABxbkxwGJ30ZCI3ucxwV/iqtQE5HKgdYMMF?=
 =?us-ascii?Q?i/WkKdvC6uENKbWNEen7tuNyk3jFzCA2ubr+GqGeuwyV/9GOEDBgMxvOCy53?=
 =?us-ascii?Q?ax+2MWNgtMyx/pgs3Ht5tJbXDW8k+g32XZdZE9dFeHqXEe7Q9OJPLjHqDd1b?=
 =?us-ascii?Q?3E1rRJII8qrhohm8wAJNkf919mT5EQT6nfGn5xAn9/YzMsCJp5BOp+InKftt?=
 =?us-ascii?Q?lXEjM0ZLoAclCOkADcUaf/p6ev0UGEPk2zGWdbNeI1+7nxz2HksZ6tYuXyv+?=
 =?us-ascii?Q?NQ+U9tgGTIT0fE0YCy3I1jczSyI6bW+dVrVcTf45IsRCHdzK981Fa6X7vuQ9?=
 =?us-ascii?Q?b4iVszCknHwhioaWirSvNbMwT7fz9WlR4FQcm3Mg4vkjER5iyxr+9SK2RoOA?=
 =?us-ascii?Q?1ldkUZUbT5zFtZSNEMo+A9PmMPeKnzCtTNy1PS085Aabcw2WmnthdSTmTZrS?=
 =?us-ascii?Q?2wggvrWlM4LI+J5UlMfuJRpL7OmzZwYArCzmnS+FXmHDwCTX+SZK/n2yQxiu?=
 =?us-ascii?Q?SPcu0gUjKJMIdBChtR0MO7U/djpOUBwmN8l9fXrRCnyZ5Z+Dkw59fPF5mDc5?=
 =?us-ascii?Q?3m7CVVdjH6H8IXX9q+QQdCJtWir7KUWAIJ1EJjT6k456ZRDc84r8tG2WyrkH?=
 =?us-ascii?Q?GYq1sqmlSmmSuAIR3gUxzZUG/pmt9XXy7VtG2o7oMsLZr9EeyrOe3pBOoEK4?=
 =?us-ascii?Q?ANCSI9Astews9Rvl1pf2v6w=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: f84fcf8e-e1e4-40f0-d68f-08de1a98a2e1
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 05:20:00.4593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGxZp6yYBwrO3IQHcEIBKztmOcjwHaMM0FXY+JCKVP2YW6Glau3sxcdGfoKixn0J5UUo6zT50YPR+XvIdzFGOnyPVJGkXwEUolVXOKkx91t8+V5KmG3oFWGzUFeuHHyi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4942
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 05:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121265

The logic used is :
- We check if the required tools are present or not
- We used magick to create an raw RGB file
- The created RGB is then converted to PNG using convert
- We re-gerenate RGB from PNG and compare the original and re-generated RGB
- Enabled the ptest in ptest-packagelists-meta-oe.inc as
  suggested by Gyorgy Sarvari and incorporated logging suggestion
- This was done as standard imagemagick test like drawtest requires manual
  internetion to verify the file.
---
 .../include/ptest-packagelists-meta-oe.inc    |   1 +
 .../imagemagick/imagemagick-ptest.sh          | 132 ++++++++++++++++++
 .../imagemagick/imagemagick/run-ptest         |  43 ++++++
 .../imagemagick/imagemagick_7.1.2-5.bb        |  13 +-
 4 files changed, 187 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-support/imagemagick/imagemagick/imagema=
gick-ptest.sh
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/run-pte=
st

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc
index 825747d522..bd6db35c5b 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -16,6 +16,7 @@ PTESTS_FAST_META_OE =3D "\
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
index 0000000000..08595837d6
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/imagemagick-ptest.sh
@@ -0,0 +1,132 @@
+#!/bin/sh
+#
+# ImageMagick ptest:
+# We ceate an BASERGB file for our usage using "magick"
+# We convert this RGB file to BASEPNG
+# Using BASEPNG we recreate RGB named REGENERATEDRGB
+#
+# BASERGB to BASEPNG to REGENERATEDRGB
+# - Then compare  BASERGB with REGENERATEDRGB
+#
+# 0) The convert command is deprecated in IMv7
+#    used "magick" instead of "convert"
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
+for bin in magick cmp wc rm; do
+    if [ -z "$(command -v "$bin" 2>/dev/null)" ]; then
+        echo "[ERROR] Required binary '$bin' not found $PATH"
+        exit 127
+    fi
+done
+
+
+# Generate raw RGB
+magick -size ${WIDTH}x${HEIGHT} gradient:red-blue \
+    -depth 8 -type TrueColor \
+    -alpha off -define png:color-type=3D2 \
+    -strip -set gamma 1.0 \
+    rgb:${BASERGB}
+
+returnvalue=3D$?
+if [ "$returnvalue" -ne 0 ]; then
+    echo "[FAIL] Failed to generate RGB pattern "
+    exit 1
+else
+    echo "[DEBUG] ${BASERGB} generated from gradient"
+fi
+
+
+# Convert raw RGB to PNG
+magick -depth 8 -size ${WIDTH}x${HEIGHT} rgb:${BASERGB} \
+    -type TrueColor -alpha off \
+    -define png:color-type=3D2 -strip -set gamma 1.0 \
+    ${BASEPNG}
+
+returnvalue=3D$?
+if [ $returnvalue -ne 0 ]; then
+    echo "[FAIL] Failed to convert RGB to PNG"
+    rm -f ${BASERGB}
+    exit 1
+else
+    echo "[DEBUG] ${BASEPNG} generated from ${BASERGB}"
+fi
+
+
+
+# Regenerate raw RGB from PNG
+magick ${BASEPNG} \
+    -size ${WIDTH}x${HEIGHT} -depth 8 -type TrueColor \
+    -alpha off -define png:color-type=3D2 \
+    -strip -set gamma 1.0 \
+    rgb:${REGENERATEDRGB}
+
+returnvalue=3D$?
+if [ $returnvalue -ne 0 ]; then
+    echo "[FAIL] Failed to regenerate RGB from PNG"
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
index 8ba14261ae..9da9d7df58 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
@@ -12,11 +12,14 @@ DEPENDS =3D "lcms bzip2 jpeg libpng tiff zlib fftw free=
type libtool"
 BASE_PV =3D "${@d.getVar('PV').split('-')[0]}"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>([0-9][\.|_|-]?)+)"
=20
-SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;pr=
otocol=3Dhttps;tag=3D${PV}"
+SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;pr=
otocol=3Dhttps;tag=3D${PV} \
+           file://run-ptest \
+           file://imagemagick-ptest.sh \
+"
 SRCREV =3D "4a620c2a89a7481e83cb4a0ff32db0ccbb3afcd2"
=20
=20
-inherit autotools pkgconfig update-alternatives
+inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits =3D "64"
=20
 EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=3D.im7 --without-pe=
rl --enable-largefile"
@@ -55,6 +58,12 @@ do_install:append:class-target() {
     fi
 }
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
+    install -m 0755 ${UNPACKDIR}/imagemagick-ptest.sh ${D}${PTEST_PATH}/
+}
+
 FILES:${PN} +=3D "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
                 ${datadir}/ImageMagick-7"
=20
--=20
2.34.1


