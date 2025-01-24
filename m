Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A2EC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 11:53:43 +0000 (UTC)
Subject: Re: plymouth_24.004.60 causes to not pop up login prompt
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
X-Originating-Location: Bojano, Pomerania, PL (185.53.145.148)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 03:53:36 -0800
References: <PA4PR04MB93433E7643B4F386C4D6541F91E02@PA4PR04MB9343.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB93433E7643B4F386C4D6541F91E02@PA4PR04MB9343.eurprd04.prod.outlook.com>
Message-ID: <25447.1737719616967366710@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="U1lTZyZUdTbMxdLZraNd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 11:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115058

--U1lTZyZUdTbMxdLZraNd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From b2c23a43cde6090322d3161accce47b74d8a6602 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
Date: Fri, 24 Jan 2025 11:49:40 +0100
Subject: [meta-oe][scarthgap][PATCH 1/2] plymouth: remove patch causing iss=
ue
with no login prompt
Setting `--retain-splash` isn't right, plymouth-quit gets used for instance
when switching to a getty or something that isn't graphical [1].
[1] https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/157
---
...lymouth-Add-the-retain-splash-option.patch | 35 -------------------
.../plymouth/plymouth_24.004.60.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A01 -
2 files changed, 36 deletions(-)
delete mode 100644 meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-Add=
-the-retain-splash-option.patch
diff --git a/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-Add-the-r=
etain-splash-option.patch b/meta-oe/recipes-core/plymouth/plymouth/0001-ply=
mouth-Add-the-retain-splash-option.patch
deleted file mode 100644
index 58838500bf..0000000000
--- a/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-Add-the-retain-s=
plash-option.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f270f80d4c36a22a0f7b8de8fb6b1abef6f7b183 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Tue, 15 Feb 2022 16:23:10 +0800
-Subject: [PATCH] plymouth : Add the retain-splash option
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Adding the "retain-splash=E2=80=9D option to tell plymouth to keep the boo=
t
-splash=E2=80=99s contents on screen even after plymouth exits to make the
-splash screen show more friendly on the system which boots so fast.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- systemd-units/plymouth-quit.service.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/systemd-units/plymouth-quit.service.in b/systemd-units/plymou=
th-quit.service.in
-index ed9f9b9..147e9ee 100644
---- a/systemd-units/plymouth-quit.service.in
-+++ b/systemd-units/plymouth-quit.service.in
-@@ -3,7 +3,7 @@ Description=3DTerminate Plymouth Boot Screen
- After=3Drc-local.service plymouth-start.service systemd-user-sessions.ser=
vice
-
- [Service]
--ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit
-+ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit --retain-splash
- Type=3Doneshot
- RemainAfterExit=3Dyes
- TimeoutSec=3D20
---
-2.17.1
-
diff --git a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb b/meta-oe/=
recipes-core/plymouth/plymouth_24.004.60.bb
index cdf24477a7..c161c20ee9 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb
@@ -12,7 +12,6 @@ SRC_URI =3D " \
http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
file://0001-plymouth-start-service-in-add-related-kernel-paramet.patch \
- =C2=A0 =C2=A0file://0001-plymouth-Add-the-retain-splash-option.patch \
file://0001-Drop-libdl-references.patch \
file://0001-Avoid-linking-to-plymouth_logo_file.patch \
file://0001-Make-themes-build-optional.patch \
--
2.48.1

