Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.9045.1594308109901379959
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 08:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HTcuMCLl;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id rk21so2709919ejb.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 08:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R7RZ7gIwIYo15EiUoOsDA5KnwKCfW0JtHdti3bAcU/g=;
        b=HTcuMCLlq9qeiYF4emJEBrpu4XJOVkL/Vx686mZjdSxOwrpbs71+3oD7fyZwETz2yD
         +Yu+FYC41v0WFg5TG+X1EkyPIVcdP8/ykNjgUYjExrsPBRzKc08YkcpChIhiK/RWpdV8
         NeWU/gnSiotUHMwM4u7sbfhXLCq5I9HUPKMLWCsq4WffboUKhCB0glSI/HvkELBtAa7E
         6htr2pQV8ADqr49ifO27DslG+WQKCtCIepe4LVEZcWfOaWkZi6Q7c3WzYBerVzhpW2DO
         iW1LgFnNYpje8hezoNuXSCWpj1dybxOj5qcTBTC7v46ICovyr237fPjpB1qZC5Qof85A
         6yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R7RZ7gIwIYo15EiUoOsDA5KnwKCfW0JtHdti3bAcU/g=;
        b=hm8eTqkB5K0seTXwd+ljYIhVBfGciqU0HOKVtv1U4EUSp0AVAg8CQLiT9vwQqJSco9
         F6LQD0sbkvjZMPkCGVqF/Bjp6uLib2gNrGgthCIVGlBlt+shnqPml+hN9LlqTzEpf4hd
         /dpPfDGK9nAK6F6EapSgz3h6CYGrWBPaCYbh2ySmdJooWwlpLtsl1WYWIUkXVrdTqknd
         IvxF/YV//UXrZPbBTwOBrO7kEz6aj4epWWQuK8aCVeXcqulSufrWzZYiHfn+9T0Z1eIB
         prgrxUz1OlNkEWwe4SrP8WI+NsmApzArILUrS9mOH7ruyqWaLEIf35RrfS2OxBVIdzCA
         XJGQ==
X-Gm-Message-State: AOAM531YxSDLi1oJlYuGs+LJSgLo/sU4JGpWPAYLsfHI9gEodm7Ny2hK
	0p5GMEJa32JkRGf5tHGufpnMmEZd3vCPqStUKzo=
X-Google-Smtp-Source: ABdhPJxWHcLBaC7Cf9eXlhyAylOJqsuIIEIdcX7c+p0dQ6N34P7dGDguqIJaZmZP4YYeuB/BbC5OhVIvkfX+J7o6RKk=
X-Received: by 2002:a17:906:5fc4:: with SMTP id k4mr56695215ejv.94.1594308108420;
 Thu, 09 Jul 2020 08:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593561840.git.akuster808@gmail.com> <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
In-Reply-To: <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 9 Jul 2020 17:21:37 +0200
Message-ID: <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000770aac05aa03c8cd"

--000000000000770aac05aa03c8cd
Content-Type: text/plain; charset="UTF-8"

FYI this "small" upgrade changes ABI version from libjsoncpp22
to libjsoncpp24 which might cause some issues to people who expect
relatively stable ABIs in LTS dunfell.

On Wed, Jul 1, 2020 at 2:07 AM akuster <akuster808@gmail.com> wrote:

> From: Pierre-Jean Texier <pjtexier@koncepto.io>
>
> See full changelog
> https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3
>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 65e124eef373680726ac045677cbec7d9080a289)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../jsoncpp/{jsoncpp_1.9.2.bb => jsoncpp_1.9.3.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb =>
> jsoncpp_1.9.3.bb} (93%)
>
> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
> rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> index a88410f2ff..97c6361ad8 100644
> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> @@ -11,7 +11,7 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
>
> -SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
> +SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
>  SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
>
>  S = "${WORKDIR}/git"
> --
> 2.17.1
>
> 
>

--000000000000770aac05aa03c8cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI this &quot;small&quot; upgrade changes ABI version fro=
m=C2=A0libjsoncpp22 to=C2=A0libjsoncpp24 which might cause some issues to p=
eople who expect relatively stable ABIs in LTS dunfell.</div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 1, 2020=
 at 2:07 AM akuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncept=
o.io" target=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
<br>
See full changelog <a href=3D"https://github.com/open-source-parsers/jsonc=
pp/releases/tag/1.9.3" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/open-source-parsers/jsoncpp/releases/tag/1.9.3</a><br>
<br>
Signed-off-by: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncepto.=
io" target=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
(cherry picked from commit 65e124eef373680726ac045677cbec7d9080a289)<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../jsoncpp/{<a href=3D"http://jsoncpp_1.9.2.bb" rel=3D"noreferrer" =
target=3D"_blank">jsoncpp_1.9.2.bb</a> =3D&gt; <a href=3D"http://jsoncpp_1.=
9.3.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.3.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-devtools/jsoncpp/{<a href=3D"http://jsoncpp_1=
.9.2.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.2.bb</a> =3D&gt; =
<a href=3D"http://jsoncpp_1.9.3.bb" rel=3D"noreferrer" target=3D"_blank">js=
oncpp_1.9.3.bb</a>} (93%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.=
9.2.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.2.bb</a> b/meta-oe=
/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">jsoncpp_1.9.3.bb</a><br>
similarity index 93%<br>
rename from meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9=
.2.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.2.bb</a><br>
rename to meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.3=
.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.3.bb</a><br>
index a88410f2ff..97c6361ad8 100644<br>
--- a/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.2.bb</a><br>
+++ b/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.3.bb</a><br>
@@ -11,7 +11,7 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dfa2a23dd1dc6c139f351=
05379d76df2b&quot;<br>
<br>
-SRCREV =3D &quot;d2e6a971f4544c55b8e3b25cf96db266971b778f&quot;<br>
+SRCREV =3D &quot;6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/open-source-par=
sers/jsoncpp" rel=3D"noreferrer" target=3D"_blank">github.com/open-source-p=
arsers/jsoncpp</a>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--000000000000770aac05aa03c8cd--
