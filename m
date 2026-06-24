Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDE7CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:53:50 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12159.1782320025611542071
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=WxYpJ9lX;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd92.aul.t-online.de (fwd92.aul.t-online.de [10.223.144.118])
	by mailout06.t-online.de (Postfix) with SMTP id 6F4E291C
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 18:53:43 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.171.242]) by fwd92.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wcQr2-05qQSW0; Wed, 24 Jun 2026 18:53:36 +0200
Date: Wed, 24 Jun 2026 18:53:30 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] xdg-desktop-portal: update 1.20.4 ->
 1.22.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <6XA5HT.RCDI6HWLGPR9@t-online.de>
In-Reply-To: <18BC128D21463273.1138462@lists.openembedded.org>
References: <18BC128D21463273.1138462@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-u4Y1QyerE9JCL/8PEYy9"
X-TOI-EXPURGATEID: 150726::1782320016-B1FF946A-956A9EB4/0/0 CLEAN NORMAL
X-TOI-MSGID: 129b609e-72a4-4155-9b89-e9ffd51c8a1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782320023; i=f_l_k@t-online.de;
	bh=e8nVp3XtcJud4qs7Bu3V1j8eFgB91NCCKWoQYEUBqI4=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=WxYpJ9lXt6ZqQHkIjBvu3LkMuS8Ux0hAmju/RW3UMu9s8ZDzOiOq+NPO1W+8zJS3f
	 c0tIsmGolBJjRvvv7HggkumyY3Mu+gujNQPxsU+9GClVRBEEOX6jO+fjQwyuUO8Vsf
	 BxadAy5azhLxSeI20KZ1QrdUQ+GujLmf3BByfz1K4JQKzqvuIwcowdwINQTFh2uBYP
	 BeUuzSO4m1UQ0snZ344ypnzfAZsCL9xhiuwNMdPz71+/Abnmisb8inxPdosNOq9dc7
	 jMuR0vGeuzERoGAXVnVw8Gc/4xYZBTbk7/popq0hCXtHc2338Uw7FbQa2USJ7nUH5q
	 I2bMcAyIQ8yFA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 16:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127723

--=-u4Y1QyerE9JCL/8PEYy9
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: also update SRCREV for libglnx

