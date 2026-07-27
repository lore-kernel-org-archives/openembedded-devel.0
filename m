Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AC8C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 18:18:26 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37919.1785176305236805256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 11:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=mtqROMyB;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout03.t-online.de (Postfix) with SMTP id 0D991EABB;
	Mon, 27 Jul 2026 20:18:23 +0200 (CEST)
Received: from [192.168.178.63] ([84.163.45.137]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1woPu9-26sB9s0; Mon, 27 Jul 2026 20:18:22 +0200
Date: Mon, 27 Jul 2026 20:18:16 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv4] malcontent: update 1.13.1 -> 1.14.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <GUIUIT.IUDYXJZK2XZQ1@t-online.de>
In-Reply-To: <18C63849DAC2499A.1539786@lists.openembedded.org>
References: <18C63849DAC2499A.1539786@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-01xv+ElphDkVFLGjD1XI"
X-TOI-EXPURGATEID: 150726::1785176302-973A2BDF-70764B74/0/0 CLEAN NORMAL
X-TOI-MSGID: bfd39bef-2da4-4259-9292-8c302283d3c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1785176302; i=f_l_k@t-online.de;
	bh=IGVQn5XjythegBxNMUMlY9yI75Bej2ykOvTp4QhBnoE=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=mtqROMyB7EFuD48mDYLkCQDGQPFUXfdo1LKdBfAzwwy7Mbuprlp6zWRr4li6jze3W
	 POP0z5hktl9QBD2zae7i64a6H82wDae+axeqoA+fd6qh3qeHQe1kyuXZT6NTf3vciY
	 6T0akjr3ygv4B3wd94v6sMPdrQV5Q0PnbXBIiTsWj+lPQ10Tgqws4gS2OiTPI1Qd0f
	 l7OC8pMPNz9xC3ud/W+TZB4lY0pDN/1Tl3R+kEmKtp+XugOe6+Aleaql6neSEO0o9h
	 7G6XIcb4Y+1Zgb+01nb1ulyoikj8hV974j1bUdZ3U1gTqB8ZH+EoFTs76x/Y96Dat3
	 jMsn4cniNuvGQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 18:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128466

--=-01xv+ElphDkVFLGjD1XI
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

v4: set --home-dir ${localstatedir} for the malcontent users

