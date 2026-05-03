Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754BACD13DA
	for <webhook@archiver.kernel.org>; Sun,  3 May 2026 03:14:25 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17780.1777778063674607384
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 20:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hq/kumMm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7bd5c773ef3so34447157b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 20:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777778063; cv=none;
        d=google.com; s=arc-20240605;
        b=XeBeED8ZdIx/l+hLxi/n9LJxC3WyXfbpzQqFidf+AngFaJ2W12/2WUjDu6ZidyaJMB
         pKK/kX41UnnirGPhc/i6/3u8arz5hnP1i5lZsLDTljVgRCz3QX7pZQl3DlipXWl6kzX1
         6qeGkeH9osO7s2bh/sUVpZuvUjOnwLW8BfrAhK9R4qtfZOeOaPGqUfCqmToWGrJchHql
         frj4jaEbLH/ZRPZXDJoTvSSwZoiXbPCy2fHUIGj5YXYElGaYmm33JP1iArA4kUxNSyhO
         pZxsNUizwC4dQ81Z3xMmYYK+cxw53x7OHoU/1/ee9QrDr0cDqAwyxOcstgE4OoPJGoYF
         HXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oJl2g1cpX8Aq82onrwYcH3El/cdj5dUjb9mmOxP+e40=;
        fh=B8F3lforaWXqCOLcYLVP4hd84u8I8RwmQUzZM4ZNJEc=;
        b=UDmkGboGHjfBTIUn3fUhSPW2neFMKpwBwE+0wc2yATlo0HWeP6lL5x5GoOYqp5Klkk
         lkNFtUXuG76pXKqh4HRlgOlmJVTqD1ufafWvTQCnMvM9lll7qq/WEa4SJoYj4FZ+bYWs
         nN3raMfAX7jOw3sjFXVOYte1YS6QMb7Tv32sfhIrY55ZzsZda35s8TUBadexNSxjcZ6C
         IcFDgCy6tlPm2g5UpdLWWCvEC18nJIGBlyN+boCDINkgWepNptHO+b8oTuVrdOnYZKdw
         tDx/kzujG+lIGrekD5tDoFxOQ5iORG9Wi1m5PbVoOIO3llDGfU58W/tLRR9zmQYJgKQu
         uhHg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777778063; x=1778382863; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oJl2g1cpX8Aq82onrwYcH3El/cdj5dUjb9mmOxP+e40=;
        b=hq/kumMmU8FMLurNgv0oZ1OfUooZp6s/syqkeBGbVhknNzk9g59jyb6crTxTKoK5C5
         cHoN5C9mYiTeYXLdlwmVWZmuTFmr/iVIebVw/003ODD2cq3NmqbMOx/feJEPIqcYOS3Z
         7QiCUb6YPig9gwWjZh5IDHYda4ke9N3NwAQwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777778063; x=1778382863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJl2g1cpX8Aq82onrwYcH3El/cdj5dUjb9mmOxP+e40=;
        b=Sr3P7wEbhe4D63+O7P7+1Vw1enY6DAxD1ql58KhJYXsRc84k4cLTiXwOGuPs62uwm8
         vTd182UY3OaqQeQRfDhciDMpI9Y/otSRVWqpWS3lQWn4riCBxaqEoo+w9tKJd36cLNGB
         40d60Qklv4mtsG5I8MCdMwnXVHcNCMI8g5UB3vDVoF6VJ/mN8MZ8o6U032utr1W/Fdni
         fi/ronaKyufI+R+vs66evSL2q9YSx1thdcLtUGRI6bNZ4IuMAgxJKj6efiq6P4mroRzi
         87h70r0FD5ndJx+ZoyTvtzdPRcX/zV5msIz8RyTuwYvAryj5biVRMUAYBB1W10+8VpjQ
         bRHA==
X-Gm-Message-State: AOJu0Yz2jofm7AEnqQhAN7tLKn/Z4FJCO4yKoIMwvIX0MqxKL66Aaj9P
	MWYkMRkxdP3Q/oUfc6+FZf6EoI4lJ1ZnR8zZb9rWC25w65r6pgUk5yLfVwykOh1BPNofHOdAG7m
	2yFixbfl/m3hrtUgEwEg/LtrIM1uJjd+qsPcQLUMGZQ==
X-Gm-Gg: AeBDies/YD34FqPTBKQ1qZvLjn63A5khiJukzVdEycSZKMrlOoRiRHuO9Wo62MnoXuJ
	cj1G4YYJaVnVrxCKusrXsu9fL5uN4qNeLHUFDUMMv1IFpMdM/IKmfe788EhPVXO+mIzEJ1mxfFX
	EmG/Jl4uKyueruWkWsqPBU4a0TgGX9ojMANNmhZiqiO7R1WU0X+I4uNwEyIb+TRAzLxPqQPE2qq
	+1zckUa4nY3cselPYtRVrV0nKpV7OGv8ufRgc3Kf90MeFgVjTnuKG7Vf1EF9BvAnr9FikpjP1Uc
	SM8qo8kCyruoRwWlGgtDrzoCe60Zn58rrpe597EQ3YqF8GBIIO4=
