Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8F8C36005
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 03:21:27 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.58001.1742872881007381102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 20:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 0A9A8E4E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 04:21:19 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.137]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1twuqs-0TeWzh0; Tue, 25 Mar 2025 04:21:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] upower-profiles-daemon: add recipe
Date: Tue, 25 Mar 2025 04:22:02 +0100
Message-ID: <20250325032203.3034-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742872878-EDFFC83B-D2D4EF74/0/0 CLEAN NORMAL
X-TOI-MSGID: b3244960-0b33-42ec-921c-37b20dd91be1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116214

0.30
----

Add support for configuring actions to be enabled or disabled over dbus:
  - Actions can be listed via `powerprofilesctl list-actions`
  - These can be controlled via `powerprofilesctl configure-action`
Add support for configuring whether PPD reacts to battery/AC charger even=
ts:
  - It can be queried and controlled via:
    `powerprofilesctl query-battery-aware` and
    `powerprofilesctl configure-battery-aware`
Add better better compatibility with kernel 6.14.

0.23
----

Bugfix release for a performance regression with users who manually
adjusted AMD dGPU settings using other software.

0.22
----

Since this release power-profiles-daemon is also battery-level aware and
some drivers use this value to be smarter at tuning their optimizations.
In particular both the AMD panel power action now uses a progressive appr=
oach,
changing the the ABM based on the battery percentage.

AMD p-state received various features and improvements:
 - it supports core performance boost when not in power-saver mode.
 - uses minimum frequency to lowest non-linear frequency
 - it is more impervious to faulty firmware and kernel bugs

Added support for changing DPM clocks on amdgpu, to explicitly set the DP=
M
clocks down to "low" when in power-saver mode.

The daemon command line interface now allows to disable logind and upower
integration.

Fixes handling of turbo_pct (now assumed as not present by default).

The systemd service lockdown settings have been restricted even more.

The systemd service starts later in the boot to avoid conflicts with
module loading.

0.21
----

Since this release power-profiles-daemon is battery-state aware and some =
drivers
use a more power efficient state when using the balanced profile on batte=
ry.
In particular both the AMD and Intel P-State drivers will use the
balance_power EPP profile, while for Intel one we also set the energy
performance bias to 8 (instead of 6).

This release also contains various fixes for the powerprofilesctl command=
 line
tool when using the launch or version commands.
The tool is now better documented as we generate a manual page for it (if
python3-argparse is installed) and bash completions. We're even generatin=
g the
ZSH completions, but the install path must be provided.

The daemon command line interface has been improved for debugging, so use
--help-debug for further information.

The systemd service lockdown settings have been restricted even more.

Various code optimizations.

0.20
----

The project has moved under the freedesktop 'Upower' group. The service i=
s
now advertised as 'org.freedesktop.UPower.PowerProfiles' in addition to t=
he
previous 'net.hadess.PowerProfiles' for compatibility reasons.

This release adds support for:

* Multiple power-profiles-daemon drivers to load simultaneously.  This no=
tably
  allows both CPU based control with amd-pstate or intel-pstate as well a=
s
  ACPI platform profile based control.

* amdgpu panel power savings which uses dedicated hardware in systems wit=
h
  integrated Radeon graphics to decrease panel power consumption when the
  system is on battery.

This release also enables the test suite by default, so distribution vend=
ors
should update packaging accordingly.

0.13
----

This release adds support for the AMD P-State driver that's been added to=
 the
6.3 Linux kernel. This release also fixes mismatched profiles on some HP
laptops and some miscellaneous bug fixes.

0.12
----

This release adds support for the Intel "Energy Performance Bias" feature=
, which
can be used on hardware that doesn't have a platform_profile or doesn't s=
upport
HWP. It will also be used to eke out a bit more performance, or power, on=
 systems
which already supported HWP.

More information is available in the README.

0.11.1
------

This release stops power-profiles-daemon from modifying the cpufreq drive=
r when
driver when the user/administrator has chosen to disable the Intel P-Stat=
e scaling
governor (eg. forcing a passive operation mode).

More information is available in the README.

0.11
----

This release fixes problems on Intel machines when the CPUs didn't suppor=
t turbo at
all, or the performance scaling governor was built as default in the kern=
el.

It also adds better end-user documentation, fixes in the command-line too=
l to not
cause bug report tools to popup on not-uncommon errors, and a bug fix for=
 running
on some systems with controllable charge speeds.

0.10.1
------

This release fixes a bug in the authorization codepath added in 0.10.0, w=
here holding
a profile could still succeed despite having sent a denial to the calling=
 process.

This release also makes the pylint test optional. It should not be used u=
nless the goal
is to contribute patches to assuage it.

0.10.0
------

This release adds authorization checks for the profile holds and profile =
switching
features of the backend daemon, through polkit. It is recommended that al=
l
distributions upgrade to this version as soon as possible.

This release also adds support for the "quiet" kernel platform profile us=
ed
in some systems.

0.9.0
-----

This release adds support for "holding" a power profile while running a t=
ask
or application, making it possible to switch to a performance profile dur=
ing
a compilation, or to a power-saver profile when low on battery, reverting=
 to
the original profile when done.

This release also removes the "inhibited" property for the performance pr=
ofile,
which made it impossible to switch to that profile, and replaces it with =
the
"degraded" property which lists why performance is degraded.

Finally, the last used profile is now remembered across reboots.

0.8.1
-----

This release works-around a cosmetic issue in gnome-shell animations when
on battery and using the intel-pstate driver.

0.8
---

This release adds support for the new generic `platform_profile` kernel
API to replace the Lenovo specific `dytc_perfmode`, meaning it should als=
o
support profile selection on a number of HP and Microsoft Surface devices=
.

This release also add the `powerprofilesctl` command-line application.

0.1
---

This is the first version of power-profiles-daemon.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../upower/power-profiles-daemon_0.30.bb      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/upower/power-profiles-daemon_=
0.30.bb

diff --git a/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb=
 b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
new file mode 100644
index 0000000000..687e39145d
--- /dev/null
+++ b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
@@ -0,0 +1,32 @@
+SUMMARY =3D "Makes power profiles handling available over D-Bus"
+HOMEPAGE =3D "https://gitlab.freedesktop.org/upower/power-profile-daemon=
"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
+
+DEPENDS =3D " \
+    glib-2.0 \
+    polkit \
+    upower \
+    libgudev \
+"
+
+inherit meson pkgconfig systemd features_check
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+EXTRA_OEMESON =3D "-Dtests=3Dfalse"
+
+SRCREV =3D "5b4994c8a91290481bef87a5bae95391d0ec677f"
+SRC_URI =3D "git://gitlab.freedesktop.org/upower/power-profiles-daemon;b=
ranch=3Dmain;protocol=3Dhttps"
+S =3D "${WORKDIR}/git"
+
+do_install:append() {
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "d ${localstatedir}/lib/power-profiles-daemon 700 root root - -" >=
 ${D}${sysconfdir}/tmpfiles.d/power-profiles-daemon.conf
+}
+
+do_install:append() {
+    sed -i -e 's|After=3Dmulti-user.target |After=3D|g' ${D}${systemd_sy=
stem_unitdir}/power-profiles-daemon.service
+}
+
+FILES:${PN} +=3D "${sysconfdir}/tmpfiles.d ${datadir}/dbus-1 ${datadir}/=
polkit-1 ${systemd_system_unitdir}"
--=20
2.49.0