Am Mo, 27. Jul 2026 um 20:16:16 +02:00:00 schrieb Markus Volk via=20
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>:
> - add missing dependencies
> - fetch missing subprojects
> - LIC_FILES_CHKSUM has changed but LICENSE is still LGPL-2.1
> - The malcontent-timer-ext-agent, malcontent-timerd, and=20
> malcontent-webd services
>   are configured to run under their own user accounts. Create the=20
> users so that
>   the services can run.
>=20
> Overview of changes in malcontent 0.14.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Bugs fixed:
>   - #89 After reworking user selector and navigation, removing=20
> currently viewed
>     users isn't handled (Philip Withnall)
>   - #101 Integrate NSS web filtering module in flatpak (Philip=20
> Withnall)
>   - #122 Allow viewing screen time usage when using=20
> malcontent-control as a
>     child user (Philip Withnall)
>   - #129 Hide level bar if there=FFs no data available yet
>   - #133 EstimatedTimesChanged signal is not emitted after a screen=20
> time
>     extension request is granted (Philip Withnall)
>   - !292 docs: Add diagram and some more notes to screen time design=20
> document
>   - !293 malcontent-client: Improve some error messages for invalid=20
> command
>     lines
>   - !294 build: Post-release version bump
>   - !295 po: Fix a few localisation problems
>   - !296 Update Chinese translation
>   - !297 docs: Add a diagram of web filtering IPC
>   - !298 Update Czech translation
>   - !299 updated ru.po
>   - !300 Replace sl.po with translation update
>   - !305 Update Czech translation
>   - !306 Update Chinese translation
>   - !307 Update Georgian translation
>   - !309 Update Slovenian (sl) translation
>   - !311 build: Use system libcdb library if available
>   - !312 malcontent-webd-update/tests: Only install webd template if=20
> tests are
>     installed
>   - !314 nss/tests/nss-objdump: Also allow linker library
>   - !315 Update Swedish translation
>   - !316 build/ci: Minor cleanups related to docs
>   - !317 Update Kazakh translation
>=20
> * Translation updates:
>   - Chinese (China) (lumingzh)
>   - Czech (AsciiWolf)
>   - Georgian (NorwayFun)
>   - Kazakh (Baurzhan Muftakhidinov)
>   - Russian (Ser82-png)
>   - Slovenian (filmsi)
>   - Swedish (Anders Jonsson)
>=20
> Overview of changes in malcontent 0.14.alpha
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * This is an unstable development release previewing some new=20
> features; a lot of
>   things have changed around, so it=FFs expected that there may be=20
> some packaging
>   issues; please file an issue on
>   <https://gitlab.freedesktop.org/pwithnall/malcontent/-/issues> if so
>=20
> * Add developer API documentation
>=20
> * Refresh UI
>=20
> * Add support for screen time limits
>=20
> * Add backend for web filtering
>=20
> * Bugs fixed:
>   - #2 Build developer documentation (Philip Withnall)
>   - #73 Updated sl.po translationn
>   - #74 Add family API (Philip Withnall)
>   - #75 Ensure MctSessionLimits can do daily time limit and bedtime=20
> schedule
>     (Philip Withnall)
>   - #76 Add org.freedesktop.MalcontentTimer1.Parent API for querying=20
> child
>     computer usage (Philip Withnall)
>   - #80 Refresh UI for unlock page
>   - #81 Rework user selector
>   - #83 Add screen time subpage with basic screen limits options
>   - #84 Add screen time chart
>   - #88 Implement NSS web filtering module and filter list daemon=20
> (Philip
>     Withnall)
>   - #91 Port documentation comments to gi-docgen format
>   - #95 Build sysext image in CI for integration testing with=20
> gnome-shell
>     (Philip Withnall)
>   - #96 Selecting username from commandline fails (Ignacy Kuchci=F1ski)
>   - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending=20
> a child=FFs
>     session time (Philip Withnall)
>   - #98 After adding screen time subpage, the previous value of=20
> bedtime/screen
>     limit are not preserved (Philip Withnall)
>   - #100 Bump the app copyright date (Philip Withnall)
>   - #102 Add tests for filter list parsing code in malcontent-webd=20
> (Philip
>     Withnall)
>   - #107 Follow-up from "Add screen time chart"
>   - #109 Set a default daily screen time limit value
>   - #110 Show logged-in child accounts in the parental controls=20
> application
>   - #111 Screen time summary level bar overflows
>   - #112 Fix assertion when closing the application (Philip Withnall)
>   - #113 Investigate gtklevelbar breaking
>   - #115 Improve documentation of the malcontent-client record-usage=20
> command
>     (Philip Withnall)
>   - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if=20
> session
>     limits settings change (Philip Withnall)
>   - #118 Malcontent-timerd daemon error on GNOME OS child account=20
> login (Philip
>     Withnall)
>   - #119 Fix duration picker breaking in 12-hour clock mode
>   - #120 Update Turkish translation
>   - !189 build: Post-release version bump
>   - !190 Bulgarian translation by kraftwerk
>   - !191 malcontent-control: Port about dialog to AdwAboutDialog
>   - !192 ci: Add various linting tests for shell and Python
>   - !193 malcontent-client: Add support for setting a session limit=20
> policy
>   - !194 Improve REUSE license/copyright tagging somewhat
>   - !195 Update Georgian translation
>   - !196 malcontent-timerd: Add initial implementation of timer daemon
>   - !197 po: Add new malcontent-timerd files to POTFILES.in
>   - !198 updated ru.po
>   - !200 ui: Fix wrong a11y role in button
>   - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web=20
> filtering
>   - !204 libmalcontent: Add web filtering settings storage and API
>   - !205 malcontent-client: Add {get,set}-web-filter commands
>   - !210 Add icons to libmalcontent-ui gresources
>   - !211 docs: Add Code of Conduct
>   - !213 Add missing mct_session_limits_equal() and=20
> mct_web_filter_equal()
>     functions
>   - !214 manager: Rework change notification from AccountsService and=20
> support
>     notification for session limits and web filters
>   - !215 Various minor type and terminology fixes
>   - !216 user-selector: Factor out getuid() calls into a=20
> :current-user property
>   - !217 Fix icons in dark theme
>   - !218 tools: Add a sysext build tool
>   - !219 malcontent-control: Add D-Bus service file
>   - !220 malcontent-control: Change component type to=20
> "desktop-application"
>   - !221 accounts-service: Make extension symlinks relative
>   - !222 Handle external changes to users and settings
>   - !224 Fix waiting asynchronously for user manager
>   - !225 malcontent-webd: Add initial implementation of web filtering=20
> daemon
>   - !226 Adjust malcontent-timer for shell integration
>   - !227 po: Add missing files to POTFILES.in
>   - !228 Replace sl.po; this is the updated translation (100%).
>   - !229 nss: Add unit tests for NSS module
>   - !230 Update of sl.po
>   - !231 malcontent-timer: Remove an invalid attribute from a D-Bus=20
> XML file
>   - !232 tests: Add test for the sandboxing of=20
> malcontent-webd.service and
>     malcontent-timerd.service
>   - !233 Update Czech translation
>   - !235 Malcontent client improvements
>   - !236 Update Polish translation 250828
>   - #83 Add screen time subpage with basic screen limits options
>   - #84 Add screen time chart
>   - #88 Implement NSS web filtering module and filter list daemon=20
> (Philip
>     Withnall)
>   - #91 Port documentation comments to gi-docgen format
>   - #95 Build sysext image in CI for integration testing with=20
> gnome-shell
>     (Philip Withnall)
>   - #96 Selecting username from commandline fails (Ignacy Kuchci=F1ski)
>   - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending=20
> a child=FFs
>     session time (Philip Withnall)
>   - #98 After adding screen time subpage, the previous value of=20
> bedtime/screen
>     limit are not preserved (Philip Withnall)
>   - #100 Bump the app copyright date (Philip Withnall)
>   - #102 Add tests for filter list parsing code in malcontent-webd=20
> (Philip
>     Withnall)
>   - #107 Follow-up from "Add screen time chart"
>   - #109 Set a default daily screen time limit value
>   - #110 Show logged-in child accounts in the parental controls=20
> application
>   - #111 Screen time summary level bar overflows
>   - #112 Fix assertion when closing the application (Philip Withnall)
>   - #113 Investigate gtklevelbar breaking
>   - #115 Improve documentation of the malcontent-client record-usage=20
> command
>     (Philip Withnall)
>   - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if=20
> session
>     limits settings change (Philip Withnall)
>   - #118 Malcontent-timerd daemon error on GNOME OS child account=20
> login (Philip
>     Withnall)
>   - #119 Fix duration picker breaking in 12-hour clock mode
>   - #120 Update Turkish translation
>   - !189 build: Post-release version bump
>   - !190 Bulgarian translation by kraftwerk
>   - !191 malcontent-control: Port about dialog to AdwAboutDialog
>   - !192 ci: Add various linting tests for shell and Python
>   - !193 malcontent-client: Add support for setting a session limit=20
> policy
>   - !194 Improve REUSE license/copyright tagging somewhat
>   - !195 Update Georgian translation
>   - !196 malcontent-timerd: Add initial implementation of timer daemon
>   - !197 po: Add new malcontent-timerd files to POTFILES.in
>   - !198 updated ru.po
>   - !200 ui: Fix wrong a11y role in button
>   - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web=20
> filtering
>   - !204 libmalcontent: Add web filtering settings storage and API
>   - !205 malcontent-client: Add {get,set}-web-filter commands
>   - !210 Add icons to libmalcontent-ui gresources
>   - !211 docs: Add Code of Conduct
>   - !213 Add missing mct_session_limits_equal() and=20
> mct_web_filter_equal()
>     functions
>   - !214 manager: Rework change notification from AccountsService and=20
> support
>     notification for session limits and web filters
>   - !215 Various minor type and terminology fixes
>   - !216 user-selector: Factor out getuid() calls into a=20
> :current-user property
>   - !217 Fix icons in dark theme
>   - !218 tools: Add a sysext build tool
>   - !219 malcontent-control: Add D-Bus service file
>   - !220 malcontent-control: Change component type to=20
> "desktop-application"
>   - !221 accounts-service: Make extension symlinks relative
>   - !222 Handle external changes to users and settings
>   - !224 Fix waiting asynchronously for user manager
>   - !225 malcontent-webd: Add initial implementation of web filtering=20
> daemon
>   - !226 Adjust malcontent-timer for shell integration
>   - !227 po: Add missing files to POTFILES.in
>   - !228 Replace sl.po; this is the updated translation (100%).
>   - !229 nss: Add unit tests for NSS module
>   - !230 Update of sl.po
>   - !231 malcontent-timer: Remove an invalid attribute from a D-Bus=20
> XML file
>   - !232 tests: Add test for the sandboxing of=20
> malcontent-webd.service and
>     malcontent-timerd.service
>   - !233 Update Czech translation
>   - !235 Malcontent client improvements
>   - !236 Update Polish translation 250828
>   - !237 docs: Add web filtering design document
>   - !238 docs: Add a document about system integration (packaging)
>   - !240 Update Czech translation
>   - !241 malcontent-client: Fix --help output for set-web-filter=20
> subcommand
>   - !242 Calculate next session times in malcontent-timer
>   - !243 Update Czech translation
>   - !245 po: Add false positves to POTFILES.skip
>   - !246 Update Polish translation 250907
>   - !247 manager: Handle UnknownInterface error from AccountsService
>   - !249 Minor malcontent-webd fixes
>   - !251 docs: Mention the update-error file in malcontent-webd.8
>   - !252 libmalcontent-ui: Update documentation to use gi-docgen
>   - !254 docs: Add some reference links to screen time design document
>   - !255 Update Chinese translation
>   - !256 Update Slovenian translation
>   - !257 libmalcontent-timer: Retry queries if the timer store is busy
>   - !258 time-page: Prevent calling unref on a NULL pointer
>   - !259 malcontent-webd-update: Disable timeout when updating filters
>   - !260 malcontent-webd: Relax UMask in service file
>   - !261 Update Czech translation
>   - !262 po: Add missing file to POTFILES.in
>   - !263 Update Chinese translation
>   - !264 build: Use exposed interfaces directory
>   - !265 libmalcontent-ui: Add missing gir include path
>   - !266 Minor fixes for malcontent-control
>   - !268 Replace sl.po with translation update.
>   - !269 Russian translation updated
>   - !270 Update Czech translation
>   - !271 Update Chinese translation
>   - !272 Updated RU against most recent pot
>   - !273 Statically link libgsystemservice
>   - !274 Various minor fixes and build system tests
>   - !277 l10n: Replace sl.po (Slovenian)
>   - !279 Update Swedish translation
>   - !282 tests: Add unit tests for `MctExtensionAgentObject`
>   - !286 libmalcontent: Port remaining doc comments to gi-docgen=20
> format
>   - !289 malcontent-control: Fix a crash when quitting just after=20
> making changes
>   - !291 po: Update Bulgarian translation
>=20
> * Translation updates:
>   - Bulgarian (twlvnn, twlvnn kraftwerk)
>   - Chinese (China) (lumingzh)
>   - Czech (AsciiWolf)
>   - Georgian (NorwayFun)
>   - Polish (Piotr Dr=E0g)
>   - Russian (Julia Dronova, Ser82-png)
>   - Slovenian (filmsi, Martin Srebotnjak)
>   - Swedish (Anders Jonsson)
>   - Turkish (Sabri =DCnal)
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-gnome/malcontent/malcontent-ui.bb |  4 ++--
>  .../recipes-gnome/malcontent/malcontent.bb    | 22=20
> ++++++++++++-------
>  .../recipes-gnome/malcontent/malcontent.inc   | 21 +++++++++++++++---
>  3 files changed, 34 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb=20
> b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
> index 8630822939..d0a975a457 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
> @@ -1,7 +1,5 @@
>  SUMMARY =3D "User-Interface for malcontent."
>  HOMEPAGE =3D "<https://gitlab.freedesktop.org/pwithnall/malcontent>"
> -LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"=20
> <file://copying;md5=3D4fbd65380cdd255951079008b364516c/>
>=20
>  require malcontent.inc
>=20
> @@ -20,6 +18,8 @@ DEPENDS +=3D " \
>  	flatpak \
>  	libadwaita \
>  	gtk4 \
> +	gi-docgen-native \
> +	gnome-desktop \
>  "
>=20
>  GIR_MESON_OPTION =3D ""
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb=20
> b/meta-oe/recipes-gnome/malcontent/malcontent.bb
> index 9da95329a8..a6aa59513d 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
> @@ -1,7 +1,5 @@
>  SUMMARY =3D "malcontent implements support for restricting the type of=20
> content."
>  HOMEPAGE =3D "<https://gitlab.freedesktop.org/pwithnall/malcontent>"
> -LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"=20
> <file://copying;md5=3D4fbd65380cdd255951079008b364516c/>
>=20
>  require malcontent.inc
>=20
> @@ -13,11 +11,13 @@ DEPENDS =3D " \
>  	itstool-native \
>  	libpam \
>  	polkit \
> +	gi-docgen-native \
> +	libsoup \
>  "
>=20
>  GIR_MESON_OPTION =3D ""
>=20
> -inherit  meson pkgconfig gobject-introspection gettext features_check
> +inherit  meson pkgconfig gobject-introspection gettext=20
> features_check useradd
>=20
>  REQUIRED_DISTRO_FEATURES =3D "pam polkit gobject-introspection"
>=20
> @@ -27,9 +27,15 @@ PACKAGECONFIG[ui] =3D ",,,malcontent-ui"
>  EXTRA_OEMESON =3D "-Dui=3Ddisabled -Dpamlibdir=3D${base_libdir}/security=
"
>=20
>  FILES:${PN} +=3D " \
> -	${base_libdir}/security/pam_malcontent.so \
> -	${datadir}/accountsservice \
> -	${datadir}/help \
> -	${datadir}/dbus-1 \
> -	${datadir}/polkit-1 \
> +    ${nonarch_libdir}/sysusers.d \
> +    ${systemd_system_unitdir} \
> +    ${base_libdir}/security/pam_malcontent.so \
> +    ${datadir}/accountsservice \
> +    ${datadir}/help \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/polkit-1 \
>  "
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group=20
> --shell /bin/false --home-dir ${localstatedir} =20
> malcontent-timer-ext-agent;malcontent-timerd;malcontent-webd"
> +
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc=20
> b/meta-oe/recipes-gnome/malcontent/malcontent.inc
> index 7cb052d69c..de5da10193 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
> @@ -1,3 +1,18 @@
> -SRC_URI =3D=20
> "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=3Dhttps;b=
ranch=3Dmalcontent-0.13"
> -SRCREV =3D "090042fec5181621e2fd8cfef9fc446ed86db98b"
> -PV =3D "0.13.1"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3D310c7c93cf5181c6b0cc8229a1f3c6f6"=20
> <file://copying;md5=3D310c7c93cf5181c6b0cc8229a1f3c6f6/>
> +
> +SRC_URI =3D=20
> "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=3Dhttps;n=
obranch=3D1;tag=3D${PV};name=3Dmalcontent"
> +SRC_URI +=3D=20
> "git://gitlab.gnome.org/pwithnall/libgsystemservice.git;name=3Dlibgsystem=
service;subdir=3D${S}/subprojects/libgsystemservice;protocol=3Dhttps;nobran=
ch=3D1"
> +SRC_URI +=3D=20
> "git://gitlab.gnome.org/GNOME/gvdb.git;protocol=3Dhttps;subdir=3D${S}/sub=
projects/gvdb;name=3Dgvdb;nobranch=3D1"
> +SRC_URI +=3D=20
> "https://www.corpit.ru/mjt/tinycdb/tinycdb-0.81.tar.gz;subdir=3D${S}/subp=
rojects;name=3Dtinycdb=20
> <https://www.corpit.ru/mjt/tinycdb/tinycdb-0.81.tar.gz;subdir=3D$%7BS%7D/=
subprojects;name=3Dtinycdb>"
> +SRCREV_malcontent =3D "d28f6635359d02d1068d8b21fb5810e5074b7903"
> +SRCREV_libgsystemservice =3D "f4c5764652b5f347347b459ee011e4f02b29c3a0"
> +SRCREV_gvdb =3D "466fc22016cf0981424e7121557611942191992f"
> +SRC_URI[tinycdb.sha256sum] =3D=20
> "469de2d445bf54880f652f4b6dc95c7cdf6f5502c35524a45b2122d70d47ebc2"
> +SRCREV_FORMAT =3D "malcontent"
> +
> +PV =3D "0.14.0"
> +
> +do_configure:prepend() {
> +    cp ${S}/subprojects/packagefiles/tinycdb/meson.build=20
> ${S}/subprojects/tinycdb-0.81
> +}
> --
> 2.55.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128465):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/128465>
> Mute This Topic: <https://lists.openembedded.org/mt/120471918/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-01xv+ElphDkVFLGjD1XI
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v4: set&nbsp;<span style=3D"white-=
space: break-spaces;">--home-dir ${localstatedir} for the malcontent users<=
/span></div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am Mo, 27. Jul 2=
026 um 20:16:16 +02:00:00 schrieb Markus Volk via lists.openembedded.org &l=
t;f_l_k=3Dt-online.de@lists.openembedded.org&gt;:<br><blockquote type=3D"ci=
te"><div class=3D"plaintext" style=3D"white-space: break-spaces;">- add mis=
sing dependencies
- fetch missing subprojects
- LIC_FILES_CHKSUM has changed but LICENSE is still LGPL-2.1
- The malcontent-timer-ext-agent, malcontent-timerd, and malcontent-webd se=
rvices
  are configured to run under their own user accounts. Create the users so =
