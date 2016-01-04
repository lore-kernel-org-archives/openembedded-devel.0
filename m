Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B69E4731A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:21:47 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f206so150283250wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 10:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=Fe8CXYFflIphRcTndGDHmZ/AdZxF92DnTBk8aC3kQHw=;
	b=YAzKN++c/8nDo9urczg6eoOfDyxoGms/7jQ5RfgfX6AMFK9UYXvyf9QuFtoco1lOfr
	HQZRY4MId7+BahfRbNcb3by54x0NIgehzWzc4yZtS6h5ikShiMLo5Jy9W/WyNlUbUhGM
	xX+yK9N3IwJl7CWnmKhN9cFbQW2Zn1GLf3VNmbMAVV8nC/3ZDuYogTSgtn6HsRr3iuhp
	HEW0JxPkUZsEYzeJPJ9a4qPKWdzRBTt876AT/FD/gR+UGSKHmEShdxldOFDsfleVcmj3
	/EQTTxGLBbh5q6yoak7CYoxSgb2U5nEzXKUiNPfVrW4E5sUomlKUU2KtFgnYF7Bf/hH5
	KqKA==
X-Received: by 10.28.94.1 with SMTP id s1mr96502012wmb.60.1451931707986;
	Mon, 04 Jan 2016 10:21:47 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	q129sm44887053wmd.14.2016.01.04.10.21.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 10:21:47 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Mon, 4 Jan 2016 19:21:45 +0100
Message-Id: <FA0361B1-63D8-4713-96BD-169202D7F68F@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [meta-networking][PATCH] samba: split packages similar to samba3
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
X-List-Received-Date: Mon, 04 Jan 2016 18:21:48 -0000
X-Groupsio-MsgNum: 59322
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7537551B-715C-4483-AD23-B5D3220F4E7D";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_7537551B-715C-4483-AD23-B5D3220F4E7D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Since entire samba4 package is around 25MB, trying to save some space by
splitting the package into several ones logically grouped as they were
at samba3 in fido.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-connectivity/samba/samba_4.1.12.bb     | 161 =
+++++++++++++++++++--
 1 file changed, 149 insertions(+), 12 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index 75cf5d2..5b343f2 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -52,7 +52,7 @@ PACKAGECONFIG ??=3D =
"${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    acl aio cups ldap \
 "

-RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'lsb', =
'lsb', '', d)}"
+RDEPENDS_${PN}-base +=3D "${@bb.utils.contains('PACKAGECONFIG', 'lsb', =
'lsb', '', d)}"

 PACKAGECONFIG[acl] =3D "--with-acl-support,---without-acl-support,acl"
 PACKAGECONFIG[aio] =3D =
