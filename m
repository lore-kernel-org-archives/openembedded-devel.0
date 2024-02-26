Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A20C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 11:42:29 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.125])
 by mx.groups.io with SMTP id smtpd.web10.18531.1708947743790236617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Feb 2024 03:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=afQgBhRo;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.125, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLY+5hHjP9JABhmL5zPMZgrqIL2VkSoRJxPzIMOqFgeN641Ald9hw9w3e8iTPx7yifMhWl/SYrcw9qwXy+ewwjoP9GFwEwga0E+vFRvTmnMZA9nAXaNTTkqfiLV1JbNNHESBinUGmX10Xg8axPQC2iqRE1QPwj7EvWlidPjTmU7pJROwNzpUXgpHGuTF8k16w54Ng/vLEk7s6+PlTyJcKX8a1O8UUDJWS6X43Zcgqv0055b3cI9K9F+Ly7i4vp4m6HUqowCA/gOjj0+w5dC4NZv6WldXwmWVePQ4EtfVj9FhZ5K0JBI3Dzc4ifpB0m/1BmMvuv7w9R9Gh1DzL6rwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5om2cVA2CesfeFV9QcUghS+hdm5/AR2nXl304b2VVhY=;
 b=Y0o3Qt2TvCd3vuDmsvqJ7nWLWluUQXzQRbrx1bbg0I99SrZvYTOvGytB/dW7IXFyh6Mls4YDNJs2Lohhg3QBzquuulEtRqqQbnbKL/MnqYDk/fc9/IOXVLUUhKQmUjfFTh/7sF0wr2qljjGuN2XWunTSYiNdxlhcygWq+rJf7mJCYU2uNWaTKYYdeGf/KZX9eCdxuVZqy3VvQvxe7rMsB1SznoreP4owq6jpJAJ0mOFoGcDcVMVFwo/PLG3Ex1qC8nuK7K1iUN8EWMzi6YBxhq/zLjsJCc68Vm60fN9oaV57HZ23tWNJ4OKFJHRRhi6qYaE0+PwLsKx03Yb+XQfLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5om2cVA2CesfeFV9QcUghS+hdm5/AR2nXl304b2VVhY=;
 b=afQgBhRo61SFwsH8sFaXgZULpD8/UyyrHtLKZcBXEwYISbiwgH6D4WMiZ/b4po7GfVAbNep5B1df70kuDGLTUuHtmZ6/1Wetv4PirqFVjvctLzCDDQ+zzFjjWQ7F9YNC4k6bXJMk2d7VD810YuP/j0IUGiNpVa+/hLqIe6U83a3lyycQZKIt3hyygw5BMVOhpj6j9/7SXaRx7MaxMVu90Tv4KXSOYEpU/NRESF2iTZ/cTXdm1Hk7Nb2CPeCrBnQrrhh8tZjfok5gV0BcZoy+xZd6+ikR1y3e9l+3wMennQ0sCvW11rK/wPJ6UUhW20/V5+a71JZrsmdS9xxr3wCrJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DUZPR06MB8773.eurprd06.prod.outlook.com (2603:10a6:10:4d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 11:42:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::b5ae:8355:acaf:29e0%4]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 11:42:21 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: ticotimo@gmail.com,
	raj.khem@gmail.com,
	joonas.salonpaa@vaisala.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 2/2] python3-pybind11: Restore strip prevention patch
