Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 989FC60107
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 19:45:56 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so42206877wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=k4+kvh+pxCZM53wxpAb/tphJiZ3RK4waJ7JWo2wvkwo=;
	b=WQPIpwRkPs48xqAno+b66azENQ6WcLH7Wu+ti/m70EWWxsV2Z63YnkFxpnQFpchWkd
	gNzB/PBA2TpePseZNOPoWb0vFsE8G1MdsI4yGXnPWaCRpaqUCHAK/j23554IzYYnCKU2
	aVukRZ+/tMGa2yBS3EoyDMoJe2avdQpu6Zzws6k9N+7KQfDAs5Nr3SDlfb5cQD5vdTgi
	kKbeMYuJ639iY6xHYQDjDfQ3cd+VlEBxm1Aw37xeJkTo/Q5nJ1Hql6U3GB8B8had+Ort
	EYO7muzRz/oZcGMyH6iyLnGRDANqnPBkv3uAygbgdJUFn//C9idKVYjoKEXAcCDLbyul
	HWUQ==
X-Received: by 10.28.176.200 with SMTP id z191mr13839968wme.102.1447962356800; 
	Thu, 19 Nov 2015 11:45:56 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	d66sm35625971wma.21.2015.11.19.11.45.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 11:45:56 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <8F3E8485-A462-4A0B-AC31-2F3D546D3FB7@gmail.com>
Date: Thu, 19 Nov 2015 20:45:56 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-networking][PATCH 4/6] libldb: allow chosing ldap dependency instead of hard requiring it
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
X-List-Received-Date: Thu, 19 Nov 2015 19:45:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Add a patch to remove the check for openldap but mark prove result =
negative unless
ldap dependency is enabled explicitely.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libldb/libldb/avoid-openldap-unless-wanted.patch        | 13 =
+++++++++++++
 meta-networking/recipes-support/libldb/libldb_1.1.17.bb     |  6 ++++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 =
meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-wanted=
.patch

diff --git =
a/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-want=
ed.patch =
b/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-want=
ed.patch
new file mode 100644
index 0000000..8ab094f
--- /dev/null
+++ =
b/meta-networking/recipes-support/libldb/libldb/avoid-openldap-unless-want=
ed.patch
@@ -0,0 +1,13 @@
+--- a/wscript	2015-11-18 12:43:33.000000000 +0100
++++ b/wscript	2015-11-18 12:46:25.000000000 +0100
+@@ -58,9 +58,7 @@
+     if conf.env.standalone_ldb:
+         conf.CHECK_XSLTPROC_MANPAGES()
+=20
+-        # we need this for the ldap backend
+-        if conf.CHECK_FUNCS_IN('ber_flush ldap_open ldap_initialize', =
'lber ldap', headers=3D'lber.h ldap.h'):
+-            conf.env.ENABLE_LDAP_BACKEND =3D True
++        conf.env.ENABLE_LDAP_BACKEND =3D False
+=20
+         # we don't want any libraries or modules to rely on runtime
+         # resolution of symbols
diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.17.bb =
b/meta-networking/recipes-support/libldb/libldb_1.1.17.bb
index e587858..2e708a5 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.17.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.17.bb
@@ -3,14 +3,16 @@ HOMEPAGE =3D "http://ldb.samba.org"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-3.0+ & LGPL-2.1+ & GPL-3.0+"
=20
-DEPENDS +=3D "libtdb libtalloc libtevent popt"
-RDEPENDS_${PN} +=3D "openldap"
+DEPENDS +=3D "libbsd libtdb libtalloc libtevent popt"
 RDEPENDS_pyldb +=3D "python"
=20
 SRC_URI =3D "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://do-not-import-target-module-while-cross-compile.patch =
\
           "
=20
+PACKAGECONFIG[ldap] =3D ",,openldap"
+SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ldap', '', =
'file://avoid-openldap-unless-wanted.patch', d)}"
+
 LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=3Dbfccfe952269=
fff2b407dd11f2f3083b \
                     =
file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=3D1a6d268fd2186=
75ffea8be556788b780 \
                     =
file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=3Dc79ff39f19dfec=
6d293b95dea7b07891"
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


