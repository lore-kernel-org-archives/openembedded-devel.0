Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9186.1623135394998311132
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GEdWmV+N;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id k25so25313268eja.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1qEQIRksoz64U3pQwJr37kvR6N8lsm1y+S+GdFvoQvc=;
        b=GEdWmV+NCiedn0hV9vbPtFZ5pFzlT1jgkizQHjRHwpRGbNnXgbyjurF87v4UYkKh9P
         3LdLdiKKlNTFijRa+bMaxiqpy2Wh+AeH3Z+Us+6UhUdVMooiAgkK6qSwsDUAgkOd7Pkf
         McooFqIqvr24xWTrGn5kmYuo+rztVmd7Me2/u0Iaeu1Ei1/w8GMV/xw8iqQfp3Oqa9f6
         NyRjW6ieCTtXefdZmCIhyeAJxuOzbDKIANjlhjMLcWEPhJ6k47YdCc4gU2GCq/fvtm5y
         k54pnNp7ATC6yR5WVBdN2/W3fmSZY5tL/FXTAdvmZuqOZUQOTM9HjpsWPbDF0WALlz5h
         jg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1qEQIRksoz64U3pQwJr37kvR6N8lsm1y+S+GdFvoQvc=;
        b=RzfmHscwPBmoFx0kdRvgRHxUtm9OaU39akOSh0Hby9oCi+DuZO/nkNSRCJqKITtvBa
         DSFGrBUn3SeMlhjIEhltv1Qphl31QdSIY/c9DoTkL9P8syr8IP986oodjk1wnyN7004i
         Mh3UT6OGE74g/XaPSRsc0ZgUGzEj0DFlCrbB2K4GvpawxldsziJgqFvRbdyD+KhVz/Pw
         igO3zP4MpvWxrwd7pTxvABld3ZsrpVPMa2D01cW1zZGiYW5+C+sJ/8uxjsc8GdSv06DK
         PXTAike3I0UdOoEA+uKst95xIYeU5v9SzpZafM/F6vGNSmMVLHk80nI/kH6oU26K7cm2
         yLkA==
X-Gm-Message-State: AOAM532b3qqDYueoG8V4WV8lSrM7LqrbflfNUFFJvbDIUtPLwAfg7bo9
	IUTpQ0T9i27u8ucA/dha3pXWEzI7ZjALdT2FeRE=
X-Google-Smtp-Source: ABdhPJxfRPTTu/JuzAv7XveneAy+CYntvCBBN424TyIw09BqKqAwy/ZFNlqYa22Pwc3plb+wXkipjnzQ8i1gTCCmZrM=
X-Received: by 2002:a17:906:490:: with SMTP id f16mr22271876eja.541.1623135393508;
 Mon, 07 Jun 2021 23:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <1623128392-11648-1-git-send-email-akash.hadke@kpit.com>
In-Reply-To: <1623128392-11648-1-git-send-email-akash.hadke@kpit.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 8 Jun 2021 08:56:21 +0200
Message-ID: <CA+chaQdZS+b=6o2aXnMj+=w_w5mniRixZzLZrxD+5aiZMHQZbQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][dunfell][PATCH] tracker-miners: enable ffmpeg dependency only if its whitelisted
To: akash hadke <akash.hadke@kpit.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, 
	Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>, Mikko Rapeli <mikko.rapeli@bmw.de>
Content-Type: multipart/alternative; boundary="0000000000008d71a405c43ba816"

--0000000000008d71a405c43ba816
Content-Type: text/plain; charset="UTF-8"

Backport the commit from master instead:
https://git.openembedded.org/meta-openembedded/commit/?id=c7b77535e0b08e8c89f41fa0508d3b275c95ab80

in this case it's the same, but using the same commit message and author
will better indicate that it's straight cherry-pick from newer branch.

On Tue, Jun 8, 2021 at 7:00 AM akash hadke <akash.hadke@kpit.com> wrote:

