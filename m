Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.13581.1616968810101256493
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 15:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MgTNatq0;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id 1so7468279qtb.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 15:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CN1JdLnxFISRCv18k036x/JvjoBQ+dgEChtS+jyCP50=;
        b=MgTNatq0zavY10p0or4e6wYXW/7+H78/Pj7DVMtkQoAD90vGBT8JQJ0J/PT5F98TXm
         MA3cVEqqEtGzwARLDUIbESgoQJULZsQAhanYmapzRNq/AI59deSHrwIiH0okX7+u4nqH
         gs3VKF4um0lvUEZ82lbawWvEpzeots0XFtw01WfbjpMRrhHmMtV/H1/ogRhCGroTG+dR
         8dc25rHXS9ua7pZwZqSKtDm07t/UwfieosbRF+yc1sh5cG0y8A0YQXGn5RpxWdju8rob
         Jf/ABrTAq0Km4cFK9K9Ts2w0+UvSUGKY1lRzno8+/V9dN6Hz8+lH4Vbo5MreS1vY2OYm
         ckcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CN1JdLnxFISRCv18k036x/JvjoBQ+dgEChtS+jyCP50=;
        b=dmLwvH1BcdioKPipMiLHlWerMVxEVRwmdBesU2WN+oynNjt1CdAIi31kFXNI2/KukS
         HzerEihEOC1ztw1diEfWBaYAU+rdrnj8IPAs76FGoWqmMYV2jx6vSMBQRFJd6HBoUtJp
         CqmZBRhIadMP+xRNyDIlHM8yAFt82Z4E214lE7JWB9/u1Bj0DNDVABwsAa8v66oy7Az9
         vleqvMLCxt6iDVM2oWfd7u/s7CiLPSVKhepFb+KQix6lEwSOrBIr0J/NFp+duIFcUVlh
         Z908ea5fE0AH1sNSxy9KuoVSY/Kd1HAZEC5hbmjwH9wHZhp1znwZirHc3q2Kc/tRdP+S
         0q2g==
X-Gm-Message-State: AOAM532mPvIQlFI/eKJenrLtpkBR6AqUumkMiJOtKsrny/QvZXHl4H6Z
	u+eJq4SgTD06Y11ZZM00q6cwaXTnyLZ28OUpng0=
X-Google-Smtp-Source: ABdhPJyWMMBMb3XgBTcsbo9h9XemDqRmUjaPvc+r68Sgm6nZ2xyibu3OFxWjXm80sXVOTp6Dct+rIQPKN91mtJK8Ut4=
X-Received: by 2002:ac8:7dce:: with SMTP id c14mr20401489qte.82.1616968809155;
 Sun, 28 Mar 2021 15:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210325070600.1335182-1-raj.khem@gmail.com> <bcac6cd8-ea83-8512-59af-2fe95e4726a8@gmail.com>
In-Reply-To: <bcac6cd8-ea83-8512-59af-2fe95e4726a8@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 28 Mar 2021 14:59:58 -0700
Message-ID: <CAMKF1sr07Z1dx4decfUZp7jBizp61PAcjbKhaOS+4U6CH7BqyQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] cryptsetup: DEPEND on renamed util-linux-libuuid
To: akuster808 <akuster808@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007b8ea505be9fe332"

--0000000000007b8ea505be9fe332
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 28, 2021 at 2:10 PM akuster808 <akuster808@gmail.com> wrote:

> I am seeing a build failure with this change after updating both core
> and meta-oe to latest as of today.
>
>
> bitbake cryptsetup


Please update oe-core to the push that went in today

>
>
> ERROR: Nothing PROVIDES 'util-linux-libuuid' (but
>
> /home/build/releases/master/meta-openembedded/meta-oe/recipes-crypto/cryptsetup/
> cryptsetup_2.3.5.bb
> DEPENDS on or otherwise requires it). Close matches:
>   util-linux
>   util-linux-uuid
>   util-linux-uuid RPROVIDES util-linux-libuuid
>   util-linux-uuid-native
> ERROR: Required build target 'cryptsetup' has no buildable providers.
> Missing or unbuildable dependency chain was: ['cryptsetup',
> 'util-linux-libuuid']
>
> The recipe in core is not  util-linux-libuuid, its util-linux-uuid.
>
> Do I need to cleanup any thing?
>
> -armin
>
> On 3/25/21 12:06 AM, Khem Raj wrote:
> > OE-core recipe is called util-linux-libuuid now
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> >  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> > index 5faaada4b7..0da9a26e83 100644
> > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
> > @@ -13,7 +13,7 @@ DEPENDS = " \
> >      json-c \
> >      libdevmapper \
> >      popt \
> > -    util-linux-uuid \
> > +    util-linux-libuuid \
> >  "
> >
> >  RDEPENDS_${PN} = " \
> >
> > 
> >
>
>

--0000000000007b8ea505be9fe332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Mar 28, 2021 at 2:10 PM akuster808 &lt;<a href=3D"=
mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">I am seeing a build failure with this change =
after updating both core<br>
and meta-oe to latest as of today.<br>
<br>
<br>
bitbake cryptsetup</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Please update oe-core to the push that went in today=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex" dir=3D"auto"><br>
<br>
ERROR: Nothing PROVIDES &#39;util-linux-libuuid&#39; (but<br>
/home/build/releases/master/meta-openembedded/meta-oe/recipes-crypto/crypt=
setup/<a href=3D"http://cryptsetup_2.3.5.bb" rel=3D"noreferrer" target=3D"_=
blank">cryptsetup_2.3.5.bb</a><br>
DEPENDS on or otherwise requires it). Close matches:<br>
=C2=A0 util-linux<br>
=C2=A0 util-linux-uuid<br>
=C2=A0 util-linux-uuid RPROVIDES util-linux-libuuid<br>
=C2=A0 util-linux-uuid-native<br>
ERROR: Required build target &#39;cryptsetup&#39; has no buildable provide=
rs.<br>
Missing or unbuildable dependency chain was: [&#39;cryptsetup&#39;,<br>
&#39;util-linux-libuuid&#39;]<br>
<br>
The recipe in core is not=C2=A0 util-linux-libuuid, its util-linux-uuid.<b=
r>
<br>
Do I need to cleanup any thing?<br>
<br>
-armin<br>
<br>
On 3/25/21 12:06 AM, Khem Raj wrote:<br>
&gt; OE-core recipe is called util-linux-libuuid now<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@microsoft.com" =
target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup_=
2.3.5.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.3.5.bb</a> | 2 =
+-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cryp=
tsetup_2.3.5.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.3.5.bb</=
a> b/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup_2.3.5.b=
b" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.3.5.bb</a><br>
&gt; index 5faaada4b7..0da9a26e83 100644<br>
&gt; --- a/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup_=
2.3.5.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.3.5.bb</a><br>
&gt; +++ b/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup_=
2.3.5.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.3.5.bb</a><br>
&gt; @@ -13,7 +13,7 @@ DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 json-c \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libdevmapper \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 popt \<br>
&gt; -=C2=A0 =C2=A0 util-linux-uuid \<br>
&gt; +=C2=A0 =C2=A0 util-linux-libuuid \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 RDEPENDS_${PN} =3D &quot; \<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</blockquote></div></div>

--0000000000007b8ea505be9fe332--
