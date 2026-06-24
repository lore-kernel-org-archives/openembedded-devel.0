Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D41CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:52:30 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12129.1782319949525247800
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=h3eIYDDm;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id 7E77AEEB8
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 18:52:17 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.171.242]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wcQpi-0RXulN0; Wed, 24 Jun 2026 18:52:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] xdg-desktop-portal: update 1.20.4 -> 1.22.1
Date: Wed, 24 Jun 2026 18:52:07 +0200
Message-ID: <20260624165207.3416536-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782319934-789F6B5F-FF0EDB41/0/0 CLEAN NORMAL
X-TOI-MSGID: a3cbce49-4503-4bd9-b999-4eb7524116c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782319937; i=f_l_k@t-online.de;
	bh=Gip19HVK7wUE0vNGSoLVJv/f12TudoA7BuK6KG25k1A=;
	h=From:To:Subject:Date;
	b=h3eIYDDmpJund3O9wELSMlfXq9t7Z3RDTk2xfYgaMktVMjaJqOQ7NxKQ9dFhj38zt
	 0nhuMlehwMW4DnfFWtAgSs3TCkhQQf/NadoMqh+hr0idysmAdsB2HmIc7Z1TjQuiad
	 D9/ePoo+Ud7qF8T76kgYpYtJDuEI/VVzIGVcIEw61deWG19hqMvQGq76mwsJnZ99cA
	 v3O2YNV47SeylHgOyZLfr6YQGrPyW0UPZGkWDxmCxUiBabj0gAjMQvRauRZH3XYNa0
	 EgaqjVYVQtfMhrmlJGzjX/UZhXaCfCUoQObFgq2TFeO+HK2Od+IWEFSnxE889gm18G
	 RYl8UCs1rYeuw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 16:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127722

Changes in 1.22.0
Released: 2026-06-08

Bug Fixes:

