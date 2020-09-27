Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.8573.1601192459015370724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 00:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Remj/nw8;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id q4so6756238ils.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2020 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivYDH9modbi7tmm8/f0ZVe5duxXZvpePJwCKvPZplzI=;
        b=Remj/nw8ECp5d0vlhEo0CmjoOr/ouSc95Q4hcMirx945GpDP3LGioRaMMIB9AVwpEy
         W8kCE+Pf8ZSBZXYdNO4HDWOWQG12QSsiXhoZypgZY4mL901mvdIhC9ZIdUQjEmTtFqjG
         5HY3D82/ePmLZzHrUzKj9N3/TOcA8EXOnLHQnmwbK77hpzBYioI8yEypv5wVEeUNdpO8
         hO/fvXurkiV7lkM4vQIPnp+4JQZBzUvz1BEnIo1W5s9DZ0n/nLxmNPV+ijTZW2L4oCHE
         Y8FyBXm61DtEBhRcGhdeCYLw19FoLIt1C9PyByQ4APiKz9xCx4RxEf74E10XMEP+Rn2A
         fVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivYDH9modbi7tmm8/f0ZVe5duxXZvpePJwCKvPZplzI=;
        b=BGopFdL9YYyGrMJBInUlLfmqyGozXgj1icwyZkpVJWXYPrh59ybn+LcIg4p0ihWg+v
         cZLecn2XzehPRnumoEJy+Kwxq83L8wLMF+5O8B7xOkuQFrIA3Qz91I+cHSSSrN6AUb6/
         ls6CpxtkoKnuNu1Wk9edCKF+HwZX5LPItgRYZlL9Et2kkl451MMT6wVSNhGOGWuUEwUq
         1CNW+W51A0lxm7aOYXTksz/FbLtXlSLF/4f0XcdHTh0ghxv9lbGqGCCJBJ1sQcZnVFft
         nvsM3uJIu8LqIfc6Sejlx7dFJ4QvmqRpQZ8jcAvQvAv44lZ2I6S+k9n8ZESHTzb9U4Se
         3w2Q==
X-Gm-Message-State: AOAM531YSwPetoEmUTKl3Gn/mcgB69utLq8ATA7nVMRhzyy1W+MqMSwV
	R3GQ4XVAVdKnbtIxWg7WVnOg3Bf2cpOGObXJMps=
X-Google-Smtp-Source: ABdhPJyqmoZ6kR2D34bPHV3pe72AjzYiBywl4UX3LqJKExNOLA729W4R4gatqQOBNZSc++IyKd75N9jjtXjHzUFSKt4=
X-Received: by 2002:a92:4805:: with SMTP id v5mr6612221ila.170.1601192458198;
 Sun, 27 Sep 2020 00:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200927054741.11210-1-kai.kang@windriver.com>
In-Reply-To: <20200927054741.11210-1-kai.kang@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sun, 27 Sep 2020 00:40:46 -0700
Message-ID: <CANx9H-Ab2LG17H=_4U8a4m-xT+gHR6LQcR10v9OyU4AaeCKc4Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/2] Update python3-pytest to 6.1.0
To: kai <kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b0233105b046abc1"

--000000000000b0233105b046abc1
Content-Type: text/plain; charset="UTF-8"

When you do a major version update, or any update,  please include the
change log. It only takes a few seconds to copy and paste it. And then we
all know what this change brings.

On Sat, Sep 26, 2020 at 10:47 PM kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
>
>
>
>
> Kai Kang (2):
>
>   python3-iniconfig: add recipe
>
>   python3-pytest: 5.4.3 -> 6.1.0
>
>
>
>  .../python/python3-iniconfig_1.0.1.bb         |  8 +++++
>
>  ...he-setup_requires-for-setuptools-scm.patch | 35 ++++++++++---------
>
>  ...ytest_5.4.3.bb => python3-pytest_6.1.0.bb} |  3 +-
>
>  3 files changed, 29 insertions(+), 17 deletions(-)
>
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-iniconfig_1.0.1.bb
>
>  rename meta-python/recipes-devtools/python/{python3-pytest_5.4.3.bb =>
> python3-pytest_6.1.0.bb} (89%)
>
>
>
> --
>
> 2.17.1
>
>
>
>
>
> 
>
>
>
>

--000000000000b0233105b046abc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">When you do a major version update, or any update, =C2=A0=
please include the change log. It only takes a few seconds to copy and past=
e it. And then we all know what this change brings.=C2=A0</div><div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 2=
6, 2020 at 10:47 PM kai &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.k=
ang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fr=
om: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank=
">kai.kang@windriver.com</a>&gt;<br><br><br><br><br><br>Kai Kang (2):<br><b=
r>=C2=A0 python3-iniconfig: add recipe<br><br>=C2=A0 python3-pytest: 5.4.3 =
-&gt; 6.1.0<br><br><br><br>=C2=A0.../python/<a href=3D"http://python3-inico=
nfig_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-iniconfig_1.0.1=
.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++++<br><br>=C2=A0...he=
-setup_requires-for-setuptools-scm.patch | 35 ++++++++++---------<br><br>=
=C2=A0...<a href=3D"http://ytest_5.4.3.bb" rel=3D"noreferrer" target=3D"_b=
lank">ytest_5.4.3.bb</a> =3D&gt; <a href=3D"http://python3-pytest_6.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-pytest_6.1.0.bb</a>} |=C2=A0 =
3 +-<br><br>=C2=A03 files changed, 29 insertions(+), 17 deletions(-)<br><br=
>=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-iniconfig_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-iniconfig_1.0.1.bb</a><br><br>=C2=A0rename meta-python/recipes-devtools/=
python/{<a href=3D"http://python3-pytest_5.4.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-pytest_5.4.3.bb</a> =3D&gt; <a href=3D"http://python3-=
pytest_6.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pytest_6.1.0.=
bb</a>} (89%)<br><br><br><br>-- <br><br>2.17.1<br><br><br><br><br><br><br><=
br><br><br></blockquote></div></div>

--000000000000b0233105b046abc1--
