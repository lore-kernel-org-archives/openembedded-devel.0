Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web11.4399.1591766315866336346
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 22:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fi/mzm/j;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id b5so715285iln.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 22:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3kuV2kHmhI7TsR/q55kRPoP4yfhjWIMsud+Wmd4lWz4=;
        b=Fi/mzm/j8omjatG6dFSBFQTaugmLzkQ/jyQr0zDoUI0mglEIyNjeD0DhC4j7nHVZvG
         40+Q1+omlQ4SgVPdQPTi46DS7LeLfW4GPhaa3Ih7Vu1HA9TXEFdlSUYB0zIw1HJO6J5D
         g9VkwlrNbtyd88hPQLcVYX3KarbvVjfOoNvB71hk7D7wTjf473+0cQimQKl/aRK7HN2t
         qTfe9V5CyUbT2jbn93SsQZkhtFPJq1nk9MDNclg064pOrJu8mX/FAQx+cM1oRw9jlTT2
         y+Yoo2kpAxhirlIppG4wMU0mMmvYUh+gRMBWC3ZKi+thPm94N4+yAHIEVSYYsklTyhLy
         lGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3kuV2kHmhI7TsR/q55kRPoP4yfhjWIMsud+Wmd4lWz4=;
        b=Vy2G08PhZpZ8wNGS/GqJjFQ9GaLS4hhGDot3qyUZ3WO7hkR+3A0h3rzvbLqBsTe6Io
         r7R5mJcKOHGiREw8VWWbQErlod//wK2272GL4jeHOVTsj0jzeZ2fdY6JCxtuWAfzrgXb
         ErWuIRpHtY9m7D8T9V3mGAjIffrRpn/YNrVa8UbBjJBz5xXP1Fx7wjO7GgG07X024WHC
         4ZjjQ+ihTe6FAKNp7g2pNZSu/JMyl/Sedcfx7i4988IPuzejD6qdf4x8lCMXM++ne57P
         o4tn1duB50l1qUMBdn1numoH+w9compih1HkcTEtn7kDguJeqaaZBBZIX0fm7SLs9TMI
         tyAQ==
X-Gm-Message-State: AOAM531gxC1FBT4JZ0L3LFXAPTyPJxeJ33j0nYuWluaBYy0gzuiz9y3B
	o8krJUhfZDN24Zo1syBvk0qdXFnkNUDwtcFVVNA=
X-Google-Smtp-Source: ABdhPJxWkiAmsAKjlUxX27XKuyddaDITyAnGSWuffAXNbs0loj9d8U35iSQoIoZpbEAo7NxIPwcluPztEh/BgkAczys=
X-Received: by 2002:a92:40dc:: with SMTP id d89mr1524256ill.170.1591766315217;
 Tue, 09 Jun 2020 22:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200609134311.13299-1-leon.anavi@konsulko.com> <20200609134311.13299-3-leon.anavi@konsulko.com>
In-Reply-To: <20200609134311.13299-3-leon.anavi@konsulko.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Tue, 9 Jun 2020 22:18:24 -0700
Message-ID: <CANx9H-Avsf9vEQNSGh1wbtNCc51WgucHL44pXm+Ci6aLVKmjCA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-soupsieve: Upgrade 1.9.4 -> 2.0.1
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c8b84305a7b3f99a"

--000000000000c8b84305a7b3f99a
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 9, 2020 at 6:43 AM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Upgrade to release 2.0.1.


I would like to see more information in the commit message for major
version upgrades (or any upgrades for that matter).

If you simply go to the source and look for Changelog or similar and copy
paste it takes 10-30 seconds and adds a lot of value for quickly reviewing.

Not picking on you, but the nearly empty commit messages on upgrades are
not doing any of us any favors. It is simply bad practice and if we had
patchtest running on meta-OpenEmbedded these would get Nacked.


>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...{python3-soupsieve_1.9.4.bb => python3-soupsieve_2.0.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-soupsieve_1.9.4.bb
> => python3-soupsieve_2.0.1.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/
> python3-soupsieve_2.0.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
> rename to meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> index df69e007f..aa087c920 100644
> --- a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
>
> -SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
> -SRC_URI[sha256sum] =
> "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
> +SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
> +SRC_URI[sha256sum] =
> "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
>
>  inherit pypi setuptools3
>
> --
> 2.17.1
>
> 
>

--000000000000c8b84305a7b3f99a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 9, 2020 at 6:43 AM Leon Anavi &lt;<a href=3D"m=
ailto:leon.anavi@konsulko.com">leon.anavi@konsulko.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Upgrade to release 2.0.1.</blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I would like to see more inform=
ation in the commit message for major version upgrades (or any upgrades for=
 that matter).</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you si=
mply go to the source and look for Changelog or similar and copy paste it t=
akes 10-30 seconds and adds a lot of value for quickly reviewing.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Not picking on you, but the nearl=
y empty commit messages on upgrades are not doing any of us any favors. It =
is simply bad practice and if we had patchtest running on meta-OpenEmbedded=
 these would get Nacked.</div><div dir=3D"auto"><br></div><blockquote class=
=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://python3-soupsieve_1.9.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-soupsieve_1.9.4.bb</a> =3D&gt; <a href=3D"http:/=
/python3-soupsieve_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-s=
oupsieve_2.0.1.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-soupsieve_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsiev=
e_1.9.4.bb</a> =3D&gt; <a href=3D"http://python3-soupsieve_2.0.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-soupsieve_2.0.1.bb</a>} (65%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-soupsieve_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsieve=
_1.9.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-soupsieve_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsie=
ve_2.0.1.bb</a><br>
similarity index 65%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-=
soupsieve_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsieve_=
1.9.4.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-so=
upsieve_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsieve_2.=
0.1.bb</a><br>
index df69e007f..aa087c920 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-soupsi=
eve_1.9.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsieve_1.9.4.=
bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-soupsi=
eve_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-soupsieve_2.0.1.=
bb</a><br>
@@ -4,8 +4,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/facelessu=
ser/soupsieve" rel=3D"noreferrer" target=3D"_blank">https://github.com/face=
lessuser/soupsieve</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.md;md5=3D5a6fd3b0c24fc5a04=
1a3d1bbb22c81b5&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;43d8ea20c58494446aa65ba5cc6320fe&quot;<br>
-SRC_URI[sha256sum] =3D &quot;605f89ad5fdbfefe30cdc293303665eff2d188865d4d=
be4eb510bba1edfbfce3&quot;<br>
+SRC_URI[md5sum] =3D &quot;62a7481c7dbf6d8cc21e4e3a79c72034&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff=
49eadfd7f1a537cc0232&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000c8b84305a7b3f99a--
