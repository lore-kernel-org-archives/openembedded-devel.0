Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4F2C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 13:33:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.6753.1676381602697751070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 05:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ey3xe+62;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso13716785wms.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 05:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qEz57XJsdzNYY9jyJO5CxTPtyyHHOa+SWIruquRzMR8=;
        b=Ey3xe+62woZnZmsaAQGTBtfnTs3osyZLlCs+tuRZSj0W7+ZeET4fDwOok3czGVCYOD
         97nAQnSKP0tQIG38AuRpUJx40jjecGPyJqj4FynrZKmxs1Z1eBh6VNvlWC0xv9w9wPpD
         BlOZSC6iMXLw0Jy3g6bLO9iWlVWR02KjBP8zkn6yMtEcGogmDWBhXUlHshx5QjI71bXx
         kXtvU0lJZplGp+c2XDZ6x+ZMGDpht5dvK3MvsuV0luaNOWhjVGR73ndH7cUs5sKk8aVt
         f6+uecBwwvq3S/d9OvDbdKHF+FRmcwsMgESTeRzxklC1aYdKNflQdgOWYEPH1lcn+Jy5
         5YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEz57XJsdzNYY9jyJO5CxTPtyyHHOa+SWIruquRzMR8=;
        b=717GR0attsUSS86xx2/Ttr9dBLbYKsIzPJEziJgHwAg+8VoPyFjT6iDhy7Kcb0m/Lg
         DsS9egebViuo/zZU6XM1M31uo/mF0aPO4N6RwRxB6euJF/C3oig4hP9CLrHTiEd9VEgk
         5ABnDvMSpIDnBHvx2c0sYKSFxAcQq0mjt//tAyO1KD/fQID6WpE7xYhlGDpq5WhnkGBY
         hu78a0FCj+NresNUDwkkbxkZUvJ6d7omCJ/etDCgYj8Rx2Lgt/WyMWRcK3+iJ9yDLJE0
         Oq5CghHPedgQ0EC7pVDneUMzqMkJjg4Z7xU7Qfxtlo0HbWdLz+O+rCl2pKzKXUIGyu07
         cSTg==
X-Gm-Message-State: AO0yUKUDVyXKUKWq2jIvrF5XJgAMwI208O5lSwQN7QxZXv9sQSjXoY9P
	kZloEIrSmh8kS9bYUmpmP0kEK+NfO+SZhXTRFRE=
X-Google-Smtp-Source: AK7set+h+uoAmZhun8Aoiq6R2MA/drOtGkQe74lvynOVC6Mm7ztIPzz4o2bDevEjJZztHRe9EZmtjtX6h7SYlgqYPXM=
X-Received: by 2002:a05:600c:3ac3:b0:3db:f34:e9f2 with SMTP id
 d3-20020a05600c3ac300b003db0f34e9f2mr1492014wms.102.1676381601133; Tue, 14
 Feb 2023 05:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20230214131349.1685229-1-jlu@pengutronix.de>
In-Reply-To: <20230214131349.1685229-1-jlu@pengutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Feb 2023 14:33:09 +0100
Message-ID: <CA+chaQekd6nXV_CXHHJCBZK6QCMc-MYd+L4nutS52yk6SCyUgA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] smemstat: add recipe
To: Jan Luebbe <jlu@pengutronix.de>
Cc: openembedded-devel@lists.openembedded.org, yocto@pengutronix.de
Content-Type: multipart/alternative; boundary="000000000000d7f9b905f4a9010c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 13:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101073

--000000000000d7f9b905f4a9010c
Content-Type: text/plain; charset="UTF-8"

FWIW: this was in meta-luneos for a while:
https://github.com/webOS-ports/meta-webos-ports/blob/master/meta-luneos/recipes-devtools/smemstat/smemstat_git.bb

since
https://github.com/webOS-ports/meta-webos-ports/commit/9c73ce110a6cd97a476c6beff10f9d8648cffea6

I didn't compare the output from your version, but does it set the VERSION
correctly now?

Regards,

On Tue, Feb 14, 2023 at 2:14 PM Jan Luebbe <jlu@pengutronix.de> wrote:

