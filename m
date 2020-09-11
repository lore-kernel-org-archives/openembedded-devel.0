Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.7220.1599865243666436160
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 16:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W+jeVeEA;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id r9so12803462ioa.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 16:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMrHCPlWvDV1rXHAR7XdraeQ0HodwwbB56SJbzEcb+8=;
        b=W+jeVeEAZLa6fNW/LXctPBzZEOFxFfL/xBW8+bKmvZATGrINtFVe3BDqnCA0vX1Ed1
         A2ODEVIglB9m0zCk8eR3+gm9auNmnwH4uVyTJgTuSCY6Y+gf7MbW29yexfWDqA1jzvhR
         tjqU5uFNzwcw6UDJoOJ85IIPOVfa7cNMzL0b6xIHAOvKOLlx2d6mpqlTfxaTuL/dR2Tv
         TA4eQVI8QALSXDlqcgKZVDU31HHarY/PKtX4i7ih4j2mFbDeQbpACUs4Jk+i1GSVVu8d
         riDVrdMRHQG09RyWXoN74cmqErbERLivo6jeHaQ25/jkfHBggdcgkKV8OQDFby8itHjl
         3JOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMrHCPlWvDV1rXHAR7XdraeQ0HodwwbB56SJbzEcb+8=;
        b=ZOC/yI9vjJ+mEtfE7qzqCklUmUlXe9ruRMNPkzIFsM6rDRfo6i9YcaFaAoGCii1WLS
         NLyrZtGzGPryj/JG3AB2vpB8wXES3aa6hHzPwU1rhvMUv0i9a3lFisojCasHFWnVjatz
         rc2RiXJqBgNHrrIQxYdgmH3Wf9PAu8JyTziXw6RlzqUghTSqlHe15nEy0JZo7fJMmMrD
         Vdkp3A7A2ADPiAzyZ/xvxw0k/BsEJtCVYKquB+aL5ncOuxxnzQcvF/C6+EUYyvx4ckm9
         PAWba4epKRJnPfaZnhhG36fNUBVnY0TYM7DGKtowN7nVi5OjPpzTzGU3NexV92Q7SSjz
         zijw==
X-Gm-Message-State: AOAM533jyG8IyBAvv6WQ926oAKAdsm8zF72wkYYfRLpMIl89Tb3KeGQO
	qXlUzJ8gP2pXTV9E4X0bQtlYluqD49m3i4s7AiI=
X-Google-Smtp-Source: ABdhPJy9ykQRmNAIO8vVLUSUyYfu33OC+bPyMLi/Bk+XAS0Sh831iSsYTgTAp7FdccwQpN/vt2mA+7jv0l14ouq4soE=
X-Received: by 2002:a5d:96ce:: with SMTP id r14mr3532081iol.146.1599865242802;
 Fri, 11 Sep 2020 16:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200911142637.1435646-1-trevor.gamblin@windriver.com>
 <CANx9H-CDW+55z5cHQX0pvnmoCsN72hATBpDz8+H_ud2ukiopRw@mail.gmail.com> <a07d51b2-fd5d-5422-4b58-4c358c37b106@windriver.com>
In-Reply-To: <a07d51b2-fd5d-5422-4b58-4c358c37b106@windriver.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 11 Sep 2020 16:00:32 -0700
Message-ID: <CANx9H-Cnft8egCGzS_WRi5QJn9cBew188GZXa4o2dJyK8hot=g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-django: add recipe for 3.1.1
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007c5b8d05af11a727"

--0000000000007c5b8d05af11a727
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 2:40 PM Trevor Gamblin <trevor.gamblin@windriver.co=
m>
wrote:

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
>
>
>
> On 9/11/20 5:02 PM, Tim Orling wrote:
>
>
>
>
>
>
>
>
> The reason for Django 2.2 is it is LTS. This
>
> version will now override unless the user sets
>
> PREFERRED_VERSION. The thrash on non-LTS Django is a PITA to
>
> support...
>
>
>
>
> Alright, let's hold off on merging this one then. I'll revisit it
>
> some time in the future.
>

I=E2=80=99m not steadfastly against this, it just cannot be the default. P=
rior
experience has been a lot of pain. Every single YP/OE Django app we
currently have is brittle with Django version, although I believe David
Reyna got Toaster to work with Django 3. The next LTS will be Django 3.2,
starting in April 2021.

I  am open to other ideas, but the default must remain the current LTS
version.


>
>
>
>
>
>
>
>
>
> On Fri, Sep 11, 2020 at 7:26
>
> AM Trevor Gamblin <trevor.gamblin@windriver.com>
>
> wrote:
>
>
>
>
> meta-python
>>
>> only contains a recipe for django 2.2.x, so
>>
>>
>>
>>
>>
>> add a recipe file for the newest branch.
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>>
>>
>>
>>
>> ---
>>
>>
>>
>>
>>
>>  .../recipes-devtools/python/python3-django_3.1.1.bb
>>
>>     | 9 +++++++++
>>
>>
>>
>>
>>
>>  1 file changed, 9 insertions(+)
>>
>>
>>
>>
>>
>>  create mode 100644 meta-python/recipes-devtools/python/
>> python3-django_3.1.1.bb
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-django_3.1.1.b=
b
>>
>> b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>>
>>
>>
>>
>>
>> new file mode 100644
>>
>>
>>
>>
>>
>> index 000000000..b36cfb699
>>
>>
>>
>>
>>
>> --- /dev/null
>>
>>
>>
>>
>>
>> +++ b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>>
>>
>>
>>
>>
>> @@ -0,0 +1,9 @@
>>
>>
>>
>>
>>
>> +require python-django.inc
>>
>>
>>
>>
>>
>> +inherit setuptools3
>>
>>
>>
>>
>>
>> +
>>
>>
>>
>>
>>
>> +SRC_URI[md5sum] =3D "d5e894fb3c46064e84e9dc68a08a46d0"
>>
>>
>>
>>
>>
>> +SRC_URI[sha256sum] =3D
>>
>> "59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f"
>>
>>
>>
>>
>>
>> +
>>
>>
>>
>>
>>
>> +RDEPENDS_${PN} +=3D "\
>>
>>
>>
>>
>>
>> +    ${PYTHON_PN}-sqlparse \
>>
>>
>>
>>
>>
>> +"
>>
>>
>>
>>
>>
>> --
>>
>>
>>
>>
>>
>> 2.26.2
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>=20
>>
>>
>>
>>
>>
>>
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
>
>