--U1lTZyZUdTbMxdLZraNd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>From b2c23a43cde6090322d3161accce47b74d8a6602 Mon Sep 17 00:00:00 2001=
<br />From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D &lt;p.lobacz@welotec.=
com&gt;<br />Date: Fri, 24 Jan 2025 11:49:40 +0100<br />Subject: [meta-oe][=
scarthgap][PATCH 1/2] plymouth: remove patch causing issue<br />&nbsp;with =
no login prompt</div>
<div>Setting `--retain-splash` isn't right, plymouth-quit gets used for ins=
tance<br />when switching to a getty or something that isn't graphical [1].=
</div>
<div>[1] https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/=
157<br />---<br />&nbsp;...lymouth-Add-the-retain-splash-option.patch | 35 =
-------------------<br />&nbsp;.../plymouth/plymouth_24.004.60.bb &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;1 -<br />&nbsp;2 files changed, 36 =
deletions(-)<br />&nbsp;delete mode 100644 meta-oe/recipes-core/plymouth/pl=
ymouth/0001-plymouth-Add-the-retain-splash-option.patch</div>
<div>diff --git a/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-Add-=
the-retain-splash-option.patch b/meta-oe/recipes-core/plymouth/plymouth/000=
1-plymouth-Add-the-retain-splash-option.patch<br />deleted file mode 100644=
<br />index 58838500bf..0000000000<br />--- a/meta-oe/recipes-core/plymouth=
/plymouth/0001-plymouth-Add-the-retain-splash-option.patch<br />+++ /dev/nu=
ll<br />@@ -1,35 +0,0 @@<br />-From f270f80d4c36a22a0f7b8de8fb6b1abef6f7b18=
3 Mon Sep 17 00:00:00 2001<br />-From: Mingli Yu &lt;mingli.yu@windriver.co=
m&gt;<br />-Date: Tue, 15 Feb 2022 16:23:10 +0800<br />-Subject: [PATCH] pl=
ymouth : Add the retain-splash option<br />-MIME-Version: 1.0<br />-Content=
-Type: text/plain; charset=3DUTF-8<br />-Content-Transfer-Encoding: 8bit<br=
 />-<br />-Adding the "retain-splash&rdquo; option to tell plymouth to keep=
 the boot<br />-splash&rsquo;s contents on screen even after plymouth exits=
 to make the<br />-splash screen show more friendly on the system which boo=
ts so fast.<br />-<br />-Upstream-Status: Inappropriate [embedded specific]=
<br />-<br />-Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br /=
>----<br />- systemd-units/plymouth-quit.service.in | 2 +-<br />- 1 file ch=
anged, 1 insertion(+), 1 deletion(-)<br />-<br />-diff --git a/systemd-unit=
s/plymouth-quit.service.in b/systemd-units/plymouth-quit.service.in<br />-i=
ndex ed9f9b9..147e9ee 100644<br />---- a/systemd-units/plymouth-quit.servic=
e.in<br />-+++ b/systemd-units/plymouth-quit.service.in<br />-@@ -3,7 +3,7 =
@@ Description=3DTerminate Plymouth Boot Screen<br />- After=3Drc-local.ser=
vice plymouth-start.service systemd-user-sessions.service<br />-&nbsp;<br /=
>- [Service]<br />--ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit<br />-=
+ExecStart=3D-@PLYMOUTH_CLIENT_DIR@/plymouth quit --retain-splash<br />- Ty=
pe=3Doneshot<br />- RemainAfterExit=3Dyes<br />- TimeoutSec=3D20<br />---&n=
bsp;<br />-2.17.1<br />-<br />diff --git a/meta-oe/recipes-core/plymouth/pl=
ymouth_24.004.60.bb b/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb<b=
r />index cdf24477a7..c161c20ee9 100644<br />--- a/meta-oe/recipes-core/ply=
mouth/plymouth_24.004.60.bb<br />+++ b/meta-oe/recipes-core/plymouth/plymou=
th_24.004.60.bb<br />@@ -12,7 +12,6 @@ SRC_URI =3D " \<br />&nbsp; &nbsp; &=
nbsp;http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar=
.xz \<br />&nbsp; &nbsp; &nbsp;file://0001-Make-full-path-to-systemd-tty-as=
k-password-agent-con.patch \<br />&nbsp; &nbsp; &nbsp;file://0001-plymouth-=
start-service-in-add-related-kernel-paramet.patch \<br />- &nbsp; &nbsp;fil=
e://0001-plymouth-Add-the-retain-splash-option.patch \<br />&nbsp; &nbsp; &=
nbsp;file://0001-Drop-libdl-references.patch \<br />&nbsp; &nbsp; &nbsp;fil=
e://0001-Avoid-linking-to-plymouth_logo_file.patch \<br />&nbsp; &nbsp; &nb=
sp;file://0001-Make-themes-build-optional.patch \<br />--&nbsp;<br />2.48.1=
</div>
<div>&nbsp;</div>
</div>

--U1lTZyZUdTbMxdLZraNd--

