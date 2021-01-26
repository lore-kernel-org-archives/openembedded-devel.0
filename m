Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web12.18667.1611692840521696600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 12:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ds+2wesI;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id v23so6064788uam.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 12:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RctpYg9eCi1CH68uMsn+TSvkKrhYJrO/vGHyEucdLoU=;
        b=ds+2wesIetHk+RCiFB8rLSCOKJftCowlZQK6GZ9zKUELGS1m1Q/X0MTEWl664uKRcY
         c3R9rkadt2Lg3SVTBCJ2AZWYiQU4Yt9LVf1D9myMw5KEPHA6nUmfGqvUF34umFhw2QwZ
         1SZGruG8pfz8LdfFunvhuey/DUPqZoRwhmlaSjS9n2EhqTRXWMTinK0c9nk5q9Sy84oK
         dxKgKreuZbJ6DZuTlLE2pYaNLN9CKf6GPhE58ITf7TxQ6PI+Yo6q8T5s0WEnbwSJxpSJ
         HWnjNfq2uQr4pFqdz+7pifjYyKvHNprWBcwjL9OdubkVt+T/qDJHvb5wT6m3zEDPXvqc
         CrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RctpYg9eCi1CH68uMsn+TSvkKrhYJrO/vGHyEucdLoU=;
        b=uAtq6buR++dmlDbY1+5wvlK///PtKHA5KEV3UwssK0ZW+8lMFjc+h8orxLW0t8Rirw
         YkswKh9XGq/b6q3LPWgE+Q9cnh/d19u4L3CTnm8cUWLbjOAF1sPfw5xhrgfWTGk4qVL2
         iXI6UMKC6ALdNLe8lwmqnY543Iu29zpWjBg8TQEFhQHvqM3j1b+EnUM4ulZRPbVSH0nl
         gEmYQzWtlNihm5mEgDvSoTb8zYnYYr7RE35n+9MQbuD7K04FwBrz3HNgODstDri7RjlA
         W5iqqrLvAvNqfICrkqAJP2RFr9ahyPUWOftX32UXWom88cW8yHMMoTlg7cW6Fy+U2W5r
         fevA==
X-Gm-Message-State: AOAM533EPRfYyT808KBuWKyHdY0V8PvVzdCCKvIv3wX5765fiGSt+/nl
	RrMTlR0lu49QwvyeoR3nvt1Lh4XfImGG8YNswQQ=
X-Google-Smtp-Source: ABdhPJybSo+Z71Lh52at9aTOtI/OsyGE/M160VZGEV2SyzYz6hJHWe04oTUUEKaa7oWte3ko9nm24p99Zquqfy7Uj4A=
X-Received: by 2002:ab0:2917:: with SMTP id v23mr6075890uap.71.1611692839659;
 Tue, 26 Jan 2021 12:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20210125163136.2497652-1-adrian.freihofer@siemens.com>
 <CALbNGRR2FXO1MRnfUpfND_N+rBrRZ9AO4fV0cGK1UWfPc=pU8g@mail.gmail.com>
 <CALbNGRR3G29swaE0kTVaNjobtwOt1tpX07XUJZcutt7jd40WRg@mail.gmail.com> <5ef6c37e826f06c47f93bce8eb4ad338e7828bbe.camel@siemens.com>
In-Reply-To: <5ef6c37e826f06c47f93bce8eb4ad338e7828bbe.camel@siemens.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 26 Jan 2021 21:27:08 +0100
Message-ID: <CANNYZj8ttcRT4yF2u6GiQ18v_UPbb6aJFmtVwZ+fTV2LthnwRQ@mail.gmail.com>
Subject: Re: [oe][meta-networking][PATCH] networkmanager: add missing readline depends
To: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000031f03b05b9d37b4d"

--00000000000031f03b05b9d37b4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As you said, nmcli is already placed into its own package, so we (mbition.i=
o)
simply do not install the package onto the product images.

Last time I looked it was not possible to enable/disable nmcli at buildtim=
e
without extensive patching.

Alex

On Tue, 26 Jan 2021 at 21:17, Adrian Freihofer <adrian.freihofer@siemens.c=
om>
wrote:

