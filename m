Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA64C021B6
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 01:01:32 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.1104.1740445288905295782
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 17:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout11.t-online.de (Postfix) with SMTP id 1F6FC170D
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 02:01:25 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.213]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmjK5-3RwbC70; Tue, 25 Feb 2025 02:01:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] xdg-desktop-portal: update 1.18.4 -> 1.20.0
Date: Tue, 25 Feb 2025 02:01:15 +0100
Message-ID: <20250225010115.31203-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225010115.31203-1-f_l_k@t-online.de>
References: <20250225010115.31203-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740445282-92FFB479-77D464F8/10/3626336762 SUSPECT URL
X-TOI-MSGID: 48782f24-b282-4f46-9daf-88b18f8c123f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 01:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115555

Changes in 1.20.0

Released: 2025-02-19

Enhancements:

    Document how the test suite works.
    Improve the test runner script.

Changes in 1.19.4

Released: 2025-02-15

New Features:

    Introduce the host app registry. This interface allows host system ap=
ps (i.e. apps not running under a sandboxing mechanism like Flatpak) regi=
ster themselves with XDG Desktop Portal. This allows XDG Desktop Portal t=
o use a proper app id, and desktop file, improving the interaction with p=
ortal backends.

Enhancements:

    Use a new internal script to simplify running tests.

Bug Fixes:

    Properly escape notification body in the Notification portal.
    Fix various documentation links in the USB portal documentation page.

Changes in 1.19.3

Released: 2025-02-12

Bug Fixes:

    Fix documentation links in the USB portal page.
    Make the Document portal track open files, and release them when shut=
ting down. This should fix some harmless leak reports.
    Fix a memory leak, a crash, and improve robustness against non-existi=
ng folders in the Dynamic Launcher portal.
    Fix build with PipeWire 1.3.82

Enhancements:

    Make the host path xattr more useful by removing the trailing end cha=
racter, and also reporting the xattr of files inside folders added to the=
 document store.
    Remove libportal-based integrated tests. This should remove the cycli=
c dependency between libportal, and xdg-desktop-portal. All tests are now=
 based on the Python testing framework.

Changes in 1.19.2

Released: 2025-01-20

Bug Fixes:

    Fix permission check for host system apps in the Camera portal.
    Do not expose the Settings portal if there are no backends available.
    Disable sounds-related notification tests if the project is built wit=
hout wavparse.

Enhancements:

    Start porting the test suite to Python tests. Once finished, this sho=
uld break the cyclic dependency between xdg-desktop-portal and libportal.
    Install Python-based tests. This is mostly useful for distributions t=
o run tests as part of their packaging process.

Changes in 1.19.1

Released: 2024-12-21

Dependencies:

    XDG Desktop Portal now requires GLib 2.72 or higher.

New Features:

    Introduce the Notification v2 portal. This updated version of the Not=
ification portal supports a plethora of new fields for notifications, suc=
h as sounds, categories, purpose, and more.
    Introduce the USB portal. This portal allows apps with relevant permi=
ssions to enumerate and acquire access to specific USB devices.
    Introduce a new SchemeSupported method to the OpenURI portal. This ne=
w method allows apps to know ahead of time if the host system is able to =
deal with a particular scheme.

Enhancements:

    Continued the move towards Python-based tests. This should simplify t=
he test setup in the project quite significantly, and also will allow rem=
oving the cyclic dependency between libportal and XDG Desktop Portal.
    Introduce umockdev-based tests.
    Improve the icon validator so it can deal with memfd-based icons.
    Clarify behavior of the Settings portal for non-standardized keys.
    In the Global Shortcuts portal, clarify that the result the BindShort=
cuts of may be a subset of all requested shortcuts.
    Add a documentation page about icon validation requirements.

Bug Fixes:

    Fix memory leaks in the Background, Email, and Global Shortcuts porta=
ls.
    Fix a general file descriptor & memory leak.
    Fix a regression in the Settings portal.
    New and updated translations.

Changes in 1.19.0

Released: 2024-10-09

    Completely rework and restructure the documentation website. Document=
ation is now segmented by target audience (app developers, desktop develo=
pers, and contributors). It also documents how the Document portal operat=
es, the FUSE filesystem, and custom file attributes. This is available in=
 the following address: https://flatpak.github.io/xdg-desktop-portal/docs=
/index.html
    The portals.conf parser is now able to handle fallback backends bette=
r, and respects the order of backends in the config file.
    Try to use the xdg-desktop-portal-gtk backend as a last resort backen=
d, if everything else fails.
    Implement getlk and setlk, and honour O_NOFOLLOW, in the Document por=
tal's FUSE filesystem.
    Neutralize the Devices portal. Originally the Devices portal was intr=
oduced so that services like PulseAudio or PipeWire could request access =
to microphones and cameras on the behalf of apps. It was not meant to be =
used by sandboxed apps directly, which is unusual for a portal. Practical=
ly, however, it didn't take off.
    Implement PID/TID mapping for host system apps.
    Add a new "supported_output_file_formats" option to the Print portal.=
 This can be used by apps like browsers to limit the output file formats =
presented by the Print portal backend. For example, an app can limit file=
 printing to PDF files.
    Add a new "GetHostPaths" method to the Document portal, which allows =
mapping file descriptors to paths on the host system. This can be used by=
 apps to show more meaningful file paths in the user interface.
    Like the new method above, the Document portal sets the "user.documen=
t-portal.host-path" xattr on files, pointing to the the host system file =
path. The use case is similar to "GetHostPaths".
    Make the Background portal more robust when validating autostart file=
s.
    Clarify behavior of the File Chooser portal in the documentation page=
s.
    Improve robustness against deleted o_path fds in the Document portal.
    Fix a warning in some systems while trying to load Request D-Bus obje=
ct properties.
    Fix a physical inode leak in the Document portal.
    Various improvements to the test suite. Python-based tests now run in=
 parallel and are more careful when setting up the mock D-Bus server. Tes=
ts also start dbus-monitor if necessary now. FUSE tests of the Document p=
ortal have been made more TAP-alike now.
    Memory leak fixes in a variety of portals and services, including the=
 permissions database, the Document portal, the File Transfer portal, the=
 Location portal, the Background portal, tests, and the icon validator. A=
nd more. There's a lot of memory leak fixes everywhere, really.
    Major refactorings of the icon validator. Icons are now limited to 4M=
B files.
    Update XML specification specifying session handle type to match curr=
ent actual ABI in GlobalShortcuts, Inhibit, RemoteDesktop, and ScreenCast=
 portals.
    New and updated translations.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...desktop-portal_1.18.4.bb =3D> xdg-desktop-portal_1.20.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
18.4.bb =3D> xdg-desktop-portal_1.20.0.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.18.4.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.20.0.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.18.4.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.20.0.bb
index 87e8f1f5e9..800624bd90 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.18.=
4.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.=
0.bb
@@ -27,18 +27,19 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKEND=
S} fuse3-utils"
 inherit meson pkgconfig python3native features_check
=20
 SRC_URI =3D " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dxdg-desktop-portal-1.18 \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain \
 	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "11c8a96b147aeae70e3f770313f93b367d53fedd"
+SRCREV =3D "85df26fb1c53334969fea3f15c2a06a14831094b"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
=20
 EXTRA_OEMESON +=3D " \
 	--cross-file=3D${WORKDIR}/meson-${PN}.cross \
 	-Ddbus-service-dir=3D${datadir}/dbus-1/services \
+	-Dtests=3Ddisabled \
 "
=20
 do_write_config:append() {
--=20
2.48.1


