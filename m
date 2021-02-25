Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.10116.1614254322783832729
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 03:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWxAGelP;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id mm21so8124605ejb.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Feb 2021 03:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=1pQrZUGzTQwYijR1PMajfZeRFsChmdS+8E97FU612eQ=;
        b=jWxAGelPlVLbfHNHqdBDpBUboXpOkjE4Y+a7hv59B5EEUvD7n6ZTPAPil/zz+f6YHL
         eO0LVHDBGUihynXsxyERFAo+kdRkKsOgqdg7FUyQgobmZZYlrrZwiX6zHZsxdUzrOUb5
         xjYLNuUJfhO9KTBb0JZ6DfzMhqPFVvzyqa5j4fCPY7qj5giV3fz9jz+O2KxH5sTKW2ni
         bCIMQLW1iZskti7D4u59SPNpJh+cZaKPpQAPv5L8S9A1VHbwJWMlcWT+vZMeDMcw27E9
         ey2AwbxvDHx22igg4T+ZMbYTuRIdileCIDGS7aPwFNTO4QE6NaNqhDX6Q91JF8zHorvM
         YArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=1pQrZUGzTQwYijR1PMajfZeRFsChmdS+8E97FU612eQ=;
        b=UNe3cG+c4lu8Fe2lt+Xc8tAw8tF5BY2IIzUrBVRFS9SH1FZ/Q3YSOI1XiWHq/UaHlK
         N4qXNufEVKkDavXzHac+XKaeh3ExtATstKQ3YWtr/IHEfj+aiBfZo9xz4ugPEuXg8sO9
         4WCeyg9GsQ47AvKRYAiCvV/xStohyT070+znuHocQW0vwI+kgabrjHhNPvN9d8GWjYwP
         RuLaLEJK9Fo4QOBMq31WsaXVK0kICZzZXOdgvqn1H2jQdr8edxNuX9GJV7S2uZzZMtsr
         O1mk4K1mLNPoq7/i2D8o2tEgrR6EHU8Bas78jm9rjgdiYDid9Vin4x5B+wRVgivqWh7g
         mOyQ==
X-Gm-Message-State: AOAM531FlzcS/ZpgrghXGsjH4tSNyVxrBZ09Kew7Sg9alsNEUOyf2AbX
	cRM9heDmkWdlgDwz3jhhefoXbet6/A0gAln598M=
X-Google-Smtp-Source: ABdhPJxzoSzTnYxtIzVuvnO+0ZTtuDMn8Buel8nxt3ZBtejPMovg3JjGTEdFRd99yFMiSOjNzybl4F8ZjwsCQCzZ3TQ=
X-Received: by 2002:a17:906:c0d7:: with SMTP id bn23mr2295658ejb.94.1614254321054;
 Thu, 25 Feb 2021 03:58:41 -0800 (PST)
MIME-Version: 1.0
References: <CA+chaQfrVCttH0nb55=eiwJva=GT0NZyitkVEfaFyigVj+RC8A@mail.gmail.com>
 <8614.1614238566433967267@lists.openembedded.org>
In-Reply-To: <8614.1614238566433967267@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2021 12:58:30 +0100
Message-ID: <CA+chaQcfz8tXZJ3qoK3J8yejc8OW=qrzJ4mAZXce0WwOJenaiA@mail.gmail.com>
Subject: Re: Private: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
To: Rahult9@kpit.com, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000062390a05bc27df9a"

--00000000000062390a05bc27df9a
Content-Type: text/plain; charset="UTF-8"

Hi,

you patch has:
Content-Type: text/plain; charset=8bit
Content-Transfer-Encoding: quoted-printable

and git am doesn't handle it

$ git am python2/cur/1614253357.R13620585686638879435.jama\:2\,RS
error: cannot convert from 8bit to UTF-8
fatal: could not parse patch

if I manually change it to
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

like most other patches have, then it works, that's why I've asked you to
fix your e-mail client/server or git push it somewhere so I can just
cherry-pick from there.

Anyway I've manually applied it to master-next with Backport URL
http://archive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz
replaced with:
https://github.com/python/cpython/commit/3ba51d587f6897a45301ce9126300c14fcd4eba2

Adding oe-devel ML.

Regards,

On Thu, Feb 25, 2021 at 8:36 AM <Rahult9@kpit.com> wrote:

> Hi Martin,
>
> So do you need this patch in UTF-8 format ?
>
> Thanks,
> Rahul Taya

--00000000000062390a05bc27df9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>you patch has:</div><div>Content-Ty=
pe: text/plain; charset=3D8bit<br>Content-Transfer-Encoding: quoted-printab=
le<br></div><div><br></div><div>and git am doesn&#39;t handle it</div><div>=
<br></div><div>$ git am python2/cur/1614253357.R13620585686638879435.jama\:=
2\,RS<br>error: cannot convert from 8bit to UTF-8<br>fatal: could not parse=
 patch<br></div><div><br></div><div>if I manually change it to</div><div>Co=
ntent-Type: text/plain; charset=3Dutf-8<br>Content-Transfer-Encoding: quote=
d-printable<br></div><div><br></div><div>like most other patches have, then=
 it works, that&#39;s why I&#39;ve asked you to fix your e-mail client/serv=
er or git push it somewhere so I can just cherry-pick from there.</div><div=
><br></div><div>Anyway I&#39;ve manually applied it to master-next with Bac=
kport URL=C2=A0</div><div><a href=3D"http://archive.ubuntu.com/ubuntu/pool/=
main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.04.12.debian.tar.xz">http://ar=
chive.ubuntu.com/ubuntu/pool/main/p/python3.5/python3.5_3.5.2-2ubuntu0~16.0=
4.12.debian.tar.xz</a><br></div><div>replaced with:</div><div><a href=3D"ht=
tps://github.com/python/cpython/commit/3ba51d587f6897a45301ce9126300c14fcd4=
eba2">https://github.com/python/cpython/commit/3ba51d587f6897a45301ce912630=
0c14fcd4eba2</a><br></div><div><br></div><div>Adding oe-devel ML.</div><div=
><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Feb 25, 2021 at 8:36 AM &lt;<a href=
=3D"mailto:Rahult9@kpit.com">Rahult9@kpit.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Martin,<br><br>So do you ne=
ed this patch in UTF-8 format ?<br><br>Thanks,<br>Rahul Taya
</blockquote></div>

--00000000000062390a05bc27df9a--
