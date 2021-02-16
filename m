Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.43])
 by mx.groups.io with SMTP id smtpd.web08.9196.1613489058622637631
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 07:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=tliJlrpg;
 spf=pass (domain: kpit.com, ip: 40.107.138.43, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5hoRZtB3NCRr9N0ROZyeDzn/tU0KZy8JB9PeKpyIbJVh1n0UGkq+Lb1KRbn4N3PvnmJR7IA7WiSBF4TCV4w5IUQ7u0AkN37BphRCAkOYuYGWcHIH1g4F9KgZMnGXc4NXE6DAMgbQSWj+zlye8n/khAsSuaSGontJfpwnzfv6wRTq3qWY57U4Dw/jC1OoVyFc4BqmD2wUyplyt9N9DYJvyQqHQKUZDOVp/grMabDnzPYPEHJUKoQF5K1Yv8BTIGHAeytp1k7ONRRe5zZIZoF3SZAo7e997vJWZKVPRIktCa7nfuTVhgJbGRu1j08HnS0x3Y+3vlv+/sl2zwJoDIT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTLCmdDAJFkmRwztIkfg82fGHPEtmSbrwsG3KfbO9cc=;
 b=Z/n5DkDG+y4gZMxQdusnhEGvvvm8Ytr2IO8NZQ/cD2PcH24PHQRhOQyGW9yb7QmdNMzLTxBtxIQ31jkjOSpX8IlRnSnl9NLzXd3oWJCtLNGNwe05lkZ/k8j2Ir5r4/hQ5SyS2g3vNtps1h5the/XGsp8ijeEll2UMWDCtaU3fNIoCkLA0K9KQ0lhuN13Q//YhQTS9N31vKkeQe9M4x5+QbqIcqwDCHUQWDiILpBR6o0UeppmOvDeKtb7eIb+EoHLhwUO+2h4+k136Mj7fNThenC0A8ehcX7x2A89N4T6jIuc/aiRFO3QG4C3bYfmsSDy2kGGNybXhNTqChf6Y5hXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTLCmdDAJFkmRwztIkfg82fGHPEtmSbrwsG3KfbO9cc=;
 b=tliJlrpgUfKWkk6cRnPE64h/0xb9HFwJ8z+H8YOF2BkWP009wS6tqUcKWK0jpJT9uRNrBWe4ebpODlck8yVcHF4N8fnp36i38+qHzvfmXcKj4fwxZTwzTrcj0Dlg5F/ITWPz6XSUppkmt+fIKhxRqWRKFOUCYd9mcsjwURes6vc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BMXPR01MB4085.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:64::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36; Tue, 16 Feb
 2021 15:24:07 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7%7]) with mapi id 15.20.3846.039; Tue, 16 Feb 2021
 15:24:06 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