> From: Mikko Rapeli <mikko.rapeli@bmw.de>
>
> ffmpeg isn't enabled by default. Fixes yocto-layer-check error:
>
> ERROR: Nothing PROVIDES 'ffmpeg' (but
> /home/builder/src/base/meta-openembedded/meta-gnome/recipes-gnome/tracker/
> tracker-miners_2.3.3.bb DEPENDS on or otherwise requires it)
> ffmpeg was skipped: because it has a restricted license 'commercial'.
> Which is not whitelisted in LICENSE_FLAGS_WHITELIST
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'tracker-miners', 'ffmpeg']
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> Signed-off-by: akash hadke <akash.hadke@kpit.com>
> ---
>  meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
> b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
> index e2ced39..ccd22a0 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
> +++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
> @@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>  UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
>
>  PACKAGECONFIG ??= " \
> -    ffmpeg \
> +    ${@bb.utils.contains_any('LICENSE_FLAGS_WHITELIST', 'commercial',
> 'ffmpeg', '', d)} \
>      flac \
>      gexiv2 \
>      gstreamer \
> --
> 2.7.4
>
>
> 
>
>

--0000000000008d71a405c43ba816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Backport the commit from master instead:<div><a href=3D"ht=
tps://git.openembedded.org/meta-openembedded/commit/?id=3Dc7b77535e0b08e8c8=
9f41fa0508d3b275c95ab80">https://git.openembedded.org/meta-openembedded/com=
mit/?id=3Dc7b77535e0b08e8c89f41fa0508d3b275c95ab80</a><br></div><div><br></=
div><div>in this case it&#39;s the same, but using the same commit message =
and author will better indicate that it&#39;s straight cherry-pick from new=
er branch.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Tue, Jun 8, 2021 at 7:00 AM akash hadke &lt;<a href=3D"=
mailto:akash.hadke@kpit.com">akash.hadke@kpit.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Mikko Rapeli &lt;<a =
href=3D"mailto:mikko.rapeli@bmw.de" target=3D"_blank">mikko.rapeli@bmw.de</=
a>&gt;<br>
<br>
ffmpeg isn&#39;t enabled by default. Fixes yocto-layer-check error:<br>
<br>
ERROR: Nothing PROVIDES &#39;ffmpeg&#39; (but /home/builder/src/base/meta-=
openembedded/meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker-min=
ers_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">tracker-miners_2.3.3.bb<=
/a> DEPENDS on or otherwise requires it)<br>
ffmpeg was skipped: because it has a restricted license &#39;commercial&#3=
9;. Which is not whitelisted in LICENSE_FLAGS_WHITELIST<br>
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable=
 providers.<br>
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;=
, &#39;tracker-miners&#39;, &#39;ffmpeg&#39;]<br>
<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code=
.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" tar=
get=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
Signed-off-by: akash hadke &lt;<a href=3D"mailto:akash.hadke@kpit.com" tar=
get=3D"_blank">akash.hadke@kpit.com</a>&gt;<br>
---<br>
=C2=A0meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker-miners_2.=
3.3.bb" rel=3D"noreferrer" target=3D"_blank">tracker-miners_2.3.3.bb</a> | =
2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker-mi=
ners_2.3.3.bb" rel=3D"noreferrer" target=3D"_blank">tracker-miners_2.3.3.bb=
</a> b/meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker-miners_2.=
3.3.bb" rel=3D"noreferrer" target=3D"_blank">tracker-miners_2.3.3.bb</a><br=
>
index e2ced39..ccd22a0 100644<br>
--- a/meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker-miners_2.=
3.3.bb" rel=3D"noreferrer" target=3D"_blank">tracker-miners_2.3.3.bb</a><br=
>
+++ b/meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker-miners_2.=
3.3.bb" rel=3D"noreferrer" target=3D"_blank">tracker-miners_2.3.3.bb</a><br=
>
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection=
-data&quot;<br>
=C2=A0UNKNOWN_CONFIGURE_WHITELIST_append =3D &quot; introspection&quot;<br=
>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot; \<br>
-=C2=A0 =C2=A0 ffmpeg \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;LICENSE_FLAGS_WHITELIST&#39;,=
 &#39;commercial&#39;, &#39;ffmpeg&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0flac \<br>
=C2=A0 =C2=A0 =C2=A0gexiv2 \<br>
=C2=A0 =C2=A0 =C2=A0gstreamer \<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008d71a405c43ba816--