> This is useful to see which processes use physical memory.
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  .../smemstat/smemstat_0.02.11.bb              | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
>
> diff --git a/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
> b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
> new file mode 100644
> index 000000000000..37015ce6bdc1
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/smemstat/smemstat_0.02.11.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "smemstat reports the physical memory usage taking into
> consideration shared memory"
> +HOMEPAGE = "https://github.com/ColinIanKing/smemstat"
> +LICENSE = "GPL-2.0-or-later"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +DEPENDS = "ncurses"
> +
> +SRC_URI = "git://
> github.com/ColinIanKing/smemstat.git;protocol=https;branch=master"
> +SRCREV = "9eea7504ab33783d804c4ed9237e299effb68874"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure () {
> +       :
> +}
> +
> +do_compile () {
> +       oe_runmake
> +}
> +
> +do_install () {
> +       install -d -m 755 ${D}${sbindir}
> +       install -m 755 ${B}/smemstat ${D}${sbindir}/
> +       install -d -m 755 ${D}${mandir}/man8
> +       install -m 644 ${S}/smemstat.8 ${D}${mandir}/man8/
> +}
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101071):
> https://lists.openembedded.org/g/openembedded-devel/message/101071
> Mute This Topic: https://lists.openembedded.org/mt/96959306/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d7f9b905f4a9010c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: this was in meta-luneos for a while:<div><a href=3D"=
https://github.com/webOS-ports/meta-webos-ports/blob/master/meta-luneos/rec=
ipes-devtools/smemstat/smemstat_git.bb">https://github.com/webOS-ports/meta=
-webos-ports/blob/master/meta-luneos/recipes-devtools/smemstat/smemstat_git=
.bb</a><br></div><div><br></div><div>since=C2=A0<a href=3D"https://github.c=
om/webOS-ports/meta-webos-ports/commit/9c73ce110a6cd97a476c6beff10f9d8648cf=
fea6">https://github.com/webOS-ports/meta-webos-ports/commit/9c73ce110a6cd9=
7a476c6beff10f9d8648cffea6</a></div><div><br></div><div>I didn&#39;t compar=
e the output from your version, but does it set the VERSION correctly now?<=
/div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 2:14 PM Jan =
Luebbe &lt;<a href=3D"mailto:jlu@pengutronix.de">jlu@pengutronix.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is =
useful to see which processes use physical memory.<br>
<br>
Signed-off-by: Jan Luebbe &lt;<a href=3D"mailto:jlu@pengutronix.de" target=
=3D"_blank">jlu@pengutronix.de</a>&gt;<br>
---<br>
=C2=A0.../smemstat/<a href=3D"http://smemstat_0.02.11.bb" rel=3D"noreferrer=
" target=3D"_blank">smemstat_0.02.11.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 27 +++++++++++++++++++<br>
=C2=A01 file changed, 27 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/smemstat/<a href=3D"http:=
//smemstat_0.02.11.bb" rel=3D"noreferrer" target=3D"_blank">smemstat_0.02.1=
1.bb</a><br>
<br>
diff --git a/meta-oe/recipes-devtools/smemstat/<a href=3D"http://smemstat_0=
.02.11.bb" rel=3D"noreferrer" target=3D"_blank">smemstat_0.02.11.bb</a> b/m=
eta-oe/recipes-devtools/smemstat/<a href=3D"http://smemstat_0.02.11.bb" rel=
=3D"noreferrer" target=3D"_blank">smemstat_0.02.11.bb</a><br>
new file mode 100644<br>
index 000000000000..37015ce6bdc1<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/smemstat/<a href=3D"http://smemstat_0.02.11.=
bb" rel=3D"noreferrer" target=3D"_blank">smemstat_0.02.11.bb</a><br>
@@ -0,0 +1,27 @@<br>
+SUMMARY =3D &quot;smemstat reports the physical memory usage taking into c=
onsideration shared memory&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ColinIanKing/smemstat" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/ColinIanKing/smemstat=
</a>&quot;<br>
+LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
+<br>
+DEPENDS =3D &quot;ncurses&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/ColinIanKing/smemstat=
.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank"=
>github.com/ColinIanKing/smemstat.git;protocol=3Dhttps;branch=3Dmaster</a>&=
quot;<br>
+SRCREV =3D &quot;9eea7504ab33783d804c4ed9237e299effb68874&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+do_configure () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
+}<br>
+<br>
+do_compile () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake<br>
+}<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d -m 755 ${D}${sbindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${B}/smemstat ${D}${sbindir}/<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d -m 755 ${D}${mandir}/man8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/smemstat.8 ${D}${mandir}/ma=
n8/<br>
+}<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101071): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101071" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101071</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96959306/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96959306/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d7f9b905f4a9010c--