that
  the services can run.

Overview of changes in malcontent 0.14.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #89 After reworking user selector and navigation, removing currently vi=
ewed
    users isn't handled (Philip Withnall)
  - #101 Integrate NSS web filtering module in flatpak (Philip Withnall)
  - #122 Allow viewing screen time usage when using malcontent-control as a
    child user (Philip Withnall)
  - #129 Hide level bar if there=FFs no data available yet
  - #133 EstimatedTimesChanged signal is not emitted after a screen time
    extension request is granted (Philip Withnall)
  - !292 docs: Add diagram and some more notes to screen time design docume=
nt
  - !293 malcontent-client: Improve some error messages for invalid command
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
  - !312 malcontent-webd-update/tests: Only install webd template if tests =
are
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

* This is an unstable development release previewing some new features; a l=
ot of
  things have changed around, so it=FFs expected that there may be some pac=
kaging
  issues; please file an issue on
  <a href=3D"https://gitlab.freedesktop.org/pwithnall/malcontent/-/issues">=
https://gitlab.freedesktop.org/pwithnall/malcontent/-/issues</a> if so

* Add developer API documentation

* Refresh UI

* Add support for screen time limits

* Add backend for web filtering

* Bugs fixed:
  - #2 Build developer documentation (Philip Withnall)
  - #73 Updated sl.po translationn
  - #74 Add family API (Philip Withnall)
  - #75 Ensure MctSessionLimits can do daily time limit and bedtime schedul=
