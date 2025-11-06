Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4875ECCFA19
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 09:14:46 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10769.1762420479664464892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Nov 2025 01:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=jiavPBu6;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.38, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2anE5riLAh0ujvMyut5eUP+pdpcTws09JfQWvAX3CzMDag+AeejnIs7aK5knIqoCPPt6/nvEc5q2fJaZkxCFr4A2izuSrlDNJ7Mhu7pycVTwRi/yjY0RFHeZas+Z/YJGSsiks3g9TVRFfC9Ovb2LnzH3abLkxSCukhKzx+ZLAteIT9Ttagds8hOBPk41RkKv9ji4BVevyIOFb3Ps6+/yBO9t9F8hy6QEI0+5dZIYfpiEK0Numgq6Z/mqHFztHEuqlXTnEf8VIhEKSCPuehEfb6elh2dgZoCgW4/8lifdwF6+nJK0RPLaOW7tgRX216SKV6ibIIXoYsXp9D4teGwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGtY7Prpt9KOw2dQNOcnaJ+HVQ2oFPorNEp/j0mWdJk=;
 b=pW7SMPzLkb6HlDm8LhXP4h5K3LEDk3lnhRyb4EEXQT0OstrGoiPJogs/+mvaH9qWjAYAm/tXuJ0Fbr2B6Zi3/3eCg6ATD6Eh/zMvJ5QejoAf4CiJNGJzFioIglo7F/SsmlyGG2w9v4wo1oU7EqLBRvqMh0AFUPsq/1sdqdnxfeu1ipmLihf6pWgif00BbMU8r8wLTuCcRx/FuaXAbPb4dhZONywola8c8umqIc3AcZ2lFG80cOnUMRTUXGfWG6SfjKzqxV9qo5LKPTXHXFPwow2FlSNq/ABHGtRtNZPB8I/iFNUNL5XAOle60yUpMb0l4x1ymaug7R65KGkN3C7YGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGtY7Prpt9KOw2dQNOcnaJ+HVQ2oFPorNEp/j0mWdJk=;
 b=jiavPBu6kLbj/kaxlRahuIwM8v88AG73PgSTVr2pPEr+dmiTSN5ge4LeWIDArxjzW4QI9PwsLTOeCr9iI7CWMnDFJg3F4Zg57wtoW0Nq0/JIChA0Ewttzzl/ft796rmE60hmiYSJfVto9KzwY6AyO1WqghuCPEGzO4v2di/bslPGR+lr5NUGlETqbHPYXr/E39VFwG0YW1WPCBsJC7mbRLpCHmRrQozkYbXLNbnbnDDStjDTU6I91QH5Oc7ujXPZsZ7aPnj9d4kOAlYZ3R3r+kE3OOROqlEFP/SidFTdv3PxPeoOk7ohCP+4HtQbdq95wH98DMsIprj+BxY7+uwShg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 PN0P287MB1411.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.10; Thu, 6 Nov 2025 09:14:30 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::6aac:8839:3843:7cd0%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 09:14:30 +0000