Date: Mon, 26 Feb 2024 11:41:54 +0000
Message-ID: <20240226114154.1033676-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226114154.1033676-1-niko.mauno@vaisala.com>
References: <20240226114154.1033676-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVX0EPF00011B52.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:c) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DUZPR06MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e24120-ed35-41b7-f2f7-08dc36bffe7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eJV4WPf4JBoX2Hy7dZ135RoA0OgLDodCiHp3m9kfE+geeI2KfmsiHEee7TkcQOxZZt5lclAJlOeMXdFh2z3wS8edYDD7hAT9/+rEoyI54WHEWOCGvBFKjwPqKjZ2OoUuO+1ETxZJW64ylIM2Ksqfl4rneLpVKngX7GFo+Eto+JJ4sUA9GqvxlSyoeZ9fcx8RpeuS953+cFIDkXuv8utWldlH58IIC/IrHiYxY/5+i9DPlolEn2TWxxxEwfT44zQYY9jABoiIW+pcdV/F0t5SixLIE7KP5qFa+5bFHCKROYmMfJ3Ez9P05JNjgN7/fgSAgo2FQRJGah3BpRXGm79TCQPEJ5JLDKv/DGheEit53RZglB1luB2/xWqoEDLrAeXg0r61hDnpOqb3p0LnBLaE2Ev8an1rZ/R5/gh5XfjysBJGT64uoYxGkoYXq+Y2nNIqBhSvcpo+geRpDnO+eMveP61S10eQ/pF0g7YMgcOZUx15clQ6RvNiytg3IdGnvQY7GoIe6IweWjljHRW04FXZbWX3ufJ1CSabnGBrHNNpU6LPO8LP1/2tiFA3HtSMms5s//UYlQqJ+xyNsHGyexorjHl/3BaMDCOayC/GnK2JwGm2UOsp2z2UKFIVz++1Hg57FjfMeXs3df1GNp2zYKt7IGJ1jLPoaoxK8tcxr8nWSJ6aFbS70NZ2WhZHYpeB++SD+L+0Eed3FT2i3wbaT80xpqZ0s8hNTcyA1imbpAcC4fU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PQKVPeD5PMfYqfYcVri0+yOVTcslkqKRSVIyzj9WvddTHX3dg1yWuC3AMxze?=
 =?us-ascii?Q?pXgTwOqoZNBi3zXTyAlKyDfbOqLpvSY6xHi3B2vGtQszu9IOB1E7TBWErwo/?=
 =?us-ascii?Q?O3xNT2pPdr1LGamKHNtsklWiFmiu5DPkVTOaaVvxowQ78rXt+QfFAjZzvhfp?=
 =?us-ascii?Q?l8cE1wr3iiMPNORrKLcr2laERxgaTAEeBy3qTPMNNekplAzFSTr//LyhDnpc?=
 =?us-ascii?Q?XiO65+HGwMUzBdag41bsO2wcUxwfTwZPsmVnAtynrgPJeqhiOy/dXNN/WrML?=
 =?us-ascii?Q?aO3ch9ZKLdzHgFU4hHszgYRWf6Glsz3AU1UzbIUDaBuWAeHW0FJ+NQL7M1X4?=
 =?us-ascii?Q?wFwOGyUfTbrAQ+yJKcja4SLklbl1/BGVFLMNNK5aH+yYeKOAKm4SVTemEc3w?=
 =?us-ascii?Q?s+Bdg+KmB/u5r6dV54Ud1Tj85nyBGp/XH3qUFHlbNoaQb1QidVwO0P0WAeX9?=
 =?us-ascii?Q?9yZREPwh9huoSeOe0z3cWZeFcj+P/Ad144E84FlHwcTZtdNYL11nwSTgr2GR?=
 =?us-ascii?Q?N0xrj5stIgfq9yV9r6iNcc7pblW96Xdbibb6tMT+M7vqfT3G3TABBPxytVSo?=
 =?us-ascii?Q?Y4UsHzQcnrf+kAxNwKxSqibyrv5joaLWxFraeRaAlMLCkiSNvTqIJdwGKEzE?=
 =?us-ascii?Q?uQP3UjhQcZ+3ClD+ecCJisDMpc6s+X0Iyp5K8G9RKIj6h6hOWQACcir/v026?=
 =?us-ascii?Q?DxpFR2PXuSUE74nPVoF2hTBhcPtP3a1Oqyi8dFqn6JhQNZI07oaX0cjxUTqp?=
 =?us-ascii?Q?T1ih+6nbXoQNp+VR9TIjL6tV0WQfVSz6BU1DYT4xfXSAKHNoW8KyFL5lcbj9?=
 =?us-ascii?Q?QVv9efzXrAV+Hp9McQxQ/6QBAAGxyCyR/MdqIbXdiI/sJtXOM5rPy0Jqg2sP?=
 =?us-ascii?Q?FFzQG05Zg3wBg1av8HRa4QL4PGssVqbI5A2c4JdpWR7KCsvLz8GVfVxV9my7?=
 =?us-ascii?Q?lJ2A9BfNWli/dEPLGjgdnYkhHdllOiu9Ow3zsgQGDW+N3BPY57uVjiy1Uoax?=
 =?us-ascii?Q?98sAPTyMNg4u74A4Yt6wsl8CA4hcJYZwSktDfHCIuVXh94I/dlvCOr4GivN0?=
 =?us-ascii?Q?8e4OxG4RZAEnGzlg46oZTvx6dmDHMwMGiyxeB3RtJQUxgclLpkmuhrrszZCb?=
 =?us-ascii?Q?O5S2FqsEGFMmJMYkwhoqL7ZAouvMGn9HHOR394GrcEIx0DcZH5pEo/FnxT6s?=
 =?us-ascii?Q?XRPK8JUnL4I/wd6CHY5EDS5RltNhGLmV4ZmoXV3DmMvSs9IzjF76ze/Dei06?=
 =?us-ascii?Q?zvpIZwxfRFcJ8edZPXJzF+/Memqp1K2mSBkjz9IZbSG46cE3w4mMY1pVAwNe?=
 =?us-ascii?Q?TJtamOe3YWofLBDBumoxguLxzsUgeI+O7ncWoylPR+AxAAJ0YKOu0jcgw6Ya?=
 =?us-ascii?Q?Y/EQxwnyyIGqNRaZL5FqLgQdEkBWLxo2LgnDPDYQEnf+//Ux0UE49niz25KQ?=
 =?us-ascii?Q?A+6BWlobQ+w37Dx+EVPUq96B7nzXRkVbL2cv3eQnVWpWBQ4grglNRDd5fmDN?=
 =?us-ascii?Q?XoLaWvX3BLB5MZ+DNdVCmyzQeUV9FQiiUUtR91kLN+ezWpLV0Hh7/ifFvqCD?=
 =?us-ascii?Q?pSkpMx4DwYKLiPM7FU1vdqbh9dbuR3f7gXuQkFe74w5Z9eSPH6hBv/tefN2P?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e24120-ed35-41b7-f2f7-08dc36bffe7d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 11:42:21.7062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jh3Tmk6qPNnAlwZVmRIQsmF1KBXQESR54RXfPzFy61rVXsidnJfNcLfsQAuHuZHdzij5OZoqFuphWYqIzF9FwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8773
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Feb 2024 11:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109033