> Hi Andreas
>
> On Mon, 2021-01-25 at 18:15 +0100, Andreas M=C3=BCller wrote:
> > On Mon, Jan 25, 2021 at 6:09 PM Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
> wrote:
> > > On Mon, Jan 25, 2021 at 5:31 PM Adrian Freihofer
> > > <adrian.freihofer@gmail.com> wrote:
> > > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > > ---
> > > >  .../recipes-connectivity/networkmanager/networkmanager_1.28.0.bb =
|
> 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.28.0.bb
> b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.28.0.bb
> > > > index 1053bdd42..7338290e1 100644
> > > > --- a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.28.0.bb
> > > > +++ b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.28.0.bb
> > > > @@ -17,6 +17,7 @@ DEPENDS =3D " \
> > > >      libnewt \
> > > >      jansson \
> > > >      curl \
> > > > +    readline \
> > > >  "
> > > >
> > Hi Adrian,
> >
> > pressed 'send' accidentally...
> >
> > readline is an optional dependency for nmcli. Since readline is GPLv3,
> > not everybody is happy having it in unconditionally, I suggest you
> > introduce a PACKAGECONFIG for that - default add or not is up to you
> > (or what do others think?)
> >
> > Cheers
> >
> > Andreas
>
> Hi Andreas
>
> Thank you for the suggestion. I will send a v2 patch with a
> PACKAGECONFIG[nmcli]. But since nmcli was split into a separate
> package, its possible to compile nmcli but not install it into a
> released firmware.
> However I wonder a little bit how others are compiling NetworkManager.
> At least in my configuration there is a build error without readline in
> DEPENDS.
>
> Regards,
> Adrian
>
>
>=20
>
>

--00000000000031f03b05b9d37b4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As you said, nmcli is already placed into its own pac=
kage, so we (<a href=3D"http://mbition.io">mbition.io</a>) simply do not in=
stall the package onto the product images.</div><div><br></div><div>Last ti=
me I looked it was not possible to enable/disable nmcli at buildtime withou=
t extensive patching.<br></div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 26=
 Jan 2021 at 21:17, Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer=
@siemens.com">adrian.freihofer@siemens.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Andreas<br>
<br>
On Mon, 2021-01-25 at 18:15 +0100, Andreas M=C3=BCller wrote:<br>
&gt; On Mon, Jan 25, 2021 at 6:09 PM Andreas M=C3=BCller &lt;<a href=3D"ma=
ilto:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>=
&gt; wrote:<br>
&gt; &gt; On Mon, Jan 25, 2021 at 5:31 PM Adrian Freihofer<br>
&gt; &gt; &lt;<a href=3D"mailto:adrian.freihofer@gmail.com" target=3D"_bla=
nk">adrian.freihofer@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adria=
n.freihofer@siemens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>=
&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../recipes-connectivity/networkmanager/<a href=3D"ht=
tp://networkmanager_1.28.0.bb" rel=3D"noreferrer" target=3D"_blank">network=
manager_1.28.0.bb</a> | 1 +<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta-networking/recipes-connectivity/networkma=
nager/<a href=3D"http://networkmanager_1.28.0.bb" rel=3D"noreferrer" target=
=
=3D"_blank">networkmanager_1.28.0.bb</a> b/meta-networking/recipes-connect=
ivity/networkmanager/<a href=3D"http://networkmanager_1.28.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">networkmanager_1.28.0.bb</a><br>
&gt; &gt; &gt; index 1053bdd42..7338290e1 100644<br>
&gt; &gt; &gt; --- a/meta-networking/recipes-connectivity/networkmanager/<=
a href=3D"http://networkmanager_1.28.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">networkmanager_1.28.0.bb</a><br>
&gt; &gt; &gt; +++ b/meta-networking/recipes-connectivity/networkmanager/<=
a href=3D"http://networkmanager_1.28.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">networkmanager_1.28.0.bb</a><br>
&gt; &gt; &gt; @@ -17,6 +17,7 @@ DEPENDS =3D &quot; \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 libnewt \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 jansson \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 curl \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 readline \<br>
&gt; &gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; &gt; <br>
&gt; Hi Adrian,<br>
&gt; <br>
&gt; pressed &#39;send&#39; accidentally...<br>
&gt; <br>
&gt; readline is an optional dependency for nmcli. Since readline is GPLv3=
,<br>
&gt; not everybody is happy having it in unconditionally, I suggest you<br=
>
&gt; introduce a PACKAGECONFIG for that - default add or not is up to you<=
br>
&gt; (or what do others think?)<br>
&gt; <br>
&gt; Cheers<br>
&gt; <br>
&gt; Andreas<br>
<br>
Hi Andreas<br>
<br>
Thank you for the suggestion. I will send a v2 patch with a<br>
PACKAGECONFIG[nmcli]. But since nmcli was split into a separate<br>
package, its possible to compile nmcli but not install it into a<br>
released firmware.<br>
However I wonder a little bit how others are compiling NetworkManager.<br>
At least in my configuration there is a build error without readline in<br=
>
DEPENDS.<br>
<br>
Regards,<br>
Adrian<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000031f03b05b9d37b4d--
