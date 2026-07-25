Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D243C531F9
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 09:45:21 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36935.1784972716825889768
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2026 02:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=XZBBPzV9;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout11.t-online.de (Postfix) with SMTP id A3FCF1C2C6
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2026 11:45:14 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.160.57]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wnYwU-1VLpOz0; Sat, 25 Jul 2026 11:45:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] malcontent: update 1.13.1 -> 1.14.0
Date: Sat, 25 Jul 2026 11:45:08 +0200
Message-ID: <20260725094508.166565-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1784972714-427FBB0D-8A1902C9/0/0 CLEAN NORMAL
X-TOI-MSGID: cdafe54b-0a9f-4be3-b348-2c878e73caf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784972714; i=f_l_k@t-online.de;
	bh=zhZqllYLYAPGsPivtv9/S8Rgc7GX2t8LGpSvFLsO19s=;
	h=From:To:Subject:Date;
	b=XZBBPzV9i8uZhSiQ8Z0FMJry8HiPsS9hAdxml8ITsCpOmuOH7mG+0QZxSFxvlKdmR
	 VyPUPdX6l/1iCeAqLtis5pIRgICCGIQlj7e9/owDgF544AAd9XUUsdi3c6pnrnOf4z
	 ujmgSCm1dSldKN7mJwFahShOkLkaBQE5+ay0rsT6VIKrz/kNIFadmpZQ3lOuEFYCpM
	 MAQmz/RgUKw0xpo0bEJaLpWkiFPYOm1eRAFbv3gNcBAJ/nnbC3w1IfxQ7Oon0F9oL1
	 fbQHmRz64+olV7NB4z0S0fAfPDsgSc5y8ttckWRRTW+Ah2EXs9xXjCSkDUI0p8O7cB
	 +SlPcxI6ZRVPg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2026 09:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128445

- add missing dependencies
- fetch missing subprojects
- LIC_FILES_CHKSUM has changed but LICENSE is still LGPL-2.1

Overview of changes in malcontent 0.14.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #89 After reworking user selector and navigation, removing currently =
viewed
    users isn't handled (Philip Withnall)
  - #101 Integrate NSS web filtering module in flatpak (Philip Withnall)
  - #122 Allow viewing screen time usage when using malcontent-control as=
 a
    child user (Philip Withnall)
  - #129 Hide level bar if there=E2=80=99s no data available yet
  - #133 EstimatedTimesChanged signal is not emitted after a screen time
    extension request is granted (Philip Withnall)
  - !292 docs: Add diagram and some more notes to screen time design docu=
ment
  - !293 malcontent-client: Improve some error messages for invalid comma=
nd
    lines
  - !294 build: Post-release version bump
  - !295 po: Fix a few localisation problems
  - !296 Update Chinese translation
  - !297 docs: Add a diagram of web filtering IPC
  - !298 Update Czech translation
  - !299 updated ru.po
  - !300 Replace sl.po with translation update
  - !305 Update Czech translation
  - !306 Update Chinese translation
  - !307 Update Georgian translation
  - !309 Update Slovenian (sl) translation
  - !311 build: Use system libcdb library if available
  - !312 malcontent-webd-update/tests: Only install webd template if test=
s are
    installed
  - !314 nss/tests/nss-objdump: Also allow linker library
  - !315 Update Swedish translation
  - !316 build/ci: Minor cleanups related to docs
  - !317 Update Kazakh translation

* Translation updates:
  - Chinese (China) (lumingzh)
  - Czech (AsciiWolf)
  - Georgian (NorwayFun)
  - Kazakh (Baurzhan Muftakhidinov)
  - Russian (Ser82-png)
  - Slovenian (filmsi)
  - Swedish (Anders Jonsson)

Overview of changes in malcontent 0.14.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* This is an unstable development release previewing some new features; a=
 lot of
  things have changed around, so it=E2=80=99s expected that there may be =
some packaging
  issues; please file an issue on
  https://gitlab.freedesktop.org/pwithnall/malcontent/-/issues if so

* Add developer API documentation

* Refresh UI

* Add support for screen time limits

* Add backend for web filtering

* Bugs fixed:
  - #2 Build developer documentation (Philip Withnall)
  - #73 Updated sl.po translationn
  - #74 Add family API (Philip Withnall)
  - #75 Ensure MctSessionLimits can do daily time limit and bedtime sched=
ule
    (Philip Withnall)
  - #76 Add org.freedesktop.MalcontentTimer1.Parent API for querying chil=
