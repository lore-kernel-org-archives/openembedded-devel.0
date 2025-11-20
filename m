Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C91CF886E
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30427.1763629570098347010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=ojZa43Na;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.43, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKTMOquYLgXPIDHduiqpFdaa1TM4sLC7yx8Ws48CpVtXS4blqk1ucRU7Jj/sQYlmyLLxOm1f+ic6r+aWDJ4scKgZjMcUlhndMmrj4PGe/w9foKLs1JH35sQEBB2urxYdNq+zUBolwTgWRcTvAGVtUt0Z2UV2lK8wr+6urvTK6s/FpEvujf42/6ho88b8P1hgtxamgDcptKvV4EJGQWdlXtZ7PyPEbz3Tm3dA8mPPRFOwutApJXRVYhaAn8p5+lcV5EZ7PmbXubo7nLh8UjZBz0bBZEZlt1PhSC1iedRcXZY/Hn3k4OZnbN4UWJuMadAS9BFZL6pVUkA7VK2q0sffcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG6vqx5fDFyU0Y8Wti6pJsQv+a8NBj9iL87l2LusreM=;
 b=rh2PlidDXw77Z0X8pFiPAPh5qJn79SYf7MriWInQL83ph6M+km9v94seQJTOWEN6u008n3672PiP6scW9rZmtet1ypRrs8MRu7jQU7G233mkFrtizwXyCGNLD6BhFxTCLg6bzTBjvuOOfr8hrCVhavZpmYt33CgrOk+QQLkFJrWxKT2LieZyS27zCL/5w7aOV80xRA+PcRgNz+JVHRRrlGXBHjyW/mv+Nilbqtl4laEKsjknAMKgKxyyAQOXtB6LueQq71vxud0bL9LCDoAIWVlAO9oET4IxjYfjxnXC5N9ks7bI0RNcpq/ocNabSrxktY/gb9i9KP9PgG/9pRNabA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vG6vqx5fDFyU0Y8Wti6pJsQv+a8NBj9iL87l2LusreM=;
 b=ojZa43NaImhJWlkBxhTK4M3AWlJKWbTnSUF+rAYOaTbeeUaPVfvQt+E8FBnZx6qn3AEHj8fZyeufAEsL6ZZ1ewY5/wIrKOfksJFyIxINVgQEzSkerVk9bojnEWgk2xwN9sj5BR//PejXKCqkD0a5n4etT1S8q5JEpcRXaWbVx/KY+2O3aWHWA7AIcLnHl+//pY2bXxj90VtpjPn5qNavVy8Ov3sF4GhXGS2ad7v4uqR+4q4B150wHrduVj6MtzONgwAg5fUa8y+qWBbl+ZnC9v7Q9q7zFORckWQP6vJUyDfzI3BpM1r13ZzuSzCuuYlQlP+VLUgF6OMHZ2XGb6AyPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN2P287MB1004.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:22 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:22 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH 12/12] ImageMagick: Fix CVE-2024-41817
