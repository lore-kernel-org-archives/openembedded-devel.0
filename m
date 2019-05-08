Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 May 2019 07:48:34 UTC
Received: from mail2.br-automation.com (mail2.br-automation.com
	[213.33.116.61])
	by mail.openembedded.org (Postfix) with ESMTP id D3E4E7D7A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 07:48:34 +0000 (UTC)
X-AuditID: c0a80110-c27ff70000001075-d1-5cd2864dab04
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 15.68.04213.D4682DC5;
	Wed,  8 May 2019 09:33:33 +0200 (CEST)
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 8 May 2019 09:31:19 +0200
Message-Id: <20190508073119.7018-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 08/05/2019 09:33:33,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 08/05/2019 09:33:33,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 08.05.2019 09:33:32
X-TNEFEvaluated: 1
X-Disclaimed: 60583
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42I5sILRRte37VKMwbqvOhYXDy9ldmD0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxqv7h1kKfjtWrJr3krGBcYNBFyMnh4SAicTGHR2sXYxcHEIC
	mxklthzrZQVJsAnYShyZ8JUFxBYR0JX4+GEuI4jNLGAt8X75ArAaYQFLiT0bjoPFWQRUJJYe
	WgQW5xVwl7i+8SsrRL22xLKFr5khlslL/FyxiR2iRlDi5MwnLCCLJQTuMUnMe3eQHaJISOL0
	4rNQDcISd1qXsk1g5JuFZNYsJP0LGJlWMYrnJmbmGOklFekmlpbk5yaWZObn6SXn525ihASQ
	wA7G3W+0DzEKcDAq8fAecb8UI8SaWFZcmXuIUYKDWUmE12jfxRgh3pTEyqrUovz4otKc1OJD
	jNIcLErivFMcJ8cICaQnlqRmp6YWpBbBZJk4OKUaGBd+Sk2YvzrjblS6t4bu1B0131UZJHNF
	Nlq0yuv+u7XN1+1i47aFe7JW68Q0qDh4Polg3HxYUSS8bLbmdxV393dnRJ9xSqR46nXfOFLK
	EsUXlDaFNaStpSl+pl6YX6NggZBG+7Z6phV7bvgm3q8IlTtc5PdUq3pp8Hp/pdiH+Qck65aF
	1u5VYinOSDTUYi4qTgQAKAcdXBwCAAA=
Subject: [meta-networking][PATCH] samba: update to 4.8.11
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
X-List-Received-Date: Wed, 08 May 2019 07:48:35 -0000
Content-Transfer-Encoding: quoted-printable

* This includes security fixes that adresses the following defects:
CVE-2018-14629 (Unprivileged adding of CNAME record causing loop in AD
Internal DNS server)
CVE-2018-16841 (Double-free in Samba AD DC KDC with PKINIT)
CVE-2018-16851 (NULL pointer de-reference in Samba AD DC LDAP server)
CVE-2018-16853 (Samba AD DC S4U2Self crash in experimental MIT Kerberos
configuration (unsupported))
CVE-2019-3880 (Save registry file outside share as unprivileged user)

* Upstreamed patch removed:
0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch

* Extended PACKAGECONFIG ad-dc to be able to build MIT Kerberos
see https://bugzilla.samba.org/show=5Fbug.cgi?id=3D13678

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 ...ild-Samba-against-a-newer-minor-vers.patch | 86 -------------------
 .../samba/{samba=5F4.8.4.bb =3D> samba=5F4.8.11.bb} |  7 +-
 2 files changed, 3 insertions(+), 90 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-l=
