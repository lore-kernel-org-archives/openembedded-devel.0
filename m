Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEB4C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 11:24:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [104.47.17.171])
 by mx.groups.io with SMTP id smtpd.web09.5235.1660217097984620384
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 04:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=0P9Df1gc;
 spf=none, err=SPF record not found (domain: gossenmetrawatt.com,
 ip: 104.47.17.171, mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxqaGRz59psDyx+tXJe2GvlL4C0DmSQZ0du4lqiWEsthOmbjXW8OF5aMlYaCHmYFH3p2/BYUZDghN2Ah3wupbPoEY5AktsNAfNEDbRNrwtAeV3vttG8P1VIwc4zgfpeuBheAcbNLrLKWhlQJ+V4Rc5ytN6i2Og7CjMO+id28ZvQSbFpgJVPkyim+Np7fpbQ7uK6lQ4AjVXaIeuEwOSDA2fYMsybrCoVmAOPGqx9CicAxFJkfSF4AfnLuv6xpLjCclh8uF7f+bjKDDzBuvDp0+LBxbyvsBnl2d/In6xGI6CMsOd/NCEvRTBFFklNEPbNhfQsz6ujvDRqpf6lXMFPCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/Jh1g647isnmo+M4tiFquQ6PxI6zXsR2GNkBeIAABQ=;
 b=OKQsOFOpr2+We4785Lbcd2Laqd1TIrn4UywPlbaYI+Y9lF7J0EZi9NxzIfdbfgsVtrU05Ubv2q9kttF/qFEZjwvXObbWNeM2mmtdNGRyxRzTwp/8CSPi+pDunZQeBaaB3B7hTtXuMYbFVsKN3xxpD9mBCEtBzhpuFhF1byrUow86MOb8xoGufoG6/mPVkueRSVT2sSG/WchXboaUktbUfYMpeMabJGYtlU/aaA2en+AjwYzxpU7o5qc4SDZDZHEMThIxteHVe847/8N0c0gvGseRdfHsrjvhLMZ+1eoA8pkY7SPJ7CAOHdkEmH7SmgpcCFuHzWD/LBOZ8efOOnRj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/Jh1g647isnmo+M4tiFquQ6PxI6zXsR2GNkBeIAABQ=;
 b=0P9Df1gcHU6a0R1L9rQt9Gj8Mu0KHn2O07tG7YcicNDgf+tbWfZjOpU00AVld9fzZYjAim6nk/MF9VWY48091bwZ0TdT+iPt1bfxqa+1IDHuJRsybhfENIRepMxYuXBBDnXauqL+e86+MOIj7rdHH7q19QwX5A04skaqlqqZokY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by DB8PR08MB5276.eurprd08.prod.outlook.com (2603:10a6:10:bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 11:24:52 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::818c:5db3:4c6:2857]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::818c:5db3:4c6:2857%9]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 11:24:52 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH] libsdl2-ttf: upgrade 2.0.18 -> 2.20.0