d
    computer usage (Philip Withnall)
  - #80 Refresh UI for unlock page
  - #81 Rework user selector
  - #83 Add screen time subpage with basic screen limits options
  - #84 Add screen time chart
  - #88 Implement NSS web filtering module and filter list daemon (Philip
    Withnall)
  - #91 Port documentation comments to gi-docgen format
  - #95 Build sysext image in CI for integration testing with gnome-shell
    (Philip Withnall)
  - #96 Selecting username from commandline fails (Ignacy Kuchci=C5=84ski=
)
  - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending a ch=
ild=E2=80=99s
    session time (Philip Withnall)
  - #98 After adding screen time subpage, the previous value of bedtime/s=
creen
    limit are not preserved (Philip Withnall)
  - #100 Bump the app copyright date (Philip Withnall)
  - #102 Add tests for filter list parsing code in malcontent-webd (Phili=
p
    Withnall)
  - #107 Follow-up from "Add screen time chart"
  - #109 Set a default daily screen time limit value
  - #110 Show logged-in child accounts in the parental controls applicati=
on
  - #111 Screen time summary level bar overflows
  - #112 Fix assertion when closing the application (Philip Withnall)
  - #113 Investigate gtklevelbar breaking
  - #115 Improve documentation of the malcontent-client record-usage comm=
and
    (Philip Withnall)
  - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if sess=
ion
    limits settings change (Philip Withnall)
  - #118 Malcontent-timerd daemon error on GNOME OS child account login (=
Philip
    Withnall)
  - #119 Fix duration picker breaking in 12-hour clock mode
  - #120 Update Turkish translation
  - !189 build: Post-release version bump
  - !190 Bulgarian translation by kraftwerk
  - !191 malcontent-control: Port about dialog to AdwAboutDialog
  - !192 ci: Add various linting tests for shell and Python
  - !193 malcontent-client: Add support for setting a session limit polic=
y
  - !194 Improve REUSE license/copyright tagging somewhat
  - !195 Update Georgian translation
  - !196 malcontent-timerd: Add initial implementation of timer daemon
  - !197 po: Add new malcontent-timerd files to POTFILES.in
  - !198 updated ru.po
  - !200 ui: Fix wrong a11y role in button
  - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web filteri=
ng
  - !204 libmalcontent: Add web filtering settings storage and API
  - !205 malcontent-client: Add {get,set}-web-filter commands
  - !210 Add icons to libmalcontent-ui gresources
  - !211 docs: Add Code of Conduct
  - !213 Add missing mct_session_limits_equal() and mct_web_filter_equal(=
)
    functions
  - !214 manager: Rework change notification from AccountsService and sup=
port
    notification for session limits and web filters
  - !215 Various minor type and terminology fixes
  - !216 user-selector: Factor out getuid() calls into a :current-user pr=
operty
  - !217 Fix icons in dark theme
  - !218 tools: Add a sysext build tool
  - !219 malcontent-control: Add D-Bus service file
  - !220 malcontent-control: Change component type to "desktop-applicatio=
n"
  - !221 accounts-service: Make extension symlinks relative
  - !222 Handle external changes to users and settings
  - !224 Fix waiting asynchronously for user manager
  - !225 malcontent-webd: Add initial implementation of web filtering dae=
mon
  - !226 Adjust malcontent-timer for shell integration
  - !227 po: Add missing files to POTFILES.in
  - !228 Replace sl.po; this is the updated translation (100%).
  - !229 nss: Add unit tests for NSS module
  - !230 Update of sl.po
  - !231 malcontent-timer: Remove an invalid attribute from a D-Bus XML f=
ile
  - !232 tests: Add test for the sandboxing of malcontent-webd.service an=
d
    malcontent-timerd.service
  - !233 Update Czech translation
  - !235 Malcontent client improvements
  - !236 Update Polish translation 250828
  - #83 Add screen time subpage with basic screen limits options
  - #84 Add screen time chart
  - #88 Implement NSS web filtering module and filter list daemon (Philip
    Withnall)
  - #91 Port documentation comments to gi-docgen format
  - #95 Build sysext image in CI for integration testing with gnome-shell
    (Philip Withnall)
  - #96 Selecting username from commandline fails (Ignacy Kuchci=C5=84ski=
)
  - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending a ch=
ild=E2=80=99s
    session time (Philip Withnall)
  - #98 After adding screen time subpage, the previous value of bedtime/s=
creen
    limit are not preserved (Philip Withnall)
  - #100 Bump the app copyright date (Philip Withnall)
  - #102 Add tests for filter list parsing code in malcontent-webd (Phili=
p
    Withnall)
  - #107 Follow-up from "Add screen time chart"
  - #109 Set a default daily screen time limit value
  - #110 Show logged-in child accounts in the parental controls applicati=
on
  - #111 Screen time summary level bar overflows
  - #112 Fix assertion when closing the application (Philip Withnall)
  - #113 Investigate gtklevelbar breaking
  - #115 Improve documentation of the malcontent-client record-usage comm=
