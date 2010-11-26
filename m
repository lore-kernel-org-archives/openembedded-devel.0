Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PLzb8-0000cl-83
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 15:48:35 +0100
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.12.11.20060308/8.12.11) with ESMTP id oAQEl8Ut015142
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 15:47:08 +0100
Received: from DEMCHP99ET2MSX.ww902.siemens.net
	(demchp99et2msx.ww902.siemens.net [139.25.131.241])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id oAQEl744013707
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 15:47:08 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.7]) by
	DEMCHP99ET2MSX.ww902.siemens.net ([139.25.131.241]) with mapi;
	Fri, 26 Nov 2010 15:47:07 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Nov 2010 15:47:06 +0100
Thread-Topic: [PATCH] libsdl-directfb: fixed qa_configure error
Thread-Index: AcuNeMvC5CPEoDjyTQq6IKYahylPuA==
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D4A0@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.35.17.2
X-SA-Exim-Mail-From: Fabrice.Aeschbacher@siemens.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=5.0 tests=AWL, BAYES_00,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libsdl-directfb: fixed qa_configure error
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
X-List-Received-Date: Fri, 26 Nov 2010 14:48:35 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* without this patch, ${STAGING_DIR}/bin/directfb-config --cflags returns:
    -I/usr/include/directfb -D_REENTRANT
  which makes qa_configure complain about /usr/include


Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
---
 recipes/libsdl/libsdl-directfb_1.2.14.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/libsdl/libsdl-directfb_1.2.14.bb b/recipes/libsdl/libs=
dl-directfb_1.2.14.bb
index 9f22ee5..4a3dab0 100644
--- a/recipes/libsdl/libsdl-directfb_1.2.14.bb
+++ b/recipes/libsdl/libsdl-directfb_1.2.14.bb
@@ -41,6 +41,7 @@ do_configure_prepend () {
         # Remove old libtool macros.
         MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltvers=
ion.m4"
         for i in ${MACROS}; do
-               rm acinclude/$i
+               rm -f acinclude/$i
         done
+	export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
 }
--=20
1.5.6.5