Date: Thu, 11 Aug 2022 13:23:59 +0200
Message-Id: <20220811112359.389404-1-Wolfgang.Meyer@gossenmetrawatt.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To VE1PR08MB5583.eurprd08.prod.outlook.com
 (2603:10a6:800:1ac::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 097f256b-46e4-4611-2cfa-08da7b8c1be4
X-MS-TrafficTypeDiagnostic: DB8PR08MB5276:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mXZxxrBfLyi4IVGOKO1dB+loMMlCjsr3GWHdxbuAN1uLpcO5Z6WyiQTTHJauAwGeM0OorwIxwmUNSgpBBF9SSQ1cCZhkr3gfuQYsA13YTDWWtJp7SAHkdMcqtm6hszRPABktFBuPh46uaPA8POJxAg2IXaHsuU7JFBHLnv2OLYW3ElwK4GageE15m394BwjEjqNmrSgiqUa0Cmxe8ACETakeL7Hk2/PlnF11qaATxKn2uQnIfSalTKvMzl92E4zRfd9VLOLnRr4KJNjXPABKQ/3Kz8Mav46Lw5waSAi19PmsIpU50Z3hfFjQ3WT22FdRQ3RurMsn5rqY2vkgZxY7WGq67fxyHbvFofUWgU6zNe1QUF3h0K2cpGOSatW3gH0EVxIvkIUyp13X2aJ9Ln2gBm/56YgLL7PWw6SGgaG9n4IYYDfwJMoekXNDPO+zBcOeC3nFLyw0AS34jpor6LjAabfnEk6PS6Jsla7qXnOsWgrA4ENcrgvDk+54ilepuHqCPMhJAUm5YuD4FkWrJ20faJmO6QlnZvrdYpsis4HxDdwRPeMkzqACbi0ELynZlyqhxWj00u9jvVrkGbDAw3wPakVI2Fyap6T9yE2/4HCHXhP3dD/5Fov6Bp2DhX5W+Q1Uh6k4DRIebQ9qjhyQQseWGPF7suiLmtLo6d3W/9jN2RckezvV9cOlFXo4mNl1NOGccNA7ukmWXeDW4ubdO7rKfInJXN96HblHh94el5yPAk7FZeGXqlWiyV/L4OZDXoG4PYmqoGgcMT5HunRqjhbIxg1Qt/7hQrzMx8AEH2/7agiLR77hNYa2n6ab1lBxrXbXlbFRsKampOmxiWgb2nVtLw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39850400004)(396003)(346002)(366004)(376002)(83380400001)(2616005)(8676002)(66556008)(66476007)(66946007)(966005)(38100700002)(316002)(6486002)(186003)(8936002)(6916009)(86362001)(107886003)(4326008)(36756003)(5660300002)(38350700002)(6512007)(26005)(52116002)(41300700001)(1076003)(478600001)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z5jbKKXHySZ16tf2PCxT2wdV5jS0XIZIYx1ifgMm71NSxTgXn/2Vu9bh/ifa?=
 =?us-ascii?Q?G60TCmpwtRngfDrg66J6246ltR+ahZIEGz14hWY0lL/+mQ7m+dC3NJ06WuoB?=
 =?us-ascii?Q?4Efkf+ze0JSdvkQw64ad/RKIp4ZB6Ofw+jUcXoPvUAxMDUeUI70/r9D96Eq9?=
 =?us-ascii?Q?AqDTS0wpdF7MIr5VH089NB+LqQ7kT+jVMQOTMPhwlmWq7foynxSBJzhAHAXV?=
 =?us-ascii?Q?A22sT32/h/mv70vvzVh7dkb31glmRyD5em/AF1l9R46UtAxS0ygIcybsZtYs?=
 =?us-ascii?Q?qqRgo7BPCFBf7o8MvtVaTGP5UrG3aUFAbrwAYZbellJTsX1fiMRdaCOjSNWs?=
 =?us-ascii?Q?zcbosXERBZjjRUSBN2UsqVtklgF/7ufu9sNsThltVOlB8OX+2LpkK15i7dW+?=
 =?us-ascii?Q?sKE8DicWXr4yJQuZBVqPKSe5dn4SYmuroSIoqL3k7Fj3IaWyM5k8hwakC9JQ?=
 =?us-ascii?Q?TQY73eG4/7dIb4Z9LLH6LQ/egufKzy0JznWND/8BQ3iJT+9c64EHkjoKU+92?=
 =?us-ascii?Q?R40GPusk+r4M9mBJInm/dLA5e2/m7pcuTVhH9xU7oOHt8cAEvhEmB6Mu/PUM?=
 =?us-ascii?Q?cXlXc7Luw0GNCTBb2o4PD2NCnjAgf9daoaejf4GekUQ/p1NDaH6xDYONmQFx?=
 =?us-ascii?Q?Q9LXzdskpGM4P1uMJg32LmmL2ByZ1Ld11oNNuyFfqVsgbDiCv8fqEaFlKD52?=
 =?us-ascii?Q?2oQztC80RtmSH6Nv1XRdSSFJCv80wxgqOXVeNOvldNpBu0mR3Q0atseVDNMR?=
 =?us-ascii?Q?37BIf2mBxDh7ko+9ydIaQPZCdqh2HqYa2gp5SUbmQpIaJfTWfe5wM7hNKTtx?=
 =?us-ascii?Q?ybrAt8OkHRhz0RrgFkHu4qpOIZV/5P/+Ma0EUPP2uNUZSIYhit+ZjH7H+OdV?=
 =?us-ascii?Q?OJnDNW9omFBXCggvGbcolJkP7vPng0I8DxwXjkxgQ5ePXb0qdkNwfZsnS3ZC?=
 =?us-ascii?Q?BGTJBIyNUZDRCB2zq3l/urth1ZdIGzF5gL2BxTZjrxxQOVHBveVQg3+sVyxD?=
 =?us-ascii?Q?Qv9MKdYPSSJ1NErp1rtHtXOqTN+8N2p69rv93TV6o5NzDFSHtg1gJdzWDF9c?=
 =?us-ascii?Q?1cyiSViY+4n/TmZARe+hOuF9ZhlSZpo/INPJjNp6Z/EfJdYf+6tgRbJrRrkt?=
 =?us-ascii?Q?yfjhYMuNTlw5YIihO4ZkvFhAzYeHFlSlmNrE/HNFmQRcJY2UeC8OLU+cfVEn?=
 =?us-ascii?Q?mvOPziO6lYS3U1vFm9TzTv8qg7q7QVSWIM5GsrBQ6kr1rqMU4V1oB3yCCr8+?=
 =?us-ascii?Q?WDVphY8GxUJ0uFvosWbEuzc5d1ALa+lQhtc5M0ulB5RQG6u9zpf8KufvCwK+?=
 =?us-ascii?Q?i9ko96QXZOpYaphr28h0jgGsVE3cX/V+UzWO27uyqszbqmiPP90ystu2oR8c?=
 =?us-ascii?Q?zgIQisd5Nsx9yEylhpP6elsICsWw+DCSxuQ2JKK2t3d6W7I0tZMJHLEpuNvR?=
 =?us-ascii?Q?a9oK9n0frRHOcmrxBQMmwGtwRn0IthHYLv2AMg8yB/GTYrzmf1izzbzN/eD8?=
 =?us-ascii?Q?lEaeA65eDaVaOC1v3Iw6ipq5ixSH9C721e4d8bHwQEzDQpTsxIvnWqadlLUC?=
 =?us-ascii?Q?0/4jZSNNJ2ype0wUvM762flgjfIV83pXuwfxCtYrNh6ovXsPwXF+fj9qh7Qg?=
 =?us-ascii?Q?qgUOlx6hptkQjV5CJDOxyk0=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 097f256b-46e4-4611-2cfa-08da7b8c1be4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 11:24:52.1329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gJEq8lOrQ8VdatToAx2ZvrLmfmYPwviAOkHBZzRU09VoM35QYm6/CYGaW9zRjNxRGez0QuuYKlCr+ei4wlU8IBe85oCLrHLl70kGqWfSTU+qbGky5jHQFseECVMrYZtk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5276
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Aug 2022 11:24:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98195

