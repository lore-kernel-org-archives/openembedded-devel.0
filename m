Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.10126.1621006117416366847
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 08:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PMkVrKkO;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: athomasset@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 131so12913739ljj.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=4Ukevsy4qEMRDTv5VQMoHBbFi/W/AqSDjykXIBqU9Bc=;
        b=PMkVrKkOnmQNbpgZmC3oixjR/cgmHH5n3sOXdNeyojGEHgbK0MoniHc8Suuz77NYCb
         vHdtMFeWRlF/MveAEhF51BEH8l4V8YTkhPX1tkwItYQiTCOTwkXX7sUrsBeBNmSj+487
         ua7fxu0WYCqQGNpJ9gqkaAtU9Uck07af67b2/9ymJT5/rlh/H7S0gWWVouMPRQu9LiuD
         UaZfX/DbN2AooXTgs3VCjAEixgMPUEbR1RjpAAfCnuRTeEBgbQ+Ut0b/dEmsa9malo9L
         YCqAJAUyF2B/l5zFWOiqFl0o9+2amcKQkt4O45UdK8emHKP72l6jSxQSRkNp4yL66xlN
         FwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=4Ukevsy4qEMRDTv5VQMoHBbFi/W/AqSDjykXIBqU9Bc=;
        b=G0aI8QCKvjbf8jNCoiIZ1vd/x9Lx1fl3J5znTe0V5lCokkFMdYW3JJFDayKk6edhxe
         nWmIrdXoBn3sWNSVRWEyjVsFEDKXkMb0S6OP9En9UgCB3qDxZ8WQItWt6yOG3xcILvZZ
         JIXXrmY05UeiPy7zMHZOdoSlTzOBKh54MgXKcX+jf4nFQisqGFJEJGQrQvI5UR4H2ROG
         yxw/GL+f+9UK1wqDybnclAQUnSdicBFuBTMHYk8vIwY72tu+q/aMc4n+dgN4AHbJn5QN
         MExXpTo8huc+2SIQkxHfGu2h7Dm57cK1pGBpR+rYfoLWim6wb0ZwrlZeaCJ5o9qv4+sd
         1lZA==
X-Gm-Message-State: AOAM5302u/+VgOVDuKi0M6KgFc1RV8zgQH/zJPknv5fvZWNpVBzcUvPQ
	Zo2Bks3i+yz3o/z9afEtVlFWYyXTtjpqbYpZq451Fq5ao90qBw==
X-Google-Smtp-Source: ABdhPJyAy95ga/+PmDP+WrcS4ZtcBovfBJZo9BEFqKH+2jlSG9tzSxYNJgZ8l8fK9j3GwvwPjl9cfVTvYDTYCi+G1vg=
X-Received: by 2002:a05:651c:151:: with SMTP id c17mr35042135ljd.398.1621006114123;
 Fri, 14 May 2021 08:28:34 -0700 (PDT)
MIME-Version: 1.0
Reply-To: athomasset@gmail.com
From: "Adrian Thomasset" <athomasset@gmail.com>
Date: Fri, 14 May 2021 16:28:23 +0100
Message-ID: <CALvjPy0by0vAvNLTzJ4WyasGHpzhw4T8SKmWj-_k7v1gRzR=jg@mail.gmail.com>
Subject: [meta-networking][dunfell][PATCH] wireguard-tools: Fix systemd service installation
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009c725205c24be514"

--0000000000009c725205c24be514
Content-Type: text/plain; charset="UTF-8"

From 84681a31cfd3f7aa8cc89181c2c87ffffcbc261b Mon Sep 17 00:00:00 2001
From: Mario Schuknecht <schuknecht@dresearch-fe.de>
Date: Thu, 15 Oct 2020 16:53:12 +0200
Subject: [meta-networking][dunfell][PATCH] wireguard-tools: Fix systemd
 service installation

