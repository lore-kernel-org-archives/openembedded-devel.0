Return-Path: <woutervdstoel@outlook.com>
X-Greylist: delayed 39379 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 29 Jul 2017 16:18:46 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-oln040092068099.outbound.protection.outlook.com [40.92.68.99])
	by mail.openembedded.org (Postfix) with ESMTP id C563F78529
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jul 2017 16:18:46 +0000 (UTC)
Received: from VE1EUR02HT086.eop-EUR02.prod.protection.outlook.com
	(10.152.13.150) by AM5EUR02HT083.eop-EUR02.prod.protection.outlook.com
	(10.152.9.239) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1282.16;
	Sat, 29 Jul 2017 11:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=ZCL6T1fv9a5Jp+BhxhYEnXkHPXjoFJomocaMF+ixATI=;
	b=O7Hf8261UvKDojXJAf39WKlKDH23RybcaaGjFv3fVXAGsHKqVxFAzrxlqRxS5bk/zVeJWC9nri1UC6VTEM+eA+Y04hyhX/tRpf8r8Zudh/EsH8fnBPupKF2/pI7wsStqeGr8AgtaMWexMziCLX/CAvGgkDjhl9UpLqf223EXdTTKztEcfVQkakGVtE7qUhOvusn6l0tKj8MoVdorq7KBIbVLNFLtvLz5a1tcuvVb3hl8Bow8zAMnoDZ82cjrN1dFThmH9CMyEw+XzoL3tl/M7fXeC95XcHj8TSIF+2eSm58xiFPXbdp80Yf8bC8XadGBJBWbbmGNYSJOH5G8DZkwMw==
Received: from VE1EUR02FT010.eop-EUR02.prod.protection.outlook.com
	(10.152.12.53) by VE1EUR02HT086.eop-EUR02.prod.protection.outlook.com
	(10.152.13.150) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1240.9;
	Fri, 28 Jul 2017 14:50:21 +0000
Received: from VI1PR0802MB2191.eurprd08.prod.outlook.com (10.152.12.59) by
	VE1EUR02FT010.mail.protection.outlook.com (10.152.12.126) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1282.16 via Frontend Transport; Fri, 28 Jul 2017 14:50:21 +0000
Received: from VI1PR0802MB2191.eurprd08.prod.outlook.com
	([fe80::e9fd:8bd3:acf1:2e0f]) by
	VI1PR0802MB2191.eurprd08.prod.outlook.com
	([fe80::e9fd:8bd3:acf1:2e0f%13]) with mapi id 15.01.1282.021;
	Fri, 28 Jul 2017 14:50:21 +0000
