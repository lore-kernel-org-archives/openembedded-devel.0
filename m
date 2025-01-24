Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1899C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 11:54:32 +0000 (UTC)
Subject: Re: plymouth_24.004.60 causes to not pop up login prompt
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
X-Originating-Location: Bojano, Pomerania, PL (185.53.145.148)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 03:54:29 -0800
References: <25447.1737719616967366710@lists.openembedded.org>
In-Reply-To: <25447.1737719616967366710@lists.openembedded.org>
Message-ID: <25447.1737719669989083698@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="EaHYgmt8Hd7OedZQd1pW"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 11:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115059

--EaHYgmt8Hd7OedZQd1pW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From 3850e79c641a8f942400a566c36f716fc7a542a9 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
Date: Fri, 24 Jan 2025 11:54:22 +0100
Subject: [meta-oe][scarthgap][PATCH 2/2] plymouth: remove extra kernel
parameter
Setting `--kernel-command-line` in systemd service is unmodifiable
from the bootloader kernel parameters.
`splash` together with `plymouth.ignore-serial-consoles` should be
added by the user to e.g. bootloader configuration file instead.
---
...ervice-in-add-related-kernel-paramet.patch | 31 -------------------
.../plymouth/plymouth_24.004.60.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A01 -
2 files changed, 32 deletions(-)
delete mode 100644 meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-sta=
rt-service-in-add-related-kernel-paramet.patch
diff --git a/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-start-ser=
vice-in-add-related-kernel-paramet.patch b/meta-oe/recipes-core/plymouth/pl=
ymouth/0001-plymouth-start-service-in-add-related-kernel-paramet.patch
deleted file mode 100644
index 7ba1034e93..0000000000
--- a/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-start-service-in=
-add-related-kernel-paramet.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 658eac007d14d836cb002a5675487bac63d50324 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 7 Feb 2022 03:22:12 +0000
-Subject: [PATCH] plymouth-start.service.in: add related kernel parameter
-
-Add extra kernel parameter to make the plymouth splash screen
-display during boot.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/plymouth/plymou=
th/-/merge_requests/156]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- systemd-units/plymouth-start.service.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/systemd-units/plymouth-start.service.in b/systemd-units/plymo=
uth-start.service.in
-index 830a62d..c20aabe 100644
---- a/systemd-units/plymouth-start.service.in
-+++ b/systemd-units/plymouth-start.service.in
-@@ -9,7 +9,7 @@ ConditionVirtualization=3D!container
- IgnoreOnIsolate=3Dtrue
-
- [Service]
--ExecStart=3D@PLYMOUTH_DAEMON_DIR@/plymouthd --mode=3Dboot --pid-file=3D@p=
lymouthruntimedir@/pid --attach-to-session
-+ExecStart=3D@PLYMOUTH_DAEMON_DIR@/plymouthd --mode=3Dboot =C2=A0--kernel-=
command-line=3D"splash plymouth.ignore-serial-consoles" --pid-file=3D@plymo=
uthruntimedir@/pid --attach-to-session
- ExecStartPost=3D-@PLYMOUTH_CLIENT_DIR@/plymouth show-splash
- Type=3Dforking
- RemainAfterExit=3Dyes
---
-2.31.1
-
diff --git a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb b/meta-oe/=
recipes-core/plymouth/plymouth_24.004.60.bb
index c161c20ee9..05fe5c51e7 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
SRC_URI =3D " \
http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \
file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
- =C2=A0 =C2=A0file://0001-plymouth-start-service-in-add-related-kernel-par=
amet.patch \
file://0001-Drop-libdl-references.patch \
file://0001-Avoid-linking-to-plymouth_logo_file.patch \
file://0001-Make-themes-build-optional.patch \
--
2.48.1

