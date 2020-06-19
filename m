Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.201.1592525146347709986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 17:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ih/MFTt7;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 205so7447631qkg.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 17:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QodMs5LO9JK9/XVlNlqSyY8GmpzpX/met+qnf92awTM=;
        b=Ih/MFTt7F5zO4QkXH8a9t0Dl5kzFMkUqC1SxDXpixUxp1fCrz5Dn6ozSjPk4ZEIhfr
         GjaECivM4TlLv/OaOcsGBDnqSd4yHnLjy95XFRi5cZjTz6PYdvdwyG7oKz+w001M6wmc
         XBkBKoL7TePXVXHwwNCtkMsMod3c3MTEQFAGoQjfs4DyeLmtn+N9PnlJqNwQHi74Yyj6
         bvypQsjqXX+BJ2onU0txpgSl5ZiEqvG7YV5PdGcgMpx5Wzn8xkbpQhjnIqu/VKSkRrvs
         1Ur85TUKi9LPJ2W7jJ6eOHzuj7+ilZIDeMGji6cvl7oMpihXMjndIYXDexPbwGbXcJ49
         vvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QodMs5LO9JK9/XVlNlqSyY8GmpzpX/met+qnf92awTM=;
        b=UEmvqCV7ab8fsBcAfAlRdA2tu/XqXLnAFZbT5fr/yCGT/D3Chr/7O5pZZ8BIPfSZzo
         1xb6Ew48+EMHUushrqik6tpx29tqu6PilIk7iKvAXZVUjLCLPhLxomADFpovuTJthibU
         /a7cLu8DUH4dQtZTgRUVQUEFwjarUCVkpcNEzcuD84IC2dU2OccKzrqP0CIHnXqvcJZ5
         awMeexjdpHOfI3d/PEvB1yuskIun7LFF2ota9tKE6uFaBcGB4A8Xef5LwvlcoiE+Snez
         saqoXobIkIdZfe8lXYt42N6Dfjmsh57ZoXJQJzCCEBKNb2bAwT4a0V+sScxE4qEY1wDM
         IjaA==
X-Gm-Message-State: AOAM53230wzeNhPSOZdWIxPryquL1JzSo2er+qqmI/EGYZLpiBo4vYv9
	wyzIwA377KKZJXerqDueP+AC8iKwgeVDapnb6hYrCF6f
X-Google-Smtp-Source: ABdhPJyLeyq+pHNiE0Ilh73rdSGna7L2aImtCC1CruWB/uo9UOwDbGS2edTUbRjQ2VgIfEGDzdCdo/scu57gWmrXSck=
X-Received: by 2002:a05:620a:2050:: with SMTP id d16mr1092275qka.215.1592525145271;
 Thu, 18 Jun 2020 17:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LFD.2.21.2006160631480.7747@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2006160631480.7747@localhost.localdomain>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Jun 2020 17:05:34 -0700
Message-ID: <CAMKF1srjpN2W-63H-rZY-kGZ3po6m0YYbv+75QaUCEfWwjgCtw@mail.gmail.com>
Subject: Re: [oe] standardizing HOMEPAGE values in python3 recipes
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000094724605a864a70a"

--00000000000094724605a864a70a
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 16, 2020 at 3:36 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   given the current flurry of python recipe cleanup, just want to
> verify a couple things that could/should be standardized.
>
>   first, HOMEPAGE values of the form:
>
>   https://pypi.python.org/pypi/astroid
>
> can be adjusted to reflect the result of the redirection, as in:
>
>   https://pypi.org/project/astroid


Both Links above point to pypi.org while not
Ideal using pypi.python.org is still functional

<https://pypi.org/project/astroid>
>
> also, as i read it, recipe HOMEPAGE values should *not* refer to the
> pypi page, as that is already set automatically by pypi.bbclass.
> rather, the HOMEPAGE should refer to the actual source home page,
> which in the case of the astroid package would be:
>
>   https://github.com/PyCQA/astroid
>
> does this make sense?


Yeah if there is anything beyond pypi link to be used
Then it should be set but I think pypi is commonly used for majority of
recipes


>
> rday
> 
>

--00000000000094724605a864a70a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 16, 2020 at 3:36 AM Robert P. J. Day &lt;<a hr=
ef=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 given the current flurry of python recipe cleanup, just want to<br>
verify a couple things that could/should be standardized.<br>
<br>
=C2=A0 first, HOMEPAGE values of the form:<br>
<br>
=C2=A0 <a href=3D"https://pypi.python.org/pypi/astroid" rel=3D"noreferrer"=
 target=3D"_blank">https://pypi.python.org/pypi/astroid</a><br>
<br>
can be adjusted to reflect the result of the redirection, as in:<br>
<br>
=C2=A0 <a href=3D"https://pypi.org/project/astroid" rel=3D"noreferrer" tar=
get=3D"_blank">https://pypi.org/project/astroid</a></blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto">Both Links above point to <a href=3D"htt=
p://pypi.org">pypi.org</a> while not</div><div dir=3D"auto">Ideal using <a =
href=3D"http://pypi.python.org">pypi.python.org</a> is still functional=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><a hre=
f=3D"https://pypi.org/project/astroid" rel=3D"noreferrer" target=3D"_blank"=
></a><br>
<br>
also, as i read it, recipe HOMEPAGE values should *not* refer to the<br>
pypi page, as that is already set automatically by pypi.bbclass.<br>
rather, the HOMEPAGE should refer to the actual source home page,<br>
which in the case of the astroid package would be:<br>
<br>
=C2=A0 <a href=3D"https://github.com/PyCQA/astroid" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/PyCQA/astroid</a><br>
<br>
does this make sense?</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">Yeah if there is anything beyond pypi link to be used</div><div dir=
=3D"auto">Then it should be set but I think pypi is commonly used for majo=
rity of recipes=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><br>
<br>
rday<br>
<br>
</blockquote></div></div>

--00000000000094724605a864a70a--
