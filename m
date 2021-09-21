Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.2596.1632251233287443067
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 12:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PJZocvXl;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id d207so1236188qkg.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6sod5mef6rFyVClj3PYuLywnPuhqXgzMe9nIFK4WoGs=;
        b=PJZocvXlPpR1srYrKHTvXOF7GFi4x5/egTlCf15HBHrM784HbXcyWkJ4+H+fiNy8oS
         WOGxaxftaPH9etE5xw5gZKBmtjEYievgy3E7FwxfwRCLw463vg3E75HEyfMc+FeM8x/3
         BZMFhO00eTH6cJusGzKZwMhXPIVnAuxkSGtxgtAh6CjPi0dX7zxFg5j0/7dFQ5mqwJG2
         k3SuKSKd3b3kIsUV2AhPyaVvQZWuBXYcAOPOrVCdTpKsKwuOmj0k5VKKq9qKU+tsu5LX
         yJrNYxqywGwxQYfEofYBTkCQ2ph05gHPRlmW3UcDS/Rjb2WjyvKs2DSlwHdrUqTw0qS6
         nWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6sod5mef6rFyVClj3PYuLywnPuhqXgzMe9nIFK4WoGs=;
        b=EJMnKKaIhgb0kfdUbAvpc3Y5QXnUZ/D/Xfg41LtO2w6F0KaW5xvm6r8yG+8lUU/JY8
         hfNP84fzqJI0SNsyP9dFDIFoMnvHjrws/Nu2Byr39QLUxeEcrKqNCCD6ty4GzBAes7Yi
         4zgvPFbXXl4r9jbiXnXL4JuE5o/hkcHVW7JeiHbc/ORn0F3kkfniwYNU2SDThFy0yXzT
         i8eEtK3XSmZZBw0+TSaL0p/IN6es1QcXYqeUyDrqHZuu95LxqVnwwE28+dpcLf0br7D4
         BfwtfDLhpBmjuEAO94j8tvN92fT6h2TKMIXyI6knuJ7JORvuRSGS7C+jIvBGaM020Qrf
         UE3w==
X-Gm-Message-State: AOAM532rgBAHug2DZahaPQZ2zEKSoLgpQ7LMuE9e80NC+TmuUdyHhxTX
	ZSndJOv1hF75802eKrvmc3yLi/6KJZRZ6gCCvpk=
X-Google-Smtp-Source: ABdhPJylxTS2pA22zcbNpX7EMpqScYk5ScxrlsUz8GKQgX46JX1jrrYaxUxkfqtibDt5g/CYPEEG5YTUECSx6mUuonk=
X-Received: by 2002:a37:9c46:: with SMTP id f67mr3995292qke.98.1632251232335;
 Tue, 21 Sep 2021 12:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210921172931.3132388-1-raj.khem@gmail.com> <CAAnfSTsph=Kk8Rqthz07M0D6mu6Os51jxjoWiVS4kw79Z_z5=g@mail.gmail.com>
In-Reply-To: <CAAnfSTsph=Kk8Rqthz07M0D6mu6Os51jxjoWiVS4kw79Z_z5=g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 21 Sep 2021 12:07:01 -0700
Message-ID: <CAMKF1srE3cbJ+iEYKfO7QqFZZm+t+7F05FS0O7yDV1hGJmE_rw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] rp-pppoe: Add configure cached variable via recipe
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e33a8005cc861a55"

--000000000000e33a8005cc861a55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 11:15 AM Ross Burton <ross@burtonini.com> wrote:

> On Tue, 21 Sept 2021 at 18:29, Khem Raj <raj.khem@gmail.com> wrote:
> > +EXTRA_OECONF:append =3D "${@oe.utils.conditional('SITEINFO_ENDIANNESS'=
,
> 'be', 'rpppoe_cv_pack_bitfields=3D${rpppoe_cv_pack_bitfields=3Dnormal}',
> 'rpppoe_cv_pack_bitfields=3D${rpppoe_cv_pack_bitfields=3Drev}', d)}"
>
> I think CACHED_CONFIGUREVARS was intended to be used for this, for
> what it's worth.


yeah although it will work in both cases I don=E2=80=99t remember why I int=
roduced
that variable but I guess it was that in sone cases it needed to be
embedded in shell environment

>
>
> Ross
>

--000000000000e33a8005cc861a55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 21, 2021 at 11:15 AM Ross Burton &lt;<a href=3D=
"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On Tue, 21 Sept 2021 at 18:29, Khem Raj &lt;<a h=
ref=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&=
gt; wrote:<br>
&gt; +EXTRA_OECONF:append =3D &quot;${@oe.utils.conditional(&#39;SITEINFO_E=
NDIANNESS&#39;, &#39;be&#39;, &#39;rpppoe_cv_pack_bitfields=3D${rpppoe_cv_p=
ack_bitfields=3Dnormal}&#39;, &#39;rpppoe_cv_pack_bitfields=3D${rpppoe_cv_p=
ack_bitfields=3Drev}&#39;, d)}&quot;<br>
<br>
I think CACHED_CONFIGUREVARS was intended to be used for this, for<br>
what it&#39;s worth.</blockquote><div dir=3D"auto"><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex" dir=3D"auto"></blockquote><div dir=3D"auto">yeah although =
it will work in both cases I don=E2=80=99t remember why I introduced that v=
ariable but I guess it was that in sone cases it needed to be embedded in s=
hell environment=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br=
>
<br>
Ross<br>
</blockquote></div></div>

--000000000000e33a8005cc861a55--
