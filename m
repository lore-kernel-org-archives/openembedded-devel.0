Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE27C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 14:59:27 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.18598.1713970766519612874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 07:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ml7D011W;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-47c0d9bc65aso306137137.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713970765; x=1714575565; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwd8ucadZPGWevSimDV7H0DH5FckqJ6zaxo45AkAoSY=;
        b=Ml7D011W0TtnvBaueUNbFO6WU/oYdeu5gPhMeflWp0VO6GppU4M5KFkudbjwN0hKYl
         N+YeVg/tlmC84FhIR9FKbFupJDE9tOks8HOwSlRKTVDMZSFOb3oHNVMg9Jfbextq4o4w
         vTPJAQ/m0qK0Do8/5UKf0w8Egw/kjQQXCYXacAnxdWkZLs/Stu2r1VjOcjgGyg7qCABg
         J200fvcTNrpq271SCwNLRITFok4dMaUDIcMHvWwBvtCZ8ATh2fkS2Ds0v8QPY0SY6QBX
         twWXExu06EorMQ3p9ZINpH3FEEkXOT66DpBr5qfTVNDgR/BBpXLSoD9NxA9De1p+ym8v
         25JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713970765; x=1714575565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwd8ucadZPGWevSimDV7H0DH5FckqJ6zaxo45AkAoSY=;
        b=idT6vS8h0/xHCzD722zweEYFPli9cgaGbf1cz20SRMNTAPioDyXGqfltl2+VeeC/4b
         t/grHuCncb/I6fjZYhHll20MbI8Fc6vxwZUR7wx9vycEFF/Y8WYiaJr3SykMaz8c9+Ln
         0gr51jH3BzNaEIkODc2o/rA4mRLIJ1+F5VwOv8xin7Plb8txtImzR5GIhot4zGKC3wh3
         +ACAMQkT5vqw8VJoOxHJgEqFvJjRy4nC6iCA6PNUuFfcKhWjoV//4H9LWDKUDablgsHv
         0KR9m0+Jbc5wnwcJIDeAjKHpX4Z6B3f9mRrnM2Xk10DFVYYDuKg8R+FOvPffXJa88bvk
         KRCA==
X-Gm-Message-State: AOJu0YyFvFlk8NDmnhzqsBLWbu/M4JTYD5K3gDO+0YYlb5y2AMVVxj56
	k2KoxmHye/9kNjfpqNsJ5tUZmlt14qz/VJPuLKpqCV6LBtE13PaRtaaOCBforsSQeIxKWTxbjPp
	CjbnAxvDXeELXQ8McbMH73clJHuc=
X-Google-Smtp-Source: AGHT+IHM/9XasEhmcBNr6OjDcitB1YfezZwc5REMyKID4oXjMPLgHaRA4IJzFlB9I3WR/uG4Qi94KEKiF36dyRfM49M=
X-Received: by 2002:a05:6102:588e:b0:47c:607:eed2 with SMTP id
 ju14-20020a056102588e00b0047c0607eed2mr3060209vsb.18.1713970765404; Wed, 24
 Apr 2024 07:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240424080953.2461900-1-changqing.li@windriver.com>
In-Reply-To: <20240424080953.2461900-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Apr 2024 16:59:14 +0200
Message-ID: <CAMKF1spdM_JP2EsrxmMwp=DQo-YSSxWSzMvtujrtRWBXLkhtRQ@mail.gmail.com>
Subject: Re: [oe] [master][scarthgap][meta-filesystems][PATCH] fuse3: remove
 sysv init script and install fuse kernel module explictly
To: changqing.li@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a0a1190616d8ea05"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 14:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110131

--000000000000a0a1190616d8ea05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 10:09=E2=80=AFAM Changqing Li via lists.openembedde=
d.org <
changqing.li=3Deng.windriver.com@lists.openembedded.org> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> For systemd, there is not a fuse.service since systemd provides
> sys-fs-fuse-connections.mount to mount the fuse control filesystem, so
> instead, only fuse.conf is added to modules-load.d to load the required
> fuse kernel module.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-support/fuse/fuse3_3.16.2.bb          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> index 2b0797a6f..8c5c51360 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> @@ -28,6 +28,7 @@ inherit meson pkgconfig ptest
>
>  SRC_URI +=3D " \
>      file://run-ptest \
> +    file://fuse.conf \


