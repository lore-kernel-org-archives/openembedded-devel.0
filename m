Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A598010BA45E
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 00:24:03 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2378.1774657435661591320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 17:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=uf9W/ACG;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd97.mgt.mul.t-online.de (fwd97.aul.t-online.de [10.223.144.123])
	by mailout10.t-online.de (Postfix) with SMTP id 7775C39017
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 01:23:53 +0100 (CET)
Received: from fedora.fritz.box ([84.163.35.64]) by fwd97.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w6HSy-0yp6iP0; Sat, 28 Mar 2026 01:23:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] xdg-desktop-portal: update 1.20.1 -> 1.21.0
Date: Sat, 28 Mar 2026 01:23:45 +0100
Message-ID: <20260328002345.450561-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774657432-197F0539-568EA84B/0/0 CLEAN NORMAL
X-TOI-MSGID: 0daa1508-da31-48ba-a6b9-5b64796085c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774657433; i=f_l_k@t-online.de;
	bh=OgePVGJf2+QEgARezhz9nTwOGidN5LBI2osYKRGskew=;
	h=From:To:Subject:Date;
	b=uf9W/ACGaaoF6Zs1UyZQI4wUIT+KKk1jn8PCN3zli7PzxHlXG7t+BAZp79zv9uPZE
	 InUPBINVhPkQYBincyMY4R22YGG10Nf0dAiSgv0I0R1n5fkCwz4cBODbz/A3unFS8z
	 MF9ge2iEV+TF1ERbZGspGj8/mT30zn/jTAOjoaP0Dbv8tW9obe7JCPO/BIuNzh1vif
	 9zyqHXqWNRVgp3VyRg0/QjkmqMtzWkIoqABfeLv8D0D0WfPhnhtAasIc00QFJ9ovfM
	 FzXUUM7DbNRh8gMRhjsZZLor5KNtTaNOtmdph0JSFfVl+2+7+z1cRTMy10qorAVfjA
	 s8b9AOwikwmHw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 00:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125792

New Features:

- Add the `has_current_page` and `has_selected_pages` options to the Prin=
t
  Portal (#1777)
- Allow running the tests with Valgrind's memcheck (#1770)
- Add the `ConfigureShortcuts` method to the Global Shortcuts Portal (#16=
61)
- Send activation tokens in the actiavated and deactiavated signals on th=
e
  Global Shortcuts Portal (#1792)
- Add a new reduced motion setting to the Settings Portal (#1840)
- Support linyaps applications (#1846)
- Add missing cell broadcast severities to the Notification Portal (#1738=
)

Enhancements:

- Code cleanup (#1574, #1809, #1771, #1727)
- Code refactoring (#1805, #1815, #1819, #1686)
- Documentation improvements (#1712, #1759, #1776, #1795, #1798, #1866)
- New and updated translations (#1735, #1760, #1765, #1774, #1780, #1781,
  #1786, #1787, #1789, #1797, #1800, #1801, #1802, #1811, #1833, #1826,
  #1852, #1841, #1843, #1851, #1869, #1860, #1788)
- Improve various permission dialog texts (#1769, #1327, #1804)
- Release procedure clarifications (#1710, #1714)
- Updates to ASAN suppressions (#1711)
- Make XdpAppInfo more testable (#1627)
- Use the new `PIDFD_GET_PID_NAMESPACE` ioctl to get the pidns (#1713)
- Improvements to the heuristics to translate a path in the sandbox to a =
path on
  the host (#1571)
- Improve the mocking of the GeoClue service (#1695)
- Make the camera permissions per-App on the host again (#1762)
- Clean up permissions and desktop IDs usage (#1772, #1773)
- Improve PID translations for host Apps (#1785)
- Show an appropriate error when access to remote documents fails (#823)
- Require a valid AppID from apps in `RequestBackground` to enable autost=
art
  (#1793)
- Require a valid AppID from apps to use the Global Shortcuts Portal (#18=
17)
- Test and document Notification Portal backward compatibilities (#1823)
- Improve the heuristic to detect the App ID for host apps (#1595)
- Add Merge Requirements documentation (#1775)
- Initialize the Secret Portal asynchronously to avoid blocking when the =
secret
  service is not available (#1814)
- Do not allow requesting a zero capability from the Input Capture Portal
  (#1880)
- Require GLib version 2.76 and drop the related compatibility code (#173=
0)

Bug Fixes:

- Fix a crash when loading information from Flatpak apps (#1720)
- Fix fd handling to prevent EBADF errors (#1721)
- Add a fallback code path for GLib older than 2.76 (#1728)
- Don't require a .desktop file for Flatpak and Snap apps (#1729)
- Fix a crash when calling `GlobalShortcuts.BindShortcuts` with an empty =
list
  (#1732)
- Fix a crash when passing Request token handles which contain `-` (#1748=
)
- Fix tests on systems without access to /proc/cmdline (#1766)
- Stop accidentally running pytests of subprojects (#1767)
- Give up trying to unmount an existing fuse mount when shutting down the
  Document Portal (#1799)
- Fix compilation on Debian Testing, caused by a wrong cast (#1625)
- Fix ownership of pidfd for XdpAppInfos (#1810)
- Fix uninitialized variables (#1825)
- Do not give access to read-only USB devices when read-write access was
  requested (#1794)
- Do not kill PID 0 and handle races properly (#1864)
- Fix forwarding the `available-source-types` and `available-cursor-modes=
` from
  the backend (#1868)
- Ensure valid WAYLAND_DISPLAY/DISPLAY by launching after the graphical s=
ession
  target (#1830)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-desktop-portal_1.20.3.bb =3D> xdg-desktop-portal_1.21.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xdg-desktop-portal/{xdg-desktop-portal_1.=
20.3.bb =3D> xdg-desktop-portal_1.21.0.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l_1.20.3.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-port=
al_1.21.0.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal=
_1.20.3.bb
rename to meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1=
.21.0.bb
index e0aca558fd..cb34441f81 100644
--- a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.20.=
3.bb
+++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.21.=
0.bb
@@ -27,11 +27,11 @@ RDEPENDS:${PN} =3D "bubblewrap rtkit ${PORTAL_BACKEND=
S} fuse3-utils"
 inherit meson pkgconfig python3native features_check
=20
 SRC_URI =3D " \
-	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dxdg-desktop-portal-1.20 \
+	git://github.com/flatpak/xdg-desktop-portal.git;protocol=3Dhttps;branch=
=3Dmain;tag=3D${PV} \
 	file://0001-meson.build-add-a-hack-for-crosscompile.patch \
 "
=20
-SRCREV =3D "23a76c392170dbbd26230f85ef56c3a57e52b857"
+SRCREV =3D "d49f4cb0ea1d6ddc02949a9631626668cd7fc4fc"
=20
 FILES:${PN} +=3D "${libdir}/systemd ${datadir}/dbus-1"
=20
--=20
2.53.0