e
    (Philip Withnall)
  - #76 Add org.freedesktop.MalcontentTimer1.Parent API for querying child
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
  - #96 Selecting username from commandline fails (Ignacy Kuchci=F1ski)
  - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending a chil=
d=FFs
    session time (Philip Withnall)
  - #98 After adding screen time subpage, the previous value of bedtime/scr=
een
    limit are not preserved (Philip Withnall)
  - #100 Bump the app copyright date (Philip Withnall)
  - #102 Add tests for filter list parsing code in malcontent-webd (Philip
    Withnall)
  - #107 Follow-up from "Add screen time chart"
  - #109 Set a default daily screen time limit value
  - #110 Show logged-in child accounts in the parental controls application
  - #111 Screen time summary level bar overflows
  - #112 Fix assertion when closing the application (Philip Withnall)
  - #113 Investigate gtklevelbar breaking
  - #115 Improve documentation of the malcontent-client record-usage comman=
d
    (Philip Withnall)
  - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if sessio=
n
    limits settings change (Philip Withnall)
  - #118 Malcontent-timerd daemon error on GNOME OS child account login (Ph=
ilip
    Withnall)
  - #119 Fix duration picker breaking in 12-hour clock mode
  - #120 Update Turkish translation
  - !189 build: Post-release version bump
  - !190 Bulgarian translation by kraftwerk
  - !191 malcontent-control: Port about dialog to AdwAboutDialog
  - !192 ci: Add various linting tests for shell and Python
  - !193 malcontent-client: Add support for setting a session limit policy
  - !194 Improve REUSE license/copyright tagging somewhat
  - !195 Update Georgian translation
  - !196 malcontent-timerd: Add initial implementation of timer daemon
  - !197 po: Add new malcontent-timerd files to POTFILES.in
  - !198 updated ru.po
  - !200 ui: Fix wrong a11y role in button
  - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web filtering
  - !204 libmalcontent: Add web filtering settings storage and API
  - !205 malcontent-client: Add {get,set}-web-filter commands
  - !210 Add icons to libmalcontent-ui gresources
  - !211 docs: Add Code of Conduct
  - !213 Add missing mct_session_limits_equal() and mct_web_filter_equal()
    functions
  - !214 manager: Rework change notification from AccountsService and suppo=