--0000000000007c5b8d05af11a727
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 11, 2020 at 2:40 PM Trevor Gamblin &lt;<a href=
=
=3D"mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><br><br><br>  <br><b=
r>  <div><br><br>    <p><br><br><br>    </p><br><br>    <div>On 9/11/20 5:0=
2 PM, Tim Orling wrote:<br><br><br>    </div><br><br>    <blockquote type=
=3D"cite"><br><br>      <br><br>      <div dir=3D"auto">The reason for Dja=
ngo 2.2 is it is LTS. This<br><br>        version will now override unless =
the user sets<br><br>        PREFERRED_VERSION. The thrash on non-LTS Djang=
o is a PITA to<br><br>        support...</div><br><br>    </blockquote><br>=
<br>    Alright, let&#39;s hold off on merging this one then. I&#39;ll revi=
sit it<br><br>    some time in the future.</div></blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">I=E2=80=99m not steadfastly against this, i=
t just cannot be the default. Prior experience has been a lot of pain. Ever=
y single YP/OE Django app we currently have is brittle with Django version,=
 although I believe David Reyna got Toaster to work with Django 3. The next=
 LTS will be Django 3.2, starting in April 2021.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I =C2=A0am open to other ideas, but the default mu=
st remain the current LTS version.</div><div dir=3D"auto"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto"></div><div><br><br><br>    <block=
quote type=3D"cite"><br><br>      <div><br><br><br>        <div class=3D"gm=
ail_quote"><br><br>          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, =
Sep 11, 2020 at 7:26<br><br>            AM Trevor Gamblin &lt;<a href=3D"ma=
ilto:trevor.gamblin@windriver.com" target=3D"_blank">trevor.gamblin@windriv=
er.com</a>&gt;<br><br>            wrote:<br><br><br>          </div><br><br=
>          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">meta-python<br><br>            on=
ly contains a recipe for django 2.2.x, so<br><br><br>            <br><br><b=
r>            add a recipe file for the newest branch.<br><br><br>         =
   <br><br><br>            <br><br><br>            <br><br><br>            =
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windrive=
r.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br><br><br>  =
          <br><br><br>            ---<br><br><br>            <br><br><br>  =
          =C2=A0.../recipes-devtools/python/<a href=3D"http://python3-djang=
o_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_3.1.1.bb</a=
>=C2=A0<br><br>            =C2=A0 =C2=A0 | 9 +++++++++<br><br><br>         =
   <br><br><br>            =C2=A01 file changed, 9 insertions(+)<br><br><br=
>            <br><br><br>            =C2=A0create mode 100644 meta-python/r=
ecipes-devtools/python/<a href=3D"http://python3-django_3.1.1.bb" rel=3D"no=
referrer" target=3D"_blank">python3-django_3.1.1.bb</a><br><br><br>        =
    <br><br><br>            <br><br><br>            <br><br><br>           =
 diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-django_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_3.1.1=
.bb</a><br><br>            b/meta-python/recipes-devtools/python/<a href=3D=
"http://python3-django_3.1.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-django_3.1.1.bb</a><br><br><br>            <br><br><br>            new f=
ile mode 100644<br><br><br>            <br><br><br>            index 000000=
000..b36cfb699<br><br><br>            <br><br><br>            --- /dev/null=
<br><br><br>            <br><br><br>            +++ b/meta-python/recipes-d=
evtools/python/<a href=3D"http://python3-django_3.1.1.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-django_3.1.1.bb</a><br><br><br>            <br>=
<br><br>            @@ -0,0 +1,9 @@<br><br><br>            <br><br><br>    =
        +require python-django.inc<br><br><br>            <br><br><br>     =
       +inherit setuptools3<br><br><br>            <br><br><br>            =
+<br><br><br>            <br><br><br>            +SRC_URI[md5sum] =3D &quot=
;d5e894fb3c46064e84e9dc68a08a46d0&quot;<br><br><br>            <br><br><br>=
            +SRC_URI[sha256sum] =3D<br><br>            &quot;59c8125ca873ed=
3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f&quot;<br><br><br>       =
     <br><br><br>            +<br><br><br>            <br><br><br>         =
   +RDEPENDS_${PN} +=3D &quot;\<br><br><br>            <br><br><br>        =
    +=C2=A0 =C2=A0 ${PYTHON_PN}-sqlparse \<br><br><br>            <br><br><=
br>            +&quot;<br><br><br>            <br><br><br>            -- <b=
r><br><br>            <br><br><br>            2.26.2<br><br><br>           =
 <br><br><br>            <br><br><br>            <br><br><br>            <b=
r><br><br>            <br><br><br>          </blockquote><br><br>        </=
div><br><br>      </div><br><br>    </blockquote><br><br>  </div><br><br><b=
r><br></blockquote></div></div>

--0000000000007c5b8d05af11a727--