Who provides this file ? I don=E2=80=99t see it as part of patch

>
>  "
>
>  RDEPENDS:${PN}-ptest +=3D " \
> @@ -79,6 +80,20 @@ FILES:fuse3-utils =3D "${bindir} ${base_sbindir}"
>  DEBIAN_NOAUTONAME:fuse3-utils =3D "1"
>  DEBIAN_NOAUTONAME:${PN}-dbg =3D "1"
>
> +SYSTEMD_SERVICE:${PN} =3D ""
> +
>  do_install:append() {
>      rm -rf ${D}${base_prefix}/dev
> +
> +    # systemd class remove the sysv_initddir only if
> systemd_system_unitdir
> +    # contains anything, but it's not needed if sysvinit is not in
> DISTRO_FEATURES
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false',
> 'true', d)}; then
> +        rm -rf ${D}${sysconfdir}/init.d/
> +    fi
> +
> +    # Install systemd related configuration file
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +        install -d ${D}${sysconfdir}/modules-load.d
> +        install -m 0644 ${WORKDIR}/fuse.conf
> ${D}${sysconfdir}/modules-load.d
> +    fi
>  }
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110121):
> https://lists.openembedded.org/g/openembedded-devel/message/110121
> Mute This Topic: https://lists.openembedded.org/mt/105706495/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a0a1190616d8ea05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Apr 24, 2024 at 10:09=E2=80=AFAM Changqi=
ng Li via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;<a href=3D"http://changqing.li">changqing.li</a>=3D<a href=3D"mailt=
o:eng.windriver.com@lists.openembedded.org">eng.windriver.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Ch=
angqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" target=3D"_bla=
nk">changqing.li@windriver.com</a>&gt;<br>
<br>
For systemd, there is not a fuse.service since systemd provides<br>
sys-fs-fuse-connections.mount to mount the fuse control filesystem, so<br>
instead, only fuse.conf is added to modules-load.d to load the required<br>
fuse kernel module.<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/fuse/<a href=3D"http://fuse3_3.16.2.bb" rel=3D"no=
referrer" target=3D"_blank">fuse3_3.16.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
<br>
diff --git a/meta-filesystems/recipes-support/fuse/<a href=3D"http://fuse3_=
3.16.2.bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a> b/meta-=
filesystems/recipes-support/fuse/<a href=3D"http://fuse3_3.16.2.bb" rel=3D"=
noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a><br>
index 2b0797a6f..8c5c51360 100644<br>
--- a/meta-filesystems/recipes-support/fuse/<a href=3D"http://fuse3_3.16.2.=
bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a><br>
+++ b/meta-filesystems/recipes-support/fuse/<a href=3D"http://fuse3_3.16.2.=
bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a><br>
@@ -28,6 +28,7 @@ inherit meson pkgconfig ptest<br>
<br>
=C2=A0SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 file://fuse.conf \</blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">Who provides this file ? I don=E2=80=99t see it as part of=
 patch=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
@@ -79,6 +80,20 @@ FILES:fuse3-utils =3D &quot;${bindir} ${base_sbindir}&qu=
ot;<br>
=C2=A0DEBIAN_NOAUTONAME:fuse3-utils =3D &quot;1&quot;<br>
=C2=A0DEBIAN_NOAUTONAME:${PN}-dbg =3D &quot;1&quot;<br>
<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;&quot;<br>
+<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${D}${base_prefix}/dev<br>
+<br>
+=C2=A0 =C2=A0 # systemd class remove the sysv_initddir only if systemd_sys=
tem_unitdir<br>
+=C2=A0 =C2=A0 # contains anything, but it&#39;s not needed if sysvinit is =
not in DISTRO_FEATURES<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sysv=
init&#39;, &#39;false&#39;, &#39;true&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${sysconfdir}/init.d/<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 # Install systemd related configuration file<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;syst=
emd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/modules-load.d<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/fuse.conf ${D}${sys=
confdir}/modules-load.d<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110121): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110121" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110121</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105706495/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105706495/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a0a1190616d8ea05--

