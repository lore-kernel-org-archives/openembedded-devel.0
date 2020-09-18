Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.9848.1600425367299212635
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qSZV/Ys6;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id gr14so7495878ejb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 03:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=McivFvrtiIwVH5uG/+xo1LLpXiLQ+8B2J9Xcnv196GA=;
        b=qSZV/Ys6LoOOBx175gL9DwMugKd0r9sHWHfFSyV+neEuU/VopCj62pJ2EPWhFOKatV
         QgpFLctJVxF6YCZ58m19CzTdapklAQGLLNQpzfLhe7kbvV1s/B0UlJrKVGximyq2xGnF
         x0R/O220VD4/PstF/UyGJvtpsJaWVc3VhbjIa4yF6LNxt5o+3L9drQwBfTtJvp31h3If
         voUp+pXh+xwsXVH2pQ3/jg8UYSIEmtZC2sPahBtuK5+d50R1EhWtg4cstb7oU06MA+qp
         s6eeGDLmFaHpGhN3UyyQSWD1PzLDD4CZUjvBJR4/ovbGu25o2Sej7ckbRWfDF+EmVEFi
         VaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=McivFvrtiIwVH5uG/+xo1LLpXiLQ+8B2J9Xcnv196GA=;
        b=ZU3t3U1Eggmc0+5Vk46Gdc0UE/a8weAjNk408aVpX61gvmuNzsVv0j72BtT9VfaKa7
         fEAdbHViSZpetYmholYAJoZfjRVR+xvvdjZTxyVhosk9DjROy14Zrwp8UnW1ubuc5QXh
         yXt1iAB4RgD8D20wQwjo4oAuV8u1FwTvCkqDUavKo/qI64x8dfXmQcLexycNFjM7XwPq
         amKPd9Kf86NixlCnaKWYD/9jSE53X/SYydMJz5/X/MukIn7kQSI9Nin0wJNdzBYG9WV3
         5p1OgvgEfwkw3Q56rGw9hMW2EmdHBWEvZ5u9hXsi3qtO6GkUK0b9kE4DIn/sC8zkRlgK
         tjTg==
X-Gm-Message-State: AOAM533vvSH1U1DQTOobXgvr/nSSexVG+9vJMXBEAzywcJfHpE8oupi0
	L7RNZLKi5PJ7/mLYns1nZ/VOHAL3PmqviMW74qbKVaENy5o=
X-Google-Smtp-Source: ABdhPJxVMJCdMp+iWX+T5KQpNFquYHSMp6vN52FVGINAfXeSdppxP6jrO+C1BpGuifOgXfzEKxrp5cDutnpYkx8Hr9w=
X-Received: by 2002:a17:906:4b18:: with SMTP id y24mr34774374eju.471.1600425365665;
 Fri, 18 Sep 2020 03:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200918103455.370682-1-Martin.Jansa@gmail.com> <1635DA55744A95C6.24495@lists.openembedded.org>
In-Reply-To: <1635DA55744A95C6.24495@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 18 Sep 2020 12:35:54 +0200
Message-ID: <CA+chaQc0MmAJSu3bdbzg3Mdm79t52pV49npnsVjfsZeDd1h6fA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH 3/3] iwd: Upgrade to 1.9
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000068fdf705af941103"

--00000000000068fdf705af941103
Content-Type: text/plain; charset="UTF-8"

This is now needed in dunfell, because ell upgrade was backported to
dunfell in oe-core:
https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=deb77c59b9c11738a93fc80c1b256b3df8e14827

On Fri, Sep 18, 2020 at 12:35 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> From: Khem Raj <raj.khem@gmail.com>
>
> Need this upgrade to work with ell >= 0.33
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-connectivity/iwd/{iwd_1.8.bb => iwd_1.9.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_1.8.bb => iwd_1.9.bb} (96%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
> b/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
> similarity index 96%
> rename from meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
> index bfbf3c7fa6..25500e6501 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.9.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
>  DEPENDS = "ell"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
> -SRCREV = "a01754f56aacdc641c819f983c3c0ad374be77b2"
> +SRCREV = "aa3dc1b95348dea177e9d8c2c3063b29e20fe2e9"
>  S = "${WORKDIR}/git"
>
>  inherit autotools manpages pkgconfig python3native systemd
> --
> 2.25.1
>
>
> 
>
>

--00000000000068fdf705af941103
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is now needed in dunfell, because ell upgrade was bac=
kported to dunfell in oe-core:<div><a href=3D"https://git.openembedded.org/=
openembedded-core/commit/?h=3Ddunfell&amp;id=3Ddeb77c59b9c11738a93fc80c1b25=
6b3df8e14827">https://git.openembedded.org/openembedded-core/commit/?h=3Ddu=
nfell&amp;id=3Ddeb77c59b9c11738a93fc80c1b256b3df8e14827</a><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Sep 18, 2020 at 12:35 PM Martin Jansa via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt;<br>
<br>
Need this upgrade to work with ell &gt;=3D 0.33<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-connectivity/iwd/{<a href=3D"http://iwd_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a> =3D&gt; <a href=3D"http:/=
/iwd_1.9.bb" rel=3D"noreferrer" target=3D"_blank">iwd_1.9.bb</a>} | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-connectivity/iwd/{<a href=3D"http://iwd_1.8.b=
b" rel=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a> =3D&gt; <a href=3D"h=
ttp://iwd_1.9.bb" rel=3D"noreferrer" target=3D"_blank">iwd_1.9.bb</a>} (96%=
)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb=
" rel=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a> b/meta-oe/recipes-con=
nectivity/iwd/<a href=3D"http://iwd_1.9.bb" rel=3D"noreferrer" target=3D"_b=
lank">iwd_1.9.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a><br>
rename to meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.9.bb" r=
el=3D"noreferrer" target=3D"_blank">iwd_1.9.bb</a><br>
index bfbf3c7fa6..25500e6501 100644<br>
--- a/meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.8.bb" rel=
=3D"noreferrer" target=3D"_blank">iwd_1.8.bb</a><br>
+++ b/meta-oe/recipes-connectivity/iwd/<a href=3D"http://iwd_1.9.bb" rel=
=3D"noreferrer" target=3D"_blank">iwd_1.9.bb</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfb504b67c5=
0331fc78734fed90fb0e09&quot;<br>
=C2=A0DEPENDS =3D &quot;ell&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/net=
work/wireless/iwd.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.org/=
pub/scm/network/wireless/iwd.git</a>&quot;<br>
-SRCREV =3D &quot;a01754f56aacdc641c819f983c3c0ad374be77b2&quot;<br>
+SRCREV =3D &quot;aa3dc1b95348dea177e9d8c2c3063b29e20fe2e9&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit autotools manpages pkgconfig python3native systemd<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000068fdf705af941103--