"--with-aio-support,---without-aio-support,libaio"
@@ -78,8 +78,8 @@ =
SAMBA4_LIBS=3D"heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!teven=
t,!pytev
 PERL_VERNDORLIB=3D"${libdir}/perl5/vendor_perl/${PERLVERSION}"

 EXTRA_OECONF +=3D "--enable-fhs \
-                 --with-piddir=3D${localstatedir}/run \
-                 --with-sockets-dir=3D${localstatedir}/run/samba \
+                 --with-piddir=3D/run \
+                 --with-sockets-dir=3D/run/samba \
                  --with-modulesdir=3D${libdir}/samba \
                  --with-lockdir=3D${localstatedir}/lib/samba \
                  --with-cachedir=3D${localstatedir}/lib/samba \
@@ -100,7 +100,8 @@ EXTRA_OECONF +=3D "--enable-fhs \
 LDFLAGS +=3D "-Wl,-z,relro,-z,now"

 do_install_append() {
-    rmdir --ignore-fail-on-non-empty "${D}/${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}/run/samba"
+    rmdir --ignore-fail-on-non-empty "${D}/run"

     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', =
'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
@@ -138,16 +139,151 @@ do_install_append() {
 }

 PACKAGES +=3D "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind =
libwinbind-dbg libwinbind-krb5-locator"
+PACKAGES =3D+ "libwbclient libnss-winbind winbind winbind-dbg libnetapi =
libsmbsharemodes \
+             libsmbclient libsmbclient-dev lib${PN}-base ${PN}-base"

-FILES_${PN} +=3D "/run \
-                ${base_libdir}/security/pam_smbpass.so \
+RDEPENDS_${PN} +=3D "${PN}-base"
+
+FILES_${PN}-base =3D "${sbindir}/nmbd \
+                    ${sbindir}/smbd \
+                    ${sysconfdir}/init.d \
+                    ${localstatedir}/lib/samba \
+                    ${localstatedir}/log/samba \
+                    ${localstatedir}/nmbd \
+                    ${localstatedir}/spool/samba \
+"
+
+# figured out by
+# =
FILES=3D"tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/samba/4.1.12-r0/i=
mage/usr/sbin/smbd =
tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/samba/4.1.12-r0/image/usr/=
sbin/nmbd"
+#
+# while [ "${FILES}" !=3D "${OLDFILES}" ]
+# do
+#     OLDFILES=3D"${FILES}"
+#     =
NEEDED=3D`tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi.gcc=
-cross-initial-arm/gcc/arm-poky-linux-gnueabi/5.2.0/objdump -x ${FILES} =
| grep NEEDED | egrep -E 'so(.[0-9]|$)' | sort -u | perl -MData::Dumper =
-le 'while (<>) {chomp; push @lib, (split)[1]}; print "(", join("|", =
@lib), ")"'`
+#     NF=3D`find =
tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/samba/4.1.12-r0/image/usr/=
lib -type f | egrep "${NEEDED}" | sort -u`
+#
+#     FILES=3D`perl -le 'foreach (@ARGV) { $f{$_}++ }; print join(" ", =
sort keys %f)' ${FILES} ${NF}`
+# done
+#
+# LIBS=3D`echo ${FILES} | sed -e =
's,tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/samba/4.1.12-r0/image/u=
sr/lib,${libdir},g' -e 's,.so.[0-9]+.*$,.so.*,g'`
+# for l in ${LIBS}
+# do
+#     echo $l
+# done
+
+FILES_lib${PN}-base =3D "\
+                    ${sysconfdir}/default \
+                    ${sysconfdir}/samba \
+                    ${libdir}/libdcerpc-binding.so.* \
+                    ${libdir}/libgensec.so.* \
+                    ${libdir}/libndr-krb5pac.so.* \
+                    ${libdir}/libndr-nbt.so.* \
+                    ${libdir}/libndr-standard.so.* \
+                    ${libdir}/libndr.so.* \
+                    ${libdir}/libnetapi.so.* \
+                    ${libdir}/libpdb.so.* \
+                    ${libdir}/libsamba-credentials.so.* \
+                    ${libdir}/libsamba-hostconfig.so.* \
+                    ${libdir}/libsamba-util.so.* \
+                    ${libdir}/libsamdb.so.* \
+                    ${libdir}/libsmbconf.so.* \
+                    ${libdir}/libtevent-util.so.* \
+                    ${libdir}/samba/libCHARSET3.so \
+                    ${libdir}/samba/libaddns.so \
+                    ${libdir}/samba/libads.so \
+                    ${libdir}/samba/libasn1util.so \
+                    ${libdir}/samba/libauth.so \
+                    ${libdir}/samba/libauth_sam_reply.so \
+                    ${libdir}/samba/libauthkrb5.so \
+                    ${libdir}/samba/libccan.so \
+                    ${libdir}/samba/libcli-ldap-common.so \
+                    ${libdir}/samba/libcli-nbt.so \
+                    ${libdir}/samba/libcli_cldap.so \
+                    ${libdir}/samba/libcli_smb_common.so \
+                    ${libdir}/samba/libcli_spoolss.so \
+                    ${libdir}/samba/libcliauth.so \
+                    ${libdir}/samba/libdbwrap.so \
+                    ${libdir}/samba/libdcerpc-samba.so \
+                    ${libdir}/samba/liberrors.so \
+                    ${libdir}/samba/libflag_mapping.so \
+                    ${libdir}/samba/libgse.so \
+                    ${libdir}/samba/libinterfaces.so \
+                    ${libdir}/samba/libkrb5samba.so \
+                    ${libdir}/samba/libldbsamba.so \
+                    ${libdir}/samba/liblibcli_lsa3.so \
+                    ${libdir}/samba/liblibcli_netlogon3.so \
+                    ${libdir}/samba/liblibsmb.so \
+                    ${libdir}/samba/libmsrpc3.so \
+                    ${libdir}/samba/libndr-samba.so \
+                    ${libdir}/samba/libndr-samba4.so \
+                    ${libdir}/samba/libnpa_tstream.so \
+                    ${libdir}/samba/libntdb.so.* \
+                    ${libdir}/samba/libpopt_samba3.so \
+                    ${libdir}/samba/libprinting_migrate.so \
+                    ${libdir}/samba/libsamba-modules.so \
+                    ${libdir}/samba/libsamba-security.so \
+                    ${libdir}/samba/libsamba-sockets.so \
+                    ${libdir}/samba/libsamba3-util.so \
+                    ${libdir}/samba/libsamdb-common.so \
+                    ${libdir}/samba/libsecrets3.so \
+                    ${libdir}/samba/libserver-role.so \
+                    ${libdir}/samba/libsmb_transport.so \
+                    ${libdir}/samba/libsmbd_base.so \
+                    ${libdir}/samba/libsmbd_conn.so \
+                    ${libdir}/samba/libsmbd_shim.so \
+                    ${libdir}/samba/libsmbregistry.so \
+                    ${libdir}/samba/libtdb-wrap.so \
+                    ${libdir}/samba/libutil_cmdline.so \
+                    ${libdir}/samba/libutil_ntdb.so \
+                    ${libdir}/samba/libutil_reg.so \
+                    ${libdir}/samba/libutil_setid.so \
+                    ${libdir}/samba/libutil_tdb.so \
+                    ${libdir}/samba/pdb/smbpasswd.so \
+                    ${libdir}/samba/pdb/tdbsam.so \
+                    ${libdir}/samba/pdb/wbc_sam.so \
+"
+
+FILES_winbind-dbg =3D "${libdir}/idmap/.debug/*.so \
+                     ${libdir}/security/.debug/pam_winbind.so \
+"
+
+FILES_${PN} +=3D "${libdir}/vfs/*.so \
+                ${libdir}/charset/*.so \
+                ${libdir}/*.dat \
+                ${libdir}/auth/*.so \
+                ${libdir}/security/pam_smbpass.so \
+"
+
+FILES_${PN}-dbg +=3D "${libdir}/vfs/.debug/*.so \
+                    ${libdir}/charset/.debug/*.so \
+                    ${libdir}/auth/.debug/*.so \
+                    ${libdir}/security/.debug/pam_smbpass.so \
+"
+
+FILES_libwbclient =3D "${libdir}/libwbclient.so.* =
${libdir}/samba/libwinbind-client.so"
+FILES_libnetapi =3D "${libdir}/libnetapi.so.*"
+FILES_libsmbsharemodes =3D "${libdir}/libsmbsharemodes.so.*"
+FILES_libsmbclient =3D "${libdir}/libsmbclient.so.*"
+FILES_libsmbclient-dev =3D "${libdir}/libsmbclient.so ${includedir}"
+FILES_winbind =3D "${sbindir}/winbindd \
+                 ${bindir}/wbinfo \
+                 ${bindir}/ntlm_auth \
+                 ${sysconfdir}/init.d/winbind \
+                 ${systemd_unitdir}/system/winbind.service \
+"
+
+FILES_libnss-winbind =3D "${libdir}/libnss_*${SOLIBS} \
+                        ${libdir}/nss_info \
+"
+
+FILES_${PN} +=3D "${base_libdir}/security/pam_smbpass.so \
                 ${libdir}/tmpfiles.d/* \
-               "
+"

 SMB_SERVICE=3D"${systemd_unitdir}/system/nmb.service =