X-Received: by 2002:a05:690c:ed6:b0:7a2:ce0e:864a with SMTP id
 00721157ae682-7bd76fc4be5mr52380727b3.17.1777778062721; Sat, 02 May 2026
 20:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260502205501.185550-1-tim.orling@konsulko.com>
 <20260502205501.185550-3-tim.orling@konsulko.com> <CADySD0F5+T_eiLstknJfbOfkBuoUu3fMoE=Xd91PQHrtL8U4Mw@mail.gmail.com>
In-Reply-To: <CADySD0F5+T_eiLstknJfbOfkBuoUu3fMoE=Xd91PQHrtL8U4Mw@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sat, 2 May 2026 20:14:11 -0700
X-Gm-Features: AVHnY4Iw6Ebe3iaGhl3VXPbeymZhC7kPywvyPesnfO0_FDr8fo9tuYjvdp3QrLo
Message-ID: <CAOyo-87zZxzc7gg0VQQ-sXc2jWnPmF54jK5-Moq_A9L3JMckig@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH 3/3] nginx: upgrade mainline 1.29.7
 -> 1.29.8
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eb13860650e135cc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2026 03:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126769

--000000000000eb13860650e135cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 2, 2026 at 4:02=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.com=
> wrote:

> On Sun, May 3, 2026 at 8:55=E2=80=AFAM Tim Orling via lists.openembedded.=
org
> <tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > 2026-04-07
> > nginx 1.29.8 is the final release of the 1.29.x mainline branch,
> > published a week before the 1.30.0 stable cut on 2026-04-14. After
> > this point the 1.29.x branch is closed; new development will continue
> > on a future 1.31.x mainline.
>
> There isn't any difference between 1.30.0 and 1.29.8 except[1].
> Don't see benefit in adding both versions.
>
> There is a discussion already going around this[2], will be good to
> hear your thoughts.


Good point. I was just updating to the latest =E2=80=9Cmainline=E2=80=9D ac=
cording to the
website. I=E2=80=99d suggest we wait for 1.31.x to branch and update the =
=E2=80=9Cmainline=E2=80=9D
recipe at that time. We should keep the =E2=80=9Cstable=E2=80=9D 1.30.0 upg=
rade.

>
>
> [1]
> https://github.com/nginx/nginx/commit/654367cb11b08b0a5a67b08d5e1ff058de8=
b13c3
> [2]https://lists.openembedded.org/g/openembedded-devel/message/126762
>
> cheers
> Ankur
>
> >
> > Notable changes in 1.29.8:
> >
> >   * New 'max_headers' directive that bounds the number of HTTP headers
> >     accepted per request, mitigating header-based DoS exposure.
> >   * OpenSSL 4.0 build compatibility.
> >   * The 'include' directive inside a 'geo' block now accepts wildcard
> >     patterns, matching behaviour in other contexts.
> >   * Bug fix: handling of HTTP 103 (Early Hints) responses received
> >     from a proxied backend.
> >   * Bug fix: $request_port and $is_request_port are now available in
> >     subrequests (previously only in the originating request).
> >
> > Also refreshes the recipe header comment to reflect 1.30.x being the
> > current stable branch (it had previously identified 1.28.x as stable).
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
> >  meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb | 11 +++++++++++
> >  2 files changed, 11 insertions(+), 10 deletions(-)
> >  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> > deleted file mode 100644
> > index 4d884fcbb3..0000000000
> > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -require nginx.inc
> > -
> > -# 1.28.x branch is the current stable branch, the recommended default
> > -# 1.29.x is the current mainline branches containing all new features
> > -DEFAULT_PREFERENCE =3D "-1"
> > -
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79da1c70d587d3a199af9255ad3=
93f99"
> > -
> > -SRC_URI[sha256sum] =3D
> "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
> > -
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb
> > new file mode 100644
> > index 0000000000..f810ac219d
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.8.bb
> > @@ -0,0 +1,11 @@
> > +require nginx.inc
> > +
> > +# 1.30.x branch is the current stable branch, the recommended default
> > +# 1.29.x is the most recent mainline branch (final release before the
> > +# 1.30.x stable cut on 2026-04-14)
> > +DEFAULT_PREFERENCE =3D "-1"
> > +
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79da1c70d587d3a199af9255ad3=
93f99"
> > +
> > +SRC_URI[sha256sum] =3D
> "7f1b985dace8fe706dfc288b83927c928f0ae60bcb7507c2d4e0025eca7280c3"
> > +
> > --
> > 2.47.3
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#126766):
> https://lists.openembedded.org/g/openembedded-devel/message/126766
> > Mute This Topic: https://lists.openembedded.org/mt/119120498/3619737
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> ankur.tyagi85@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000eb13860650e135cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, May 2, 2026 at 4:02=E2=80=AFPM Ankur Tyagi &lt=
;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, =
May 3, 2026 at 8:55=E2=80=AFAM Tim Orling via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
><br>
&lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org" tar=
get=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;<br>
&gt; 2026-04-07<br>
&gt; nginx 1.29.8 is the final release of the 1.29.x mainline branch,<br>
&gt; published a week before the 1.30.0 stable cut on 2026-04-14. After<br>
&gt; this point the 1.29.x branch is closed; new development will continue<=
br>
&gt; on a future 1.31.x mainline.<br>
<br>
There isn&#39;t any difference between 1.30.0 and 1.29.8 except[1].<br>
Don&#39;t see benefit in adding both versions.<br>
<br>
There is a discussion already going around this[2], will be good to<br>
hear your thoughts.</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Good point. I was just updating to the latest =E2=80=9Cmainline=E2=80=9D=
 according to the website. I=E2=80=99d suggest we wait for 1.31.x to branch=
 and update the =E2=80=9Cmainline=E2=80=9D recipe at that time. We should k=
