Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A4BD56010D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 19:46:55 +0000 (UTC)
Received: by wmec201 with SMTP id c201so42272995wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 11:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=0OANynkqwQTpPbqbdm/eSGNNZJWlZ1FQeAsNs0hlktc=;
	b=qh5r9OuEdczVvYflAR0uhbg3Dc2WetZOq9Ga9aTgqBzU5ZpG5/Jua13epEwSf5b0lK
	sBEVD72CREHiCHkKhMEviFHLIpLImLOAFVbnDk4mHPBeiPfpxzDkzPBd6cI5ywFsfSz1
	Fp7nLjDH1KQtu/8Tz/fI0CPXfISzbqwnCRoq6rEdRKv18DOqtHMSf66CMZJkbSoAJg5P
	6JNWsmDzgQPmvk3aacO9vaLJemKsv6mZjmQZ6HzhYpMTONZ4i/kC2Uny+X7k3wpPAfh6
	Ew8YJBLqWxKr0GFZ+Iq/Q7yiCT62ckfmxUQyeg+KCy/sIkhMLZM6Ro9GaEhakxtrbTK6
	Eh4A==
X-Received: by 10.28.100.69 with SMTP id y66mr18474476wmb.98.1447962416306;
	Thu, 19 Nov 2015 11:46:56 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	d66sm35625971wma.21.2015.11.19.11.46.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Nov 2015 11:46:55 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <A55F13DE-9BA1-43A9-955E-A4D3FA28F47B@gmail.com>
Date: Thu, 19 Nov 2015 20:46:55 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-networking][PATCH 6/6] samba: make cyrus-sasl optional
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
X-List-Received-Date: Thu, 19 Nov 2015 19:46:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since waf doesn't allow override check results via environment, a patch
is needed to remove the bad check when an optional feature is unwanted.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../samba/samba-4.1.12/21-avoid-sasl-unless-wanted.patch       | 10 =
++++++++++
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb     |  6 =
++++--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 =
meta-networking/recipes-connectivity/samba/samba-4.1.12/21-avoid-sasl-unle=
ss-wanted.patch

diff --git =
a/meta-networking/recipes-connectivity/samba/samba-4.1.12/21-avoid-sasl-un=
less-wanted.patch =
b/meta-networking/recipes-connectivity/samba/samba-4.1.12/21-avoid-sasl-un=
less-wanted.patch
new file mode 100644
index 0000000..4254e11
--- /dev/null
+++ =
b/meta-networking/recipes-connectivity/samba/samba-4.1.12/21-avoid-sasl-un=
less-wanted.patch
@@ -0,0 +1,10 @@
+--- ./source4/auth/wscript_configure.orig	2015-11-19 =
19:53:11.022212181 +0100
++++ ./source4/auth/wscript_configure	2015-11-19 19:53:17.466212205 =
+0100
+@@ -2,7 +2,3 @@
+=20
+ conf.CHECK_HEADERS('security/pam_appl.h')
+ conf.CHECK_FUNCS_IN('pam_start', 'pam', checklibc=3DTrue)
+-
+-if (conf.CHECK_HEADERS('sasl/sasl.h') and
+-    conf.CHECK_FUNCS_IN('sasl_client_init', 'sasl2')):
+-    conf.DEFINE('HAVE_SASL', 1)
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index a2d3a2c..75cf5d2 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -40,8 +40,7 @@ SRC_URI[sha256sum] =3D =
"033604674936bf5c77d7df299b0626052b84a41505a6a6afe902f6274f
=20
 inherit systemd waf-samba cpan-base perlnative
=20
-DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb =
libtevent libldb krb5 ctdb libbsd cyrus-sasl"
-
+DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb =
libtevent libldb krb5 ctdb libbsd"
=20
 SYSVINITTYPE_linuxstdbase =3D "lsb"
 SYSVINITTYPE =3D "sysv"
@@ -62,10 +61,13 @@ PACKAGECONFIG[pam] =3D "--with-pam =
--with-pam_smbpass --with-pammodulesdir=3D${base_
 PACKAGECONFIG[lsb] =3D ",,lsb"
 PACKAGECONFIG[cups] =3D "--enable-cups,--disable-cups,cups"
 PACKAGECONFIG[ldap] =3D "--with-ldap,--without-ldap,openldap"
+PACKAGECONFIG[sasl] =3D ",,cyrus-sasl"
 PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
 PACKAGECONFIG[dmapi] =3D "--with-dmapi,--without-dmapi,dmapi"
 PACKAGECONFIG[zeroconf] =3D "--enable-avahi,--disable-avahi,avahi"
=20
+SRC_URI +=3D "${@bb.utils.contains('PACKAGECONFIG', 'sasl', '', =
'file://21-avoid-sasl-unless-wanted.patch', d)}"
+
 =
SAMBA4_IDMAP_MODULES=3D"idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb=
2"
 SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', =
'ldap', 'pdb_ldap,', '', =
d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
 =
SAMBA4_AUTH_MODULES=3D"auth_unix,auth_wbc,auth_server,auth_netlogond,auth_=
script,auth_samba4"
--=20
1.9.1

--=20
Jens Rehsack - rehsack@gmail.com


