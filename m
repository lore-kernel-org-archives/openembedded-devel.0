Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B50D339AC
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 18:10:12 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5.1764958202209837305
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 10:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j3lHV6E7;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-789524e6719so35281337b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764958201; x=1765563001; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cHbpnBiMcJcSiQPsEcz6ctpOHPzHeF2rKLQBlW5PycQ=;
        b=j3lHV6E7xnmHhuSLFhXL+ONwqY+FEhrzxsUIkF/dk1boEeddSLHWlflNmqKUY9W6X2
         Z4/fwKVOi/T++Q4tkPjb4fX2OhGRpJG8CW4Y+J6upR9/EVz0ndMKu6s2TaZb4Nhpk2kk
         pkYHJh+ucYGO03ISa2XBHhrVy8NCXYXZ1P1PwwrlojoqWu4CUCWVZdk01+Tj3pJ3d5qe
         pRUDSpJEc3BrYO1uNg2W8BqkCwzEwYmp4mFlj1P8FmewIn/Q2P0u6oJE0LDvYiKCcNqa
         p/7ZNC3BWJsEZTd8pFtjtKZjjFxDDOXfMJaQjoDOGJQQmAVREgq/70+0U/ornsRuFwW0
         x/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764958201; x=1765563001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHbpnBiMcJcSiQPsEcz6ctpOHPzHeF2rKLQBlW5PycQ=;
        b=htEfJk6oXIhFCkl7MK5T9BQqRsGhAMF2VLgVX1URVbtqY2CfyMrJZfY25XDrQPxMCk
         54rvEqiSc/46t46hNKeoozLrsYTTOL5DF1bTAw0sSA95b7O0j+Lb+jdDRzHhU/u11zd2
         mazJ91gK8iZkXmEmO2n5D3bHLexqS0eg5Cd7QYPwat6MsR7xMeCB9D0MunDYjLAvm1XU
         VwVwo4qu0qfvLEnke62KYCqbAf/c1uyElKFU9JffRCfLdTjC0lzqjZCWzJhA1hurGCKt
         vcgdIUIDlC12fSPJFtL4ECxqvjIx7aLx+fahlYP325Rns03iQcstpzRbqoIV8fCjy6N3
         eqfg==
X-Gm-Message-State: AOJu0YwIr6nQ94DhzZQp8sBj1sk94aesjuGsLbAtOnLSEj9orJxFH5z0
	SU9ZGOPd7sJjBvFonRT3jqr01DtjKSwXI0v5t/3erPI4oLj4Cfymty58jYSMBd2gxRTryZDSS5x
	UrTm8fMxLCdKaHIwKHufJI1ZhqvjcnNqJr9rr
X-Gm-Gg: ASbGncsWKnRQ9BBdPbrKHB/Mq4fXK4RqE+wcnxzAkbWSKvMJ7U+BYPg6PARKf2YZYoc
	VT+AKR49k7uX1xUF836jvsReD2EzKaPMx9kU9W4aXISCIZSq/D2lj+gUz73uRqz3oYq87l+edWB
	f4PrIRu8jUIcQTpTcPz6NqcOaogPNc3TESeg3vHhiX9qD/jZGHd6bE+SBaOukkk5Be3aoZN899w
	IMa6WY8Y3kMXE8NvG44TiCgnsTJT0cTCdyksRgmEy3lUp0Dxkdgyyv9M4AGH3hJ0X5OuUgRJOZB
	byJFf3FjgKKrpd8va4/mFf3dM2nIFI6srMuOhgENqH6yB+iyfvU/evkuDl3TgN9wRHHbu8xYb1X
	y7Jwu98zGDmyGKcGEvadIuFtdqn7ldXgSQqpUsolswmxw7g==