--EaHYgmt8Hd7OedZQd1pW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>From 3850e79c641a8f942400a566c36f716fc7a542a9 Mon Sep 17 00:00:00 2001=
<br />From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D &lt;p.lobacz@welotec.=
com&gt;<br />Date: Fri, 24 Jan 2025 11:54:22 +0100<br />Subject: [meta-oe][=
scarthgap][PATCH 2/2] plymouth: remove extra kernel<br />&nbsp;parameter</d=
iv>
<div>Setting `--kernel-command-line` in systemd service is unmodifiable<br =
/>from the bootloader kernel parameters.</div>
<div>`splash` together with `plymouth.ignore-serial-consoles` should be<br =
/>added by the user to e.g. bootloader configuration file instead.<br />---=
<br />&nbsp;...ervice-in-add-related-kernel-paramet.patch | 31 ------------=
-------<br />&nbsp;.../plymouth/plymouth_24.004.60.bb &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;| &nbsp;1 -<br />&nbsp;2 files changed, 32 deletions(-)=
<br />&nbsp;delete mode 100644 meta-oe/recipes-core/plymouth/plymouth/0001-=
plymouth-start-service-in-add-related-kernel-paramet.patch</div>
<div>diff --git a/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-star=
t-service-in-add-related-kernel-paramet.patch b/meta-oe/recipes-core/plymou=
th/plymouth/0001-plymouth-start-service-in-add-related-kernel-paramet.patch=
<br />deleted file mode 100644<br />index 7ba1034e93..0000000000<br />--- a=
/meta-oe/recipes-core/plymouth/plymouth/0001-plymouth-start-service-in-add-=
related-kernel-paramet.patch<br />+++ /dev/null<br />@@ -1,31 +0,0 @@<br />=
-From 658eac007d14d836cb002a5675487bac63d50324 Mon Sep 17 00:00:00 2001<br =
/>-From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br />-Date: Mon, 7 Feb 2=
022 03:22:12 +0000<br />-Subject: [PATCH] plymouth-start.service.in: add re=
lated kernel parameter<br />-<br />-Add extra kernel parameter to make the =
plymouth splash screen<br />-display during boot.<br />-<br />-Upstream-Sta=
tus: Submitted [https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_re=
quests/156]<br />-<br />-Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.c=
om&gt;<br />----<br />- systemd-units/plymouth-start.service.in | 2 +-<br /=
>- 1 file changed, 1 insertion(+), 1 deletion(-)<br />-<br />-diff --git a/=
systemd-units/plymouth-start.service.in b/systemd-units/plymouth-start.serv=
ice.in<br />-index 830a62d..c20aabe 100644<br />---- a/systemd-units/plymou=
th-start.service.in<br />-+++ b/systemd-units/plymouth-start.service.in<br =
/>-@@ -9,7 +9,7 @@ ConditionVirtualization=3D!container<br />- IgnoreOnIsol=
ate=3Dtrue<br />-&nbsp;<br />- [Service]<br />--ExecStart=3D@PLYMOUTH_DAEMO=
N_DIR@/plymouthd --mode=3Dboot --pid-file=3D@plymouthruntimedir@/pid --atta=
ch-to-session<br />-+ExecStart=3D@PLYMOUTH_DAEMON_DIR@/plymouthd --mode=3Db=
oot &nbsp;--kernel-command-line=3D"splash plymouth.ignore-serial-consoles" =
--pid-file=3D@plymouthruntimedir@/pid --attach-to-session<br />- ExecStartP=
ost=3D-@PLYMOUTH_CLIENT_DIR@/plymouth show-splash<br />- Type=3Dforking<br =
/>- RemainAfterExit=3Dyes<br />---&nbsp;<br />-2.31.1<br />-<br />diff --gi=
t a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb b/meta-oe/recipes-c=
ore/plymouth/plymouth_24.004.60.bb<br />index c161c20ee9..05fe5c51e7 100644=
<br />--- a/meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb<br />+++ b/=
meta-oe/recipes-core/plymouth/plymouth_24.004.60.bb<br />@@ -11,7 +11,6 @@ =
LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f=
"<br />&nbsp;SRC_URI =3D " \<br />&nbsp; &nbsp; &nbsp;http://www.freedeskto=
p.org/software/plymouth/releases/${BPN}-${PV}.tar.xz \<br />&nbsp; &nbsp; &=
nbsp;file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch=
 \<br />- &nbsp; &nbsp;file://0001-plymouth-start-service-in-add-related-ke=
rnel-paramet.patch \<br />&nbsp; &nbsp; &nbsp;file://0001-Drop-libdl-refere=
nces.patch \<br />&nbsp; &nbsp; &nbsp;file://0001-Avoid-linking-to-plymouth=
_logo_file.patch \<br />&nbsp; &nbsp; &nbsp;file://0001-Make-themes-build-o=
ptional.patch \<br />--&nbsp;<br />2.48.1</div>
<div>&nbsp;</div>
</div>

--EaHYgmt8Hd7OedZQd1pW--

