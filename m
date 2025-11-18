Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0F2CEE347
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 17:54:50 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3202.1763488480963990945
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 09:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=na/ez8jH;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64107188baeso5286077d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763488480; x=1764093280; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nolHInTHJS3IzqeZ1nMfROYjQh7eueGqg9LETKcgKgs=;
        b=na/ez8jHqARLqQ6XIrLq6K5tqcloV+Z6g1MjjPQar2kJla87rJBNAPfJgerlevAyF8
         6SdFXDnKzhsQqxHmTjrQSPNfUY8VDb6Kc0tztwN1VX4rZFE2At70oYdnydjfrcob/eJ1
         CHRUzbKKlHJBn1XAPEvU+DPSvZErpNLKipeg1Cmp9yo/zDkDiwIvWwZ5VJwTHhgsuCVd
         iRrGoo1wmBe78Fnuc80CkAmekrFQbz9wk6wsYMSu+23jexttQvp406qFpJZhr/PfhshR
         hbRofdOqF6FKkC42zYXnbpFwmUL9+cq0n0pQSTjtLXE5tIBKUl5HQuEO/2Afe1VOgN+f
         TYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488480; x=1764093280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nolHInTHJS3IzqeZ1nMfROYjQh7eueGqg9LETKcgKgs=;
        b=AX42NJ3Z+uOgwR1QXpATudHcw2BzirExepcUx6GrdynVjQjY7+wNiMmLh5YrGepWNh
         R8/A0kSGWCsu/he+4fZj5He6XKzSs0XASw1P0UfWaWjX6GNHDHqOErH/lKajEckSHfn+
         CDThDrMzjHjRsVexZy6qEXo/TSihxu5DdC6jcvm3Saqs7IKIouAWzwXJIrPyz88DpcUe
         xAHOvZn6bcazQiLSSX9eHINSzyspUHHzTx3QXiZmUy4Upb/4SKRWCCr2GWF8RVGIMd1M
         UEG151IUhFYIQCG+irY/ArRdeGyYfvT53PyB+82o9FeJEohdI6Ush3RHBmTgPzJFlfuZ
         VIkg==
X-Gm-Message-State: AOJu0YzWw3M28wPG02TU7Zj4oj1ed33vIAlVpVXFfgPizVd6/6No7i+N
	FtUZtYRbiJdYLse3RGAlfZheedz/1BEWTqQYbL+Kh1rfntCQ6xopEOUzIQ7jqXpbhjrfCcVZDhQ
	4+5DaLgLYgDW79lrC4ta/YDLwU4GO65c=
X-Gm-Gg: ASbGncshILQek2GPpY1hGC6HEpIlYdUG6YDrhG7odslGgIu5JY01De8rCIWM02DDaKK
	SA6TPCozqva7wK8FKlU+3LuCZShGs6Bzcr4r1hPUmOzK0hlFcsmer44x8yvvIM+Y6q+tubv/FCS
	tD6zGnrDq0Cy+5N199G248IZSJEkSA1z3+H76uZO5E6z6rgqXBguk7tkdp/zcIUuxIX3hiBYPMk
	hrjwxfApFmzWdM7wk8V0W6ASeHw18gIrdu9aETMyT1IDCr9/HmVQXX4xND857/++9sM+KevD02L
	Etrp3oY1+G1veq7o9z6uEKCsjFJTnOXJiJxFYoEK5VEC1apj36qUu8LXahKFgMYCO/jsXf5AqvK
	uYMloMPBhpLs+9LU5GWm5og==
X-Google-Smtp-Source: AGHT+IHQlQZnfCP6SLol6Z7J0+Nw7ABGnHrGtKK+chVhrASQFTIRQbYKeTm61fGEjJpv3IUVIqpUVuxyOW6XSNq8ReY=
X-Received: by 2002:a05:690e:d4a:b0:63e:1f47:f504 with SMTP id
 956f58d0204a3-641e766148fmr12664715d50.50.1763488480103; Tue, 18 Nov 2025
 09:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20251118072435.4104724-1-raj.khem@gmail.com> <CA+s=J=wZrf7piDmBqHSmbADPj3XwiStbyP78EXqLo_efh=wt3g@mail.gmail.com>
