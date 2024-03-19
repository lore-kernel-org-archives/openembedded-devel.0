Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6B6C54E68
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 09:09:58 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.10543.1710839391776450099
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 02:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id D00556FAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 10:09:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.144]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmVTb-0zhHLm0; Tue, 19 Mar 2024 10:09:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] tracker-miners: update 3.6.2 -> 3.7.0
Date: Tue, 19 Mar 2024 10:10:09 +0100
Message-ID: <20240319091009.334076-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319091009.334076-1-f_l_k@t-online.de>
References: <20240319091009.334076-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710839384-CA7FBDC7-4ABE7970/0/0 CLEAN NORMAL
X-TOI-MSGID: 263bd1b4-e5fa-49cb-9d03-a65607f503bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 09:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109474

- add PACKAGECONFIG for landlock to disable it by default. landlock sandb=
oxing would
  be required to be supported by the kernel
- update 0001-fix-reproducibility.patch
- add missing files in datadir
- strip buildpath from the installed binary and fix the package_qa error =
it causes
  with INSANE_SKIP

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-fix-reproducibility.patch            | 27 -------------------
 ...iners_3.6.2.bb =3D> tracker-miners_3.7.0.bb} | 12 ++++++---
 2 files changed, 9 insertions(+), 30 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.6.2.bb =3D> tr=
acker-miners_3.7.0.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-rep=
roducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001=
-fix-reproducibility.patch
index dd5525616..c6b07dc6c 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducib=
ility.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducib=
ility.patch
@@ -39,21 +39,6 @@ index 935584185..aa6126081 100644
 =20
  # We use tracker-miners-3.0 rather than tracker3-miners inside the lib6=
4
  # directory, following the existing convention in that directory.