db-Refuse-to-build-Samba-against-a-newer-minor-vers.patch
 rename meta-networking/recipes-connectivity/samba/{samba=5F4.8.4.bb =3D> s=
amba=5F4.8.11.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refu=
se-to-build-Samba-against-a-newer-minor-vers.patch b/meta-networking/recipe=
s-connectivity/samba/samba/0001-ldb-Refuse-to-build-Samba-against-a-newer-m=
inor-vers.patch
deleted file mode 100644
index 4c94831d7..000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0001-ldb-Refuse-to-b=
uild-Samba-against-a-newer-minor-vers.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 0bc8bc4143a58f91f6d7ce228b6763f377fdf45a Mon Sep 17 00:00:00 2001
-From: Andrew Bartlett <abartlet@samba.org>
-Date: Thu, 12 Jul 2018 12:34:56 +1200
-Subject: [PATCH] ldb: Refuse to build Samba against a newer minor version =
of
- ldb
-
-Samba is not compatible with new versions of ldb (except release versions)
-
-Other users would not notice the breakages, but Samba makes many
-more assuptions about the LDB internals than any other package.
-
-(Specifically, LDB 1.2 and 1.4 broke builds against released
-Samba versions)
-
-BUG: https://bugzilla.samba.org/show=5Fbug.cgi?id=3D13519
-
-Signed-off-by: Andrew Bartlett <abartlet@samba.org>
-Reviewed-by: Gary Lockyer <gary@catalyst.net.nz>
-(cherry picked from commit 52efa796538ae004ca62ea32fc8c833472991be6)
----
- lib/ldb/wscript | 32 ++++++++++++++++++++++----------
- 1 file changed, 22 insertions(+), 10 deletions(-)
-
-diff --git a/lib/ldb/wscript b/lib/ldb/wscript
-index d94086b..2bb0832 100644
---- a/lib/ldb/wscript
-+++ b/lib/ldb/wscript
-@@ -62,23 +62,33 @@ def configure(conf):
-     conf.env.standalone=5Fldb =3D conf.IN=5FLAUNCH=5FDIR()
-=20
-     if not conf.env.standalone=5Fldb:
-+        max=5Fldb=5Fversion =3D [int(x) for x in VERSION.split(".")]
-+        max=5Fldb=5Fversion[2] =3D 999
-+        max=5Fldb=5Fversion=5Fdots =3D "%d.%d.%d" % tuple(max=5Fldb=5Fver=
sion)
-+
-         if conf.env.disable=5Fpython:
--            if conf.CHECK=5FBUNDLED=5FSYSTEM=5FPKG('ldb', minversion=3DVE=
RSION,
--                                         onlyif=3D'talloc tdb tevent',
--                                         implied=5Fdeps=3D'replace talloc=
 tdb tevent'):
-+            if conf.CHECK=5FBUNDLED=5FSYSTEM=5FPKG('ldb',
-+                                             minversion=3DVERSION,
-+                                             maxversion=3Dmax=5Fldb=5Fver=
sion=5Fdots,
-+                                             onlyif=3D'talloc tdb tevent',
-+                                             implied=5Fdeps=3D'replace ta=
lloc tdb tevent'):
-                 conf.define('USING=5FSYSTEM=5FLDB', 1)
-         else:
-             using=5Fsystem=5Fpyldb=5Futil =3D True
--            if not conf.CHECK=5FBUNDLED=5FSYSTEM=5FPKG('pyldb-util', minv=
ersion=3DVERSION,
--                                             onlyif=3D'talloc tdb tevent',
--                                             implied=5Fdeps=3D'replace ta=
lloc tdb tevent ldb'):
-+            if not conf.CHECK=5FBUNDLED=5FSYSTEM=5FPKG('pyldb-util',
-+                                                 minversion=3DVERSION,
-+                                                 maxversion=3Dmax=5Fldb=
=5Fversion=5Fdots,
-+                                                 onlyif=3D'talloc tdb tev=
ent',
-+                                                 implied=5Fdeps=3D'replac=
e talloc tdb tevent ldb'):
-                 using=5Fsystem=5Fpyldb=5Futil =3D False
-=20
-             # We need to get a pyldb-util for all the python versions
-             # we are building for
-             if conf.env['EXTRA=5FPYTHON']:
-                 name =3D 'pyldb-util' + conf.all=5Fenvs['extrapython']['P=
YTHON=5FSO=5FABI=5FFLAG']
--                if not conf.CHECK=5FBUNDLED=5FSYSTEM=5FPKG(name, minversi=
on=3DVERSION,
-+                if not conf.CHECK=5FBUNDLED=5FSYSTEM=5FPKG(name,
-+                                                     minversion=3DVERSION,
-+                                                     maxversion=3Dmax=5Fl=
db=5Fversion=5Fdots,
-                                                      onlyif=3D'talloc tdb=
 tevent',
-                                                      implied=5Fdeps=3D're=
place talloc tdb tevent ldb'):
-                     using=5Fsystem=5Fpyldb=5Futil =3D False
-@@ -86,9 +96,11 @@ def configure(conf):
-             if using=5Fsystem=5Fpyldb=5Futil:
-                 conf.define('USING=5FSYSTEM=5FPYLDB=5FUTIL', 1)
-=20
--            if conf.CHECK=5FBUNDLED=5FSYSTEM=5FPKG('ldb', minversion=3DVE=
RSION,
--                                         onlyif=3D'talloc tdb tevent pyld=
b-util',
--                                         implied=5Fdeps=3D'replace talloc=
 tdb tevent'):
-+            if conf.CHECK=5FBUNDLED=5FSYSTEM=5FPKG('ldb',
-+                                             minversion=3DVERSION,
-+                                             maxversion=3Dmax=5Fldb=5Fver=
sion=5Fdots,
-+                                             onlyif=3D'talloc tdb tevent =
pyldb-util',
-+                                             implied=5Fdeps=3D'replace ta=
lloc tdb tevent'):
-                 conf.define('USING=5FSYSTEM=5FLDB', 1)
-=20
-     if conf.CONFIG=5FSET('USING=5FSYSTEM=5FLDB'):
---=20
-2.18.0
-
diff --git a/meta-networking/recipes-connectivity/samba/samba=5F4.8.4.bb b/=
meta-networking/recipes-connectivity/samba/samba=5F4.8.11.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba=5F4.8.4.bb
rename to meta-networking/recipes-connectivity/samba/samba=5F4.8.11.bb
index c3a94f204..8c08d1ed3 100644
--- a/meta-networking/recipes-connectivity/samba/samba=5F4.8.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba=5F4.8.11.bb
@@ -23,7 +23,6 @@ SRC=5FURI =3D "${SAMBA=5FMIRROR}/stable/samba-${PV}.tar.g=
z \
            file://dnsserver-4.7.0.patch \
            file://smb=5Fconf-4.7.0.patch \
            file://volatiles.03=5Fsamba \
-           file://0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-ver=
s.patch \
            "
 SRC=5FURI=5Fappend=5Flibc-musl =3D " \
            file://samba-pam.patch \
@@ -31,8 +30,8 @@ SRC=5FURI=5Fappend=5Flibc-musl =3D " \
            file://cmocka-uintptr=5Ft.patch \
           "
=20
-SRC=5FURI[md5sum] =3D "ca5bfbebd8d9eb95506e16594b2bbee2"
-SRC=5FURI[sha256sum] =3D "f5044d149e01894a08b1d114b8b69aed78171a7bb19608bd=
1fd771453b9a5406"
+SRC=5FURI[md5sum] =3D "de61611075e97ea98140a42d9189d9a5"
+SRC=5FURI[sha256sum] =3D "d294a8d7455d7d252d7bafc9c474855ea6e0ebe559c3babc=
d303a5c24e58710a"
=20
 UPSTREAM=5FCHECK=5FREGEX =3D "samba\-(?P<pver>4\.8(\.\d+)+).tar.gz"
=20
@@ -93,7 +92,7 @@ PACKAGECONFIG[libunwind] =3D ", , libunwind"
 # We are now at 4.7.0, so take the above with a grain of salt. We do not n=
eed to know where
 # krb5kdc is unless ad-dc is enabled, but we tell configure anyhow.
 #
-PACKAGECONFIG[ad-dc] =3D ",--without-ad-dc,,"
+PACKAGECONFIG[ad-dc] =3D "--with-experimental-mit-ad-dc,--without-ad-dc,,"
 PACKAGECONFIG[gnutls] =3D "--enable-gnutls,--disable-gnutls,gnutls,"
 PACKAGECONFIG[mitkrb5] =3D "--with-system-mitkrb5 --with-system-mitkdc=3D/=
usr/sbin/krb5kdc,,krb5,"
=20
--=20
2.21.0