Install systemd configuration file wg-quick@.service into the proper folder.
Use 'systemd_system_unitdir' instead of 'systemd_unitdir' as the
installation
path.

Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/
wireguard-tools_1.0.20200513.bb b/meta-networking/recipes-kernel/wireguard/
wireguard-tools_1.0.20200513.bb
index 31b33a045..3403fd943 100644
--- a/meta-networking/recipes-kernel/wireguard/
wireguard-tools_1.0.20200513.bb
+++ b/meta-networking/recipes-kernel/wireguard/
wireguard-tools_1.0.20200513.bb
@@ -9,7 +9,7 @@ DEPENDS += "libmnl"

 do_install () {
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}"
SYSCONFDIR="${sysconfdir}" \
-        SYSTEMDUNITDIR="${systemd_unitdir}" \
+        SYSTEMDUNITDIR="${systemd_system_unitdir}" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
'systemd', 'yes', '', d)} \
         WITH_BASHCOMPLETION=yes \
         WITH_WGQUICK=yes \
@@ -18,7 +18,7 @@ do_install () {

 FILES_${PN} = " \
     ${sysconfdir} \
-    ${systemd_unitdir} \
+    ${systemd_system_unitdir} \
     ${bindir} \
 "

--
2.25.1

--0000000000009c725205c24be514
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From 84681a31cfd3f7aa8cc89181c2c87ffffcbc261b Mon Sep 17 0=
0:00:00 2001<br>From: Mario Schuknecht &lt;<a href=3D"mailto:schuknecht@dre=
search-fe.de">schuknecht@dresearch-fe.de</a>&gt;<br>Date: Thu, 15 Oct 2020 =
16:53:12 +0200<br>Subject: [meta-networking][dunfell][PATCH] wireguard-tool=
s: Fix systemd<br>=C2=A0service installation<br><br>Install systemd configu=
ration file wg-quick@.service into the proper folder.<br>Use &#39;systemd_s=
ystem_unitdir&#39; instead of &#39;systemd_unitdir&#39; as the installation=
<br>path.<br><br>Signed-off-by: Mario Schuknecht &lt;<a href=3D"mailto:mari=
o.schuknecht@dresearch-fe.de">mario.schuknecht@dresearch-fe.de</a>&gt;<br>S=
igned-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@g=
mail.com</a>&gt;<br>---<br>=C2=A0.../recipes-kernel/wireguard/<a href=3D"ht=
tp://wireguard-tools_1.0.20200513.bb">wireguard-tools_1.0.20200513.bb</a> =
=C2=A0| 4 ++--<br>=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>=
<br>diff --git a/meta-networking/recipes-kernel/wireguard/<a href=3D"http:/=
/wireguard-tools_1.0.20200513.bb">wireguard-tools_1.0.20200513.bb</a> b/met=
a-networking/recipes-kernel/wireguard/<a href=3D"http://wireguard-tools_1.0=
.20200513.bb">wireguard-tools_1.0.20200513.bb</a><br>index 31b33a045..3403f=
d943 100644<br>--- a/meta-networking/recipes-kernel/wireguard/<a href=3D"ht=
tp://wireguard-tools_1.0.20200513.bb">wireguard-tools_1.0.20200513.bb</a><b=
r>+++ b/meta-networking/recipes-kernel/wireguard/<a href=3D"http://wireguar=
d-tools_1.0.20200513.bb">wireguard-tools_1.0.20200513.bb</a><br>@@ -9,7 +9,=
7 @@ DEPENDS +=3D &quot;libmnl&quot;<br><br>=C2=A0do_install () {<br>=C2=A0=
 =C2=A0 =C2=A0oe_runmake DESTDIR=3D&quot;${D}&quot; PREFIX=3D&quot;${prefix=
}&quot; SYSCONFDIR=3D&quot;${sysconfdir}&quot; \<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SYSTEMDUNITDIR=3D&quot;${systemd_unitdir}&quot; \<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0SYSTEMDUNITDIR=3D&quot;${systemd_system_unitdir}&quot; \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_SYSTEMDUNITS=3D${@bb.utils.contains(=
&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;yes&#39;, &#39;&#39;, d)=
} \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_BASHCOMPLETION=3Dyes \<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_WGQUICK=3Dyes \<br>@@ -18,7 +18,7 @@ do=
_install () {<br><br>=C2=A0FILES_${PN} =3D &quot; \<br>=C2=A0 =C2=A0 =C2=A0=
${sysconfdir} \<br>- =C2=A0 =C2=A0${systemd_unitdir} \<br>+ =C2=A0 =C2=A0${=
systemd_system_unitdir} \<br>=C2=A0 =C2=A0 =C2=A0${bindir} \<br>=C2=A0&quot=
;<br><br>--<br><div>2.25.1</div>=C2=A0</div>

--0000000000009c725205c24be514--
