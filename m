Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1313076294
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:22:12 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so28624349wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=6QS2wkr/2CmO3GRDxV3jYPQvPU6W/TwieRNC8REYpKU=;
	b=gW3eChi1Sdd4cXd1KVPh3UrXjvQTIbwKZ/u2HNDdXPFug9slBvKQC9UvmENcsITaZ7
	tMg8gWB2ZwjUkwyQrTY//w+wVUcqsf/ZSWhm5KEx6xpqMnYVwDoONCUhctg+EM7LoRgJ
	2PcBF7276AJ5qhzYXlmgHWrwGDsZMirIRHtF/Uu+mHzXPNDLMLO/rxfb3a2BpDpSppIZ
	Q4CkYbAts/Qfo6+mFxvzgTaN3VrYhLENH94shJn9621PKOfxTg+xURmnnDyaEEEPEUNs
	P7R+zlJfEuBZHLLxzuJYABxrU41uMWQnNIgdCXKSS0yFkKwc2MnA48igLGaI75PnBpIF
	/j8Q==
X-Received: by 10.194.189.68 with SMTP id gg4mr5948390wjc.146.1447190530102;
	Tue, 10 Nov 2015 13:22:10 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id v9sm5526291wjv.45.2015.11.10.13.22.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 13:22:09 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Date: Tue, 10 Nov 2015 22:22:08 +0100
Message-Id: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: =?utf-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: [meta-oe][PATCH 1/3] samba: fix dependencies and QA issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 21:22:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Fix remaining QA issues (dependency-wise) like

  WARNING: QA Issue: samba rdepends on libacl, but it isn't a build =
dependency? [build-deps]
  WARNING: QA Issue: samba rdepends on libavahi-client, but it isn't a =
build dependency? [build-deps]

broken perl library path, having a default PACKAGECONFIG, but allow
user-defined one and rely on PACKAGECONFIG instead of DISTRO_FEATURES.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb | 32 =
++++++++++++++--------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
index af2cc1f..9e86e89 100644
--- a/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
@@ -38,26 +38,36 @@ SRC_URI =3D =
"${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
 SRC_URI[md5sum] =3D "232016d7581a1ba11e991ec2674553c4"
 SRC_URI[sha256sum] =3D =
"033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274fc29898"
=20
-inherit systemd waf-samba
+inherit systemd waf-samba cpan-base perlnative
=20
-DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb =
libtevent libldb krb5 ctdb cups"
-RDEPENDS_${PN} +=3D "openldap"
+DEPENDS +=3D "readline virtual/libiconv zlib popt talloc libtdb =
libtevent libldb krb5 ctdb"
+RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'lsb', =
'lsb', '', d)}"
=20
-PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', =
'', d)}"
-PACKAGECONFIG +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)}"
+PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', =
'', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'sysvinit', =
'lsb', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'zeroconf', =
'zeroconf', '', d)} \
+                   acl aio cups ldap \
+"
=20
-PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[acl] =3D "--with-acl-support,---without-acl-support,acl"
+PACKAGECONFIG[aio] =3D =
"--with-aio-support,---without-aio-support,libaio"
 PACKAGECONFIG[fam] =3D "--with-fam,--without-fam,gamin"
+PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[lsb] =3D ",,lsb"
+PACKAGECONFIG[cups] =3D "--enable-cups,--disable-cups,cups"
+PACKAGECONFIG[ldap] =3D "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
+PACKAGECONFIG[zeroconf] =3D "--enable-avahi,--disable-avahi,avahi"
=20
 =
SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb=
2"
=
-SAMBA4_PDB_MODULES=3D"pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_s=
am,pdb_samba4"
+SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', =
'ldap', 'pdb_ldap,', '', =
d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
 =
SAMBA4_AUTH_MODULES=3D"auth_unix,auth_wbc,auth_server,auth_netlogond,auth_=
script,auth_samba4"
 =
SAMBA4_MODULES=3D"${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_A=
UTH_MODULES}"
=20
 =
SAMBA4_LIBS=3D"heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!teven=
t,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
=20
-PERL_VERNDORLIB=3D"${datadir}/perl5/vendor_perl/"
+PERL_VERNDORLIB=3D"${libdir}/perl5/vendor_perl/${PERLVERSION}"
=20
 EXTRA_OECONF +=3D "--enable-fhs \
                  --with-piddir=3D${localstatedir}/run \
@@ -85,7 +95,7 @@ LDFLAGS +=3D "-Wl,-z,relro,-z,now"
 do_install_append() {
     rmdir --ignore-fail-on-non-empty "${D}/${localstatedir}/run"
=20
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', =
'false', d)}; then
+    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', =
'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
         for i in nmb smb winbind; do
             install -m 0644 packaging/systemd/$i.service =
${D}${systemd_unitdir}/system
@@ -97,7 +107,7 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	echo "d ${localstatedir}/log/samba 0755 root root -" \
             > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
-    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', =
'false', d)}; then
+    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', =
d)}; then
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
 	update-rc.d -r ${D} samba.sh start 20 3 5 .
@@ -160,4 +170,4 @@ FILES_${PN}-python-dbg =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/.d
                           =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/.debug/* =
\
                          "
=20
-FILES_${PN}-pidl =3D "${datadir}/perl5/vendor_perl/*"
+FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
--=20
1.9.1

fighting with missing lsb on target and needless openldap and cups, I =
decided to give a larger cleanup a chance :)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