From: Wouter van der stoel <woutervdstoel@outlook.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] Updated mpv to version 0.26.0.
Thread-Index: AQHTB7DW4ycESRmAE0e663WTXvWSyg==
Date: Fri, 28 Jul 2017 14:50:21 +0000
Message-ID: <VI1PR0802MB2191EBB7271C730F6CF64E22A1BF0@VI1PR0802MB2191.eurprd08.prod.outlook.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=outlook.com;
x-incomingtopheadermarker: OriginalChecksum:95A1BB7FD00AD001D7795D7F73A46DF5DB1196AEB9E7491ED3D698F7B0298391;
	UpperCasedChecksum:B97AA06479AC37DD9B14FCEAE9CACCB727C14AE85FF27A3AEAA0E0486C1E4B06;
	SizeAsReceived:7205; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [S0VtjdVU+YamLF4LISEqY/f1KcfapMm+]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VE1EUR02HT086;
	7:RAQehEmFRRtdVwIJO+l755mk54JnlYP7cZ+bOXS54ND+FJN0Q9hOuFrcQn7smruHT0IpzXVMkHfWazgAVV/k/MtGnoe6n5t400Xc+sZaabaoK9BwfoRmyKoEBm9bzyF7G0/1hkRBYaU3KkvT+B1y/x9bj7Egb5GRaRFBwxitBEWN3pWFZdrKtZUidbrVBrdZryv88XfdO1oTuCu0TQbWlkGySpzoOfE7nZZezyp5LUGktvqAbMVfS6XHosijOOKcUVBdsVwkALQUa62+m3sErSQc0dIhBkGNcP8moc7nrO58hKFRHVI1wYRh3yPK3hIEzQhh7uF8fWCd+F7lCcIh15/DpyZLb00+aTaDaODhQXF0xmkABH188rbu4fDUJtGV/E5k797bhfl24l2fXbK7fKqeNPuEdDSDVkZx0u4JO3/ivOU9G+eYhpQpxjXi7xTdafL9b1v0u761ec7MNhYQAPQVe8JgrZc9kc8H+JEwb45/+kopcYqXeTwLoLu/JagNmmdyqWiOPBmXQawnX7lvwR2RLtDTiHwVuLo4mznV/2rFLbdbX0rD7i/o2HSYyCbrU72WV32E/90PrWoTBe3T1RkuVA0u3fB9Ce//3QBxsCy4qeR98ZB5vQSO8wEX1hv9LveNOsRR0fTOp5qV8o2ewzdiKD8jY/M/bbFWCXi0WC44foznsbg1eqP0CqB4zIy/8DtEL6REU28oB+kv6s6YX2R6F4+0TX418rCeY0D9NCLLmXabTUmmuWl69w6yAsjtK9NmUXgkGrjzGpK0JVWZIw==
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(7070007)(98901004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:VE1EUR02HT086;
	H:VI1PR0802MB2191.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; 
x-ms-office365-filtering-correlation-id: d8e23cb7-23bb-47c9-3404-08d4d5c7f879
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(201702181274)(2017031322350)(1603101448)(1601125374)(1701031045)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:VE1EUR02HT086; 
x-ms-exchange-slblob-mailprops: 3R77UsUWwWfH97jHeyduB2sJ4z/B2mMKbB3m7SFdHHbZK5ElBA9bnh+7aCj1OzvV5cVep1vvvfcMo2JAF5oaHffpURKJeh40ff40dm0OyNOvEDcTy4Hqow2SG45n+HLMgtTVnGFGosw7BTwTVJvWL3nsXrKowcF1jG8R/SdNZf2jWDG8Gg5Uni09oKONHTCE3B87qcEDjuA5IiEFiZAKjWGV9PpEIO3GJQqmNu42GXZXEzUi3ieSNLaaJcfKtm2aoSZiWmKMYzs31Sdrg/RILIrl1Q6AJ1G8D+0/1JU6538L4qklJ4/uGRItOsZTZWJ4k4HrqutK072436dC9W/zh66OxaEA1Ywip84tA0wBMoIymdzEmMeXBT27FuR7aOuCvMQHcVGNlCgYNdJQS6I7eCzwAWkjmJdr54S7kxKRjP0jFc2hmcCyue/TRdx6oabBm3WKiwvUYmTEBynKBkXA3MQQoi4/+4WLWJSKlbk/g2sEe7fTnzJZop0T3l/uAOA4LMZXdATA2qFVbZxeW3ZYjE0WCEheZ0V4HJpxvqRLEulwBRrsoQeYT63YP0kl0FJKwwdA0+VIuL5crBbOs65Ivd1KNY7PBlK0BGuKm/km83PRSGc+1xGIK/m2SvkKdI7q2TgkOH4x92ErqpwHy6ETpcQUTLo6jU2HTwxBMFfYmhQBioloH29hHebBd8A7CRhHewJGjYe4mlbG0kJmeHAnP0J4DUfeY1n72LW//GThcC+k8QWGIeOhh48tiEsEcO6JEUedbCvSdc9FSsPixiYzNMhcVRC6sqkuIbEEUj3dKqJ0YwOezda3twr6AQy39LdhjZNF6F5L+LWa31/VY3bJ88oTHreXzJUjRW5NA62AKMtvHf1YA8HTgwKbVpkjUBo7f193u5lkjfzTQewH82aaOw==
X-MS-TrafficTypeDiagnostic: VE1EUR02HT086:|VE1EUR02HT086:|AM5EUR02HT083:
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:VE1EUR02HT086; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VE1EUR02HT086; 
x-forefront-prvs: 03827AF76E
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2017 14:50:21.4983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT086
X-Microsoft-Exchange-Diagnostics: 1; AM5EUR02HT083;
	23:M7dMPo3Jn/ewkvlktX57M1jZXupb+H5aSTAFihoebQAXi8pkc+ce4Auxe9lWjSIYshqnq2a5zFJA3IrjZLXwTpCABfzn0ulk9Q986F2ytuGlNZKeu8Hm8iFQk/3AcnP6lu1jFxaiAXX4aqP/FZPHOg==
X-OriginatorOrg: outlook.com
Cc: Wouter van der stoel <woutervdstoel@outlook.com>
Subject: [meta-oe][PATCH] Updated mpv to version 0.26.0.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Jul 2017 16:18:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Updates the mpv package to version 0.26.0.
The patch that was previously necessary related to OpenGL has been added up=
stream.
---
 .../mpv/0001-Fix-build-with-HAVE_GL-0.patch        | 39 ------------------=
----
 .../mplayer/{mpv_0.24.0.bb =3D> mpv_0.26.0.bb}       |  5 ++-
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-w=
ith-HAVE_GL-0.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.24.0.bb =3D> mpv_0.26.0.b=
b} (92%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAV=
E_GL-0.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-H=
AVE_GL-0.patch
deleted file mode 100644
index ab2b534..0000000
--- a/meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAVE_GL-0.=
patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 212f6c8206bd4dcc7d8970c5f1632823ae4e783a Mon Sep 17 00:00:00 2001
-From: Michael Forney <mforney@mforney.org>
-Date: Sun, 12 Feb 2017 23:01:21 -0800
-Subject: [PATCH] Fix build with HAVE_GL=3D=3D0
-
-video/out/opengl/hwdec.h includes video/out/opengl/common.h, which tries
-to include opengl headers.
-
-Upstream-Status: Backport
----
- options/options.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/options/options.c b/options/options.c
-index b711156..0bb36ad 100644
---- a/options/options.c
-+++ b/options/options.c
-@@ -40,7 +40,6 @@
- #include "stream/stream.h"
- #include "video/csputils.h"
- #include "video/hwdec.h"
--#include "video/out/opengl/hwdec.h"
- #include "video/image_writer.h"
- #include "sub/osd.h"
- #include "audio/filter/af.h"
-@@ -53,6 +52,10 @@
- #include "video/out/drm_common.h"
- #endif
-=20
-+#if HAVE_GL
-+#include "video/out/opengl/hwdec.h"
-+#endif
-+
- extern const char mp_help_text[];
-=20
- static void print_version(struct mp_log *log)
---=20
-2.9.3
-
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb b/meta-oe/rec=
ipes-multimedia/mplayer/mpv_0.26.0.bb
similarity index 92%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index b1da217..a154e50 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -14,10 +14,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91f1cb870c1cc=
2d31351a4d2595441cb"
 SRC_URI =3D " \
     https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=3Dmpv \
     http://www.freehackers.org/~tnagy/release/waf-1.8.12;name=3Dwaf;subdir=
=3D${BPN}-${PV} \
-    file://0001-Fix-build-with-HAVE_GL-0.patch \
 "
-SRC_URI[mpv.md5sum] =3D "5c85d1163911e49315a5bf1ca1fae13d"
-SRC_URI[mpv.sha256sum] =3D "a41854fa0ac35b9c309ad692aaee67c8d4495c3546f11c=
b4cdd0a124195d3f15"
+SRC_URI[mpv.md5sum] =3D "038d0b660de07ff645ad6a741704ecab"
+SRC_URI[mpv.sha256sum] =3D "daf3ef358d5f260f2269f7caabce27f446c291457ec330=
077152127133b71b46"
 SRC_URI[waf.md5sum] =3D "cef4ee82206b1843db082d0b0506bf71"
 SRC_URI[waf.sha256sum] =3D "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca34=
3fe091f22fca60c98b"
=20
--=20
2.7.4