and
    (Philip Withnall)
  - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if sess=
ion
    limits settings change (Philip Withnall)
  - #118 Malcontent-timerd daemon error on GNOME OS child account login (=
Philip
    Withnall)
  - #119 Fix duration picker breaking in 12-hour clock mode
  - #120 Update Turkish translation
  - !189 build: Post-release version bump
  - !190 Bulgarian translation by kraftwerk
  - !191 malcontent-control: Port about dialog to AdwAboutDialog
  - !192 ci: Add various linting tests for shell and Python
  - !193 malcontent-client: Add support for setting a session limit polic=
y
  - !194 Improve REUSE license/copyright tagging somewhat
  - !195 Update Georgian translation
  - !196 malcontent-timerd: Add initial implementation of timer daemon
  - !197 po: Add new malcontent-timerd files to POTFILES.in
  - !198 updated ru.po
  - !200 ui: Fix wrong a11y role in button
  - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web filteri=
ng
  - !204 libmalcontent: Add web filtering settings storage and API
  - !205 malcontent-client: Add {get,set}-web-filter commands
  - !210 Add icons to libmalcontent-ui gresources
  - !211 docs: Add Code of Conduct
  - !213 Add missing mct_session_limits_equal() and mct_web_filter_equal(=
)
    functions
  - !214 manager: Rework change notification from AccountsService and sup=
port
    notification for session limits and web filters
  - !215 Various minor type and terminology fixes
  - !216 user-selector: Factor out getuid() calls into a :current-user pr=
operty
  - !217 Fix icons in dark theme
  - !218 tools: Add a sysext build tool
  - !219 malcontent-control: Add D-Bus service file
  - !220 malcontent-control: Change component type to "desktop-applicatio=
n"
  - !221 accounts-service: Make extension symlinks relative
  - !222 Handle external changes to users and settings
  - !224 Fix waiting asynchronously for user manager
  - !225 malcontent-webd: Add initial implementation of web filtering dae=
mon
  - !226 Adjust malcontent-timer for shell integration
  - !227 po: Add missing files to POTFILES.in
  - !228 Replace sl.po; this is the updated translation (100%).
  - !229 nss: Add unit tests for NSS module
  - !230 Update of sl.po
  - !231 malcontent-timer: Remove an invalid attribute from a D-Bus XML f=
ile
  - !232 tests: Add test for the sandboxing of malcontent-webd.service an=
d
    malcontent-timerd.service
  - !233 Update Czech translation
  - !235 Malcontent client improvements
  - !236 Update Polish translation 250828
  - !237 docs: Add web filtering design document
  - !238 docs: Add a document about system integration (packaging)
  - !240 Update Czech translation
  - !241 malcontent-client: Fix --help output for set-web-filter subcomma=
nd
  - !242 Calculate next session times in malcontent-timer
  - !243 Update Czech translation
  - !245 po: Add false positves to POTFILES.skip
  - !246 Update Polish translation 250907
  - !247 manager: Handle UnknownInterface error from AccountsService
  - !249 Minor malcontent-webd fixes
  - !251 docs: Mention the update-error file in malcontent-webd.8
  - !252 libmalcontent-ui: Update documentation to use gi-docgen
  - !254 docs: Add some reference links to screen time design document
  - !255 Update Chinese translation
  - !256 Update Slovenian translation
  - !257 libmalcontent-timer: Retry queries if the timer store is busy
  - !258 time-page: Prevent calling unref on a NULL pointer
  - !259 malcontent-webd-update: Disable timeout when updating filters
  - !260 malcontent-webd: Relax UMask in service file
  - !261 Update Czech translation
  - !262 po: Add missing file to POTFILES.in
  - !263 Update Chinese translation
  - !264 build: Use exposed interfaces directory
  - !265 libmalcontent-ui: Add missing gir include path
  - !266 Minor fixes for malcontent-control
  - !268 Replace sl.po with translation update.
  - !269 Russian translation updated
  - !270 Update Czech translation
  - !271 Update Chinese translation
  - !272 Updated RU against most recent pot
  - !273 Statically link libgsystemservice
  - !274 Various minor fixes and build system tests
  - !277 l10n: Replace sl.po (Slovenian)
  - !279 Update Swedish translation
  - !282 tests: Add unit tests for `MctExtensionAgentObject`
  - !286 libmalcontent: Port remaining doc comments to gi-docgen format
  - !289 malcontent-control: Fix a crash when quitting just after making =
changes
  - !291 po: Update Bulgarian translation