Am Mi, 24. Jun 2026 um 18:52:07 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> Changes in 1.22.0
> Released: 2026-06-08
> 
> Bug Fixes:
> 
> Correct passing icon GVariant around in the Dynamic Launcher Portal 
> (#2006)
> Improve Document Portal document path resolving for the File Chooser 
> and OpenURI Portals (#2004)
> Changes in 1.21.2
> Released: 2026-05-06
> 
> New Features:
> 
> Add a target selection to the Screenshot Portal (#1981)
> Add pipewire-serials to ScreenCast Portal streams (#1942)
> Enhancements:
> 
> Provide proper errors when enabling autostart failed (#1906)
> Integration for the gobject-linter and respective fixes for rule 
> violations (#1974, #1996)
> gvdb is now used as a meson subproject instead of a git subtree 
> (#1978)
> Add a missing deprecation annotation to InputCapture.CreateSession 
> (#1967)
> Various test and CI improvements (#1853, #1973, #1977)
> Various code cleanups (#1969, #1958, #1979, #1960)
> New and updated translations (#1965)
> Bug Fixes:
> 
> Improve how the document portal keeps track of granted documents to 
> avoid access getting lost when the system is rebooted (#1950)
> Fix a regression which broke trashing files in Flatpak (#1982)
> Improvements to the handling of the impl and frontend portal versions 
> (#1966, #1968, #1970)
> Changes in 1.21.1
> Released: 2026-04-08
> 
> New Features:
> 
> Add Clipboard support to the Input Capture Portal (#1803)
> Add session persistence support to the Input Capture Portal (#1898, 
> #1914, #1913)
> Security fixes:
> 
> Prevent trashing of arbitrary host files (GHSA-rqr9-jwwf-wxgj)
> Ensure that the clipboard mime type string does not exceed 4kb (#1918)
> Increase the file transfer token key size (#1916)
> Properly validate all D-Bus file descriptor indexes (#1917)
> Enhancements:
> 
> Improve loading portal configuration (#1867)
> Drop unused multiple option in the File Chooser SaveFile request 
> (#1923)
> Clarify the uris option in the File Chooser SaveFile request (#1927)
> Preparations for libdex support (#1879)
> Improve documentation on the release procedure (#1887)
> Specify that URIs follow RFC3986 (#1931)
> Clarify BindShortcuts behavior in the Global Shortcuts portal (#1848)
> Add a list of specialists for different portal topics (#1915)
> Clarify that mime type filters in the File Chooser support wildcard 
> subtypes (#1850)
> Continue removing global state and direct dependencies (#1911, #1934)
> Add Stargate Kotlin library to list of convenience libraries (#1936)
> Use the default FUSE implementation for statfs in the Document Portal 
> (#1807)
> Guard renameat2() flags usage behind ifdefs in the Document Portal 
> (#1929)
> Various testing improvements (#1909, #1891, #1890, #1907)
> New and updated translations (#1904, #1912, #1892, #1910, #1935, 
> #1949)
> Bug Fixes:
> 
> Fix the File Chooser Portal opening the parent of requested 
> current_folder (#1945)
> Prevent a deadlock on Document Portal shutdown (#1896)
> Various small fixes in the Remote Desktop, Camera, and Background 
> Portals (#1913, #1908, #1948, #1928, #1945)
> Fix checking for Input Capture capabilities (#1895)
> Print debug logs to stderr only, in the validate-icon and 
> validate-sound utils (#1901)
> Changes in 1.21.0
> Released: 2026-01-21
> 
> New Features:
> 
> Add the has_current_page and has_selected_pages options to the Print 
> Portal (#1777)
> Allow running the tests with Valgrind's memcheck (#1770)
> Add the ConfigureShortcuts method to the Global Shortcuts Portal 
> (#1661)
> Send activation tokens in the actiavated and deactiavated signals on 
> the Global Shortcuts Portal (#1792)
> Add a new reduced motion setting to the Settings Portal (#1840)
> Support linyaps applications (#1846)
> Add missing cell broadcast severities to the Notification Portal 
> (#1738)
> Enhancements:
> 
> Code cleanup (#1574, #1809, #1771, #1727)
> Code refactoring (#1805, #1815, #1819, #1686)
> Documentation improvements (#1712, #1759, #1776, #1795, #1798, #1866)
> New and updated translations (#1735, #1760, #1765, #1774, #1780, 
> #1781, #1786, #1787, #1789, #1797, #1800, #1801, #1802, #1811, #1833, 
> #1826, #1852, #1841, #1843, #1851, #1869, #1860, #1788)
> Improve various permission dialog texts (#1769, #1327, #1804)
> Release procedure clarifications (#1710, #1714)
> Updates to ASAN suppressions (#1711)
> Make XdpAppInfo more testable (#1627)
> Use the new PIDFD_GET_PID_NAMESPACE ioctl to get the pidns (#1713)
> Improvements to the heuristics to translate a path in the sandbox to 
> a path on the host (#1571)
> Improve the mocking of the GeoClue service (#1695)
> Make the camera permissions per-App on the host again (#1762)
> Clean up permissions and desktop IDs usage (#1772, #1773)
> Improve PID translations for host Apps (#1785)
> Show an appropriate error when access to remote documents fails (#823)
> Require a valid AppID from apps in RequestBackground to enable 
> autostart (#1793)
> Require a valid AppID from apps to use the Global Shortcuts Portal 
> (#1817)
> Test and document Notification Portal backward compatibilities (#1823)
> Improve the heuristic to detect the App ID for host apps (#1595)
> Add Merge Requirements documentation (#1775)
> Initialize the Secret Portal asynchronously to avoid blocking when 
> the secret service is not available (#1814)
> Do not allow requesting a zero capability from the Input Capture 
> Portal (#1880)
> Require GLib version 2.76 and drop the related compatibility code 
> (#1730)
> Bug Fixes:
> 
> Fix a crash when loading information from Flatpak apps (#1720)
> Fix fd handling to prevent EBADF errors (#1721)
> Add a fallback code path for GLib older than 2.76 (#1728)
> Don't require a .desktop file for Flatpak and Snap apps (#1729)
> Fix a crash when calling GlobalShortcuts.BindShortcuts with an empty 
> list (#1732)
> Fix a crash when passing Request token handles which contain - (#1748)
> Fix tests on systems without access to /proc/cmdline (#1766)
> Stop accidentally running pytests of subprojects (#1767)
> Give up trying to unmount an existing fuse mount when shutting down 
> the Document Portal (#1799)
> Fix compilation on Debian Testing, caused by a wrong cast (#1625)
> Fix ownership of pidfd for XdpAppInfos (#1810)
> Fix uninitialized variables (#1825)
> Do not give access to read-only USB devices when read-write access 
> was requested (#1794)
> Do not kill PID 0 and handle races properly (#1864)
> Fix forwarding the available-source-types and available-cursor-modes 
> from the backend (#1868)
> Ensure valid WAYLAND_DISPLAY/DISPLAY by launching after the graphical 
> session target (#1830)
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...top-portal_1.20.4.bb => xdg-desktop-portal_1.22.1.bb} | 9 
> ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename 
> meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.20.4.bb 
> => xdg-desktop-portal_1.22.1.bb} (77%)
> 
> diff --git 
> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.22.1.bb
> similarity index 77%
> rename from 
> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb
> rename to 
> meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.22.1.bb
> index bb48b59dd8..0ae75118ed 100644
> --- 
> a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb
> +++ 
> b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.22.1.bb
> @@ -27,15 +27,18 @@ RDEPENDS:${PN} = "bubblewrap rtkit 
> ${PORTAL_BACKENDS} fuse3-utils"
>  inherit meson pkgconfig python3native features_check
> 
>  SRC_URI = " \
> -	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=xdg-desktop-portal-1.20;name=main;tag=${PV} 
> \
> +	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=xdg-desktop-portal-1.22;name=main;tag=${PV} 
> \
>  
> 	git://gitlab.gnome.org/GNOME/libglnx.git;protocol=https;branch=master;name=libglnx;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/subprojects/libglnx 
> \
> +	git://gitlab.gnome.org/GNOME/gvdb.git;protocol=https;branch=main;name=gvdb;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/subprojects/gvdb 
> \
>  	file://0001-meson.build-add-a-hack-for-crosscompile.patch 
> <file://0001-meson.build-add-a-hack-for-crosscompile.patch/> \
>  "
> 
> -SRCREV_main = "f5aec228c9eb0c9a70eadd6424d92c0ca8a78247"
> +SRCREV_main = "1d20fadc304f6601452b5db65ed91197dba77041"
> 
>  # this revision comes from subprojects/libglnx.wrap file of the main 
> source repo
> -SRCREV_libglnx = "ccea836b799256420788c463a638ded0636b1632"
> +SRCREV_libglnx = "ff64d52116ae74f0d25e24f089db28921ea171ff"
> +# this revision comes from subprojects/gvdb.wrap file of the main 
> source repo
> +SRCREV_gvdb = "c6f2359cc1d00f16e0a0e2527fa0bc1882b8b5ab"
> 
>  SRCREV_FORMAT = "main"
> 
> --
> 2.54.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127722): 
> <https://lists.openembedded.org/g/openembedded-devel/message/127722>
> Mute This Topic: <https://lists.openembedded.org/mt/119960332/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-u4Y1QyerE9JCL/8PEYy9
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: also update SRCREV for libglnx</div></div><div id="geary-quote" dir="auto"><br>Am Mi, 24. Jun 2026 um 18:52:07 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Changes in 1.22.0
Released: 2026-06-08

Bug Fixes:

Correct passing icon GVariant around in the Dynamic Launcher Portal (#2006)
Improve Document Portal document path resolving for the File Chooser and OpenURI Portals (#2004)
Changes in 1.21.2
Released: 2026-05-06

New Features:

Add a target selection to the Screenshot Portal (#1981)
Add pipewire-serials to ScreenCast Portal streams (#1942)
Enhancements:

Provide proper errors when enabling autostart failed (#1906)
Integration for the gobject-linter and respective fixes for rule violations (#1974, #1996)
gvdb is now used as a meson subproject instead of a git subtree (#1978)
Add a missing deprecation annotation to InputCapture.CreateSession (#1967)
Various test and CI improvements (#1853, #1973, #1977)
Various code cleanups (#1969, #1958, #1979, #1960)
New and updated translations (#1965)
Bug Fixes:

Improve how the document portal keeps track of granted documents to avoid access getting lost when the system is rebooted (#1950)
Fix a regression which broke trashing files in Flatpak (#1982)
Improvements to the handling of the impl and frontend portal versions (#1966, #1968, #1970)
Changes in 1.21.1
Released: 2026-04-08

New Features:

Add Clipboard support to the Input Capture Portal (#1803)
Add session persistence support to the Input Capture Portal (#1898, #1914, #1913)
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
Clarify that mime type filters in the File Chooser support wildcard subtypes (#1850)
Continue removing global state and direct dependencies (#1911, #1934)
Add Stargate Kotlin library to list of convenience libraries (#1936)
Use the default FUSE implementation for statfs in the Document Portal (#1807)
Guard renameat2() flags usage behind ifdefs in the Document Portal (#1929)
Various testing improvements (#1909, #1891, #1890, #1907)
New and updated translations (#1904, #1912, #1892, #1910, #1935, #1949)
Bug Fixes:

Fix the File Chooser Portal opening the parent of requested current_folder (#1945)
Prevent a deadlock on Document Portal shutdown (#1896)
Various small fixes in the Remote Desktop, Camera, and Background Portals (#1913, #1908, #1948, #1928, #1945)
Fix checking for Input Capture capabilities (#1895)
Print debug logs to stderr only, in the validate-icon and validate-sound utils (#1901)
Changes in 1.21.0
Released: 2026-01-21

New Features:

Add the has_current_page and has_selected_pages options to the Print Portal (#1777)
Allow running the tests with Valgrind's memcheck (#1770)
Add the ConfigureShortcuts method to the Global Shortcuts Portal (#1661)
Send activation tokens in the actiavated and deactiavated signals on the Global Shortcuts Portal (#1792)
Add a new reduced motion setting to the Settings Portal (#1840)
Support linyaps applications (#1846)
Add missing cell broadcast severities to the Notification Portal (#1738)
Enhancements:

Code cleanup (#1574, #1809, #1771, #1727)
Code refactoring (#1805, #1815, #1819, #1686)
Documentation improvements (#1712, #1759, #1776, #1795, #1798, #1866)
New and updated translations (#1735, #1760, #1765, #1774, #1780, #1781, #1786, #1787, #1789, #1797, #1800, #1801, #1802, #1811, #1833, #1826, #1852, #1841, #1843, #1851, #1869, #1860, #1788)
Improve various permission dialog texts (#1769, #1327, #1804)
Release procedure clarifications (#1710, #1714)
Updates to ASAN suppressions (#1711)
Make XdpAppInfo more testable (#1627)
Use the new PIDFD_GET_PID_NAMESPACE ioctl to get the pidns (#1713)
Improvements to the heuristics to translate a path in the sandbox to a path on the host (#1571)
Improve the mocking of the GeoClue service (#1695)
Make the camera permissions per-App on the host again (#1762)
Clean up permissions and desktop IDs usage (#1772, #1773)
Improve PID translations for host Apps (#1785)
Show an appropriate error when access to remote documents fails (#823)
Require a valid AppID from apps in RequestBackground to enable autostart (#1793)
Require a valid AppID from apps to use the Global Shortcuts Portal (#1817)
Test and document Notification Portal backward compatibilities (#1823)
Improve the heuristic to detect the App ID for host apps (#1595)
Add Merge Requirements documentation (#1775)
Initialize the Secret Portal asynchronously to avoid blocking when the secret service is not available (#1814)
Do not allow requesting a zero capability from the Input Capture Portal (#1880)
Require GLib version 2.76 and drop the related compatibility code (#1730)
Bug Fixes:

Fix a crash when loading information from Flatpak apps (#1720)
Fix fd handling to prevent EBADF errors (#1721)
Add a fallback code path for GLib older than 2.76 (#1728)
Don't require a .desktop file for Flatpak and Snap apps (#1729)
Fix a crash when calling GlobalShortcuts.BindShortcuts with an empty list (#1732)
Fix a crash when passing Request token handles which contain - (#1748)
Fix tests on systems without access to /proc/cmdline (#1766)
Stop accidentally running pytests of subprojects (#1767)
Give up trying to unmount an existing fuse mount when shutting down the Document Portal (#1799)
Fix compilation on Debian Testing, caused by a wrong cast (#1625)
Fix ownership of pidfd for XdpAppInfos (#1810)
Fix uninitialized variables (#1825)
Do not give access to read-only USB devices when read-write access was requested (#1794)
Do not kill PID 0 and handle races properly (#1864)
Fix forwarding the available-source-types and available-cursor-modes from the backend (#1868)
Ensure valid WAYLAND_DISPLAY/DISPLAY by launching after the graphical session target (#1830)

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...top-portal_1.20.4.bb =&gt; xdg-desktop-portal_1.22.1.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.20.4.bb =&gt; xdg-desktop-portal_1.22.1.bb} (77%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.22.1.bb
similarity index 77%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.22.1.bb
index bb48b59dd8..0ae75118ed 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.4.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.22.1.bb
@@ -27,15 +27,18 @@ RDEPENDS:${PN} = "bubblewrap rtkit ${PORTAL_BACKENDS} fuse3-utils"
 inherit meson pkgconfig python3native features_check
 
 SRC_URI = " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=xdg-desktop-portal-1.20;name=main;tag=${PV} \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=xdg-desktop-portal-1.22;name=main;tag=${PV} \
 	git://gitlab.gnome.org/GNOME/libglnx.git;protocol=https;branch=master;name=libglnx;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/subprojects/libglnx \
+	git://gitlab.gnome.org/GNOME/gvdb.git;protocol=https;branch=main;name=gvdb;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/subprojects/gvdb \
 	<a href="file://0001-meson.build-add-a-hack-for-crosscompile.patch">file://0001-meson.build-add-a-hack-for-crosscompile.patch</a> \
 "
 
-SRCREV_main = "f5aec228c9eb0c9a70eadd6424d92c0ca8a78247"
+SRCREV_main = "1d20fadc304f6601452b5db65ed91197dba77041"
 
 # this revision comes from subprojects/libglnx.wrap file of the main source repo
-SRCREV_libglnx = "ccea836b799256420788c463a638ded0636b1632"
+SRCREV_libglnx = "ff64d52116ae74f0d25e24f089db28921ea171ff"
+# this revision comes from subprojects/gvdb.wrap file of the main source repo
+SRCREV_gvdb = "c6f2359cc1d00f16e0a0e2527fa0bc1882b8b5ab"
 
 SRCREV_FORMAT = "main"
 
<div>-- 
</div>2.54.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#127722): <a href="https://lists.openembedded.org/g/openembedded-devel/message/127722">https://lists.openembedded.org/g/openembedded-devel/message/127722</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/119960332/3618223">https://lists.openembedded.org/mt/119960332/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-u4Y1QyerE9JCL/8PEYy9--


