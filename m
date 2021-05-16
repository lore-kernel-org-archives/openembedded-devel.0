Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web08.4017.1621156347569109615
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 02:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AW2EcG9a;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id 14so1135312uac.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 May 2021 02:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=krC8waA8kLthemPTQXKjN2k6+wyqQSexZ1fCKCYSn5s=;
        b=AW2EcG9aKEm355B6wj/0rInxFzNvGqJVmX6ZHZxiar+0+RqXpWOMmZssMmrW8LEMdi
         MDzGp2afuAdjtPJZYWrehMU0dHvNncRStoxT2wufZZPFzvW0JZpTZOgc5lg3lScP9ZFk
         qPALt6zR6z62JrL7QAg0s2DydeMfcA5KPqaQIXULGKykvvwQLY8W5GN8/mfAMQ8YpiyE
         jMC4yxh3gqV9WILEbXK8rRtYVmHhVwzh0jwNDFBqErQI0Bl/4MTUFjc5Qd6KXoWrBhcd
         UJpzOlWSYyx0jLR5QnfdUtS5b9CG3KZev0bmLUFp/EeZG8rER01ESUN7l/GxQoT05utB
         X+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=krC8waA8kLthemPTQXKjN2k6+wyqQSexZ1fCKCYSn5s=;
        b=KY/IVh/eP+pSkVoiyFkHq/QcDJzH1GIXUUTg0qi+giHObcoqzoQDJrVxoxtjnSc2Zj
         vqjonKIYn5XycBhEnCIUAQNgVM09IykOT+KyxgApjnw8blkP7Ih/cj+MSSJcdjy68X+S
         PIwe1Aso4QtocOpU+ag/bDj2Gk1Atlnv0UVoAlI+5EsPSKGWOffDfIjs1N1Q2tuq7FSw
         laDmrtQT11g26A5Jt8E+fJoY7axaMsFL+egz66NFhMdIdFOF+MODmNr7/I3nnDGKO2RB
         3KLKFjLCyOSMjd4Qb1wiePo86PwBlmpHcapxQqn0xS0sSMmzBd+30+SJp4RzEzvk294j
         9awA==
X-Gm-Message-State: AOAM531sTFtTDJvXirPlNRq8+m6/wQbUh/5e9fIk5UfHkHbI4WI41tFN
	ELqrxwcNZodjDJcT5WEMbN0XaNUuQE2hgjUtLyc=
X-Google-Smtp-Source: ABdhPJy1msnCaTXxwhkR2RLV/bCoiil6X0Xm2ImQQB7lN8gx3KIU6nN/+RBkZBsccAZfGL/JXHhzAkUKkgK5prODa+o=
X-Received: by 2002:ab0:59cb:: with SMTP id k11mr35161211uad.100.1621156346758;
 Sun, 16 May 2021 02:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
 <CANNYZj8mfJ0txH337fGheaxdGJ-JCWR3Uc-Z2vokAKcJBmuTdQ@mail.gmail.com> <CALbNGRQ9aipfPB3_XdC_iQXmy+OJLsEkYVH8ejrF6yx4ZFoGqw@mail.gmail.com>
In-Reply-To: <CALbNGRQ9aipfPB3_XdC_iQXmy+OJLsEkYVH8ejrF6yx4ZFoGqw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 16 May 2021 11:12:15 +0200
Message-ID: <CANNYZj-r+Rp7eef4nt_UxBi2A2geD_G96LPoWPzf5zxsrYrO9g@mail.gmail.com>
Subject: Re: [oe] [PATCH 01/20] tracker: upgrade 2.3.6 -> 3.0.4
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002c8b0b05c26ee09f"

--0000000000002c8b0b05c26ee09f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 16 May 2021 at 11:02, Andreas M=C3=BCller <schnitzeltony@gmail.com>
wrote:

> On Sun, May 16, 2021 at 10:46 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Thanks, just want to note that the new gnome version scheme doesn't use
> the odd-even semantics anymore, so upstream-version-is-even should be
> dropped from 40.x versions.
>
> Ahh - I thought you had sent an adjustment to
> upstream-version-is-even.bbclass but it seems my read was not precise
> enough. Interestingly there were no faults in my builds. Anyway will
> send follow ups for 40.x recipes.
>

Builds won't fail, but latest version reporting will be inaccurate (thus,
'devtool upgrade' as well). Check with 'devtool latest-version recipe' or
'devtool check-upgrade-status recipe'.

Alex

--0000000000002c8b0b05c26ee09f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 16 May 2021 at 11:02, Andreas M=C3=BCller &lt;<a href=3D"mai=
lto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, May 16, 2021 at=
 10:46 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Thanks, just want to note that the new gnome version scheme doesn&#39;=
t use the odd-even semantics anymore, so upstream-version-is-even should be=
 dropped from 40.x versions.<br>
<br>
Ahh - I thought you had sent an adjustment to<br>
upstream-version-is-even.bbclass but it seems my read was not precise<br>
enough. Interestingly there were no faults in my builds. Anyway will<br>
send follow ups for 40.x recipes.<br></blockquote><div><br></div><div>Build=
s won&#39;t fail, but latest version reporting will be inaccurate (thus, &#=
39;devtool upgrade&#39; as well). Check with &#39;devtool latest-version re=
cipe&#39; or &#39;devtool check-upgrade-status recipe&#39;.</div><div><br><=
/div><div>Alex<br></div></div></div>

--0000000000002c8b0b05c26ee09f--
