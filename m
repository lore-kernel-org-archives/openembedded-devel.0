Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA66C021A4
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 01:01:32 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.1102.1740445283722928818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 17:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout05.t-online.de (Postfix) with SMTP id CD26AF50
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 02:01:21 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.213]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmjK5-3RwbC50; Tue, 25 Feb 2025 02:01:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] flatpak: update 1.15.10 -> 1.16.0
Date: Tue, 25 Feb 2025 02:01:13 +0100
Message-ID: <20250225010115.31203-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740445281-D67FA479-9F518043/0/0 CLEAN NORMAL
X-TOI-MSGID: 8692d5ec-4d63-4b09-8fd0-469872188577
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 01:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115553

Changes in 1.16.1
~~~~~~~~~~~~~~~~~~
Released: not yet

...

Changes in 1.16.0
~~~~~~~~~~~~~~~~~~
Released: 2025-01-09

Bug fixes:

 * Update libglnx to 2024-12-06:
    - Fix an assertion failure if creating a parent directory encounters =
a
      dangling symlink (GNOME/libglnx#1)
    - Fix a Meson warning

* Don't emit terminal progress indicator escape sequences by default. The=
y are
  interpreted as notifications by some terminal emulators. (#6052)

* Fix introspection annotations in libflatpak

Enhancements:

* Add the `FLATPAK_TTY_PROGRESS` environment variable, which re-enables t=
he
  terminal progress indicator escape sequences added in 1.15.91.

* Document the `FLATPAK_FANCY_OUTPUT` environment variable, which allows
  disabling the fancy formatting when outputting to a terminal.

Changes in 1.15.91
~~~~~~~~~~~~~~~~~~
Released: 2024-12-19

Enhancements:

 * Add the `FLATPAK_DATA_DIR` environment variable, which allows overridi=
ng
   at runtime the data directory location that Flatpak uses to search for
   configuration files such as remotes. This is useful for running tests,
   and for when installing using Flatpak in a chroot.

 * Add a `FLATPAK_DOWNLOAD_TMPDIR` variable. This allows using download
   directories other than /var/tmp.

 * Emit progress escape sequence. This can be used by terminal emulators
   to detect and display progress of Flatpak operations on their graphica=
l
   user interfaces.

Bug fixes:

 * Install missing test data. This should fix "as-installed" tests via
   `ginsttest-runner`, used for example in Debian's autopkgtest framework=
.

 * Unify and improve how the Wayland socket is passed to the sandboxed ap=
p.
   This should fix a regression that is triggered by compositors that bot=
h
   implement the security-context-v1 protocol, and sets the `WAYLAND_DISP=
LAY`
   environment variable when launching Flatpak apps. (#5863)

 * Fix the plural form of a translatable string.

Changes in 1.15.12
~~~~~~~~~~~~~~~~~~
Released: 2024-11-28

Bug fixes:

 * Return to using the process ID of the Flatpak app in the cgroup name.
   Using the instance ID in 1.15.11 caused crashes when installing apps,
   extensions or runtimes that use the "extra data" mechanism, which
   does not set up an instance ID. (#6009)

Changes in 1.15.11
~~~~~~~~~~~~~~~~~~
Released: 2024-11-26

Dependencies:

 * In distributions that compile Flatpak to use a separate bubblewrap
   executable, version 0.11.0 is recommended (but not required).
   The minimum bubblewrap continues to be 0.10.0.

 * In distributions that compile Flatpak to use a separate xdg-dbus-proxy
   executable, version 0.1.6 is recommended (but not required).
   The minimum xdg-dbus-proxy continues to be 0.1.0.

Enhancements:

 * Allow applications like WebKit to connect the AT-SPI accessibility tre=
e
   of processes in a sub-sandbox with the tree in the main process (#5898=
)

     * New sandboxing parameter `flatpak run --a11y-own-name`, which is
       like `--own-name` but for the accessibility bus

     * flatpak-portal API v7: add new sandbox-a11y-own-names option, whic=
h
       accepts names matching `${FLATPAK_ID}.*`

     * Apps may call the `org.a11y.atspi.Socket.Embedded` method on names
       matching `${FLATPAK_ID}.Sandboxed.*` by default

 * `flatpak run -vv $app_id` shows all applicable sandboxing parameters
   and their source, including overrides, as debug messages (#5895)

 * Add --device=3Dusb, a subset of --device=3Dall

 * Introduce USB device listing

   * Apps can list which USB devices they want to access ahead of time by
     using the `--usb` parameter. Check the manpages for the more informa=
tion
     about the accepted syntax.

   * Denying access to USB devices is also possible with the `--no-usb`
     parameter. The syntax is equal to `--usb`.

   * Both options merely store metadata, and aren't used by Flatpak itsel=
f.
     This metadata is intended to be used by the (as of now, still in
     progress) USB portal to decide which devices the app can enumerate a=
nd
     request access.

 * Add support for KDE search completion

 * Use the instance id of the Flatpak app as part of the cgroup name. Thi=
s
   better matches the naming conventions for cgroup.

 * Preconfigured repositories can now be set up by OS vendors using
   `${datadir}/flatpak/remotes.d` (typically /usr/share/flatpak/remotes.d=
),
   in addition to `${sysconfdir}/flatpak/remotes.d` (typically
   /etc/flatpak/remotes.d) which is intended for local sysadmin use

Bug fixes:

 * Update libglnx to 2024-08-23 (#5918)

     * fix build in environments that use -Werror=3Dreturn-type, such as
       openSUSE Tumbleweed (#5778)

     * add a fallback definition for G_PID_FORMAT with older GLib

     * avoid warnings for g_steal_fd() with newer GLib

     * improve compatibility of g_closefrom() backport with newer GLib

 * Update meson wrap file for bubblewrap to version 0.11.0:

     * drop Autotools build system

     * improve handling of EINTR

     * improve handling of socket control messages

     * improve compatibility with busybox

     * improve compatibility with older Meson

     * fix deprecation warnings

 * Update meson wrap file for xdg-dbus-proxy to version 0.1.6:

     * compatibility with D-Bus implementations that pipeline the
       authentication handshake, such as sd-bus and zbus

     * compatibility with D-Bus implementations that use non-consecutive
       serial numbers, such as godbus and zbus

     * broadcast signals can be allowed without having to add TALK permis=
sion
       (#5828)

     * fix memory leaks

 * Fix some memory leaks

 * Translation updates: cs, pl, zh_CN

Internal changes:

 * Better const-correctness (#5913)
 * Fix a shellcheck warning in the tests (#5914)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/{flatpak_1.15.10.bb =3D> flatpak_1.16.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.15.10.bb =3D> flatpak=
_1.16.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.10.bb b/meta-o=
e/recipes-extended/flatpak/flatpak_1.16.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.15.10.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
index c9d04e9261..1f0e649eea 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.10.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "8b4f523c4f8287d57f1a84a3a8216efe200c5fbf"
+SRCREV =3D "1440f4faa67ebf69c7559f31d2cab59e6ec6fe2b"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.48.1