Correct passing icon GVariant around in the Dynamic Launcher Portal (#200=
6)
Improve Document Portal document path resolving for the File Chooser and =
OpenURI Portals (#2004)
Changes in 1.21.2
Released: 2026-05-06

New Features:

Add a target selection to the Screenshot Portal (#1981)
Add pipewire-serials to ScreenCast Portal streams (#1942)
Enhancements:

Provide proper errors when enabling autostart failed (#1906)
Integration for the gobject-linter and respective fixes for rule violatio=
ns (#1974, #1996)
gvdb is now used as a meson subproject instead of a git subtree (#1978)
Add a missing deprecation annotation to InputCapture.CreateSession (#1967=
)
Various test and CI improvements (#1853, #1973, #1977)
Various code cleanups (#1969, #1958, #1979, #1960)
New and updated translations (#1965)
Bug Fixes:

Improve how the document portal keeps track of granted documents to avoid=
 access getting lost when the system is rebooted (#1950)
Fix a regression which broke trashing files in Flatpak (#1982)
Improvements to the handling of the impl and frontend portal versions (#1=
966, #1968, #1970)
Changes in 1.21.1
Released: 2026-04-08

New Features:

Add Clipboard support to the Input Capture Portal (#1803)
Add session persistence support to the Input Capture Portal (#1898, #1914=
, #1913)
Security fixes:

Prevent trashing of arbitrary host files (GHSA-rqr9-jwwf-wxgj)
Ensure that the clipboard mime type string does not exceed 4kb (#1918)
Increase the file transfer token key size (#1916)
Properly validate all D-Bus file descriptor indexes (#1917)
Enhancements:

Improve loading portal configuration (#1867)
Drop unused multiple option in the File Chooser SaveFile request (#1923)
Clarify the uris option in the File Chooser SaveFile request (#1927)
Preparations for libdex support (#1879)
Improve documentation on the release procedure (#1887)
Specify that URIs follow RFC3986 (#1931)
Clarify BindShortcuts behavior in the Global Shortcuts portal (#1848)
Add a list of specialists for different portal topics (#1915)
Clarify that mime type filters in the File Chooser support wildcard subty=
pes (#1850)
Continue removing global state and direct dependencies (#1911, #1934)
Add Stargate Kotlin library to list of convenience libraries (#1936)
Use the default FUSE implementation for statfs in the Document Portal (#1=
807)
Guard renameat2() flags usage behind ifdefs in the Document Portal (#1929=
)
Various testing improvements (#1909, #1891, #1890, #1907)
New and updated translations (#1904, #1912, #1892, #1910, #1935, #1949)
Bug Fixes:

Fix the File Chooser Portal opening the parent of requested current_folde=
r (#1945)
Prevent a deadlock on Document Portal shutdown (#1896)
Various small fixes in the Remote Desktop, Camera, and Background Portals=
 (#1913, #1908, #1948, #1928, #1945)
Fix checking for Input Capture capabilities (#1895)
Print debug logs to stderr only, in the validate-icon and validate-sound =
utils (#1901)
Changes in 1.21.0
Released: 2026-01-21

New Features:

Add the has_current_page and has_selected_pages options to the Print Port=
al (#1777)
Allow running the tests with Valgrind's memcheck (#1770)
Add the ConfigureShortcuts method to the Global Shortcuts Portal (#1661)
Send activation tokens in the actiavated and deactiavated signals on the =
Global Shortcuts Portal (#1792)
Add a new reduced motion setting to the Settings Portal (#1840)
Support linyaps applications (#1846)
Add missing cell broadcast severities to the Notification Portal (#1738)
Enhancements:

Code cleanup (#1574, #1809, #1771, #1727)
Code refactoring (#1805, #1815, #1819, #1686)
Documentation improvements (#1712, #1759, #1776, #1795, #1798, #1866)
New and updated translations (#1735, #1760, #1765, #1774, #1780, #1781, #=
1786, #1787, #1789, #1797, #1800, #1801, #1802, #1811, #1833, #1826, #185=
2, #1841, #1843, #1851, #1869, #1860, #1788)
Improve various permission dialog texts (#1769, #1327, #1804)
Release procedure clarifications (#1710, #1714)
Updates to ASAN suppressions (#1711)
Make XdpAppInfo more testable (#1627)
Use the new PIDFD_GET_PID_NAMESPACE ioctl to get the pidns (#1713)
Improvements to the heuristics to translate a path in the sandbox to a pa=
th on the host (#1571)
Improve the mocking of the GeoClue service (#1695)
Make the camera permissions per-App on the host again (#1762)
Clean up permissions and desktop IDs usage (#1772, #1773)
Improve PID translations for host Apps (#1785)
Show an appropriate error when access to remote documents fails (#823)
Require a valid AppID from apps in RequestBackground to enable autostart =
(#1793)
Require a valid AppID from apps to use the Global Shortcuts Portal (#1817=
)
Test and document Notification Portal backward compatibilities (#1823)
Improve the heuristic to detect the App ID for host apps (#1595)
Add Merge Requirements documentation (#1775)
Initialize the Secret Portal asynchronously to avoid blocking when the se=
cret service is not available (#1814)
Do not allow requesting a zero capability from the Input Capture Portal (=
#1880)
Require GLib version 2.76 and drop the related compatibility code (#1730)
Bug Fixes:

Fix a crash when loading information from Flatpak apps (#1720)
Fix fd handling to prevent EBADF errors (#1721)
Add a fallback code path for GLib older than 2.76 (#1728)
Don't require a .desktop file for Flatpak and Snap apps (#1729)
Fix a crash when calling GlobalShortcuts.BindShortcuts with an empty list=
 (#1732)
Fix a crash when passing Request token handles which contain - (#1748)
Fix tests on systems without access to /proc/cmdline (#1766)
Stop accidentally running pytests of subprojects (#1767)
Give up trying to unmount an existing fuse mount when shutting down the D=
ocument Portal (#1799)
Fix compilation on Debian Testing, caused by a wrong cast (#1625)
Fix ownership of pidfd for XdpAppInfos (#1810)
Fix uninitialized variables (#1825)
Do not give access to read-only USB devices when read-write access was re=
quested (#1794)
Do not kill PID 0 and handle races properly (#1864)
Fix forwarding the available-source-types and available-cursor-modes from=
 the backend (#1868)
Ensure valid WAYLAND_DISPLAY/DISPLAY by launching after the graphical ses=
sion target (#1830)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...top-portal_1.20.4.bb =3D> xdg-desktop-portal_1.22.1.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
20.4.bb =3D> xdg-desktop-portal_1.22.1.bb} (77%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.20.4.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.22.1.bb
similarity index 77%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.20.4.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.22.1.bb
index bb48b59dd8..0ae75118ed 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.=
4.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.22.=
1.bb
@@ -27,15 +27,18 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKEND=
S} fuse3-utils"
 inherit meson pkgconfig python3native features_check
=20
 SRC_URI =3D " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dxdg-desktop-portal-1.20;name=3Dmain;tag=3D${PV} \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dxdg-desktop-portal-1.22;name=3Dmain;tag=3D${PV} \
 	git://gitlab.gnome.org/GNOME/libglnx.git;protocol=3Dhttps;branch=3Dmast=
er;name=3Dlibglnx;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/subprojects/l=
ibglnx \
+	git://gitlab.gnome.org/GNOME/gvdb.git;protocol=3Dhttps;branch=3Dmain;na=
me=3Dgvdb;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/subprojects/gvdb \
 	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
=20
-SRCREV_main =3D "f5aec228c9eb0c9a70eadd6424d92c0ca8a78247"
+SRCREV_main =3D "1d20fadc304f6601452b5db65ed91197dba77041"
=20
 # this revision comes from subprojects/libglnx.wrap file of the main sou=
rce repo
-SRCREV_libglnx =3D "ccea836b799256420788c463a638ded0636b1632"
+SRCREV_libglnx =3D "ff64d52116ae74f0d25e24f089db28921ea171ff"
+# this revision comes from subprojects/gvdb.wrap file of the main source=
 repo
+SRCREV_gvdb =3D "c6f2359cc1d00f16e0a0e2527fa0bc1882b8b5ab"
=20
 SRCREV_FORMAT =3D "main"
=20
--=20
2.54.0


