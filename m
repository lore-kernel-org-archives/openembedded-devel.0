Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.6952.1594083745129632415
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 18:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TvRUKC2j;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id k6so34551463ili.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2020 18:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vMJUt9jS9pQZCdW4wRpqnla1wFQyF6fvbwPtug0rR7A=;
        b=TvRUKC2jMgF23rD6IMuElrQLuDg//zE+Ir9RnTBI5JuY/Vepc6lBjI3YKjVwMLC54m
         zWoAf8eG39lH+BkkCZytfExMrk3dp1fgFXUVnUBDUK4N1GWhJXg4c/I23JWqipTLfgbK
         ucRkq5HUbR/OELApPQhpwyIArRQtlnfNYRw/bdhzLo2qTz/mnwOtwfH9aIZlyLTmwz7a
         4usXK+SdjFQTvCT0LKo45RUVeBIzBgx+iUHnnRA8s2KB6jhknJbL1dF4ct+WKgsgXDvg
         +fX28ngtmyZUWAiQuXMnUaZDtKzTIMkMmKV2hwuM+O0pllBI3ysDqxR4DXX8UV8aw5hd
         QJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vMJUt9jS9pQZCdW4wRpqnla1wFQyF6fvbwPtug0rR7A=;
        b=WvQAD/fxmkf12zQUNaJF8fo7fTlTtNJyVoqKumcTSRwcUgz/dGBfUaibnZl//Hp3dp
         /UHa/69/2CznaSOrTmyn+MJd22/oqDwfd6CAMa0tkdjImMVTpWVaEQ7dLk6wsrPEI6qH
         edUnszKepPWE0sBsSakHE0UBnPZMhkgJMDVpgrISZGXRf77w6FdooWKGds1s4d83Joq6
         apZw9Wwk+c2sBSnjV/ZB8mHD2syIUfH76gaPGCK5jqMqBe4Bd2uX5zPi/cKWPqxyrkgE
         ZMTwOtiODDMZyXthWInjAyC/KnxrZNL8UXNHza/1capOjO2B4XRWWf1X/2/o3+Hokedj
         cDzw==
X-Gm-Message-State: AOAM53144cp3MfEngE+ciQY1PefpzcTw/ixrbFhtCRejIOG3x7SWoy7m
	qk1M6/AZd1PggCndWvQFFqIj+e5bVD+GIjXmHc4=
X-Google-Smtp-Source: ABdhPJytFVcYoXBjohchfaoT/Xv75uwevNswejLkIONxR3ZCK/g2tM4CUG+DI96O/LEqKtlBDruhKRCuL/buEfbtzsQ=
X-Received: by 2002:a92:9108:: with SMTP id t8mr27773660ild.170.1594083744441;
 Mon, 06 Jul 2020 18:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200706145109.600956-1-raj.khem@gmail.com> <CANx9H-DHHuFfeM0ab3txSrvgjEHiRLC7Rq4KeRp-BgriAxyGzw@mail.gmail.com>
 <412cff58-b4a4-d726-b4d3-bc96321f4b75@windriver.com>
In-Reply-To: <412cff58-b4a4-d726-b4d3-bc96321f4b75@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 6 Jul 2020 18:02:13 -0700
Message-ID: <CANx9H-CmM8ZDt8TZxmQhCk55ygRQPzDzEwYQYKh9S9WsRc6Qvg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-requests-toolbelt: Remove py3-mock from rdeps
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000546a7405a9cf8b69"

--000000000000546a7405a9cf8b69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2020 at 11:47 AM Trevor Gamblin <trevor.gamblin@windriver.co=
m>
wrote:

>
> On 7/6/20 11:01 AM, Tim Orling wrote:
>
>
>
> On Mon, Jul 6, 2020 at 7:51 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> python3-mock does not exist as independent package
>>
>
> Sakib,
> Perhaps you were bringing it in from meta-cloud-services?
> http://layers.openembedded.org/layerindex/recipe/120255/
>
> Yeah, he's been adding things to support python3-requests-toolbelt (with
> my help), but we missed that dependency. I think requests-toolbelt is mi=
nor
> enough (while being a useful addition) that it should be in meta-python
> alongside python3-requests, so for completeness' sake we should move
> python3-mock in as well.
>
>
There are other things that need python3-mock to run ptests (not that I
remember an example off the top of my head at the moment), so I agree this
makes sense. Please coordinate with meta-cloud-services maintainers to mak=
e
sure they don=E2=80=99t have any concerns.

