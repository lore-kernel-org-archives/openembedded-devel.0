Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7424.1794562110099425930
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=esDkW1LS;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id 9640F4BFD
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZM-2DfB2P0; Fri, 13 Nov 2026 10:27:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 10/16] gimp: upgrade 3.2.6 -> 3.2.8
Date: Fri, 13 Nov 2026 10:27:25 +0100
Message-ID: <20261113092732.3895896-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562060-33FFC82B-E369AAC4/0/0 CLEAN NORMAL
X-TOI-MSGID: 243912d8-9f44-4184-a99d-f6b6263c61eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=p+Ob4ABisX4lNQ32HoClyEOocWjPtvnTSivyjDOonPY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=esDkW1LSPYwq3micTgyDtTL9RCmaKT0mR7pYgTZU37zPGLgFB0ERZbpEAyFBdNrAe
	 e5Ywsxe/qI31/vY+6Yy5nCm1q3NnwKrTpHXM3FMApDJcTPh/nGGFcyeA+d2jKbbfq/
	 CkvcpXLEeVCk/BdpDgGGFPO+SUWc4K9krfUa2Ps6Z0Ugn7z89PMIIxMFJ3ZKp9K1d6
	 YfJ5Bx0s/SV8OP+yGbu9wOAbHB4FSrO7mKUF22bhjo93dD7c+Brh1gFgJKuA/VqVo2
	 BX1hqMlrlySRpkASkp0H5pHmmAZTkGoQgpI3aeFOAfqLlG0nuxSMV3OhY7AJFG0Uuo
	 US1jApg9VHJHA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132235
Content-Type: text/plain; charset="utf-8"

Refresh 0004-meson.build-dont-check-for-python3-pygobject-gexiv2-.patch.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ont-check-for-python3-pygobject-gexiv2-.patch | 16 ++++++----------
 .../gimp/{gimp_3.2.6.bb =3D> gimp_3.2.8.bb}        |  2 +-
 2 files changed, 7 insertions(+), 11 deletions(-)
 rename meta-gnome/recipes-gimp/gimp/{gimp_3.2.6.bb =3D> gimp_3.2.8.bb} (=
98%)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0004-meson.build-dont-chec=
k-for-python3-pygobject-gexiv2-.patch b/meta-gnome/recipes-gimp/gimp/gimp=
/0004-meson.build-dont-check-for-python3-pygobject-gexiv2-.patch
index 4eb6f9553d..642f6ba238 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp/0004-meson.build-dont-check-for-p=
ython3-pygobject-gexiv2-.patch
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0004-meson.build-dont-check-for-p=
ython3-pygobject-gexiv2-.patch
@@ -21,27 +21,23 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 4f6f8ce9a4..4509cd2c39 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1224,7 +1224,7 @@ foreach py : py_candidates
+@@ -1223,7 +1223,7 @@
                                          '''except (ImportError):''',
                                          '''    sys.exit(1)''']),
                                          check: false).returncode() =3D=3D=
 0
--    if pygobject_found.returncode() =3D=3D 0 and pygobject_found.stdout=
().strip().version_compare(pygobject_minver) and pygobject_gexiv2_found
-+    if pygobject_found.returncode() =3D=3D 0 and pygobject_found.stdout=
().strip().version_compare(pygobject_minver)
+-    if pygobject_found.returncode() =3D=3D 0 and pygobject_found.stdout=
().strip().version_compare('>=3D' + pygobject_minver) and pygobject_gexiv=
2_found
++    if pygobject_found.returncode() =3D=3D 0 and pygobject_found.stdout=
().strip().version_compare('>=3D' + pygobject_minver)
        break
      endif
    endif
-@@ -1235,7 +1235,7 @@ if not python.found() or not python.language_versi=
on().version_compare(python3_m
+@@ -1234,7 +1234,7 @@
  endif
  message('Found Python @0@'.format(python.language_version()))
 =20
--if pygobject_found.returncode() !=3D 0 or not pygobject_found.stdout().=
strip().version_compare(pygobject_minver) or not pygobject_gexiv2_found
-+if pygobject_found.returncode() !=3D 0 or not pygobject_found.stdout().=
strip().version_compare(pygobject_minver)
+-if pygobject_found.returncode() !=3D 0 or not pygobject_found.stdout().=
strip().version_compare('>=3D' + pygobject_minver) or not pygobject_gexiv=
2_found
++if pygobject_found.returncode() !=3D 0 or not pygobject_found.stdout().=
strip().version_compare('>=3D' + pygobject_minver)
    error('No suitable PyGObject (with GExiv2 submodule) found. Minimum s=
upported version: @0@'.format(pygobject_minver))
  endif
  message('Found PyGObject: @0@'.format(pygobject_found.stdout().strip())=
)
---=20
-2.53.0
-
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.2.6.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.2.8.bb
similarity index 98%
rename from meta-gnome/recipes-gimp/gimp/gimp_3.2.6.bb
rename to meta-gnome/recipes-gimp/gimp/gimp_3.2.8.bb
index 835a501a92..abc0583778 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.2.6.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.2.8.bb
@@ -66,7 +66,7 @@ SRC_URI =3D "https://download.gimp.org/gimp/v3.2/${BP}.=
tar.xz \
            file://0004-meson.build-dont-check-for-python3-pygobject-gexi=
v2-.patch \
            file://0005-docs-meson.build-disable-gimprc-man-build.patch \
 "
-SRC_URI[sha256sum] =3D "40b15e90ad0c0c631b76da3c467ea9847fa5c24f37413ac5=
b492804860a28cd8"
+SRC_URI[sha256sum] =3D "16a2696cadc9e03a2ef97ccb895e062f654cb2b8211fb570=
74db85f26646c847"
=20
 PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
 PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
--=20
2.56.0

