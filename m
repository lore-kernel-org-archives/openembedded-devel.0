Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65433C46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 16:59:42 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.87])
 by mx.groups.io with SMTP id smtpd.web10.105696.1703696370983000447
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 08:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=rQiSN80M;
 spf=pass (domain: navimatix.de, ip: 40.107.241.87, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDNv4bPLGOc8WVP13CYrS0aLeVVxjL0vWJESkpjBL+L+FerYwa/GPn33srn50uSbiTpUTSeoSSY47tIfAJfmRRX4CKtPJgtHhEBwxdcOAZKAUo3MrxSa7U4MFogvP5g9WuQUbhfgi+0vxG4XCu9J8dfSCGtKIADMTRMm0hC23uCXSHRh25NrhcXewuKAB5/AxKMCXwdcgGKPz6pHTueprL+LfhO6xrGmkWlNhL1bSTNhP1x2nnwPx0XTj/wzF5Q9F1uQDosLLr2Z4NzM01XKvwekG/3OJOfT4VKJjoAvTIzUCsGRr5NbokJAlOD+RdLfW6kkMibAobaFyX26WeMX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uu6b7Dbo3JrnYkg753HAs2k/chvYyikK3VgkEVKa2uI=;
 b=EwVMhdkzcYESYfPKaURltDAk10yfDshR4mw4xeSsRtWndAuYKE0Epabl1QThz8oNNpt5AY8AQVLNJNGdUU3fM6WDmEtjNUMBftTJzKU3tFusXvAuJxV8FT1IskxcL53A5kc/2NPURjikpiXAyy2VJ0elrn5rBAxkXWT6ejNIPfp7fmZgWMDODWShBmho+ZZ+qal7sjvIwMR2BmF4jfkVR11UqLcUzQIaND0zTQi+abmJCuqd5PKveqwgo0q6YUu/5ogpehAsLmdWbLvRhAG1pwzqT2j0iRqlaGwxumbey+2CtgSj6qITtyr2d6QIX2i5qEsOJirFwZKkJ0a9L5Yv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu6b7Dbo3JrnYkg753HAs2k/chvYyikK3VgkEVKa2uI=;
 b=rQiSN80M5k+ovF/8hbZF+oNFqWqHDp99467iavISv9WDtKuR/SK9QmcNy4r9UV4IyF67vuDxT1k8Mqi3xhL78C97SOtK++R/RD5fhf9CjyvH+XlP06HqiHW11QxE3lKYIErPRvqO149MF8Ca7IjXgHvVUmYsL0M766O9xLnUAb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22) by AS1PR01MB10104.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:47b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 16:59:27 +0000
Received: from DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f]) by DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 ([fe80::ccd0:21d8:8742:ee1f%4]) with mapi id 15.20.7135.019; Wed, 27 Dec 2023
 16:59:26 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-oe][PATCH] i2cdev: New recipe with i2c tools