In-Reply-To: <CA+s=J=wZrf7piDmBqHSmbADPj3XwiStbyP78EXqLo_efh=wt3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Nov 2025 09:54:13 -0800
X-Gm-Features: AWmQ_bmbTwrr1wAwpTsJ3_rqtPjlTuMBVjQluwZjZVghtyTuSWKmgxvU6Zqb_bU
Message-ID: <CAMKF1srnQUXWJELZQnQhhgD8f+SxyF4rsJkF7SnMGDi4-uE8Sw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python3-python-dotenv: Add missing
 rdep on click module and coreutils
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006c0fa30643e22884"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 17:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121867

--0000000000006c0fa30643e22884
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 12:09=E2=80=AFAM Anuj Mittal <anuj.mittal@oss.qualc=
omm.com>
wrote:

>
>
> On Tue, Nov 18, 2025 at 3:24=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Needed for ptests to pass
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v2: Add coreutils dep for printenv utility used in ptests
>>
>>  .../recipes-devtools/python/python3-python-dotenv_1.2.1.bb    | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/
>> python3-python-dotenv_1.2.1.bb
>> index 58784fcf2e..a63bd7ae28 100644
>> --- a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
>> @@ -11,12 +11,14 @@ SRC_URI +=3D
>> "file://0001-test_main.py-skip-two-test-when-running-as-root.patch"
>>  inherit pypi python_setuptools_build_meta ptest-python-pytest
>>
>>  # Uncomment this line to enable all the optional features.
>> -#PACKAGECONFIG ?=3D "cli"
>> +PACKAGECONFIG ?=3D ""
>> +PACKAGECONFIG:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptes=
t',
>> ' cli', '', d)}"
>>
>
> Should this use PTEST_ENABLED instead in case there's a native version of
> this recipe in future?
>

yes, that is a better check

--0000000000006c0fa30643e22884
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 18,=
 2025 at 12:09=E2=80=AFAM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss=
.qualcomm.com">anuj.mittal@oss.qualcomm.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr=
"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Nov 18, 2025 at 3:24=E2=80=AFPM Khem Raj via <a href=3D"http:=
//lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;=
raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_b=
lank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Needed for ptests to pass<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Add coreutils dep for printenv utility used in ptests<br>
<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-python-dotenv_1=
.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv_1.2.1.b=
b</a>=C2=A0 =C2=A0 | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
python-dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python=
-dotenv_1.2.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-python-dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-python-dotenv_1.2.1.bb</a><br>
index 58784fcf2e..a63bd7ae28 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-python-=
dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv=
_1.2.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-python-=
dotenv_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-python-dotenv=
_1.2.1.bb</a><br>
@@ -11,12 +11,14 @@ SRC_URI +=3D &quot;file://0001-test_main.py-skip-two-te=
st-when-running-as-root.patch&quot;<br>
=C2=A0inherit pypi python_setuptools_build_meta ptest-python-pytest<br>
<br>
=C2=A0# Uncomment this line to enable all the optional features.<br>
-#PACKAGECONFIG ?=3D &quot;cli&quot;<br>
+PACKAGECONFIG ?=3D &quot;&quot;<br>
+PACKAGECONFIG:append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;ptest&#39;, &#39; cli&#39;, &#39;&#39;, d)}&quot;<br></blockquote=
><div><br></div><div>Should this use PTEST_ENABLED instead in case there&#3=
9;s a native version of this recipe in future?</div></div></div></blockquot=
e><div><br></div><div>yes, that is a better check=C2=A0=C2=A0</div></div></=
div>

--0000000000006c0fa30643e22884--