rt
    notification for session limits and web filters
  - !215 Various minor type and terminology fixes
  - !216 user-selector: Factor out getuid() calls into a :current-user prop=
erty
  - !217 Fix icons in dark theme
  - !218 tools: Add a sysext build tool
  - !219 malcontent-control: Add D-Bus service file
  - !220 malcontent-control: Change component type to "desktop-application"
  - !221 accounts-service: Make extension symlinks relative
  - !222 Handle external changes to users and settings
  - !224 Fix waiting asynchronously for user manager
  - !225 malcontent-webd: Add initial implementation of web filtering daemo=
n
  - !226 Adjust malcontent-timer for shell integration
  - !227 po: Add missing files to POTFILES.in
  - !228 Replace sl.po; this is the updated translation (100%).
  - !229 nss: Add unit tests for NSS module
  - !230 Update of sl.po
  - !231 malcontent-timer: Remove an invalid attribute from a D-Bus XML fil=
e
  - !232 tests: Add test for the sandboxing of malcontent-webd.service and
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
  - #96 Selecting username from commandline fails (Ignacy Kuchci=F1ski)
  - #97 Add org.freedesktop.MalcontentTimer1.Child API for extending a chil=
d=FFs
    session time (Philip Withnall)
  - #98 After adding screen time subpage, the previous value of bedtime/scr=
