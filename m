Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B63CF9C45
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20387.1726844890127195178
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id C99562E7DC
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEU-3JaG0X0; Fri, 20 Sep 2024 17:07:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 17/23] gvfs: update 1.54.0 -> 1.56.0
Date: Fri, 20 Sep 2024 17:08:16 +0200
Message-ID: <20240920150822.1131707-17-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844862-BE7FA467-3DF8330A/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c079cb2-c123-4964-a573-87abbf845018
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112417

Major changes in 1.56.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* udisks2: Run update synchronously for internal changes (Ondrej Holy)
* onedrive: Set name of drive root (Jan-Michael Brummer)
* onedrive: Handle multiple drives with same IDs (Jan-Michael Brummer)
* Translation updates (GNOME Translation Project contributors)

Major changes in 1.55.90
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* fuse: Fill stat info during readdir to improve performance (Ondrej Holy=
, Jan Palus)
* smb: Fix access over FUSE when root dir is not accessible (rong wang)
* onedrive: Guess mime type locally if not set by the server (Jan-Michael=
 Brummer)
* trash: Add support for x-gvfs-trash mount option (Ondrej Holy)
* onedrive: Add seek on write functionality (Jan-Michael Brummer)
* Translation updates (GNOME Translation Project contributors)

Major changes in 1.55.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* ftp: Change cwd to root before renaming to prevent failures (rong wang)
* udisks2: Ignore autofs mounts to prevent duplicated entries (Ondrej Hol=
y)
* udisks2: Show only direct descendats of /media unless $USER (Ondrej Hol=
y)
* ftp: Obtain correct modification time for old files using MDTM cmd (Ond=
rej Holy)
* ftp: Use timegm instead of mktime to not shift dates by timezone (Ondre=
j Holy)
* ftp: Add support for setting mtime attribute using MFMT cmd (Ondrej Hol=
y)
* ftp: Preserve mtime when copying to local (Ondrej Holy)
* build: Add deprecated_apis option and disable installation of headers (=
Ondrej Holy)
* udisks2: Do not schedule update if pending already to improve performan=
ce (Ondrej Holy)
* dav: Disable query_info_on_read method to fix mtime preservation (Ondre=
j Holy)
* network: Disable usage of smbbrowse backend by default (Ondrej Holy)
* smbbrowse: Don't enforce NT1 to fix mounting in certain cases (Ondrej H=
oly)
* onedrive: Fix various memory leaks (Jan-Michael Brummer)
* build: Disable burn backend by default (Ondrej Holy)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gvfs/{gvfs_1.54.0.bb =3D> gvfs_1.56.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.54.0.bb =3D> gvfs_1.56.0.bb=
} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.56.0.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.56.0.bb
index 6549b1900..a7a869eb5 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.56.0.bb
@@ -19,7 +19,7 @@ RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
=20
 SRC_URI =3D "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("=
${PV}")}/${BPN}-${PV}.tar.xz;name=3Darchive"
=20
-SRC_URI[archive.sha256sum] =3D "f53d81df86c2e86cdd25182c2d8a669a22371e83=
623ded1b9d5416dcfc6de366"
+SRC_URI[archive.sha256sum] =3D "441d2356c72616364cdb420af96199113a13ed9e=
146f2175fe373989adada39e"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
--=20
2.46.0


