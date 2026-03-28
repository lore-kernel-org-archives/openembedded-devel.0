Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30C810ED67B
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 00:40:43 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2693.1774658434778152685
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Tvgd9Nz6;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id D085438FE3
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 01:40:32 +0100 (CET)
Received: from fedora.fritz.box ([84.163.35.64]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w6Hj4-2mww8v0; Sat, 28 Mar 2026 01:40:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] flatpak: update 1.17.2 -> 1.17.3
Date: Sat, 28 Mar 2026 01:40:24 +0100
Message-ID: <20260328004025.592494-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774658430-41FF880B-58259D23/0/0 CLEAN NORMAL
X-TOI-MSGID: 376e63eb-7878-4bd4-b7de-93e96b83e4df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774658432; i=f_l_k@t-online.de;
	bh=/C4lKISCvtymMJ3Uk18GUlPbUa0ReUOf4bYGca8P1LI=;
	h=From:To:Subject:Date;
	b=Tvgd9Nz6gVwf92yJFFWdVcQPhgDACfugAdshcA1t56n2w125sVTMrA348wlEbx0SP
	 s6AhPahAAxOqohAIZBluEjD15+LC0Dw+WR/bbkX2mVpAIoSWZ+zRVn6okFhpWkDSJf
	 qVbXGchK+Wf4/akIekGgN4j7fUIWwFA3DA8hho823hS+VOc57LK3WPe/7j5cNgIeJe
	 sq25NbW4B+lOcJa/pxJPKVkTN4BhlmfPEcW1S8is8vwjDkzpyDBZQri0GpwojojNhC
	 2SwSY/CndFXn3dhO79rivcDJ+6pFhuZYlK8xiWcZWx9zHYYXQLbb/hsTvrNd98Lgil
	 DXigGCCaMUKMg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 00:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125794

Enhancements:

* Improve check for --filesystem paths pointing to a parent folder (#6473=
)

* Fail if non-interactive and multiple refs, remotes or installations mat=
ch
  (#5754)

* Default to text auth on WSL (#6491)

* Add build instructions for Ubuntu 24.04 (#6498)

* Show a better message when there are no refs to update (#6521)

* Silence AppStream refresh output on non-interactive runs (#6521)

* Translation updates: pt_BR (#6483), sl (#6468, #6475), sv (#6514), tr (=
#6528),
  zh_CN (#6469, #6477)

Bug fixes:

* Map the font-dirs.xml file more selectively (#6450)

* Change const pointers. This fixes build issues with glibc 2.43. (#6490)

* Add custom type flatpak_home_t for ~/.local/share/flatpak for SELinux (=
#6437)

* Fix build warnings when compiling with -Wanalyzer-null-argument and wit=
h
  -Wanalyzer-null-dereference (#6527)

* Use raw string for regular expression in the flatpak-bisect script (#65=
19)

Internal changes:

* Set the `FLATPAK_TRIGGERSDIR` environment variable when running
  installed tests. This fixes a regression with autopkg tests in
  Debian. (#6444)

* Add translator comments for some translatable strings (#6462)

* Fix typos in translatable strings (#6463)

* Fix lots of typos in code comments (#6482)

* Remove an unused function (#6529)

* Update two strings (#6464)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatpak/{flatpak_1.17.2.bb =3D> flatpak_1.17.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.2.bb =3D> flatpak_=
1.17.3.bb} (97%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.17.3.bb
similarity index 97%
rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
rename to meta-oe/recipes-extended/flatpak/flatpak_1.17.3.bb
index 4f8ad8add0..cd461e2632 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.17.3.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
     file://0001-flatpak-pc-add-pc_sysrootdir.patch \
 "
=20
-SRCREV =3D "20599618d623630f7aa38d61a2bb81d86fb25f09"
+SRCREV =3D "13b26a94a3bd6fec309a16982a3a80d83776d7ac"
=20
=20
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check useradd
--=20
2.53.0


