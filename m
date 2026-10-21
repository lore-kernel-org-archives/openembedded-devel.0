Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8021.1792577262424355093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=hQLhoKVA;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id D8E12E3A1
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:39 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEJ-0cELa40; Wed, 21 Oct 2026 12:07:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/26] eog: upgrade 50.3 -> 50.4
Date: Wed, 21 Oct 2026 12:06:49 +0200
Message-ID: <20261021100717.11068-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577251-84FF6903-1294CD0A/0/0 CLEAN NORMAL
X-TOI-MSGID: 6de7efd4-d5b6-44b1-aea2-f47ecf550467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577259; i=f_l_k@t-online.de;
	bh=dguej0fd83n8VFiKaSgBYly9/fdQ9XpoOKT4jqchn44=;
	h=From:To:Subject:Date;
	b=hQLhoKVAU2QsOMZchoXB/4vm/frwlYQS6BqgV0YfIouuUa76FRGUJ7An/GRhcvOTR
	 cp2hn7RRfKxJiZco+Lnriml+s6I+eejs/Jy5Aq+vaepwlqzIsJRomc2an4aLUlgUkn
	 M3uHlTQRMxHnE6o0TstLWNGDJrtC8l79m3Un5REIWpks3lqkdXjNoOqfu+YBFDi9LW
	 +1otNa57k36ACivy4IXACMGxeId0xo7eFbGWqrXBRECXWltfo96sKrRydimSuibA3M
	 axMLRIAkKUOBVE8sxSyQs9x4p30lrrADhrB2CFG5GtaWUYUFYsNyPHiF571XeWvcJq
	 bBcix9M+1b10Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131242
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/{eog_50.3.bb =3D> eog_50.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_50.3.bb =3D> eog_50.4.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_50.3.bb b/meta-gnome/recipe=
s-gnome/eog/eog_50.4.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/eog/eog_50.3.bb
rename to meta-gnome/recipes-gnome/eog/eog_50.4.bb
index 21c6853a69..e15abb45fd 100644
--- a/meta-gnome/recipes-gnome/eog/eog_50.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_50.4.bb
@@ -23,7 +23,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "37280cd3874c6f219012b219f9f2c83bd88d750b=
f25f05bc7f742f41018466f4"
+SRC_URI[archive.sha256sum] =3D "db9a11ebad2fb1e5199c529d0eab8e566bd2d513=
8585ac467e5f6752206486c9"
=20
 PACKAGECONFIG =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11','cms', =
'', d)}"
=20
--=20
2.56.0