Date: Thu, 20 Nov 2025 14:19:59 +0530
Message-ID: <20251120084959.51761-12-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN2P287MB1004:EE_
X-MS-Office365-Filtering-Correlation-Id: b0109ddb-db09-49ca-ee34-08de2811d717
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|10070799003|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LOujjCVTef4/QtGmQPGMD9n2J8RnH3UNnLIC6XxyHjNIaJdbP12J9mnC5x2B?=
 =?us-ascii?Q?Tg5NKEBz8zrMXNyam9jru7MKA6v8ONd2kDvZMe/5zMcxAm2Q6iN3zN86cp03?=
 =?us-ascii?Q?NQcz6Odg9S9aolesfWTkMANToyRz5+cOHKi892Bbt17p4XH9U7/qQENHmv4i?=
 =?us-ascii?Q?qTh7Yq2jUBDB39NPVUfiF91ZRXU+esjc8qmqDpnGLDH8VzCHh/ONL+7YAKu1?=
 =?us-ascii?Q?fvVb9M0O2zYnht5H71TRkvNiZbBepO5xoda/4jCjqcyMt4hOXBsFsVJMr6BY?=
 =?us-ascii?Q?4puh18KZjsqM2phn+0dyRNCXQrN4NlyBsf+UVJVX1NGcTJZiBM1VRnw8gZYm?=
 =?us-ascii?Q?sDygrpikLzI2tsh/5emL7tbtTyOdq4H9Q6m2FJ7u8HMz72fhwj7TKc9yyTcv?=
 =?us-ascii?Q?1xaYHN5xO6bGSBEu7XQKQmCzfEaR0Y9HjrpWBMYm8oYYOMO7x3goTfovQwgN?=
 =?us-ascii?Q?8mUFH2y1S26Tu+4d0ftb7O0T/ilV9rmLJ4a6ftorAO08UvtWVyh4HNRAIaBY?=
 =?us-ascii?Q?37fXEGPUXb2bGPtm2OyMoTOcMxzRH4qZx8/9rpIikHWNofTapjlris5UWpHM?=
 =?us-ascii?Q?cCrhHBEvnS1OyCrKS5SnEwB21/F6tiGJjiYsxueMynlOf7v8nrkOAZSltvP1?=
 =?us-ascii?Q?OQ6mhEJDtv0P4y8j2do8TzzhrrnmmoTeVSS7lkGxhtqeVk3bVjK1enCaagB+?=
 =?us-ascii?Q?PVFuUiCmStb6buJraJzRT46D4GjYsskZJIJ3X3lwVGbVk+BgUzH1MFgwNU9K?=
 =?us-ascii?Q?/2glkW4IM5r6NMLw0gLAoVYg84DQpoi4Nebu/wH4p0pDFtQpcq7ddRdMLOX7?=
 =?us-ascii?Q?FdEELXm2c67IZmxzkUaOCOmUZjLS2qtyXKl5kU5jKNIAURy9Py57OGbFFzVp?=
 =?us-ascii?Q?6jRkTvAOV4azu6ByxN6HyZaEnqCuLhrMiw4phzMlhYa8YvrZnRih0Cm+AZKA?=
 =?us-ascii?Q?scXIU9QrNC8cLLnPPZ4pqAM8Mg0WHs2xch2K7mescblD6nka9GiOAb+lVL9s?=
 =?us-ascii?Q?5zhrZehJJVBFYm7shKlp0+gDkkPVdxw1WHcIIHEsN4UhXINyjp7xiHP7PfVM?=
 =?us-ascii?Q?z24OWJ8ypnsFpRJtYVMOaLMmli9zdze2w+RBLsBoYHPR1chMbZbKgrJhPWrQ?=
 =?us-ascii?Q?zX/K6IWvsX0z0PDpodxAf8QRx9GNcJnNQT0VzvGsd7oV9Ojx6wavcZYOv3HJ?=
 =?us-ascii?Q?wDMATQFgUJD9ADeosGG+34eOHokDhXpP2koR9V9+vY5iJ5so2DZLOW2+M3uc?=
 =?us-ascii?Q?U3lx3cw3+3eZpi9d+oZ5JoA2OoHqKZ2aOhvRppPuyxW0hH8p3Ozb0Y9G+qhr?=
 =?us-ascii?Q?PxYDmjXt16AF6RGDDTqNxNHEPWyN1CKHoX14r3X8+T23O0bRlR5agBy8duSh?=
 =?us-ascii?Q?px76SkBPQ8oH6qkr4DL6Qs0VPJyEcwr7BwChzDcsSeFpoytAtg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(10070799003)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0IVBb373TY220jA0a0s5THSBTzt1Kmb2xVnjDu3G2yhHR7DjEn/fI5V1+3gF?=
 =?us-ascii?Q?FDl7sx4DSiKwcs+5Nxiqi0O769J2i1Z3+eUFWqL2S6V+p+3nl0adRkQJ2iIX?=
 =?us-ascii?Q?aBB1iZT82Wse4bt2DgkpctrKSv8yOB69SxIXdvBkkzt0a8XoZl4LjpkHFIz/?=
 =?us-ascii?Q?ITmpsA4hr811/XTRCRZGMpbfTQyVsQ+FplE9+3yfB2+iChr0kJm0KsT1hUK0?=
 =?us-ascii?Q?lPAlFH/xQs2s9YXiu1qBiX1EGh2abnX/bkeFI7/Rq1BbtKUttDNObaG3mxEb?=
 =?us-ascii?Q?6w7+O3nvEmBiZY6eOXy4ljzJuthOGIPBIvrUHI76Fwlr7mlKkd3glw+xZyo8?=
 =?us-ascii?Q?2y5oeaCnzX0pa188shhS3t9eI+6BipzqveUDtYuIC3w+ibLOKtZrPF9B+D48?=
 =?us-ascii?Q?t/ZW++hJaMX7puQy/7bgyNN/ZCY5SwyAfqsBpBAkPMrxD+mMI4gVrn1t5Bo+?=
 =?us-ascii?Q?PBF+QCT3tHdFIeJ5BkLj4QWr7c56AvDu7kuSmNlua2Za7eHW+t1qcz4Tf+gh?=
 =?us-ascii?Q?eDAFVYG10b6WNftPz4j4J/4GRJ017rZclYnmA9KYc6DhwclkUZznqylG+vct?=
 =?us-ascii?Q?rm5L1jEON6n92A1lPKuVGFT8ftT6t4CH3WwvdlrTb9+4NwlvUCRa0uTbckQG?=
 =?us-ascii?Q?ewFadEePXZknGmovdWWSH9++giBMMFyJuVmCJEEAUpN9K+B9QXghieHfU7vj?=
 =?us-ascii?Q?OGT8qF7e4ATgNFPG6jFDc6GHt0SKlyG2uPVT0pdKRP1L8Xgg1BlcavJ46JOC?=
 =?us-ascii?Q?OF3FszwhgiI1L6t220tycc9ZxxYu8uslsTIYiW++jsVgZs6c7oSk9abAasqZ?=
 =?us-ascii?Q?IxftEV9AFSOpoQkQT0gKFqRqjN0P45i+4wHtNvhNgOdJ52r+kwQC32jW1HFe?=
 =?us-ascii?Q?RQL0UKXfIc3JsAiUVnatralCXFVvhy9Vog+ZvkP6DXAaY8K2OyKSd1ROTb8X?=
 =?us-ascii?Q?o/EFK59Y+frygEyEhiC5JcIeqoDO/f8QU0ELuBlmmkr36MnwybAdGMlcgi68?=
 =?us-ascii?Q?ETKIRzI2asykESpzHGBKcNKuhNmNJExwZmeecEQeqBp3+wcKUuzr5kI2fXcs?=
 =?us-ascii?Q?3uW7q4HbiJkQRN4xU8sLnRZyJaWp2ab2wGvac+q5+QWE+yrxySNM8bFizZTl?=
 =?us-ascii?Q?cpQXHXaH62vAk8iNgAtdiEWzvNCHdM/toCs97abn8SXDgmcdggNWPsTtZCer?=
 =?us-ascii?Q?q0657sd0/HGeiOQqcUV0Q+xMRIihgdz7oJXehqywjjYVbb75n5rPvD73/Awb?=
 =?us-ascii?Q?3R4RbCFLAKoaeSFyL2PTldcpZgHzGojuFGTit+2pX2RONVPgiXlzp7+Wm8B3?=
 =?us-ascii?Q?XfsVv2Sg048HadJLgOU1aHCwPEE58n/kiClg8SzzRbz+cObkAqHBvoAXl4i8?=
 =?us-ascii?Q?/lc9iPPhssAc8UCteULRAufTfJu16bNSrZ7rLdtZu+WEm451LRGbiuRa8XJ2?=
 =?us-ascii?Q?cr+V7Zh9ULO3NNSBESr7Nq9zyRSoYUztqXbx3vLamaHiGB+fmUWaUxJwSP2v?=
 =?us-ascii?Q?2VVNF5aQzpnXjZKsAncNLMOxjuqSn0J8X9sUHNsNbhsiT6SWTijrtRr/H2+R?=
 =?us-ascii?Q?VDjOvQkl0SvHWy8p7pc1PsUQES2qDxJb0jX5YfPpKkG2Ap4SjH+00LH7jMdR?=
 =?us-ascii?Q?tAW8hmViqZn2SDWXgGjKbzpFFWZQsTAyDUsniFRTsRfpp1wg/+HMdcxmAIif?=
 =?us-ascii?Q?0Cj2uikbStw7+9ofXUHeye9HuuI=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: b0109ddb-db09-49ca-ee34-08de2811d717
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:22.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P60twOnzglO0kkC2aZANN/jN0g3QvZaItjkjsNLWy5ISL++azBax/YW0vl888fklbGxtiL8HD3qgnyU+92KBrjOF8JjhrcADen/BOLC4QAJRLZS7f83GveO4KQOFB+Hi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1004
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121946