Changelog:
 * Added support for building with CMake
 * Added TTF_GetFontWrappedAlign() and TTF_SetFontWrappedAlign() to set ali=
gnment on wrapped text
 * Added functions to render using FreeType LCD algorithm:
    TTF_RenderText_LCD()
    TTF_RenderUTF8_LCD()
    TTF_RenderUNICODE_LCD()
    TTF_RenderText_LCD_Wrapped()
    TTF_RenderUTF8_LCD_Wrapped()
    TTF_RenderUNICODE_LCD_Wrapped()
    TTF_RenderGlyph_LCD()
    TTF_RenderGlyph32_LCD()
 * Added TTF_SetFontDirection() and TTF_SetFontScriptName() for additional =
control over fonts using HarfBuzz
 * Updated to FreeType version 2.12.1 and HarfBuzz version 2.9.1, fixing CV=
E-2018-25032
 * Fixed crash when loading fonts at certain sizes on Windows
 * Fix memory corruption loading malformed TTF files (CVE-2022-27470)

Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
---
 .../libsdl/libsdl2-ttf_2.0.18.bb              | 27 ----------------
 .../libsdl/libsdl2-ttf_2.20.0.bb              | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.0.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb b/meta-o=
e/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
deleted file mode 100644
index aae803f2e..000000000
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.18.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "Simple DirectMedia Layer truetype font library"
-SECTION =3D "libs"
-DEPENDS =3D "libsdl2 freetype virtual/egl"
-LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3De98cfd01ca78f683e9d03579581=
0ce87"
-
-SRC_URI =3D "http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}=
.tar.gz \
-           file://automake_foreign.patch \
-           "
-SRC_URI[sha256sum] =3D "7234eb8883514e019e7747c703e4a774575b18d435c22a4a29=
d068cb768a2251"
-
-S =3D "${WORKDIR}/SDL2_ttf-${PV}"
-
-inherit autotools pkgconfig features_check
-
-# links to libGL.so
-REQUIRED_DISTRO_FEATURES +=3D "opengl"
-
-do_configure:prepend() {
-    # Removing these files fixes a libtool version mismatch.
-    MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.=
m4"
-
-    for i in ${MACROS}; do
-        rm -f ${S}/acinclude/$i
-    done
-}
-ASNEEDED =3D ""
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.0.bb b/meta-o=
e/recipes-graphics/libsdl/libsdl2-ttf_2.20.0.bb
new file mode 100644
index 000000000..4728022a2
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.20.0.bb
@@ -0,0 +1,32 @@
+SUMMARY =3D "Simple DirectMedia Layer truetype font library"
+SECTION =3D "libs"
+DEPENDS =3D "libsdl2 freetype virtual/egl"
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D771dca8728b18d39b130e19b365=
14371"
+
+SRC_URI =3D " \
+    git://github.com/libsdl-org/SDL_ttf.git;branch=3Dmain;protocol=3Dhttps=
 \
