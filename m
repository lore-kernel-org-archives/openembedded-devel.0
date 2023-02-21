Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C9BC636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 15:26:47 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.44716.1676993207053052244
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Feb 2023 07:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout01.t-online.de (Postfix) with SMTP id 28D98E288
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 16:26:45 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.85]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pUUXU-2pTOyI0; Tue, 21 Feb 2023 16:26:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] flatpak: update 1.15.1 -> 1.15.3
Date: Tue, 21 Feb 2023 16:26:30 +0100
Message-Id: <20230221152630.51167-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221152630.51167-1-f_l_k@t-online.de>
References: <20230221152630.51167-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676993205-C77EB4E4-219A11F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 9bae755f-01a1-4af3-b731-49d6734c7edb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 15:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101190

1.15.3
Released: 2023-02-21

Build system:

    Building this version of Flatpak with Meson is recommended. The sourc=
e release flatpak-1.15.3.tar.xz no longer contains Autotools-generated fi=
les, although this version can still be built using Autotools after runni=
ng ./autogen.sh. Future versions are likely to remove the Autotools build=
 system.

Bug fixes:

    When splitting an upgrade into two steps (download without installing=
, and then upgrade without allowing further downloads) like GNOME Softwar=
e does, if an app is marked EOL and superseded by a replacement, don't re=
move the superseded app in the first step, which would result in the repl=
acement incorrectly not being installed (#5172)
    Fix a crash when --socket=3Dgpg-agent is used (#5095)
    Fix a crash when listing apps if one of them is broken or misconfigur=
ed (#5293)
    If an app has invalid syntax in its overrides or metadata, mention th=
e filename in the error message (#5293)
    Unset $GDK_BACKEND for apps, ensuring GTK apps with --socket=3Dfallba=
ck-x11 can work (#5303)
    Fix a deprecation warning when compiled with curl >=3D 7.85 (#5284)
    Translation updates: es, ru (#5266, #5312, #5313)

Internal changes:

    Better diagnostic messages for why runtimes are or are not considered=
 unused (#5237)

1.15.2
Released: 2023-02-06

Bug fixes:

    Never try to export a parent of reserved directories as a --filesyste=
m,
    for example /run, which would prevent the app from starting (#5205, #=
5207)
    Never try to export a --filesystem below /run/flatpak or /run/host,
    which could similarly prevent the app from starting
    The above change also fixes apps not starting if a --filesystem is a
    symlink to the root directory (#1357)
    Show a warning when the --filesystem exists but cannot be shared with
    the sandbox (#1357, #5035, #5205, #5207)
    Display the intended messages for flatpak repair (#5204)
    Exporting an app to an existing repository on a CIFS filesystem
    now works as intended (#5257)
    Unset $GIO_EXTRA_MODULES for apps, avoiding misbehaviour in some GLib
    apps when set to a path on the host (#5206)
    Unset $XKB_CONFIG_ROOT for apps, avoiding crashes in GTK and Qt apps
    under Wayland when this variable is set to a path not available in th=
e
    sandbox (#5194)
    When using the fish shell, avoid duplicate XDG_DATA_DIRS entries if t=
he
    profile script is sourced more than once (#5198)
    Update included copy of bubblewrap to 0.7.0 for better error messages
    Install SELinux files correctly when building with Meson
    Translation updates: ru, tr (#5256, #5262)

Internal changes:

    Update included copy of libglnx
    flatpak -v now uses the INFO log level, and flatpak -vv uses the
    DEBUG log level in the flatpak log domain. Previously, the extra
    messages that were logged by flatpak -vv were in a separate "flatpak2=
"
    log domain. G_MESSAGES_DEBUG=3Dflatpak previously had an effect simil=
ar to
    flatpak -v, and is now more similar to flatpak -vv.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/{flatpak_1.15.1.bb =3D> flatpak_1.15.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.15.1.bb =3D> flatpak_=
1.15.3.bb} (96%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.15.3.bb
index 04f4c532a..3aafa3f0d 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.3.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "47ea3934c0e055605b8dff93edad2136141e48ec"
+SRCREV =3D "756994b5c433dad9786f9fad736667c4f524aeac"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