Backport the fix for CVE-2024-41817

Add below patch to fix
0012-ImageMagick-Fix-CVE-2024-41817.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0012-ImageMagick-Fix-CVE-2024-41817.patch | 44 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0012-ImageMag=
ick-Fix-CVE-2024-41817.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0012-ImageMagick-Fix=
-CVE-2024-41817.patch b/meta-oe/recipes-support/imagemagick/files/0012-Imag=
eMagick-Fix-CVE-2024-41817.patch
new file mode 100644
index 0000000000..1a7f2aa72d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0012-ImageMagick-Fix-CVE-20=
24-41817.patch
@@ -0,0 +1,44 @@
+From 80612989115844741371c10deda249d592c0b801 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Fri, 7 Nov 2025 09:45:43 +0530
+Subject: [PATCH 8/8] ImageMagick: Fix CVE-2024-41817
+
+CVE: CVE-2024-41817
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/6526a2b28510ead6a3e14de711bb991ad9abff38]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ AppRun | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/AppRun b/AppRun
+index 4c597fa99..cd2787fe3 100644
+--- a/AppRun
++++ b/AppRun
+@@ -7,16 +7,16 @@
+=20
+ HERE=3D"$(dirname "$(readlink -f "${0}")")"
+=20
+-export MAGICK_HOME=3D"$HERE/usr:$MAGICK_HOME" # https://imagemagick.org/Q=
uickStart.txt
+-export MAGICK_CONFIGURE_PATH=3D$(readlink -f "$HERE/usr/lib/ImageMagick-7=
.0.9/config-Q16"):$(readlink -f "$HERE/usr/lib/ImageMagick-7.0.9/config-Q16=
HDRI"):$(readlink -f "$HERE/usr/share/ImageMagick-7"):$(readlink -f "$HERE/=
usr/etc/ImageMagick-7"):$MAGICK_CONFIGURE_PATH #Wildcards don't work
++export MAGICK_HOME=3D"$HERE/usr$MAGICK_HOME" # https://imagemagick.org/Qu=
ickStart.txt
++export MAGICK_CONFIGURE_PATH=3D$(readlink -f "$HERE/usr/lib/ImageMagick-7=
.0.9/config-Q16"):$(readlink -f "$HERE/usr/lib/ImageMagick-7.0.9/config-Q16=
HDRI"):$(readlink -f "$HERE/usr/share/ImageMagick-7"):$(readlink -f "$HERE/=
usr/etc/ImageMagick-7")$MAGICK_CONFIGURE_PATH #Wildcards don't work
+=20
+ export LD_LIBRARY_PATH=3D$(readlink -f "$HERE/usr/lib"):$LD_LIBRARY_PATH
+ export LD_LIBRARY_PATH=3D${HERE}/usr/lib/ImageMagick-7.0.9/modules-Q16HDR=
I/coders:$LD_LIBRARY_PATH
+=20
+ if [ "$1" =3D=3D "man" ] ; then
+-  export MANPATH=3D"$HERE/usr/share/man:$MANPATH" ; exec "$@" ; exit $?
++  export MANPATH=3D"$HERE/usr/share/man$MANPATH" ; exec "$@" ; exit $?
+ elif [ "$1" =3D=3D "info" ] ; then
+-  export INFOPATH=3D"$HERE/usr/share/info:$INFOPATH" ; exec "$@" ; exit $=
?
++  export INFOPATH=3D"$HERE/usr/share/info$INFOPATH" ; exec "$@" ; exit $?
+ fi
+=20
+ if [ ! -z $APPIMAGE ] ; then
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index d929a220f1..1b4ab344c2 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -39,6 +39,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0011-ImageMagick-Add-support-patch-4-to-fix-CVE-2025-5529.patch=
 \
     file://0011-ImageMagick-Fix-1-CVE-2025-55298.patch \
     file://0011-ImageMagick-Fix-2-CVE-2025-55298.patch \
+    file://0012-ImageMagick-Fix-CVE-2024-41817.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


