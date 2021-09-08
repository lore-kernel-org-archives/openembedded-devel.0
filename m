Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.8618.1631090001072357070
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 01:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j2j80o0S;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: manjunathan.n@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id h9so2571864ejs.4
        for <Openembedded-devel@lists.openembedded.org>; Wed, 08 Sep 2021 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Kl552ZxsY+yNZArsVFp/x8xfD2M93pcw0pc8T6tpCA=;
        b=j2j80o0SyGPH0QO85X0Rs/CVwECfEHB8El2tWrfj8rps6TLG4YGxDkdnAULj6SDkEj
         jFh+dodsLHEWF+ByB9BJfcVnVHTdbmOG7wblHTO2Dr6ihAdf62aY+cv56D/IiIYbCEJd
         mF7Je7LPmyf3F6HLjvPMF6HBUFLfdXp1BumjyP68Off6fdEfY73n5Zcb2F9kmiHrlp+R
         DdUKepYesWOGycBXrrnpk1/qwEdt3ILMjSWbKU+xq2ObrZ7TVhyiguthu8XqCwuVk1sH
         1XIzSEl8mhaCuYVOJABh4NzNkBEZGsYJFu3xoNM81z15CfMhFyiO7MUR6OsaQRPrpnJO
         b7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Kl552ZxsY+yNZArsVFp/x8xfD2M93pcw0pc8T6tpCA=;
        b=NIa+eeSQUExlWv7m8QN2K6NxRRCq1URFkiKTXJjTejGMl463/DiERc93mYf/lsRHD5
         ryplOJVJ9Z72P8QT+GwRJVfWi7Ol2gE1osXeS5rmH+GMhsRNDGZ2P+zbLlVhwaeObmWF
         VOOqqY4564QOMbF9Ls4z/J39x46m4s/r5/UnY2ZMBxOGDxuwwNLDO2wkryiOvir+QDtl
         KvaTQ8lGBV6wZ4QYX/ty2M6r923bVd18MoA9PIbypUTLC9L6KNxj4DMkjDQu7YTOMls0
         vgd0Lr8Y6ogjwJrw1xmrG177QXXVIa+zxWXmDg7+e5qgHQq6IKcEQuHpl3uKeXGm1Xbe
         IWmg==
X-Gm-Message-State: AOAM531ra3ufLKmYBYR1QxkTrwrYq7u2seNjfG0H7xO6eUG7ES3Y5Azp
	OGMRrTdUIHqjQgKPJfrhekcmAozChPhhsr6U+bM=
X-Google-Smtp-Source: ABdhPJwShPYjrjKu9OBKxrrm22YLySwQhAuFZQnTZBy2dk05Lv17i+ZmRnNO1E7SDQ/Z7RfInjN/b53arkcQifokW8I=
X-Received: by 2002:a17:907:9723:: with SMTP id jg35mr2721885ejc.187.1631089999168;
 Wed, 08 Sep 2021 01:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+xQMzz1cuSfo2XwV98BCCKmv=5XH65eYHdgSgH3TMNjU_d2cQ@mail.gmail.com>
 <CAMKF1sqgsG5e1j-85MCaydbukaiQbsuccLUyJThwotFjrOTypQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqgsG5e1j-85MCaydbukaiQbsuccLUyJThwotFjrOTypQ@mail.gmail.com>
From: "manjunatha srinivasan" <manjunathan.n@gmail.com>
Date: Wed, 8 Sep 2021 14:03:08 +0530
Message-ID: <CA+xQMzyg9mRxb1NfcrnUAt8TTCg2Mc8a8xvEPoY4Qhio7ksgng@mail.gmail.com>
Subject: Re: [oe] Regarding Python 3.9 to yocto .2.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ff682c05cb77bb07"

--000000000000ff682c05cb77bb07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi  Khem

Thanks for your reply.  Iam proceeding with changes. I can build for
standalone python 3.9 with python 3.9.5 recipe from hardknott.
I am facing issues in rootfs building. Currently I am debugging it.

Thanks
Manjunatha Srinivasan N


On Sat, 4 Sept 2021 at 23:24, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Sep 4, 2021 at 3:42 AM manjunatha srinivasan
> <manjunathan.n@gmail.com> wrote:
> >
> > Hi
> > I want to back port python 3.9.5 (python3_3.9.5.bb) from hardknott
> yocto 3.3 to my build environment morty (yocto 2.2). I don=E2=80=99t have=
 any other
> option for upgrading my yocto version from morty (yocto 2.2) to the lates=
t.
> Please let me know, how big is my porting effort?
> > What are key points/steps I need to look for while porting?
>
> The yocto versions are quite far so it wont be a trivial port. I would
> suggest to take hardknott version so you can avoid override changes
> and then do the needed to get it going on 2.2
>
> >
> > Thanks
> > Manjunatha Srinivasan N
> >
> >
> >
> >=20
> >
>

--000000000000ff682c05cb77bb07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0 Khem=C2=A0<div><br></div><div>Thanks for=C2=A0you=
r reply.=C2=A0 Iam=C2=A0proceeding=C2=A0with changes. I can build for stand=
alone python 3.9 with python 3.9.5 recipe from hardknott.=C2=A0</div><div>I=
 am facing issues in rootfs building. Currently I am debugging it.=C2=A0=C2=
=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature">Thanks<br>Manjunatha Srinivasan N</=
div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sat, 4 Sept 2021 at 23:24, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Sat, Sep 4, 2021 at 3:42 AM =
manjunatha srinivasan<br>
&lt;<a href=3D"mailto:manjunathan.n@gmail.com" target=3D"_blank">manjunatha=
n.n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt; I want to back port python 3.9.5 (<a href=3D"http://python3_3.9.5.bb" =
rel=3D"noreferrer" target=3D"_blank">python3_3.9.5.bb</a>) from hardknott y=
octo 3.3 to my build environment morty (yocto 2.2). I don=E2=80=99t have an=
y other option for upgrading my yocto version from morty (yocto 2.2) to the=
 latest. Please let me know, how big is my porting effort?<br>
&gt; What are key points/steps I need to look for while porting?<br>
<br>
The yocto versions are quite far so it wont be a trivial port. I would<br>
suggest to take hardknott version so you can avoid override changes<br>
and then do the needed to get it going on 2.2<br>
<br>
&gt;<br>
&gt; Thanks<br>
&gt; Manjunatha Srinivasan N<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000ff682c05cb77bb07--