Date: Tue, 16 Feb 2021 20:53:49 +0530
Message-Id: <20210216152349.30824-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [182.70.89.188]
X-ClientProxiedBy: BMXPR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::13) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.70.89.188) by BMXPR01CA0073.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Tue, 16 Feb 2021 15:24:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 66cdb946-ab2d-4eac-d521-08d8d28ee5b9
X-MS-TrafficTypeDiagnostic: BMXPR01MB4085:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB40855D768C60947861AC7CC5F2879@BMXPR01MB4085.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6JImQcY24Wtdl7PkKBqZN1uN8dlVAp/+Wt9Q+3rbDI0WwTmup1wP204lFaxCWIY8ol8MALNRrfuVI1trlB9R03S7UzxjB0xwx5BhBBI/z6Q1mn5gzfMzRhfMvml4gFnCq7+tIcq+80DmDnm0LD8J53naAXpbPCXFGSFVJKxqG1W0/w+F1dkP3DYwZwmaHi4t55Tqxrdv84lEeSC6ZKEFgvTXJ2nX1A3Ws1KAIf0aGR3qvzIIKChfQfTAa5EuwJ6nRu6DB8BYfynUwlu3zuYfM0sI3X3DWvQFNlcny/EYmYfPY/v2dVAmybl7XgFhfEDll1xyVLiz1NVm8rJ5AWOaBV6LQiZySc9bvcfH9+p7HxfL2iJ52zr/k4Ka4GqXHfXnwsKh4qVGaYPf4XUg0ybPEpNpRyJD75Ns6yR+uraOWucjb8H/CoB3PfS806eP8KJy8aqZ2kZtovnkc9GEPNi15WmYPq6OBcOlRTmazzPCWbjTtVv4vrzlLG1X6V3KJKbd9hDPOoht3Fz3D2H3gDnMPDNF46O/cxsk+xBCe5Go5ls8dxaEPhgxILSU3oODngoZi4XZrI5lJ59LwoZn8rwtEjW/0wophFKcg2Qj3wiy5VpkkTvz0u7hCNG9wNYLYxr0afMqaMokEwFcu9/gJek/4g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(6506007)(2616005)(966005)(16526019)(66946007)(478600001)(186003)(956004)(2906002)(6486002)(52116002)(66574015)(6512007)(8676002)(36756003)(83380400001)(66556008)(26005)(66476007)(8936002)(107886003)(1076003)(86362001)(4326008)(6666004)(316002)(5660300002)(120606002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?V3iv1tJM2NYH2qsX4JX7skulOQ9+Gijz3IHIdW65b/ehmdNmd7zpWvUrOohR?=
 =?us-ascii?Q?ic5C42ULcb8fOLTAbLPoByr2Ql3nU9fIbWd8gPYyAE3v2o6j3AooujIxYkoi?=
 =?us-ascii?Q?almIe0N7y5Rz6pbJUfxq3P/9lgDD/BAXMNScobyUZ6cDFgaCZ5q/j+jCg5lf?=
 =?us-ascii?Q?pPXCiiUBqQCYKHS8cXtKKAWKTjYZdYwARKkstPyzZSPDh8iq4o9Kbw6AyG16?=
 =?us-ascii?Q?3MCX7MCxJ+TMU9+oRFHdjRJK9pzKB+whtcT2caNeuPdzG1mO5e6f7QKCDh7+?=
 =?us-ascii?Q?GE2NJaxA8jFiZZYcJVMGHukx6U2+WdiOdkzeh6ou0OB0PEUd8kjKj+RNp+AI?=
 =?us-ascii?Q?VUCk6BWsXJNPZ3N/xc3h/HQu9nYv5o9DSl7JsP6wd65hpS/9Uln1RxFC9xmZ?=
 =?us-ascii?Q?mAVkWAM9uhtkvqLp3qdUhcETzxj3fS/kAC5i4cNIZlIoGfeg/GQhiNIqkAXC?=
 =?us-ascii?Q?EpX6bnE/tZwmpguWykNxx1bE/DGSmRJxyodCp4DuykFfXHtJsLfBAUFz6mxT?=
 =?us-ascii?Q?P9Ogipd+gQGuHwSLnfgDAefIPDC13SLNl89u6MHZr20hl4+DUWV/udlq+r0D?=
 =?us-ascii?Q?Hquna5l0ILLxfQes2f83CEBsMFafWFPpCwo3KlE9+BA3bAEeu2Rcnpc9W7Fi?=
 =?us-ascii?Q?MoPNNsrD5W+XuZIq9rkm9pgES+MO554n1yVdTC+ZQKbVzjaE1GhQVwyZ2Jew?=
 =?us-ascii?Q?4tWVe1Bd+SNjzyIzdO29qmVDrJmMXFt6aKW2/ybNnBnS/1AB3KDDwuJTjHkY?=
 =?us-ascii?Q?5SbX/PexrFaCb6BZ3S4Mmt9np5Nc30nE5r3T/qaQUNevnHPGcIDPd13p1jzX?=
 =?us-ascii?Q?Ik7M7jlLfReodjP/745c6gbzmhJcecmTpmpqOY9PAnwzJqit5ftd5r8kCr5z?=
 =?us-ascii?Q?cSyihEvMDIEZbRx7qUZZRQQaWs6Rp1rf+KF8ADuB7KWnSI7qF9v72qzBReRE?=
 =?us-ascii?Q?K7DjZuBMa/TtIH+eDAe+2YH9r17IN///tWIbCg/ksnZ/ucr5yhIvgdZhEW8z?=
 =?us-ascii?Q?FwKyTQQ/baHSQpre84InatAZS5nz4taTaLIsqMwl9RfBGfL+wOaxPFIeGER2?=
 =?us-ascii?Q?aVoBUYMyWrg3KhsnE8nzdvv/gdS/Ur+4Ku1VwHlPCFxcK6dLhzIo8UbIzbX8?=
 =?us-ascii?Q?szCI///lKWERh7UoCeLyysMO6qsjRjrwjsgBSlCvdV5/nxAirHnZWQeqPtlK?=
 =?us-ascii?Q?2GFhHW1OfY7fSlvzgq3RMK0+1q9U5SRMC70P8c/ThLYoo6DeGFiQ5quVIeLE?=
 =?us-ascii?Q?Spu1UjPBPiXXus7HJR+9z5KvuUpzSUiETDQiwUmhujOw8c1mZzktX4RYh3yg?=
 =?us-ascii?Q?ylH6XF2sFITPQZyJmNtTP1Ov?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cdb946-ab2d-4eac-d521-08d8d28ee5b9
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 15:24:05.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpRDna4SZNWzgyFXsaBRX0Ambf8F+4/rrK4cMIjPF8gwJownrDQ2erow08joCyTLLVOUSiIJX8RCdTtGEssH5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB4085
Content-Type: text/plain; charset=8bit
Content-Transfer-Encoding: quoted-printable

For python and python-native added patch to fix
CVE-2019-9674

Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
---
 recipes-devtools/python/python.inc            |  1 +
 .../python/python/CVE-2019-9674.patch         | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 recipes-devtools/python/python/CVE-2019-9674.patch

diff --git a/recipes-devtools/python/python.inc b/recipes-devtools/python/p=
ython.inc
index a4ba0c5..787f23e 100644
--- a/recipes-devtools/python/python.inc
+++ b/recipes-devtools/python/python.inc
@@ -8,6 +8,7 @@ INC_PR =3D "r1"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D203a6dbc802ee896020a47161e75964=
2"

 SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+           file://CVE-2019-9674.patch \
            "

 SRC_URI[sha256sum] =3D "b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808e=
d4594812edef43"
diff --git a/recipes-devtools/python/python/CVE-2019-9674.patch b/recipes-d=
evtools/python/python/CVE-2019-9674.patch
new file mode 100644
index 0000000..647d9da
--- /dev/null
+++ b/recipes-devtools/python/python/CVE-2019-9674.patch
@@ -0,0 +1,83 @@
+From 3ba51d587f6897a45301ce9126300c14fcd4eba2 Mon Sep 17 00:00:00 2001
+From: JunWei Song <sungboss2004@gmail.com>
+Date: Wed, 11 Sep 2019 23:04:12 +0800
+Subject: [PATCH] bpo-36260: Add pitfalls to zipfile module documentation
+ (#13378)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* bpo-36260: Add pitfalls to zipfile module documentation
+
+We saw vulnerability warning description (including zip bomb) in Doc/libra=
ry/xml.rst file.
+This gave us the idea of documentation improvement.
+
+So, we moved a little bit forward :P
+And the doc patch can be found (pr).
+
+* fix trailing whitespace
+
+* =F0=9F=93=9C=F0=9F=A4=96 Added by blurb_it.
+
+* Reformat text for consistency.
+
+Upstream-Status: Backport[http://archive.ubuntu.com/ubuntu/pool/main/p/pyt=
hon3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz]
+CVE: CVE-2019-9674
+Link: http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5=
.2-2ubuntu0~16.04.12.debian.tar.xz
+Comment: From the original patch skipped changes for file
+Misc/NEWS.d/next/Documentation/2019-06-04-09-29-00.bpo-36260.WrGuc-.rst
+as this file is not present in our source code.
+---
+ Doc/library/zipfile.rst                       | 41 +++++++++++++++++++
+ 1 files changed, 41 insertions(+)
+
+diff --git a/Doc/library/zipfile.rst b/Doc/library/zipfile.rst
+index b421ea5..2e0a91d 100644
+--- a/Doc/library/zipfile.rst
++++ b/Doc/library/zipfile.rst
+@@ -574,4 +574,45 @@ Instances have the following attributes:
+
+    Size of the uncompressed file.
+
++Decompression pitfalls
++----------------------
++
++The extraction in zipfile module might fail due to some pitfalls listed b=
elow.
++
++From file itself
++~~~~~~~~~~~~~~~~
++
++Decompression may fail due to incorrect password / CRC checksum / ZIP for=
mat or
++unsupported compression method / decryption.
++
++File System limitations
++~~~~~~~~~~~~~~~~~~~~~~~
++
++Exceeding limitations on different file systems can cause decompression f=
ailed.
++Such as allowable characters in the directory entries, length of the file=
 name,
++length of the pathname, size of a single file, and number of files, etc.
++
++Resources limitations
++~~~~~~~~~~~~~~~~~~~~~
++
++The lack of memory or disk volume would lead to decompression
++failed. For example, decompression bombs (aka `ZIP bomb`_)
++apply to zipfile library that can cause disk volume exhaustion.
++
++Interruption
++~~~~~~~~~~~~
++
++Interruption during the decompression, such as pressing control-C or kill=
ing the
++decompression process may result in incomplete decompression of the archi=
ve.
++
++Default behaviors of extraction
++~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++Not knowing the default extraction behaviors
++can cause unexpected decompression results.
++For example, when extracting the same archive twice,
++it overwrites files without asking.
++
++
++.. _ZIP bomb: https://en.wikipedia.org/wiki/Zip_bomb
+ .. _PKZIP Application Note: https://pkware.cachefly.net/webdocs/casestudi=
es/APPNOTE.TXT
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
