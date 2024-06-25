Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E87C2BD09
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 02:06:12 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.160605.1719281166021568739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 19:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RSZzzIRX;
 spf=pass (domain: mvista.com, ip: 209.85.208.182, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so60931521fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 19:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719281164; x=1719885964; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vy8U5AeQfb3pONQiAfmI/19MxRWnj8fxsbrbXzKBmCg=;
        b=RSZzzIRX4EAXI6U+YcbKFZtxDZwrwRciE6zmG8TnjPpkm1SZriN3zGVWp8mcJSv/nl
         mcDXpKTTPl+0hp5FV9KsHxtu+ChjoXl+rInkTwOYy0WXeal7yrD2RdtXz2HHSuPNkHaY
         Zhx2ji50z/5R8qKEDoWYrsgR6WJQDza05b/LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719281164; x=1719885964;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vy8U5AeQfb3pONQiAfmI/19MxRWnj8fxsbrbXzKBmCg=;
        b=f+K4rW5CXjPVR+ofo57L0v8akL/CGhD3Er6OCGr+EviXy/R0kxdNLA4L4uQ4cyTGss
         0uBL3S6V8Zhva+tCRbzjDiXBlT9Wi5UOMI9N0nh2F5VJxli+spK5A4Zni9pWyMi30xBi
         TKNS8H79skxn3D+KR/YnyyPZXe9AEQlmrm2iEHomERFQSHK64z27wiK76Q+zhyv+5lpT
         4Vsll7gVFbldeXDUOgZq5fvTk/VStpormelEyE+BStk5nu2PxEwHFMXZoY9BzzPmCVFS
         5ATmmYHt9/XjDP3S+9q0GqwaWHZwXJJbeJKCugeWxktXe+3V+pKhN3AmH/Uzn7odhZnx
         Hygg==
X-Gm-Message-State: AOJu0Yw7CA4/BZDI0AuZAy0bW0lUyEuQxcQXUzVIGYE+c93bYo794hC+
	NGCcGZkrndbKsfNzpppxwbzVjr48ESI1PCboub5DxXpkoe9fS7h5lbIe9VVXTWKLDjm7K76d4o5
	ratABhqVPg79IUjoboKHXL9vVB79uXTNJkrcAubwVv2vf3d0TpuI=
X-Google-Smtp-Source: AGHT+IHQ4rGGDGZP8rOHjEfrDaZ36pAcwBDoU4ncXO/7qlt2vxoDAEegmPhbIJChNOVpzw+xqUPnr+DDClpOFYU65fs=
X-Received: by 2002:a2e:9acd:0:b0:2ec:5644:8f85 with SMTP id
 38308e7fff4ca-2ec5b2b1e20mr35944741fa.27.1719281163637; Mon, 24 Jun 2024
 19:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240620044325.8391-1-vanusuri@mvista.com>
In-Reply-To: <20240620044325.8391-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 25 Jun 2024 07:35:52 +0530
Message-ID: <CANQUz19i-hbqMFxwfTLP-rVH-Pac_Qpadiiz1R3-gqVVgAdWgg@mail.gmail.com>
Subject: Re: [meta-oe][master][scarthgap][PATCH v2] tipcutils: Add systemd support
To: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000007311b061bad572a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 02:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111009

--00000000000007311b061bad572a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Any Update on this ?

Thanks & Regards,
Vijay

On Thu, Jun 20, 2024 at 10:13=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Install tipc kernel module explictly. tipcutils.conf is added to
> modules-load.d to load the required tipc kernel module.
>
> Ref: http://tipc.io/getting_started.html
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../tipcutils/tipcutils/tipcutils.conf                |  1 +
>  meta-oe/recipes-extended/tipcutils/tipcutils_git.bb   | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf
>
> diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf
> b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf
> new file mode 100644
> index 000000000..39ed83d6a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf
> @@ -0,0 +1 @@
> +tipc
> diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> index 596aa260e..580d03cbb 100644
> --- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> +++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D
> "file://tipclog/tipc.h;endline=3D35;md5=3D985b6ea8735818511d276c1b466cce9=
8"
>
>  SRC_URI =3D "git://git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster \
> +           file://tipcutils.conf \
>             file://0001-include-sys-select.h-for-FD_-definitions.patch \
>             file://0002-replace-non-standard-uint-with-unsigned-int.patch=
 \
>
> file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch \
> @@ -11,7 +12,7 @@ SRC_URI =3D "git://
> git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster \
>  SRCREV =3D "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
>  PV =3D "2.2.0+git"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig systemd
>
>  DEPENDS +=3D "libdaemon"
>
> @@ -41,8 +42,16 @@ do_install:append() {
>      install -d ${D}${sysconfdir}
>      cp -R --no-dereference --preserve=3Dmode,links -v ${S}/scripts/etc/*
> ${D}${sysconfdir}/
>      chown -R root:root ${D}${sysconfdir}
> +
> +    # Install systemd related configuration file
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +        install -d ${D}${sysconfdir}/modules-load.d
> +        install -m 0644 ${WORKDIR}/tipcutils.conf
> ${D}${sysconfdir}/modules-load.d
> +    fi
>  }
>
> +SYSTEMD_SERVICE:${PN} =3D ""
> +
>  PACKAGES +=3D "${PN}-demos"
>  FILES:${PN}-dbg +=3D "/opt/tipcutils/demos/*/.debug
> /opt/tipcutils/ptts/.debug"
>  FILES:${PN}-demos =3D "/opt/tipcutils/*"
> --
> 2.25.1
>
>

--00000000000007311b061bad572a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Armin,<br><br></div>Any Update on this ?<br><=
br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 20=
, 2024 at 10:13=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mvista.com">vanus=
uri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Install tipc kernel module explictly. tipcutils.conf is added to<br>
modules-load.d to load the required tipc kernel module.<br>
<br>
Ref: <a href=3D"http://tipc.io/getting_started.html" rel=3D"noreferrer" tar=
get=3D"_blank">http://tipc.io/getting_started.html</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../tipcutils/tipcutils/tipcutils.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_git.bb=
" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a>=C2=A0 =C2=A0| 1=
1 ++++++++++-<br>
=C2=A02 files changed, 11 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/tipcu=
tils.conf<br>
<br>
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf b/=
meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf<br>
new file mode 100644<br>
index 000000000..39ed83d6a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/tipcutils.conf<br>
@@ -0,0 +1 @@<br>
+tipc<br>
diff --git a/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils=
_git.bb" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a> b/meta-o=
e/recipes-extended/tipcutils/<a href=3D"http://tipcutils_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">tipcutils_git.bb</a><br>
index 596aa260e..580d03cbb 100644<br>
--- a/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_git.bb=
" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
+++ b/meta-oe/recipes-extended/tipcutils/<a href=3D"http://tipcutils_git.bb=
" rel=3D"noreferrer" target=3D"_blank">tipcutils_git.bb</a><br>
@@ -3,6 +3,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://tipclog/tipc.h;endline=3D35;md5=3D9=
85b6ea8735818511d276c1b466cce98&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.code.sf.net/p/tipc/tipc=
utils;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.code.sf.net=
/p/tipc/tipcutils;branch=3Dmaster</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://tipcutils.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-include-sys-select.h-=
for-FD_-definitions.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-replace-non-standard-=
uint-with-unsigned-int.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-multicast_blast-tipcc=
-Fix-struct-type-for-TIPC_GROUP.patch \<br>
@@ -11,7 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.code.sf.net=
/p/tipc/tipcutils;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git=
.code.sf.net/p/tipc/tipcutils;branch=3Dmaster</a> \<br>
=C2=A0SRCREV =3D &quot;7ab2211b87414ba240b0b2e4af219c1057c9cf9a&quot;<br>
=C2=A0PV =3D &quot;2.2.0+git&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+inherit autotools pkgconfig systemd<br>
<br>
=C2=A0DEPENDS +=3D &quot;libdaemon&quot;<br>
<br>
@@ -41,8 +42,16 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}<br>
=C2=A0 =C2=A0 =C2=A0cp -R --no-dereference --preserve=3Dmode,links -v ${S}/=
scripts/etc/* ${D}${sysconfdir}/<br>
=C2=A0 =C2=A0 =C2=A0chown -R root:root ${D}${sysconfdir}<br>
+<br>
+=C2=A0 =C2=A0 # Install systemd related configuration file<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;syst=
emd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/modules-load.d<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/tipcutils.conf ${D}=
${sysconfdir}/modules-load.d<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;&quot;<br>
+<br>
=C2=A0PACKAGES +=3D &quot;${PN}-demos&quot;<br>
=C2=A0FILES:${PN}-dbg +=3D &quot;/opt/tipcutils/demos/*/.debug /opt/tipcuti=
ls/ptts/.debug&quot;<br>
=C2=A0FILES:${PN}-demos =3D &quot;/opt/tipcutils/*&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000007311b061bad572a--

