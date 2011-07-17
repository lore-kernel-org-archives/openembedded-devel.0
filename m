Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1QiXI5-0005FT-6Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jul 2011 21:46:13 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p6HJgBfr027946
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2011 21:42:12 +0200
Received: from DEMCHP99ET3MSX.ww902.siemens.net
	(demchp99et3msx.ww902.siemens.net [139.25.131.243])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id p6HJgB6O025541
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2011 21:42:11 +0200
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.162]) by
	DEMCHP99ET3MSX.ww902.siemens.net ([139.25.131.243]) with mapi;
	Sun, 17 Jul 2011 21:41:45 +0200
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 17 Jul 2011 21:42:09 +0200
Thread-Topic: [oe] [PATCH v2] packaged-staging: fixed fetching from
	PSTAGE_MIRROR with file:// uri
Thread-Index: AcxEtgt+3l3jtlsqSjOu80sxMgmhiwAAwVUQ
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E0157569595@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819E0157569594@DEMCHP99E35MSX.ww902.siemens.net>
	<1310930168.4288.47.camel@mattotaupa>
In-Reply-To: <1310930168.4288.47.camel@mattotaupa>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: [PATCH v2] packaged-staging: fixed fetching from PSTAGE_MIRROR with file:// uri
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
X-List-Received-Date: Sun, 17 Jul 2011 19:46:13 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>

Packaged-staging:
=20
 * This patch fixes fetching pre-built staging packages from PSTAGE_MIRROR =
having file:// uri
   see: http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/0=
33938.html
   (thanks to Tom Rini for helping me fixing this)

Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
---
 classes/packaged-staging.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bb=
class
index 29a3238..c60e271 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -200,11 +200,14 @@ def staging_fetch(stagepkg, d):
         try:
             bb.fetch.init([srcuri], pd)
             bb.fetch.go(pd, [srcuri])
+            stagepkg =3D bb.fetch.localpath(srcuri, pd)
         except Exception, ex:
 	    bb.debug(1, "Failed to fetch staging package %s: %s" % (bn, ex))
         else:
 	    bb.debug(1, "Fetched staging package %s" % bn)
=20
+        return stagepkg
+
 PSTAGE_TASKS_COVERED =3D "fetch unpack munge patch configure qa_configure =
rig_locales compile sizecheck install deploy package populate_sysroot packa=
ge_write_deb package_write_ipk package_write package_stage qa_staging"
=20
 SCENEFUNCS +=3D "packagestage_scenefunc"
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