Date: Wed, 27 Dec 2023 17:58:35 +0100
Message-ID: <46cae1fba005a8ec9bbd21ac6a50500dfa1dfb79.1703696315.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::19) To DU2PR01MB8592.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2f7::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8592:EE_|AS1PR01MB10104:EE_
X-MS-Office365-Filtering-Correlation-Id: 346751ac-12b4-4a2d-42ac-08dc06fd2f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xZFKxq7pNF6WMAjNkgrA03aiqqDwHlw/PHI7GftpC2pL3ROk1sR8NZvVH8ycF/ALXJNSN0Zt7qOjEnLGL3VVUk3ealsXAq854FuTyYR2ww+0fvOH/UKywiJHXtLGLAZZxSDs4SWVg+l8vD3Sxx4PKMRHXe8dMlGUtybOPbKwdPtoxNN6VFcPi/X/T+JUKJ2DhoA4EK+UNnx/j0eypWRC/CjSGAHVSZ+AeZ8VJNUnvo12y0pUpts51bOJvqvm8130ypOlCki+uoNQsefaVXpC4D3+izabO0UQrAL7tT2klzr/Hd80cpUPppRm1GwyU8eIrc/a5CvWqjVCspEtjn+uBOrqkpiqb+s7zdMaTGtDTdQZX1LBPRjZY0mIXBIj6g9Lao7oLANFEomwR97BdOlUmV73Ev4YguBMOtHfdnP3hv5VFfnPzge11MJwowja2LH+3b9ezQXi4AoOum7s58SETy/vmM6jovRsQjWFKsbPMxXRC1fOFrR3P9v1LFYZ9Cx3K7uGffJzZ9tPD99sFTxGufEFJOWqUBSanR8f6PaA/dCJMnOKXwNfk8k42dwV5snOaf0NCQN5SuWWCFa+sK6vHGW8quAG2Zl1/BpIzqPPSwA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8592.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(366004)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(36756003)(52116002)(6916009)(6666004)(6512007)(6506007)(66946007)(66556008)(66476007)(6486002)(38350700005)(86362001)(9686003)(26005)(316002)(107886003)(38100700002)(83380400001)(2616005)(66574015)(41300700001)(5660300002)(2906002)(8936002)(478600001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wnQ+xxqx1CGjy18+m5jQRFayv98sP4zdzFcyNPKX8ZUCUtZWrdbBeYjTSnny?=
 =?us-ascii?Q?gnW5Gko7NPzDEtbuj/8uZGittTqXZADfOHARStm8KGVe2Dn/G/T4xFXW0dh8?=
 =?us-ascii?Q?wCIGGjCkoFiPDgOw138a6v4s96adQwVdyxxlKvu7FezZDYz0QNBcD0f42NMh?=
 =?us-ascii?Q?16bk+IGSiqYzz8jN1GBvb915eE9CzEQSJkzGzdoGzdPIZA7+zipVKv1he8KL?=
 =?us-ascii?Q?KRZ+zqQ7wVCZuBa0OWF00C/Pg9FQ07tVPNxcsnUmONPYaxJPs/6jr8OJIjVA?=
 =?us-ascii?Q?BGABREbltsAeyq3cVT9W2i8j51+wlL6izG94ggiIisIWpIU/xue7FySGv2xT?=
 =?us-ascii?Q?yr8ukI6sgrbDv6YIKT8LGFxAnSi5daT07RnzOHg/OCwKEZ3AXo2nHc8XxGd6?=
 =?us-ascii?Q?Yk8xdjM5MZBGnJ+Dgi7EquJx2oCb6zRfbuhs11FRCy4upCgEE2oCP7nj9CU7?=
 =?us-ascii?Q?WzHb9/BRe/XwwoHCEvPJ+5gXfPEll7J2ofwjnepPJsTHuhsGbcX4nZilFJBc?=
 =?us-ascii?Q?/9mar0gk8lxWhrgL3QVRcvEWt4bkOEIbrNaK5cHesIHryTlQOxNK1gKGiRAl?=
 =?us-ascii?Q?G/CUKUcvWY8h5fMY0lzvQCTLhzmMVdT3jj9wBfGXrsEz44ewrHeeIhS/vk7k?=
 =?us-ascii?Q?zmnauW+nU+vYj+Sw8T8sBmuICkU2gQTRKK2yuTufxAnd+KpCq3VaxpoPOYwn?=
 =?us-ascii?Q?B4AYP4uazr00wXpygxEQzxIiIY8Fk7iPHspqomrvhJcwi40MD97RyQvAyfcl?=
 =?us-ascii?Q?qmdf0xtVTnbufMTc6umF77qn6diyo5qfBzlQAn3f6wDRW5kuF5J3YB8WTgUb?=
 =?us-ascii?Q?t/jOow1ryymLhz7TqPF+3sYwI4O9oWe0F6CwTvsiXDwi44hD1m9cNym/qGbA?=
 =?us-ascii?Q?YOyP3ribQHTL71/ep6HoTSHJz+wY/SzGAwyCoJIOW69VZPw133zjWgCjutQh?=
 =?us-ascii?Q?e8w97wG7jHkGWiekugXQHTH4rxcsV9tWtQNvXa9Wp0Uu/TZFBXcTkgzjnE3+?=
 =?us-ascii?Q?QzF6Xs12Mu88PkZMOfZmlLhDJVQo57gXuKRJXRWiKfyffptrlc64O6udr2OY?=
 =?us-ascii?Q?SugYKNkZYnBnwtjNwK7y4wX/RLJdHim6pMU+++4tBdsNafXjMc3Y9yefknEH?=
 =?us-ascii?Q?rpbJZFHyhUa5a3+x2sQPddo11/wzVWRqd3Ow3ac+JdAK2b5ssH8zP0SWIXtV?=
 =?us-ascii?Q?WsRygQB1m407u4nRfeOKbOgVPkg6FClYj1xdIf8H31gZ9ftiYFE1W8MwD41Q?=
 =?us-ascii?Q?kVTgZy3ekAU/1l+21voFOwExnfiKATMSxsOnSoPX6QmuNRKim6xGvNrmSadV?=
 =?us-ascii?Q?KTLcr7IpXiK5No6p0srIMGYlo/VwYGIbw3axwPi2sw1tmKQegS74XZd3FTs9?=
 =?us-ascii?Q?X338p/BTRgwdA2mUMmN+vQVAAH2+higcvVy7XknMo0JQ2GZUKcX+alSGuMrZ?=
 =?us-ascii?Q?AmAKesQLTxgbhMHklFapn/j0IZ6ygh1uzyewq9myddaA+hJEW/jAhjhHRx6y?=
 =?us-ascii?Q?cmy2q8imuQK1c2OWprZN49TcF8chiOeNCyE56V6U4ILqfo6Uwr/hKLweTtsE?=
 =?us-ascii?Q?FBSWXyGe0E/0FXOXZb3FTHeMebydK1L+9zPPl5dpCTZyrZrkh97ljdmBjInd?=
 =?us-ascii?Q?kg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 346751ac-12b4-4a2d-42ac-08dc06fd2f25
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8592.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 16:59:26.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDaMCq6WSljDs/qnOnxS9aOUIq5zuB0paLtAPKKyMMTPIQgztzQW1gWI/elzKFranJiFlStmd6G+eySXZOf1kTHz3wRUOs0DrMThlvuMJSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB10104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 16:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107869

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The main part is the tool lsi2c to scan the i2c bus, like lspci and lsusb
do.

This recipe also ships a static library *libi2cdev.a*. Because this library
contains the file *smbus.c* which is *GPL=C2=A0v2+,* and a static library c=
an't
be linked dynamically to satisfy the LGPL, the whole recipe is marked
as *GPL-2.0-or-later.*

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../i2cdev/i2cdev/fix-lsi2c-makefile.patch    | 28 +++++++++++++++++++
 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb      | 26 +++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.pa=
tch
 create mode 100644 meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb

diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch b/m=
eta-oe/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch
new file mode 100644
index 000000000..820d4bb44
--- /dev/null
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev/fix-lsi2c-makefile.patch
@@ -0,0 +1,28 @@
+From 57c09727220e00ab961325a2c85f5611bd1770d6 Mon Sep 17 00:00:00 2001
+Message-Id: <57c09727220e00ab961325a2c85f5611bd1770d6.1701984646.git.joerg=
.sommer@navimatix.de>
+From: =3D?UTF-8?q?J=3DC3=3DB6rg=3D20Sommer?=3D <joerg.sommer@navimatix.de>
+Date: Thu, 7 Dec 2023 22:29:40 +0100
+Subject: [PATCH] lsi2c/Makefile: Use builddir to refer to libi2cdev.a
+
+Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
+Upstream-Status: Submitted [https://github.com/costad2/i2cdev/pull/2/commi=
ts/43f15e97d869797dbfeaacafa13216aaaf353426]
+---
+ lsi2c/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lsi2c/Makefile.am b/lsi2c/Makefile.am
+index 6defc1f..0d81d01 100644
+--- a/lsi2c/Makefile.am
++++ b/lsi2c/Makefile.am
+@@ -14,7 +14,7 @@ bin_PROGRAMS=3Dlsi2c
+ lsi2c_SOURCES =3D lsi2c.c
+=20
+ # Linker options for lsi2c
+-lsi2c_LDADD =3D $(top_srcdir)/libi2cdev/libi2cdev.a
++lsi2c_LDADD =3D $(top_builddir)/libi2cdev/libi2cdev.a
+=20
+ # Compiler options for lsi2c
+ lsi2c_CFLAGS =3D -I$(top_srcdir)/include -std=3Dc99 -fPIC
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb b/meta-oe/recipes-bsp=
/i2cdev/i2cdev_git.bb
new file mode 100644
index 000000000..b1f8a7f80
--- /dev/null
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev_git.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "i2c dev tools for Linux"
+DESCRIPTION =3D "\
+    This package contains an I2C dev library and the i2c bus scanning \
+    utility lsi2c. \
+"
+AUTHOR =3D "Danielle Costantino"
+HOMEPAGE =3D "https://github.com/costad2/i2cdev"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "\
+    file://COPYING;md5=3D768997ba510a952bef1775c50bc22b00 \
+    file://include/libi2cdev.h;beginline=3D12;endline=3D25;md5=3D72486a5e1=
92d6ac5c7e55a4a95e380a6 \
+    file://libi2cdev/smbus.c;beginline=3D9;endline=3D22;md5=3Dd9a0de5a611b=
960fa75912ded6c60096 \
+    file://lsi2c/lsi2c.c;beginline=3D11;endline=3D24;md5=3D72486a5e192d6ac=
5c7e55a4a95e380a6 \
+"
+
+PR =3D "git${SRCPV}"
+
+SRC_URI =3D "\
+    git://github.com/costad2/i2cdev.git;protocol=3Dhttps;branch=3Dmaster \
+    file://fix-lsi2c-makefile.patch \
+"
+SRCREV =3D "ed9ad777d842880e7ac6ca5e0de4bd2d3b4d02dc"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools
--=20
2.34.1