een
    limit are not preserved (Philip Withnall)
  - #100 Bump the app copyright date (Philip Withnall)
  - #102 Add tests for filter list parsing code in malcontent-webd (Philip
    Withnall)
  - #107 Follow-up from "Add screen time chart"
  - #109 Set a default daily screen time limit value
  - #110 Show logged-in child accounts in the parental controls application
  - #111 Screen time summary level bar overflows
  - #112 Fix assertion when closing the application (Philip Withnall)
  - #113 Investigate gtklevelbar breaking
  - #115 Improve documentation of the malcontent-client record-usage comman=
d
    (Philip Withnall)
  - #117 Emit EstimatedTimesChanged signal from malcontent-timerd if sessio=
n
    limits settings change (Philip Withnall)
  - #118 Malcontent-timerd daemon error on GNOME OS child account login (Ph=
ilip
    Withnall)
  - #119 Fix duration picker breaking in 12-hour clock mode
  - #120 Update Turkish translation
  - !189 build: Post-release version bump
  - !190 Bulgarian translation by kraftwerk
  - !191 malcontent-control: Port about dialog to AdwAboutDialog
  - !192 ci: Add various linting tests for shell and Python
  - !193 malcontent-client: Add support for setting a session limit policy
  - !194 Improve REUSE license/copyright tagging somewhat
  - !195 Update Georgian translation
  - !196 malcontent-timerd: Add initial implementation of timer daemon
  - !197 po: Add new malcontent-timerd files to POTFILES.in
  - !198 updated ru.po
  - !200 ui: Fix wrong a11y role in button
  - !202 nss: Add a new libnss_malcontent.so.2 NSS module for web filtering
  - !204 libmalcontent: Add web filtering settings storage and API
  - !205 malcontent-client: Add {get,set}-web-filter commands
  - !210 Add icons to libmalcontent-ui gresources
  - !211 docs: Add Code of Conduct
  - !213 Add missing mct_session_limits_equal() and mct_web_filter_equal()
    functions
  - !214 manager: Rework change notification from AccountsService and suppo=