-@@ -421,10 +421,10 @@ tracker_writeback_modules_dir =3D join_paths(get_o=
ption('prefix'), get_option('lib
- tracker_extract_rules_dir =3D join_paths(get_option('prefix'), get_opti=
on('datadir'), tracker_versioned_name, 'extract-rules')
- tracker_miner_services_dir =3D join_paths(get_option('prefix'), get_opt=
ion('datadir'), tracker_versioned_name, 'miners')
-=20
--tracker_uninstalled_cli_subcommands_dir =3D meson.current_build_dir() /=
 'src' / 'tracker' / 'subcommands'
--tracker_uninstalled_extract_rules_dir =3D join_paths(meson.current_buil=
d_dir(), 'src', 'tracker-extract', 'uninstalled-rules')
--tracker_uninstalled_writeback_modules_dir =3D join_paths(meson.current_=
build_dir(), 'src', 'tracker-writeback')
--uninstalled_tracker_extract_path =3D join_paths(meson.current_build_dir=
(), 'src', 'tracker-extract', 'tracker-extract-3')
-+tracker_uninstalled_cli_subcommands_dir =3D '/usr/src/debug/tracker/src=
/tracker/subcommands'
-+tracker_uninstalled_extract_rules_dir =3D join_paths('usr', 'src', 'deb=
ug', 'tracker', 'src', 'tracker-extract', 'uninstalled-rules')
-+tracker_uninstalled_writeback_modules_dir =3D join_paths('usr', 'src', =
'debug', 'tracker', 'src', 'tracker-writeback')
-+uninstalled_tracker_extract_path =3D join_paths('usr', 'src', 'debug', =
'tracker', 'src', 'tracker-extract', 'tracker-extract-3')
-=20
- gsettings_schema_dir =3D join_paths(get_option('prefix'), get_option('d=
atadir'), 'glib-2.0', 'schemas')
- po_dir =3D join_paths(meson.current_source_dir(), 'po')
 @@ -438,8 +438,8 @@ subdir('data')
  subdir('docs')
 =20
@@ -65,18 +50,6 @@ index 935584185..aa6126081 100644
  ]
 =20
  if get_option('tests_tap_protocol')
-@@ -454,9 +454,9 @@ run_uninstalled_conf =3D configuration_data()
- run_uninstalled_conf.set('tracker_sparql_uninstalled_dir', tracker_spar=
ql_uninstalled_dir)
- run_uninstalled_conf.set('tracker_uninstalled_cli_dir', tracker_uninsta=
lled_cli_dir)
- run_uninstalled_conf.set('tracker_uninstalled_cli_subcommands_dir', tra=
cker_uninstalled_cli_subcommands_dir)
--run_uninstalled_conf.set('tracker_uninstalled_domain_rule', meson.curre=
nt_build_dir() / 'tests' / 'functional-tests' / 'config' / 'test-domain.r=
ule')
-+run_uninstalled_conf.set('tracker_uninstalled_domain_rule', '/usr/src/d=
ebug/tracker/tests/functional-tests/config/test-domain.rule')
- run_uninstalled_conf.set('tracker_uninstalled_extract_rules_dir', track=
er_uninstalled_extract_rules_dir)
--run_uninstalled_conf.set('tracker_uninstalled_extractors_dir', meson.cu=
rrent_build_dir() / 'src' / 'tracker-extract')
-+run_uninstalled_conf.set('tracker_uninstalled_extractors_dir', '/usr/sr=
c/debug/tracker/src/tracker-extract')
- run_uninstalled_conf.set('tracker_uninstalled_miner_services_dir', trac=
ker_uninstalled_miner_services_dir)
- run_uninstalled_conf.set('tracker_uninstalled_testutils_dir', tracker_u=
ninstalled_testutils_dir)
- run_uninstalled_conf.set('tracker_uninstalled_writeback_modules_dir', t=
racker_uninstalled_writeback_modules_dir)
 diff --git a/src/tracker-extract/meson.build b/src/tracker-extract/meson=
.build
 index 4aaad5c41..d17cce221 100644
 --- a/src/tracker-extract/meson.build
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
index 2be6beacb..dfebd0d2e 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
@@ -19,7 +19,7 @@ SRC_URI:append =3D " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch =
\
 "
-SRC_URI[archive.sha256sum] =3D "0ad722f3d532c21d757cf488f942960679ea8f45=
7925efa97656ed4c9e9ba4ff"
+SRC_URI[archive.sha256sum] =3D "74e796c1625094a8a2175993c7907281e97ab6e0=
02578e846b8f4ca44e36bf61"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
@@ -62,6 +62,7 @@ PACKAGECONFIG[tiff]       =3D "-Dtiff=3Denabled,-Dtiff=3D=
disabled,tiff"
 PACKAGECONFIG[raw]       =3D "-Draw=3Denabled,-Draw=3Ddisabled,libraw"
 PACKAGECONFIG[xml]        =3D "-Dxml=3Denabled,-Dxml=3Ddisabled,libxml2"
 PACKAGECONFIG[networkmanager] =3D "-Dnetwork_manager=3Denabled,-Dnetwork=
_manager=3Ddisabled,networkmanager"
+PACKAGECONFIG[landlock]        =3D "-Dlandlock=3Denabled,-Dlandlock=3Ddi=
sabled"
=20
 # For security reasons it is strongly recommended to set add meta-securi=
ty in
 # your layers and 'libseccomp' to PACKAGECONFIG".
@@ -75,9 +76,14 @@ EXTRA_OEMESON +=3D " \
     -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
 "
=20
+do_install:append() {
+    sed -i -e 's|${B}||g' ${D}${libexecdir}/tracker-miner-fs-3
+}
+
 FILES:${PN} +=3D " \
-    ${datadir}/dbus-1 \
-    ${datadir}/tracker3-miners \
+    ${datadir} \
     ${libdir}/tracker-miners-3.0 \
     ${systemd_user_unitdir} \
 "
+
+INSANE_SKIP:${PN} =3D "already-stripped"
--=20
2.44.0