X-Google-Smtp-Source: AGHT+IGPnlUrhbxHoZmAy5ff6sfjr/doLSJKaCR5do7ysN5ug82uxwVZ3GIgmdPFIT3Ahp0bj300p44o4gwdBgk4IbU=
X-Received: by 2002:a05:690c:d95:b0:78c:3347:8968 with SMTP id
 00721157ae682-78c3347bc71mr2043597b3.19.1764958201222; Fri, 05 Dec 2025
 10:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20251204102556.1702492-1-leon.anavi@konsulko.com>
 <20251204102556.1702492-2-leon.anavi@konsulko.com> <CAMKF1spvg6nB_qZAG17ZbJnn=v-MswWeLTXvz-8Ab-kkqSt=MQ@mail.gmail.com>
 <80b703f2-5da1-46d0-8324-0dc9d72f450b@konsulko.com>
In-Reply-To: <80b703f2-5da1-46d0-8324-0dc9d72f450b@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Dec 2025 10:09:35 -0800
X-Gm-Features: AWmQ_bkftSXz4PwVkgokjCr14PKodLx7o8pQrjFFbopbLjKJp7JllftaeAtcDKk
Message-ID: <CAMKF1spNQ6Oech2DdohCbbM0vGSmYAOOur78Y6JKvoxeGTAgnQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-autobahn: Upgrade 24.4.2 -> 25.11.1
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a0a5a20645385a11"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 18:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122357

--000000000000a0a5a20645385a11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 5, 2025 at 12:46=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com=
> wrote:

> Hi Khem,
> On 12/5/25 00:18, Khem Raj wrote:
>
> I am seeing
>
> stdio: WARNING: python3-autobahn-25.11.1-r0 do_check_backend: QA Issue:
> inherits setuptools3 but has pyproject.toml with setuptools.build_meta, u=
se
> the correct class [pep517-backend]
>
> While at it, Would you address this as well please?
>
>
> Yes, of course. Sorry, I didn't notice the warning at first. I have just
> sent v2 of the patch.
>
>
Thank you.


> Btw thank you for your presentation at the Yocto Virtual Summit 2025.12
> yesterday and for sharing your insights and perspectives during the
> informal discussions afterward. I really enjoyed it.
>
>
Thank you again :)


> Best regards,
> Leon
>
>
> On Thu, Dec 4, 2025 at 2:26=E2=80=AFAM Leon Anavi via lists.openembedded.=
org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
>> Upgrade to release 25.11.1:
>>
>> - WAMP Flatbuffers serialization test coverage; WAMP message
>>   classes refactoring
>> - Add WAMP serdes functional and benchmark testing;
>>   WAMP-Flatbuffers; WAMP Serializer Composition (transport/payload)
>> - Add vendored Flatbuffers
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  .../{python3-autobahn_24.4.2.bb =3D> python3-autobahn_25.11.1.bb} | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-python/recipes-devtools/python/{python3-autobahn_24.4.2.bb
>> =3D> python3-autobahn_25.11.1.bb} (84%)
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-autobahn_24.4.2.bb b/meta-python/recipes-devtools/python/
>> python3-autobahn_25.11.1.bb
>> similarity index 84%
>> rename from meta-python/recipes-devtools/python/
>> python3-autobahn_24.4.2.bb
>> rename to meta-python/recipes-devtools/python/python3-autobahn_25.11.1.b=
b
>> index d785a76cc7..69613313d7 100644
>> --- a/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
>> +++ b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://crossbar.io/autobahn"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D588502cb4ffc65da2b26780d6baa=
5a40"
>>
>> -SRC_URI[sha256sum] =3D
>> "a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9"
>> +SRC_URI[sha256sum] =3D
>> "52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1"
>>
>>  inherit pypi setuptools3
>>
>> --
>> 2.47.3
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#122316):
>> https://lists.openembedded.org/g/openembedded-devel/message/122316
>> Mute This Topic: https://lists.openembedded.org/mt/116609979/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000a0a5a20645385a11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 5, =
2025 at 12:46=E2=80=AFAM Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsul=
ko.com">leon.anavi@konsulko.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <p>Hi Khem,</p>
    <div>On 12/5/25 00:18, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">I am seeing
        <div><br>
        </div>
        <div>stdio: WARNING: python3-autobahn-25.11.1-r0
          do_check_backend: QA Issue: inherits setuptools3 but has
          pyproject.toml with setuptools.build_meta, use the correct
          class [pep517-backend]<br>
        </div>
        <div><br>
        </div>
        <div>While at it, Would you address this as well please?</div>
      </div>
    </blockquote>
    <br>
    Yes, of course. Sorry, I didn&#39;t notice the warning at first. I have
    just sent v2 of the patch.<br>
    <br></div></blockquote><div><br></div><div>Thank you.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    Btw thank you for your presentation at the Yocto Virtual Summit
    2025.12 yesterday and for sharing your insights and perspectives
    during the informal discussions afterward. I really enjoyed it.<br>
    <br></div></blockquote><div><br></div><div>Thank you again :)</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>
    Best regards,<br>
    Leon<br>
    <br>
    <blockquote type=3D"cite"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 4, 2025 at 2:26=