* Translation updates:
  - Bulgarian (twlvnn, twlvnn kraftwerk)
  - Chinese (China) (lumingzh)
  - Czech (AsciiWolf)
  - Georgian (NorwayFun)
  - Polish (Piotr Dr=C4=85g)
  - Russian (Julia Dronova, Ser82-png)
  - Slovenian (filmsi, Martin Srebotnjak)
  - Swedish (Anders Jonsson)
  - Turkish (Sabri =C3=9Cnal)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/malcontent/malcontent-ui.bb |  4 ++--
 .../recipes-gnome/malcontent/malcontent.bb    | 16 +++++++-------
 .../recipes-gnome/malcontent/malcontent.inc   | 21 ++++++++++++++++---
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb b/meta-oe/=
recipes-gnome/malcontent/malcontent-ui.bb
index 8630822939..d0a975a457 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
@@ -1,7 +1,5 @@
 SUMMARY =3D "User-Interface for malcontent."
 HOMEPAGE =3D "https://gitlab.freedesktop.org/pwithnall/malcontent"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
 require malcontent.inc
=20
@@ -20,6 +18,8 @@ DEPENDS +=3D " \
 	flatpak \
 	libadwaita \
 	gtk4 \
+	gi-docgen-native \
+	gnome-desktop \
 "
=20
 GIR_MESON_OPTION =3D ""
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb b/meta-oe/rec=
ipes-gnome/malcontent/malcontent.bb
index 9da95329a8..579b0f6ffe 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
@@ -1,7 +1,5 @@
 SUMMARY =3D "malcontent implements support for restricting the type of c=
ontent."
 HOMEPAGE =3D "https://gitlab.freedesktop.org/pwithnall/malcontent"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
 require malcontent.inc
=20
@@ -13,6 +11,8 @@ DEPENDS =3D " \
 	itstool-native \
 	libpam \
 	polkit \
+	gi-docgen-native \
+	libsoup \
 "
=20
 GIR_MESON_OPTION =3D ""
@@ -27,9 +27,11 @@ PACKAGECONFIG[ui] =3D ",,,malcontent-ui"
 EXTRA_OEMESON =3D "-Dui=3Ddisabled -Dpamlibdir=3D${base_libdir}/security=
"
=20
 FILES:${PN} +=3D " \
-	${base_libdir}/security/pam_malcontent.so \
-	${datadir}/accountsservice \
-	${datadir}/help \
-	${datadir}/dbus-1 \
-	${datadir}/polkit-1 \
+    ${nonarch_libdir}/sysusers.d \
+    ${systemd_system_unitdir} \
+    ${base_libdir}/security/pam_malcontent.so \
+    ${datadir}/accountsservice \
+    ${datadir}/help \
+    ${datadir}/dbus-1 \
+    ${datadir}/polkit-1 \
 "
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/re=
cipes-gnome/malcontent/malcontent.inc
index 7cb052d69c..de5da10193 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
@@ -1,3 +1,18 @@
-SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;branch=3Dmalcontent-0.13"
-SRCREV =3D "090042fec5181621e2fd8cfef9fc446ed86db98b"
-PV =3D "0.13.1"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D310c7c93cf5181c6b0cc8229a1f3c=
6f6"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;proto=
col=3Dhttps;nobranch=3D1;tag=3D${PV};name=3Dmalcontent"
+SRC_URI +=3D "git://gitlab.gnome.org/pwithnall/libgsystemservice.git;nam=
e=3Dlibgsystemservice;subdir=3D${S}/subprojects/libgsystemservice;protoco=
l=3Dhttps;nobranch=3D1"
+SRC_URI +=3D "git://gitlab.gnome.org/GNOME/gvdb.git;protocol=3Dhttps;sub=
dir=3D${S}/subprojects/gvdb;name=3Dgvdb;nobranch=3D1"
+SRC_URI +=3D "https://www.corpit.ru/mjt/tinycdb/tinycdb-0.81.tar.gz;subd=
ir=3D${S}/subprojects;name=3Dtinycdb"
+SRCREV_malcontent =3D "d28f6635359d02d1068d8b21fb5810e5074b7903"
+SRCREV_libgsystemservice =3D "f4c5764652b5f347347b459ee011e4f02b29c3a0"
+SRCREV_gvdb =3D "466fc22016cf0981424e7121557611942191992f"
+SRC_URI[tinycdb.sha256sum] =3D "469de2d445bf54880f652f4b6dc95c7cdf6f5502=
c35524a45b2122d70d47ebc2"
+SRCREV_FORMAT =3D "malcontent"
+
+PV =3D "0.14.0"
+
+do_configure:prepend() {
+    cp ${S}/subprojects/packagefiles/tinycdb/meson.build ${S}/subproject=
s/tinycdb-0.81
+}
--=20
2.55.0