${systemd_unitdir}/system/smb.service"
 SMB_SYSV=3D"${sysconfdir}/init.d ${sysconfdir}/rc?.d"
-FILES_${PN} +=3D"${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'${SMB_SERVICE}', '', d)}"
-FILES_${PN} +=3D"${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', =
'${SMB_SYSV}', '', d)}"
+FILES_${PN}-base +=3D"${@bb.utils.contains('DISTRO_FEATURES', =
'systemd', '${SMB_SERVICE}', '', d)}"
+FILES_${PN}-base +=3D"${@bb.utils.contains('DISTRO_FEATURES', =
'sysvinit', '${SMB_SYSV}', '', d)}"

 FILES_${PN}-dbg +=3D "${libdir}/samba/idmap/.debug/* \
                     ${libdir}/samba/pdb/.debug/* \
@@ -156,7 +292,7 @@ FILES_${PN}-dbg +=3D "${libdir}/samba/idmap/.debug/* =
\
                     ${libdir}/samba/ldb/.debug/* \
                     ${libdir}/samba/vfs/.debug/* \
                     ${base_libdir}/security/.debug/pam_smbpass.so \
-                   "
+"

 FILES_libwinbind =3D "${base_libdir}/security/pam_winbind.so"
 FILES_libwinbind +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'systemd', '${systemd_unitdir}/system/winbind.service', '', d)}"
@@ -175,11 +311,12 @@ FILES_${PN}-python =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.so \
                       =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/samba3/*.so \
                       =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/tests/* \
                       =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/web_server/* \
-                     "
+"
+
 FILES_${PN}-python-dbg =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug/* \
                           =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/.debug/* \
                           =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/samba3/.debug/* =
\
                           =
${libdir}/python${PYTHON_BASEVERSION}/site-packages/samba/dcerpc/.debug/* =
\
-                         "
+"

 FILES_${PN}-pidl =3D "${bindir}/pidl ${PERL_VERNDORLIB}/*"
--
1.9.1


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_7537551B-715C-4483-AD23-B5D3220F4E7D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWirg6AAoJEESZlq7c5Qqd0iAP/j6Sz0bWTcedEjjDQe2DVGPC
vrD+XB7MIPqcLMjolw27DWzRttgBxAfQetcZzUNpfW/CZeN13t+pbud9VaHbMJh5
foSs4WRMXidcAkId4vQRpasLJMBsUQ7MpqKAQqOAToaZWdJq/8BuR0Z5jFufMcEd
e+2314/m17imJDp6vPtnjyeFSczbUOKGzrKfSTv1HALy1wbtRq9YkHqksscBIHID
q9XyBBuBokryLxlPpUwlUg14wn+K07NtGfgppWrBZ+lLAYbLGPrzXrqtSFmS2naw
q3ooLFDXBIdYDuYQub2v89jNS3wFKZmBWwBRIcjZV07KrPxFCoO4PNWTT/cWlYPr
RBJy13ZrK+O4Q7sfESn6KXVAweJcHXcSAKAWWhO8gYLxUFVdC43XM9sGVoYgQOBY
E4ybPHRKxvHX892NPIw3twxC3ywG5K7wew++TnUcfr1swjkXZeAXz3fATGgGehEb
+nyxrCj1OUadRKEZbtL+NMJ3N+oIOW9BhObZLj/z7+x9tzvLVGg41SaGF2roWybV
TQZQQRMFNmmNT0SY2+hOF54+pjTYJhR1vvdoK1K74CJtN8H/CscgNrwE3ZDis2gC
7IZCiLu4gD5rN4cI2wzH4RritXw4v36Cm8sUKYCsQIy5SU9b4MjD8griXhcY0czd
YOQdXvbxtoUygo0bxnP/
=jdx3
-----END PGP SIGNATURE-----

--Apple-Mail=_7537551B-715C-4483-AD23-B5D3220F4E7D--