=E2=80=AFAM
          Leon Anavi via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a>
          &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedde=
d.org" target=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade
          to release 25.11.1:<br>
          <br>
          - WAMP Flatbuffers serialization test coverage; WAMP message<br>
          =C2=A0 classes refactoring<br>
          - Add WAMP serdes functional and benchmark testing;<br>
          =C2=A0 WAMP-Flatbuffers; WAMP Serializer Composition
          (transport/payload)<br>
          - Add vendored Flatbuffers<br>
          <br>
          Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsul=
ko.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
          ---<br>
          =C2=A0.../{<a href=3D"http://python3-autobahn_24.4.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-autobahn_24.4.2.bb</a>
          =3D&gt; <a href=3D"http://python3-autobahn_25.11.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-autobahn_25.11.1.bb</a>}
          | 2 +-<br>
          =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
          =C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http=
://python3-autobahn_24.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-autobahn_24.4.2.bb</a>
          =3D&gt; <a href=3D"http://python3-autobahn_25.11.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-autobahn_25.11.1.bb</a>}
          (84%)<br>
          <br>
          diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-autobahn_24.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
autobahn_24.4.2.bb</a>
          b/meta-python/recipes-devtools/python/<a href=3D"http://python3-a=
utobahn_25.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobahn_2=
5.11.1.bb</a><br>
          similarity index 84%<br>
          rename from meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-autobahn_24.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-a=
utobahn_24.4.2.bb</a><br>
          rename to meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-autobahn_25.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-au=
tobahn_25.11.1.bb</a><br>
          index d785a76cc7..69613313d7 100644<br>
          --- a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-autobahn_24.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobah=
n_24.4.2.bb</a><br>
          +++ b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-autobahn_25.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-autoba=
hn_25.11.1.bb</a><br>
          @@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://crossbar.io/=
autobahn" rel=3D"noreferrer" target=3D"_blank">http://crossbar.io/autobahn<=
/a>&quot;<br>
          =C2=A0LICENSE =3D &quot;MIT&quot;<br>
          =C2=A0LIC_FILES_CHKSUM =3D
          <a>&quot;file://LICENSE;md5=3D588502cb4ffc65da2b26780d6baa5a40&qu=
ot;</a><br>
          <br>
          -SRC_URI[sha256sum] =3D
          &quot;a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642e=
e92c9&quot;<br>
          +SRC_URI[sha256sum] =3D
          &quot;52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f=
73cf1&quot;<br>
          <br>
          =C2=A0inherit pypi setuptools3<br>
          <br>
          -- <br>
          2.47.3<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#122316): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-devel/message/122316" rel=3D"noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-devel/message/122316</a>=
<br>
          Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116=
609979/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/116609979/1997914</a><br>
          Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
          Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a>
          [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--000000000000a0a5a20645385a11--

