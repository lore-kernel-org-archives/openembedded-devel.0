Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1QiWUQ-0004E0-J1
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jul 2011 20:54:54 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p6HIoqua032727;
	Sun, 17 Jul 2011 20:50:52 +0200
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id p6HIooUW013771
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL);
	Sun, 17 Jul 2011 20:50:50 +0200
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.162]) by
	DEMCHP99ET0MSX.ww902.siemens.net ([139.25.131.181]) with mapi;
	Sun, 17 Jul 2011 20:50:49 +0200
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 17 Jul 2011 20:50:47 +0200
Thread-Topic: [oe] [PATCH] packaged-staging: fixed fetching from
	PSTAGE_MIRROR with file:// uri
Thread-Index: AcxEsnD7k8AHUxXwQ9mm48hN1/9XXw==
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E0157569594@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: [PATCH] packaged-staging: fixed fetching from PSTAGE_MIRROR with file:// uri
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
X-List-Received-Date: Sun, 17 Jul 2011 18:54:54 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Packaged-staging:

* This patch fixes fetching pre-built staging packages from PSTAGE_MIRROR h=
aving file:// uri
  (thanks to Tom Rini for helping me fixing this)

Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
---
 classes/packaged-staging.bbclass |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bb=
class
index 29a3238..c60e271 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -200,10 +200,13 @@ def staging_fetch(stagepkg, d):
         try:
             bb.fetch.init([srcuri], pd)
             bb.fetch.go(pd, [srcuri])
+            stagepkg =3D bb.fetch.localpath(srcuri, pd)
         except Exception, ex:
-	    bb.debug(1, "Failed to fetch staging package %s: %s" % (bn, ex))
+            bb.debug(1, "Failed to fetch staging package %s: %s" % (bn, ex=
))
         else:
-	    bb.debug(1, "Fetched staging package %s" % bn)
+            bb.debug(1, "Fetched staging package %s" % bn)
+
+        return stagepkg
=20
 PSTAGE_TASKS_COVERED =3D "fetch unpack munge patch configure qa_configure =
rig_locales compile sizecheck install deploy package populate_sysroot packa=
ge_write_deb package_write_ipk package_write package_stage qa_staging"
=20
@@ -222,7 +225,7 @@ python packagestage_scenefunc () {
=20
     stagepkg =3D bb.data.expand("${PSTAGE_PKG}", d)
     if not os.path.exists(stagepkg):
-        staging_fetch(stagepkg, d)
+        stagepkg =3D staging_fetch(stagepkg, d)
=20
     if os.path.exists(stagepkg):
         pstage_set_pkgmanager(d)
--=20
1.7.2.5=


