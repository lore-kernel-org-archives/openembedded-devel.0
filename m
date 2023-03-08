Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B15C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 18:59:18 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.1653.1678301955687111394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 10:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G8+8bAYM;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id x12so15617127ybt.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 10:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678301955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vzGSkDwPNTFJnGcKW8fTK/Eb0BP2g/F3UqsXA2z0xwg=;
        b=G8+8bAYM4Hnd/o7Iam+jwSh63/fSZHlHmrY5ImaMnRJ0jFAE/mSg3xR1Le+wj67xBi
         +rqgCzN3Q4mgqpsOyiENNDBRWrhsyMSEA6IBd4ekMDQ7rKtmobk5VmY4BI/weq2wctIF
         LN2Y606LnpLb86kGuyZVlcuDe9KLc/yH2Nq3oLfQJR/N8kF6Jr1tUSCdu9HZePH/R2w+
         uDzmsDTcV2xQZoSu3GGjoLJnyUV4uC3VvmcDvf0FWi3/146h5GWTgOwaatxkUu4HHNoz
         oHxrVpOKcOPMYr02O2VoxNOraq3WtYRAB4nsYSU12dmtiuthV24jM4XkY+cbDkHCng4q
         u1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678301955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzGSkDwPNTFJnGcKW8fTK/Eb0BP2g/F3UqsXA2z0xwg=;
        b=h53h+b47qyoiAqa9ke142aw8G+XP8IP8qkBYE4gyD6IOvbiMq0CcGzgbHBkI/MtAAu
         cQ5IN/eCI8JB/q3cQ4JqCdp/9uxHtp8SiJC697vk6sbn8EwsQwoawEV+X350F6nZGLlv
         Re27Uwl3i/NKzJ7y+jg30dWIt4do9iPq/HWLLgkZhRjRvBbKm511seesItjcewRJijbh
         OuTp5pFaY3q4+z1PeSJ/tXHMYRou+nmWW61s+bGtkWBkGcudYiwJOeWjRWV8X3ZX7u6B
         S8LnKOmuz8SoiZLQsRmBmS2lzu3CO3l78pSZIh2ZAglAWLS/iLoPcyH39zM4bG1vw8Og
         w+VQ==
X-Gm-Message-State: AO0yUKVn4Of3QO1ErX7j8Fq5FUBX/iHXwBuByLMYvmUjtLEOY9KzygjI
	7QRKEJZjcJmTaaJCEtKWqXzFdOrXgudIQvAlPF+Om8+uzJAv4A==
X-Google-Smtp-Source: AK7set9uexgqxbYA8vlP4EIrasWBs23laOg9UWdW2l6IvyappDPhOvVVHIQRyJfSoyFt3kYDdfNQHM/3+PwhlnqhVkM=
X-Received: by 2002:a5b:b91:0:b0:a6f:b653:9f21 with SMTP id
 l17-20020a5b0b91000000b00a6fb6539f21mr11725350ybq.12.1678301954555; Wed, 08
 Mar 2023 10:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20230308135705.796596-1-yi.zhao@windriver.com>
In-Reply-To: <20230308135705.796596-1-yi.zhao@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 8 Mar 2023 10:59:03 -0800
Message-ID: <CANx9H-Az_jD58M4ntQO8DGXfYq3qQJJtNX9g2TawQenAHmeSbg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-rich: add recipe
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d3c22b05f6681f58"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 18:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101426

--000000000000d3c22b05f6681f58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 5:57=E2=80=AFAM Yi Zhao <yi.zhao@eng.windriver.com> =
wrote:

> Rich is a Python library for rich text and beautiful formatting in the
> terminal.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../python-rich/python3-rich_13.3.2.bb              | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-extended/python-rich/
> python3-rich_13.3.2.bb
>
> diff --git a/meta-python/recipes-extended/python-rich/
> python3-rich_13.3.2.bb b/meta-python/recipes-extended/python-rich/
> python3-rich_13.3.2.bb
> new file mode 100644
> index 000000000..b3a458ab8
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-rich/python3-rich_13.3.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Rich is a Python library for rich text and beautiful
> formatting in the terminal"
> +DESCRIPTION =3D "The Rich API makes it easy to add color and style to
> terminal output. \
> +Rich can also render pretty tables, progress bars, markdown, syntax
> highlighted source code, \
> +tracebacks, and more."
> +HOMEPAGE=3D"https://github.com/Textualize/rich"
> +SECTION =3D "devel/python"
> +LICENSE =3D "MIT"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db5f0b94fbc94f5ad9ae4efcf8a778=
303"
> +
> +SRC_URI[sha256sum] =3D
> "91954fe80cfb7985727a467ca98a7618e5dd15178cc2da10f553b36a93859001"
> +
> +inherit pypi setuptools3
>

This should instead inherit python_poetry_core, since it has a proper
pyproject.toml
https://github.com/Textualize/rich/blob/master/pyproject.toml#L49

Also, please double check whether it needs any RDEPENDS.


> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101424):
> https://lists.openembedded.org/g/openembedded-devel/message/101424
> Mute This Topic: https://lists.openembedded.org/mt/97472578/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d3c22b05f6681f58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 8, 2023 at 5:57=E2=80=AFA=
M Yi Zhao &lt;<a href=3D"mailto:yi.zhao@eng.windriver.com">yi.zhao@eng.wind=
river.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Rich is a Python library for rich text and beautiful formatting =
in the<br>
terminal.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python-rich/<a href=3D"http://python3-rich_13.3.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-rich_13.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-extended/python-rich/<a href=
=3D"http://python3-rich_13.3.2.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-rich_13.3.2.bb</a><br>
<br>
diff --git a/meta-python/recipes-extended/python-rich/<a href=3D"http://pyt=
hon3-rich_13.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich_13.3=
.2.bb</a> b/meta-python/recipes-extended/python-rich/<a href=3D"http://pyth=
on3-rich_13.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich_13.3.=
2.bb</a><br>
new file mode 100644<br>
index 000000000..b3a458ab8<br>
--- /dev/null<br>
+++ b/meta-python/recipes-extended/python-rich/<a href=3D"http://python3-ri=
ch_13.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-rich_13.3.2.bb</=
a><br>
@@ -0,0 +1,13 @@<br>
+SUMMARY =3D &quot;Rich is a Python library for rich text and beautiful for=
matting in the terminal&quot;<br>
+DESCRIPTION =3D &quot;The Rich API makes it easy to add color and style to=
 terminal output. \<br>
+Rich can also render pretty tables, progress bars, markdown, syntax highli=
ghted source code, \<br>
+tracebacks, and more.&quot;<br>
+HOMEPAGE=3D&quot;<a href=3D"https://github.com/Textualize/rich" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/Textualize/rich</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db5f0b94fbc94f5ad9ae4efcf8a=
778303&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;91954fe80cfb7985727a467ca98a7618e5dd15178cc2d=
a10f553b36a93859001&quot;<br>
+<br>
+inherit pypi setuptools3<br></blockquote><div><br></div><div>This should i=
nstead inherit python_poetry_core, since it has a proper pyproject.toml</di=
v><div><a href=3D"https://github.com/Textualize/rich/blob/master/pyproject.=
toml#L49">https://github.com/Textualize/rich/blob/master/pyproject.toml#L49=
</a></div><div><br></div><div>Also, please double check whether it needs an=
y RDEPENDS.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101424): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101424" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101424</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97472578/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97472578/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d3c22b05f6681f58--