+    git://github.com/libsdl-org/freetype.git;branch=3DVER-2-12-1-SDL;dests=
uffix=3Dgit/external/freetype;name=3Dfreetype;protocol=3Dhttps \
+    git://github.com/libsdl-org/harfbuzz.git;branch=3D2.9.1-SDL;destsuffix=
=3Dgit/external/harfbuzz;name=3Dharfbuzz;protocol=3Dhttps \
+    file://automake_foreign.patch \
+"
+SRCREV =3D "f5e4828ffc9d3a84f00011fede4446aecb4a685f"
+SRCREV_freetype =3D "6fc77cee03e078e97afcee0c0e06a2d3274b9a29"
+SRCREV_harfbuzz =3D "6022fe2f68d028ee178284f297b3902ffdf65b03"
+
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig features_check
+
+# links to libGL.so
+REQUIRED_DISTRO_FEATURES +=3D "opengl"
+
+do_configure:prepend() {
+    # Removing these files fixes a libtool version mismatch.
+    MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.=
m4"
+
+    for i in ${MACROS}; do
+        rm -f ${S}/acinclude/$i
+    done
+}
+ASNEEDED =3D ""
--
2.37.1


Gossen Metrawatt GmbH

S=FCdwestpark 15
90449 N=FCrnberg
Germany

http://www.gossenmetrawatt.com
Amtsgericht N=FCrnberg HRB 24 602/USt-IdNr. DE815002769
Gesch=E4ftsf=FChrer: Marcel Hutka, Matthias Wist

Gossen Metrawatt GmbH is a member of GMC INSTRUMENTS-Group

[https://www.gmc-instruments.de/media/mailfooter/mailfooter.jpg]<http://www=
.gossenmetrawatt.com>

