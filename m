Received: from goliath.siemens.de ([192.35.17.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PLvjd-0000ZS-QI
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 11:41:00 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.12.11.20060308/8.12.11) with ESMTP id
	oAQAdgOg000398 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 11:39:43 +0100
Received: from DEMCHP99ET2MSX.ww902.siemens.net
	(demchp99et2msx.ww902.siemens.net [139.25.131.241])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id oAQAdg1V027316
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 11:39:42 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.7]) by
	DEMCHP99ET2MSX.ww902.siemens.net ([139.25.131.241]) with mapi;
	Fri, 26 Nov 2010 11:39:42 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Nov 2010 11:39:41 +0100
Thread-Topic: [PATCH] crimsonfields: fixed wrong SDL_CONFIG
Thread-Index: AcuNVjuZ6CBZn/CtRjWz0cImaag8Aw==
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D383@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.35.17.28
X-SA-Exim-Mail-From: Fabrice.Aeschbacher@siemens.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=5.0 tests=AWL, BAYES_00,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] crimsonfields: fixed wrong SDL_CONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Nov 2010 10:41:00 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* libsdl-native installs:
     ${STAGING_BINDIR}/sdl-config
  and not:
     ${STAGING_BINDIR}/sdl-config-native

Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
---
 .../crimsonfields/crimsonfields-native_0.4.8.bb    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/crimsonfields/crimsonfields-native_0.4.8.bb b/recipes/=
crimsonfields/crimsonfields-native_0.4.8.bb
index 61157e2..0d30c3e 100644
--- a/recipes/crimsonfields/crimsonfields-native_0.4.8.bb
+++ b/recipes/crimsonfields/crimsonfields-native_0.4.8.bb
@@ -2,7 +2,7 @@ require crimsonfields_${PV}.bb
 inherit native
=20
 DEPENDS =3D "libsdl-native libsdl-ttf-native"
-export SDL_CONFIG =3D "${STAGING_BINDIR}/sdl-config-native"
+export SDL_CONFIG =3D "${STAGING_BINDIR}/sdl-config"
=20
 do_configure() {
        gnu-configize
--=20
1.5.6.5


