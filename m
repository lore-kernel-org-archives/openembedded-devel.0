Return-Path: <woutervdstoel@outlook.com>
X-Greylist: delayed 28829 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Aug 2017 05:36:22 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-oln040092068055.outbound.protection.outlook.com [40.92.68.55])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC9D78038
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=z9CTKzXFi9JHTWohGNppB9cGqXli6kgnGxZnozwdL/0=;
	b=XIt14tCC+wPBw77mp9rVYk8B3Q7iZX+maGdGcxwSuvpj8rZevIwaLNnYtVSzJ2wCJFFMx7uPBNS2WLtQ08Avej9v3f+T6Y6zjScZHDiICU8pCsLc0ITiT9mjt2Ex3G22Qr1LVdKOr4mQ6S/VnvmLe8C4WtEjwLm3YDRk3PV5qRJEWYeRUvigJzA+kXuAIST0zJjeA2EAzmTO2SpO6ctDo9KMiHncgWh2bMtL94lTKCNDduAzLcAilqlcy4g8xaJj/F0k3irBecCcO+iOuuh1KTOYXfs5AtzXQ6alWPzpPu2Hll99VIkG/afcdN0nAASj7DZqoh4W7e9yy4DcGm6W8g==
Received: from HE1EUR02FT056.eop-EUR02.prod.protection.outlook.com
	(10.152.10.60) by HE1EUR02HT060.eop-EUR02.prod.protection.outlook.com
	(10.152.11.252) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1341.15;
	Mon, 28 Aug 2017 07:03:01 +0000
Received: from AM4PR08MB0738.eurprd08.prod.outlook.com (10.152.10.55) by
	HE1EUR02FT056.mail.protection.outlook.com (10.152.11.21) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1341.15 via Frontend Transport; Mon, 28 Aug 2017 07:03:01 +0000
Received: from AM4PR08MB0738.eurprd08.prod.outlook.com
	([fe80::29d4:84d7:f697:1813]) by
	AM4PR08MB0738.eurprd08.prod.outlook.com
	([fe80::29d4:84d7:f697:1813%13]) with mapi id 15.01.1385.013;
	Mon, 28 Aug 2017 07:03:01 +0000
From: Wouter van der stoel <woutervdstoel@outlook.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH v2] mpv: upgrade to version 0.26.0
Thread-Index: AQHTH8rk/3Lyerib90CiUeEUGhvLpg==
Date: Mon, 28 Aug 2017 07:03:01 +0000
Message-ID: <AM4PR08MB073846C7CD0E519AB521D687A19E0@AM4PR08MB0738.eurprd08.prod.outlook.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=outlook.com;
x-incomingtopheadermarker: OriginalChecksum:6EDE1976EE78E73987D3C2B6C8F7DB2608D4C4A0A58C4FA6CA7F04F8DCDA51F5;
	UpperCasedChecksum:3FEB22E0B783DE1EEE5252612273D12A5E96FA5EA3CFA77E0B298A9E79541801;
	SizeAsReceived:6947; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [eeDdygSNvB7nvV3RypfQSBzYW6Mgk4Bz]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1EUR02HT060;
	6:CuvHjciVyzfyYnNGOhCt1DGxSwE67gONDDMcK5FW2YKsSX/RLoMsxiImXNiD8WpX090k2/pFDXadsvI1jiZBq8sq2BnuNwi2Q10v/eFk8VYxaXdHEzokDZ5f6JqfL9cEI4rVSYPnbIEeZH1xw6l7G5LoEge+oiE2bEl+ppTt4frYFNcthhMdZwtPP7naOLwgqHP0HxEdVQ8fbWUKgHERu0gwvkBNpsyjehEEXdkN2lasyXY7V1ZZYlZOuhjXPQdfB9k8qojYeCJd1SF2o4b5rOImvK7EUpP1YAp5HJngu0vLDyfXzKqHM+UUBbWcTpA/4imxjCx2R/FtU9Qb+guQIA==;
	5:GMLOeuejFz+BsdE7If5oMgbXPZB7R0VUd+PipN0J9Jm1nnE2NrdHXAQpyTFparCk8edg9zGBOwO14Lc7FV/mSAnKCQOIH9+B4WZqszKQuFJeu3g9iRllNKp2BnsnNeEVH50Px35hqkg10PqQHYbnWQ==;
	24:+ZcNmype4y5bP8jBL168igvW4wg/rEAZgwCQVtYI+F6G6p3Cfx5shk0FV6O2Cv2ykSQg4UPHzP1IVL4RFMVnJzfbM79XiwokoBxhmHV+AoQ=;
	7:/WtVOBgumB7c246rVShl37yH5CvKnDRa2mK1XG1Q95vDrOunHN7BtEcmAT9CNDmPmAAFS2GxvZE4RYkyd9ZJLYw+9s2leOilBUOnmKeSJQlxNT4ITDe0gFU5BxMygpgdLmXkFQxJNfOOmyqv+5U7UwcuxxVNdfZ1RhPeMtwHj9RYRbV6q6/mtNyRb9lEBoYYsGBYUNSJRr4LIgw6PG2mFdJUQdNhhlbb/NUGmFz/YA0=
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(7070007)(98901004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:HE1EUR02HT060;
	H:AM4PR08MB0738.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; 
x-ms-office365-filtering-correlation-id: 3543d9fd-7656-486d-abf7-08d4ede2d25a
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(300000503095)(300135400095)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101448)(1601125374)(1701031045)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1EUR02HT060; 
x-ms-traffictypediagnostic: HE1EUR02HT060:
x-exchange-antispam-report-test: UriScan:(166708455590820)(189930954265078);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:HE1EUR02HT060; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1EUR02HT060; 
x-forefront-prvs: 0413C9F1ED
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2017 07:03:01.2850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT060
Subject: [meta-oe][PATCH v2] mpv: upgrade to version 0.26.0
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
X-List-Received-Date: Tue, 29 Aug 2017 05:36:23 -0000
Content-Language: nl-NL
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Updates the mpv package to version 0.26.0.
The patch that was previously necessary related to OpenGL has been added up=
stream.

Signed-off-by: Wouter van der Stoel <woutervdstoel@outlook.com>
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
@@ -14,10 +14,9 @@ LIC_FILES_CHKSUM =3D "[file://LICENSE;md5=3D91f1cb870c1c=
c2d31351a4d2595441cb]file://LICENSE;md5=3D91f1cb870c1cc2d31351a4d2595441cb"
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
2.7.4=