eep the =E2=80=9Cstable=E2=80=9D 1.30.0 upgrade.</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex" dir=3D"auto"><br>
<br>
[1]<a href=3D"https://github.com/nginx/nginx/commit/654367cb11b08b0a5a67b08=
d5e1ff058de8b13c3" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
nginx/nginx/commit/654367cb11b08b0a5a67b08d5e1ff058de8b13c3</a><br>
[2]<a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/1=
26762" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-devel/message/126762</a><br>
<br>
cheers<br>
Ankur<br>
<br>
&gt;<br>
&gt; Notable changes in 1.29.8:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* New &#39;max_headers&#39; directive that bounds the numb=
er of HTTP headers<br>
&gt;=C2=A0 =C2=A0 =C2=A0accepted per request, mitigating header-based DoS e=
xposure.<br>
&gt;=C2=A0 =C2=A0* OpenSSL 4.0 build compatibility.<br>
&gt;=C2=A0 =C2=A0* The &#39;include&#39; directive inside a &#39;geo&#39; b=
lock now accepts wildcard<br>
&gt;=C2=A0 =C2=A0 =C2=A0patterns, matching behaviour in other contexts.<br>
&gt;=C2=A0 =C2=A0* Bug fix: handling of HTTP 103 (Early Hints) responses re=
ceived<br>
&gt;=C2=A0 =C2=A0 =C2=A0from a proxied backend.<br>
&gt;=C2=A0 =C2=A0* Bug fix: $request_port and $is_request_port are now avai=
lable in<br>
&gt;=C2=A0 =C2=A0 =C2=A0subrequests (previously only in the originating req=
uest).<br>
&gt;<br>
&gt; Also refreshes the recipe header comment to reflect 1.30.x being the<b=
r>
&gt; current stable branch (it had previously identified 1.28.x as stable).=
<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.29.=
7.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.7.bb</a> | 10 -------=
---<br>
&gt;=C2=A0 meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.29.=
8.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.8.bb</a> | 11 +++++++=
++++<br>
&gt;=C2=A0 2 files changed, 11 insertions(+), 10 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-webserver/recipes-httpd/nginx/<a href=3D=
"http://nginx_1.29.7.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.7.=
bb</a><br>
&gt;=C2=A0 create mode 100644 meta-webserver/recipes-httpd/nginx/<a href=3D=
"http://nginx_1.29.8.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.8.=
bb</a><br>
&gt;<br>
&gt; diff --git a/meta-webserver/recipes-httpd/nginx/<a href=3D"http://ngin=
x_1.29.7.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.7.bb</a> b/met=
a-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.29.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">nginx_1.29.7.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 4d884fcbb3..0000000000<br>
&gt; --- a/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.29.=
7.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.7.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,10 +0,0 @@<br>
&gt; -require nginx.inc<br>
&gt; -<br>
&gt; -# 1.28.x branch is the current stable branch, the recommended default=
<br>
&gt; -# 1.29.x is the current mainline branches containing all new features=
<br>
&gt; -DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt; -<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D79da1c70d587d3a199af9=
255ad393f99&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;673f8fb8c0961c44fbd9410d6161831453609b44=
063d3f2948253fc2b5692139&quot;<br>
&gt; -<br>
&gt; diff --git a/meta-webserver/recipes-httpd/nginx/<a href=3D"http://ngin=
x_1.29.8.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.8.bb</a> b/met=
a-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.29.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">nginx_1.29.8.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f810ac219d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.29.=
8.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.8.bb</a><br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +require nginx.inc<br>
&gt; +<br>
&gt; +# 1.30.x branch is the current stable branch, the recommended default=
<br>
&gt; +# 1.29.x is the most recent mainline branch (final release before the=
<br>
&gt; +# 1.30.x stable cut on 2026-04-14)<br>
&gt; +DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D79da1c70d587d3a199af9=
255ad393f99&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;7f1b985dace8fe706dfc288b83927c928f0ae60b=
cb7507c2d4e0025eca7280c3&quot;<br>
&gt; +<br>
&gt; --<br>
&gt; 2.47.3<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#126766): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/126766" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/126766</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11912049=
8/3619737" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/119120498/3619737</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ankur.tyagi85@gmail=
.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000eb13860650e135cc--