>
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>  .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb   | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-requests-toolbelt_0.9.1.bb b/meta-python/recipes-devtools/pytho=
n/
>> python3-requests-toolbelt_0.9.1.bb
>> index e075c019d0..27d122cd52 100644
>> --- a/meta-python/recipes-devtools/python/
>> python3-requests-toolbelt_0.9.1.bb
>> +++ b/meta-python/recipes-devtools/python/
>> python3-requests-toolbelt_0.9.1.bb
>> @@ -20,7 +20,6 @@ RDEPENDS_${PN} +=3D " \
>>  RDEPENDS_${PN}-ptest +=3D " \
>>         ${PYTHON_PN}-pytest \
>>         ${PYTHON_PN}-betamax \
>> -       ${PYTHON_PN}-mock \
>>  "
>>
>>  do_install_ptest() {
>> --
>> 2.27.0
>>
>>
>>
>=20
>
>

--000000000000546a7405a9cf8b69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 6, 2020 at 11:47 AM Trevor Gamblin &lt;<a href=
=
=3D"mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">

  
  <div>
    <p><br>
    </p>
    <div>On 7/6/20 11:01 AM, Tim Orling wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 6, 2020 at 7:5=
1
            AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">python3-mock
            does not exist as independent package<br>
          </blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Sakib,</div>
          <div dir=3D"auto">Perhaps you were bringing it in from
            meta-cloud-services?</div>
          <div dir=3D"auto">
            <div><a href=3D"http://layers.openembedded.org/layerindex/reci=
pe/120255/" target=3D"_blank">http://layers.openembedded.org/layerindex/rec=
ipe/120255/</a></div>
          </div>
        </div>
      </div>
    </blockquote>
    Yeah, he&#39;s been adding things to support python3-requests-toolbelt
    (with my help), but we missed that dependency. I think
    requests-toolbelt is minor enough (while being a useful addition)
    that it should be in meta-python alongside python3-requests, so for
    completeness&#39; sake we should move python3-mock in as well.<br>
    <blockquote type=3D"cite">
      <div>
        <div class=3D"gmail_quote">
          <div dir=3D"auto"></div></div></div></blockquote></div></blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">There are other things th=
at need python3-mock to run ptests (not that I remember an example off the =
top of my head at the moment), so I agree this makes sense. Please coordina=
te with meta-cloud-services maintainers to make sure they don=E2=80=99t hav=
e any concerns.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><blockquote type=
=3D"cite"><div><div class=3D"gmail_quote"><div dir=3D"auto"><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><br>
            Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
            Cc: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.co=
m" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
            ---<br>
            =C2=A0.../recipes-devtools/python/<a href=3D"http://python3-re=
quests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-requ=
ests-toolbelt_0.9.1.bb</a>=C2=A0
            =C2=A0| 1 -<br>
            =C2=A01 file changed, 1 deletion(-)<br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-requests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-requests-toolbelt_0.9.1.bb</a>
            b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-requests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
requests-toolbelt_0.9.1.bb</a><br>
            index e075c019d0..27d122cd52 100644<br>
            --- a/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-requests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-requests-toolbelt_0.9.1.bb</a><br>
            +++ b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-requests-toolbelt_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-requests-toolbelt_0.9.1.bb</a><br>
            @@ -20,7 +20,6 @@ RDEPENDS_${PN} +=3D &quot; \<br>
            =C2=A0RDEPENDS_${PN}-ptest +=3D &quot; \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-pytest \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-betamax \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-mock \<br>
            =C2=A0&quot;<br>
            <br>
            =C2=A0do_install_ptest() {<br>
            -- <br>
            2.27.0<br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <pre>
</pre>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000546a7405a9cf8b69--
