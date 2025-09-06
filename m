Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30178CA101C
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 06:47:37 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.2376.1757141250902860047
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Sep 2025 23:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id 8B59310D9
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Sep 2025 08:47:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.138]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uumhm-1tFz0r0; Sat, 6 Sep 2025 08:47:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] flatpak: update 1.16.0 -> 1.16.1
Date: Sat,  6 Sep 2025 08:47:09 +0200
Message-ID: <20250906064711.1430212-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757141242-D87F79FF-D8108F72/0/0 CLEAN NORMAL
X-TOI-MSGID: 88ffaa46-6651-436c-b10c-36b5ed1a04c6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 06:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119321

1.16.1

Enhancements:

    When using parental controls, allow a child account to update existin=
g apps by default, to ensure that security and bugfix updates can be inst=
alled. This can be overridden by setting polkit policy rules for the new =
org.freedesktop.Flatpak.override-parental-controls-update action if neces=
sary. (#5552)
    Make systemd scopes easier to match to Flatpak app instances, by usin=
g the instance ID instead of the top-level process ID in the scope name (=
#6015)
    Access to --device=3Ddri now includes /dev/udmabuf (#6158)
    Improve the error message for an invalid parameter to flatpak-spawn -=
-sandbox-a11y-own-name (#6048)
    Speed up flatpak prune --dry-run by not calculating potential freed s=
pace and avoiding operations that would need to hold a lock (#5813, #6121=
)
    Speed up flatpak permission-reset by only writing entries that have a=
ctually changed (#5772)
    Documentation improvements (#4859, #6066, #6134)
    Look for TLS certificates at /etc/containers/certs.d when interacting=
 with OCI registries (#5916)
    Translation updates: bg (#6120), ka (#6176), pl (#6106), pt_BR (#6076=
, #6188), ro (#6139), ru (#6145), sl (#6054), sv (#6193), tr (#6109)
    This is the first bugfix release of the Flatpak 1.16 series! Users an=
d distributions are strongly encouraged to update to this version.

Bug fixes:

    Fix intermittent flatpak-portal crashes by avoiding unnecessary multi=
-threading (#5605)
    Don't show a confusing confirmation prompt when flatpak remove --unus=
ed removes autoprune-unless extensions that are no longer needed, such as=
 older Nvidia drivers (#5712, #2718)
    Don't propagate $PYTHONPYCACHEPREFIX from host into sandbox (#6110)
    Don't propagate $WAYLAND_DISPLAY, $WAYLAND_SOCKET from host into sand=
box if access to the Wayland socket has been denied (#3948)
    When discovering the AT-SPI bus, treat $AT_SPI_BUS_ADDRESS as higher-=
priority than GetAddress(), more closely matching the behaviour of AT-SPI=
 itself (#6173)
    Fix a memory leak when installing extra-data (#6069)
    Don't show fatal transaction errors twice (#3400)
    Fix the build with -Ddefault_library=3Dstatic (#6119)
    Fix incorrect error reporting (#6127, #5170)
    When using FLATPAK_TTY_PROGRESS, terminate OSC escape sequence with s=
tandard ST sequence instead of xterm-specific BEL (#6092)
    Include all options in shell completion for flatpak search (#6096)

Internal changes:

    Fix an unclear boolean expression (no functional change) (#5013)
    Avoid a duplicate redirection in the test suite (#6117)
    CI updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/{flatpak_1.16.0.bb =3D> flatpak_1.16.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.16.0.bb =3D> flatpak_=
1.16.1.bb} (97%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.16.1.bb
similarity index 97%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.16.1.bb
index f99c8ac36a..0d688adf3e 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.16.0.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.16.1.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "1440f4faa67ebf69c7559f31d2cab59e6ec6fe2b"
+SRCREV =3D "b676905d91aa3c4e524ca663784d4cf085c465d7"
=20
=20
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check useradd
--=20
2.50.1