From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][master][PATCH v2] imagemagick: adds ptest for imagemagick
Date: Thu,  6 Nov 2025 14:44:10 +0530
Message-ID: <20251106091410.2390576-1-ashishkumar.mishra@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MA5PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::12) To PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:db::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB0358:EE_|PN0P287MB1411:EE_
X-MS-Office365-Filtering-Correlation-Id: f870159a-c7b4-402f-6edb-08de1d14e4ad
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zb08g3ZCkU971BI67lL9s8aZIhjAmke8ulS29CENTKylkOvaFvtCUgCWlVzs?=
 =?us-ascii?Q?fHo06+TC+kRJbgLZHiAPtjmRX+NaRZQ3+WVX9VXiEynn9t0IXltaEu3MsNXA?=
 =?us-ascii?Q?q0JjiSb1VaygAYlIea2w6XKjEpwJ/yDoz0YfTTi0ZXYs1heW+1V3HeTS1h76?=
 =?us-ascii?Q?jhp/wPAacdh27es3ejTjruoTtNXbw/ArJE5+HuFgTIBAf+0Pbnj2IoCrXB05?=
 =?us-ascii?Q?hRb/gSqEGD7cDmn6LkBXFk+O6HHGCbbsU2TFKIy949B8zLMHtQJkj0DSNDLX?=
 =?us-ascii?Q?2kC6EMliitW+GY4nMJP1R8Wb/CFUqYkCOu9v4EjFDSiSlW++tDLoPiaN2QIc?=
 =?us-ascii?Q?ALI+404wi+qolMSjCwTNgRUcKM6YgJ9ryzYwFpM0EPv+avsXv8f12Ru8EVTF?=
 =?us-ascii?Q?61U8MrOMMR9U6XUKoGd0g7w1wk1SabrCUSkoFq/nP5dh2Q+NJrCf7zbEshVR?=
 =?us-ascii?Q?jPC0LQMKHitTZdlgDNzCDyQtZc+co1h07v2yXS9ClnsUh4hCpBfREdJKnZNs?=
 =?us-ascii?Q?C9z+A4tVTuBFCm6HlbQDkxHHB/Nm/NIn3PyLnSqYBWDfYHU8jLux7hK/q1jh?=
 =?us-ascii?Q?EO/e02Cq6gTlODrPD6b8UXZKsIs/lCU8gjxL50PSQ7LC45wFTwwdlJBaBPpG?=
 =?us-ascii?Q?Wh7s+13gOaDEhJIzJzW+TLJbFubzsRWFUKVp2qFJZebjRUY+WdzbwZR3cbtu?=
 =?us-ascii?Q?D/dzpXBb8Bxloy0dYEzpQREVXDXDL+Vb+VM07EkaBxDi+IsyaybYZ+5Jo0qk?=
 =?us-ascii?Q?TJEqZr8o/oVuSkuj5eXG/K/PWVshoXS4Dy161RP781+LUcnKpt9X/LtGzv9K?=
 =?us-ascii?Q?5tUJkU7Q8+gRmXVg0E6HSEAqZQLdmetqcFb1+P94FtwvupuzDR31YlZhrrkk?=
 =?us-ascii?Q?r+gbGtGqdzMugaw0czIBu4dE3UpPlGU8RHu6lH9Z+Vh3zzHXWp7hG+hETirL?=
 =?us-ascii?Q?/BHFtcKOkJ11yGhA1I7xN7ezzWZ2rQYY2GrWGNqOhsoMgPilLi2YmAlvWNCX?=
 =?us-ascii?Q?Yh9strgv4PDRXt0Zz1leapotDTGT8K7sN1yTuGgyDAKS6GOq+z8m0nmMxMaR?=
 =?us-ascii?Q?AuCErp1gk6A7+XZ1ixUQP804jz/jptMbHy7JE+jkZ1QDXNhh8bLF6CP0xJ8q?=
 =?us-ascii?Q?c0X9axJs//huBNHcc77JMmBF0rN1GQ5s6iF2n27jyoCqG4RA4PU4u3EmoDHM?=
 =?us-ascii?Q?JJl03rev/GU7MJx1Bm2OEv3VCgcnp+IrG8ijhjEdDgryv5jYDl25X3wd/DNp?=
 =?us-ascii?Q?YTMzWjFnPocG64TJvULVkCu+O+ZJ92TADtNuijZb7sYUo8t0KymXOUfoPRBi?=
 =?us-ascii?Q?xRnpAnQCt52HYck8YI7fKfPSvBwOSc3JG2e/DLptmVruVK5/nwGS4uOtcsX9?=
 =?us-ascii?Q?ARScEUEKbV6b/b8tDLnrIvt3MlhJDKVvlkxIM1GAnH++zYYD7SCbe94sepCQ?=
 =?us-ascii?Q?EAzNnsSeN+onVO28oqJAMZM7OCB9CRMcOkGO1/VmuxmX1NuoN1Q13k7Xf9Vb?=
 =?us-ascii?Q?WVPRoUxKjUGKAp1Wra804HZgAxpyprcXA1tF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cxXx4chByoMmhaPlxaMHBOOWb67lgM1rRwOaxEjjcjBA2fuZdnuBMkXxp529?=
 =?us-ascii?Q?IcIes/mFYx2uL3SyqIX4o5L/7LqNTzGihe0eHd1eu7BuTVDv1Aop0ZPPzroP?=
 =?us-ascii?Q?14mStZreiEBh6DaIR8oYOUrO6O10hSf0D8mkYLwzx9gwDTD9w33Fm6rJL8W7?=
 =?us-ascii?Q?bKgq5hpMJpHKg4QTfD5aoKpnb0zdwPHJEzJDOJKza83czPrTn7+TljiMyGCp?=
 =?us-ascii?Q?Ci9fak+TWkFuUxb5MZA8bepmYFuq02kj7cvTkHw/GRzRy6s2Rt+IJud0r0vP?=
 =?us-ascii?Q?Js9Ul/fpOyH5n7It+z9xTwQx+kgkuWCwWtEUr9qMnlCgVCfO4Ag4+k6WUCBl?=
 =?us-ascii?Q?+TAkCCFL2aKxbTQbDpjBIjVm33z6VHObpLin4DBLtFp3CHiXmM/DFhqtxxTu?=
 =?us-ascii?Q?yDt7jzexGtZ8qexTFgu5jXqix7sXclfzH5eZdVmVctkfyhXaVQiRn6ogN9gM?=
 =?us-ascii?Q?magQRUStpm2zI59yRcDLphO0ggjQtsI9Db7VMgXjMb2Osy65eWSHADapIlgk?=
 =?us-ascii?Q?xknYType3rmg+MfDpnTzdlZktlolVD3HuZC2GO+eR9zM2nAHFrtaabNcRrWn?=
 =?us-ascii?Q?pqpmsRmc7+VG9tLMhoX6kYQXQN1NSXLU13kWAkfYPmimtOu4yJued8xeDtCg?=
 =?us-ascii?Q?IV6mX8IcTqMmadBOGgyKrOHO359OlQuSKzGj/2s7rK1271p0faHfB3gQP6cc?=
 =?us-ascii?Q?w8mEZHmN2tfJIgTDta4tkqzr2Xd15V46Xuex2Mei5J8fEaLyMFA0nwkZMQj8?=
 =?us-ascii?Q?2qgAdoWqlklIoA56F0bvk8sHSVpjJIgIDGrK5gITzlnpf1U363G0v+bL7Cd7?=
 =?us-ascii?Q?3J/+Tgjf+JQl523Q+pcKcn8kWhD4gMv5E8TMfKfn1l01mg2BEwb6L5i6Ie+7?=
 =?us-ascii?Q?C41lRgoFCEsa3PGxXCmdes7D+eb4sXdC4hbrLj3jm/6UBrE07Ab+HT+p/9b1?=
 =?us-ascii?Q?0+Fq2U7R/F0/BOR81wQu/8cOk4n0NCsedl3xKI5O9qC+/bJxPZqiMykHTUva?=
 =?us-ascii?Q?yjFP/R/yr4rFTyJZriZTYI5MjQNUpfQIj02gG4mS5mhQMFqNKlKXMLDSNq7B?=
 =?us-ascii?Q?7Cj7YUMFby2nfV6+xd4pNUEIe2MNaKnE3XBhz3/D1/5q43mb9P2so7/COuzE?=
 =?us-ascii?Q?AUox6/a4XR8IuKXtiI6JMYY265Oa4FLGolESXVqtfmp9v0+ySJxrxk7n1QE7?=
 =?us-ascii?Q?vfMgIpY/R3UKFdUoqKWz2Aqn1+2K2p9i0FJnoRT8gyOkMjsHF+WRgYsBG8ZA?=
 =?us-ascii?Q?fOL+EzVWXitWTxnfQqHy0aOCaTDnlnPuMD+fEv8QC3Mqp7z0NdcjKAjVL/Y/?=
 =?us-ascii?Q?QEnXQsqfDgUfpZcIZ+i05sNkK1IWZgB67yEELQQHF55GiKX8LBlSR9LCFDkf?=
 =?us-ascii?Q?Tlksw9j3wVNmk25CwYnIZh4/t3eezYk+U0veavUeQmleJhilqvJK6jQ82Dus?=
 =?us-ascii?Q?bdXqOcQldwdaQ7reQv//Pmpb6fwMj59zgqdo84fkFCxryjcEsNTuIEwN5upt?=
 =?us-ascii?Q?UapNb2DovequhQVvNKAwNr6Y5ckmKRxSmn2wlg7poR+Y+9AZqnYGTaEExiRf?=
 =?us-ascii?Q?5CzSd3jpTHlihbnow1JzeT0quNoOIQpmSpuqcwqXdFYTFNram+Sm++2+ZZnd?=
 =?us-ascii?Q?nSz6WbDvVb0Ids0oFwUPWfc=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: f870159a-c7b4-402f-6edb-08de1d14e4ad
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:14:30.7475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HH1fRoKDN9pGB1RV5kf9k2bxn6QgwWFZ+vBS94W5sEcor0dsoyd0bApPoHD5jTMNIXDizibXDB+msVhF8pMvar2en2SwzKOlwsiu3PxiHI6+iMAOGg1g8KQs3Ekug2yg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1411
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 09:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121360