rt
    notification for session limits and web filters
  - !215 Various minor type and terminology fixes
  - !216 user-selector: Factor out getuid() calls into a :current-user prop=
erty
  - !217 Fix icons in dark theme
  - !218 tools: Add a sysext build tool
  - !219 malcontent-control: Add D-Bus service file
  - !220 malcontent-control: Change component type to "desktop-application"
  - !221 accounts-service: Make extension symlinks relative
  - !222 Handle external changes to users and settings
  - !224 Fix waiting asynchronously for user manager
  - !225 malcontent-webd: Add initial implementation of web filtering daemo=
n
  - !226 Adjust malcontent-timer for shell integration
  - !227 po: Add missing files to POTFILES.in
  - !228 Replace sl.po; this is the updated translation (100%).
  - !229 nss: Add unit tests for NSS module
  - !230 Update of sl.po
  - !231 malcontent-timer: Remove an invalid attribute from a D-Bus XML fil=
e
  - !232 tests: Add test for the sandboxing of malcontent-webd.service and
    malcontent-timerd.service
  - !233 Update Czech translation
  - !235 Malcontent client improvements
  - !236 Update Polish translation 250828
  - !237 docs: Add web filtering design document
  - !238 docs: Add a document about system integration (packaging)
  - !240 Update Czech translation
  - !241 malcontent-client: Fix --help output for set-web-filter subcommand
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
  - !289 malcontent-control: Fix a crash when quitting just after making ch=
anges
  - !291 po: Update Bulgarian translation

* Translation updates:
  - Bulgarian (twlvnn, twlvnn kraftwerk)
  - Chinese (China) (lumingzh)
  - Czech (AsciiWolf)
  - Georgian (NorwayFun)
  - Polish (Piotr Dr=E0g)
  - Russian (Julia Dronova, Ser82-png)
  - Slovenian (filmsi, Martin Srebotnjak)
  - Swedish (Anders Jonsson)
  - Turkish (Sabri =DCnal)

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 .../recipes-gnome/malcontent/malcontent-ui.bb |  4 ++--
 .../recipes-gnome/malcontent/malcontent.bb    | 22 ++++++++++++-------
 .../recipes-gnome/malcontent/malcontent.inc   | 21 +++++++++++++++---
 3 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb b/meta-oe/re=