From: Niko Mauno <niko.mauno@vaisala.com>

The patch which removed the pybind11_strip() call from provisioned
pybind11*Tools.cmake files was dropped in commit
5c455804aede17e0ea0cbb7ab55f8580f912e664 ("python3-pybind11: Upgrade
to 2.10.3").

However this change delegated the requirement to set CMAKE_BUILD_TYPE
as 'Debug' or 'RelWithDebInfo' (or as unset) to the cmake utilizing
packages which have build time dependency on python3-pybind11, failure
to do which causes following kind of BitBake failure with Yocto:

  ERROR: foobar-1.0.0-r0 do_package: QA Issue: File '/usr/lib/python3.11/si=
te-packages/foobar.so' from foobar was already stripped, this will prevent =
future debugging! [already-stripped]

Restore the patch so that the stripping is delegated to Yocto once
more, allowing depending cmake packages to work out of the box also
when they use 'Release' or 'MinSizeRel' as CMAKE_BUILD_TYPE by
default.

Signed-off-by: Joonas Salonp=C3=A4=C3=A4 <joonas.salonpaa@vaisala.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../0001-Do-not-strip-binaries.patch          | 52 +++++++++++++++++++
 .../python/python3-pybind11_2.11.1.bb         |  5 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11/00=
01-Do-not-strip-binaries.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-n=
ot-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybin=
d11/0001-Do-not-strip-binaries.patch
new file mode 100644
index 000000000..37cb78a30
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-stri=
p-binaries.patch
@@ -0,0 +1,52 @@
+From debd676cd94f92a30b3be45f1245aa13d8c398c0 Mon Sep 17 00:00:00 2001
+From: Philip Balister <philip@balister.org>
+Date: Wed, 8 Jul 2020 09:41:43 -0400
+Subject: [PATCH] Do not strip binaries.
+
+ * OpenEmbedded strips them after creating debug packages.
+
+Signed-off-by: Philip Balister <philip@balister.org>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ tools/pybind11NewTools.cmake | 7 -------
+ tools/pybind11Tools.cmake    | 6 ------
+ 2 files changed, 13 deletions(-)
+
+diff --git a/tools/pybind11NewTools.cmake b/tools/pybind11NewTools.cmake
+index 7d7424a7..accd90c4 100644
+--- a/tools/pybind11NewTools.cmake
++++ b/tools/pybind11NewTools.cmake
+@@ -233,13 +233,6 @@ function(pybind11_add_module target_name)
+     endif()
+   endif()
+=20
+-  # Use case-insensitive comparison to match the result of $<CONFIG:cfgs>
+-  string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
+-  if(NOT MSVC AND NOT "${uppercase_CMAKE_BUILD_TYPE}" MATCHES DEBUG|RELWI=
THDEBINFO)
+-    # Strip unnecessary sections of the binary on Linux/macOS
+-    pybind11_strip(${target_name})
+-  endif()
+-
+   if(MSVC)
+     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras=
)
+   endif()
+diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
+index 66ad00a4..855ede41 100644
+--- a/tools/pybind11Tools.cmake
++++ b/tools/pybind11Tools.cmake
+@@ -212,12 +212,6 @@ function(pybind11_add_module target_name)
+     endif()
+   endif()
+=20
+-  # Use case-insensitive comparison to match the result of $<CONFIG:cfgs>
+-  string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
+-  if(NOT MSVC AND NOT "${uppercase_CMAKE_BUILD_TYPE}" MATCHES DEBUG|RELWI=
THDEBINFO)
+-    pybind11_strip(${target_name})
+-  endif()
+-
+   if(MSVC)
+     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras=
)
+   endif()
+--=20
+2.39.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb=
 b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
index 13f63b7c6..78662fe3c 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
@@ -8,7 +8,10 @@ DEPENDS =3D "\
 "
=20
 SRCREV =3D "8a099e44b3d5f85b20f05828d919d2332a8de841"
-SRC_URI =3D "git://github.com/pybind/pybind11.git;branch=3Dstable;protocol=
=3Dhttps"
+SRC_URI =3D "\
+    git://github.com/pybind/pybind11.git;branch=3Dstable;protocol=3Dhttps =
\
+    file://0001-Do-not-strip-binaries.patch \
+"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.2