The logic used is :
- We check if the required tools are present or not
- We used magick to create an raw RGB file
- The created RGB is then converted to PNG using convert
- We re-gerenate RGB from PNG and compare the original and re-generated RGB
- Enabled the ptest in ptest-packagelists-meta-oe.inc as
  suggested by Gyorgy Sarvari and incorporated logging suggestion
- This was done as standard imagemagick test like drawtest requires manual
  internetion to verify the file

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 .../include/ptest-packagelists-meta-oe.inc    |   1 +
 .../imagemagick/imagemagick-ptest.sh          | 132 ++++++++++++++++++
 .../imagemagick/imagemagick/run-ptest         |  43 ++++++
 .../imagemagick/imagemagick_7.1.2-8.bb        |  15 +-
 4 files changed, 189 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-support/imagemagick/imagemagick/imagema=
gick-ptest.sh
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/run-pte=
st

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc
index 0a5bbf5fe5..a685510359 100644
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
index f83adb15f2..b445ae8f62 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
@@ -12,11 +12,15 @@ DEPENDS =3D "lcms bzip2 jpeg libpng tiff zlib fftw free=
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
+
 SRCREV =3D "a3b13d143fd7dea44cd71d31aa02f411b597688f"
=20
=20
-inherit autotools pkgconfig update-alternatives
+inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits =3D "64"
=20
 EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=3D.im7 --without-pe=
rl --enable-largefile"
@@ -55,6 +59,13 @@ do_install:append:class-target() {
     fi
 }
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
+    install -m 0755 ${UNPACKDIR}/imagemagick-ptest.sh ${D}${PTEST_PATH}/
+}
+
+
 FILES:${PN} +=3D "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
                 ${datadir}/ImageMagick-7"
=20
--=20
2.34.1