cipes-gnome/malcontent/malcontent-ui.bb
index 8630822939..d0a975a457 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui.bb
@@ -1,7 +1,5 @@
 SUMMARY =3D "User-Interface for malcontent."
 HOMEPAGE =3D "<a href=3D"https://gitlab.freedesktop.org/pwithnall/malconte=
nt">https://gitlab.freedesktop.org/pwithnall/malcontent</a>"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D4fbd65380cdd25595107=
9008b364516c" "=3D"">file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"=
</a>
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
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb b/meta-oe/recip=
es-gnome/malcontent/malcontent.bb
index 9da95329a8..a6aa59513d 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
@@ -1,7 +1,5 @@
 SUMMARY =3D "malcontent implements support for restricting the type of con=
tent."
 HOMEPAGE =3D "<a href=3D"https://gitlab.freedesktop.org/pwithnall/malconte=
nt">https://gitlab.freedesktop.org/pwithnall/malcontent</a>"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D4fbd65380cdd25595107=
9008b364516c" "=3D"">file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"=
</a>
=20
 require malcontent.inc
=20
@@ -13,11 +11,13 @@ DEPENDS =3D " \
 	itstool-native \
 	libpam \
 	polkit \
+	gi-docgen-native \
+	libsoup \
 "
=20
 GIR_MESON_OPTION =3D ""
=20
-inherit  meson pkgconfig gobject-introspection gettext features_check
+inherit  meson pkgconfig gobject-introspection gettext features_check user=
add
=20
 REQUIRED_DISTRO_FEATURES =3D "pam polkit gobject-introspection"
=20
@@ -27,9 +27,15 @@ PACKAGECONFIG[ui] =3D ",,,malcontent-ui"
 EXTRA_OEMESON =3D "-Dui=3Ddisabled -Dpamlibdir=3D${base_libdir}/security"
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
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --shell /b=
in/false --home-dir ${localstatedir}  malcontent-timer-ext-agent;malcontent=
-timerd;malcontent-webd"
+
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/reci=
pes-gnome/malcontent/malcontent.inc
index 7cb052d69c..de5da10193 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
@@ -1,3 +1,18 @@
-SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protoco=
l=3Dhttps;branch=3Dmalcontent-0.13"
-SRCREV =3D "090042fec5181621e2fd8cfef9fc446ed86db98b"
-PV =3D "0.13.1"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D310c7c93cf5181c6b0cc=
8229a1f3c6f6" "=3D"">file://COPYING;md5=3D310c7c93cf5181c6b0cc8229a1f3c6f6"=
</a>
+
+SRC_URI =3D "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protoco=
l=3Dhttps;nobranch=3D1;tag=3D${PV};name=3Dmalcontent"
+SRC_URI +=3D "git://gitlab.gnome.org/pwithnall/libgsystemservice.git;name=
=3Dlibgsystemservice;subdir=3D${S}/subprojects/libgsystemservice;protocol=
=3Dhttps;nobranch=3D1"
+SRC_URI +=3D "git://gitlab.gnome.org/GNOME/gvdb.git;protocol=3Dhttps;subdi=
r=3D${S}/subprojects/gvdb;name=3Dgvdb;nobranch=3D1"
+SRC_URI +=3D "<a href=3D"https://www.corpit.ru/mjt/tinycdb/tinycdb-0.81.ta=
r.gz;subdir=3D${S}/subprojects;name=3Dtinycdb">https://www.corpit.ru/mjt/ti=
nycdb/tinycdb-0.81.tar.gz;subdir=3D${S}/subprojects;name=3Dtinycdb</a>"
+SRCREV_malcontent =3D "d28f6635359d02d1068d8b21fb5810e5074b7903"
+SRCREV_libgsystemservice =3D "f4c5764652b5f347347b459ee011e4f02b29c3a0"
+SRCREV_gvdb =3D "466fc22016cf0981424e7121557611942191992f"
+SRC_URI[tinycdb.sha256sum] =3D "469de2d445bf54880f652f4b6dc95c7cdf6f5502c3=
5524a45b2122d70d47ebc2"
+SRCREV_FORMAT =3D "malcontent"
+
+PV =3D "0.14.0"
+
+do_configure:prepend() {
+    cp ${S}/subprojects/packagefiles/tinycdb/meson.build ${S}/subprojects/=
tinycdb-0.81
+}
<div>--=20
</div>2.55.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#128465): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128465">https://lists.openembedded.org/g/openembed=
ded-devel/message/128465</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120471918/361=
8223">https://lists.openembedded.org/mt/120471918/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-01xv+ElphDkVFLGjD1XI--


