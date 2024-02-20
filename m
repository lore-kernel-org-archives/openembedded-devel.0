Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEABFC48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:57:21 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.6752.1708405041093384358
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b31vLXLk;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60866ce76dfso915757b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708405040; x=1709009840; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XLYm4mcqxQTfgwhRAIq5Fz+T8lJTtJEv70FkxEwMo90=;
        b=b31vLXLkcLh20f0aku8SIbKmcXhgZl/wxl065WhpzaOa9tgczz9R3AJmWe9e7F0Lva
         5bKfya0vMVQkBSlO5dfRGN73Wq4b9okpBopAsEDasrjp62Zje4G2/v2iArf1TRA5HlUn
         vNyoacMxACoOoyZCb4mpLa8SUqEbpfmwZaVkDjc2TbgGUi/a16Yu+CQmtwsA+C/AnqDx
         rxNGvHCpf8Py3A05H3iesvQvn1urr2vi8+iUfkQnEuNHoQDukOQS5ARwJul0i8zWjJ3D
         6CUR1EWLBAccoPNSKZF4XZ+CKzM64gMT1EoqgXRqw8qWN/gdisymp4h87VweF7XHqCN/
         u7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708405040; x=1709009840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLYm4mcqxQTfgwhRAIq5Fz+T8lJTtJEv70FkxEwMo90=;
        b=m9b4DNz3ARxiXijaACFA87lzooDXVIXD+6iFcGiItdjx3e5M0feY6Zom+8JuYj5ae0
         bfO+okQCqojb4qsVdpvUq4RrAXOHUYUO/+6m33sbCHBtoRcIpqZVPTZPwKQcHsQ/GYO3
         sEbXtffI2rDpsOT2G+w4sDs5nJ90b5r6/NdY3YHV0SRN7zFuLrrlWeTqJwkleGuIkNFX
         OFBRi1wueNaWwUMnA1V7lTg98KR5/H3hEWvcDAOw9iUonGQhtXwXbAwKYI8Vgi74cLkC
         WZUKcXnuSSo7ldZCn8lZv/+73gMLtkPmtz55GGinzKmrzyaG9LGfOR00AGfAqKNob5KG
         YLhA==
X-Gm-Message-State: AOJu0YxK6qDA8UgSL+EVmmCkjlWmTheBqw82MWbMQH4CXEaaHA/MOQIY
	L0DJxhWDnes6t/IS2XHS5L7Oxu01lt3v08SuClYUAQa+d+jqVqW8lwmGOOhRg2oX8vL+5/mBV8L
	ncRpHEasjaRHeJhfqGDlio9KxMrDJ26jYZKg=
X-Google-Smtp-Source: AGHT+IHwjgueLlxOCKRYmTDNaG9leTlpNUVPE00K9mi8lNryq/66AFIZKBIWvJQQzRbLz12HuAz63/lo1LmVth16iYc=
X-Received: by 2002:a81:8d04:0:b0:608:3cb0:4c97 with SMTP id
 d4-20020a818d04000000b006083cb04c97mr4559437ywg.21.1708405040113; Mon, 19 Feb
 2024 20:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20240219214801.1514843-1-derek@asterius.io> <20240219214801.1514843-5-derek@asterius.io>
In-Reply-To: <20240219214801.1514843-5-derek@asterius.io>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 19 Feb 2024 20:57:08 -0800
Message-ID: <CANx9H-DjUyDiQ7MZ5OK449YAt6jKb6fqsPU5PBP8HJ4ZmGbjKQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/8] python3-jdcal: re-add functional ptests
To: Derek Straka <derek@asterius.io>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008c6dd80611c90b13"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108911

--0000000000008c6dd80611c90b13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No ptest results, so this is still considered PTESTS_PROBLEMS_META_PYTHON
Can you check again?

2024-02-19 18:18:16 - INFO     - WARNING:
meta-python-image-ptest-python3-jdcal-1.0-r0 do_testimage: There were
failing ptests.
2024-02-19 18:18:16 - INFO     - Traceback (most recent call last):
2024-02-19 18:18:16 - INFO     - File
"/build/../poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in
wrapped_f
2024-02-19 18:18:16 - INFO     - return func(*args, **kwargs)
2024-02-19 18:18:16 - INFO     - File
"/build/../poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in
wrapped_f
2024-02-19 18:18:16 - INFO     - return func(*args, **kwargs)
2024-02-19 18:18:16 - INFO     - File
"/build/../poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in
wrapped_f
2024-02-19 18:18:16 - INFO     - return func(*args, **kwargs)
2024-02-19 18:18:16 - INFO     - File
"/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in
test_ptestrunner_expectfail
2024-02-19 18:18:16 - INFO     - self.do_ptestrunner()
2024-02-19 18:18:16 - INFO     - File
"/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
2024-02-19 18:18:16 - INFO     - self.fail(failmsg)
2024-02-19 18:18:16 - INFO     - AssertionError:
2024-02-19 18:18:16 - INFO     - ptests which had no test results:
2024-02-19 18:18:16 - INFO     - ['python3-jdcal']

On Mon, Feb 19, 2024 at 1:48=E2=80=AFPM Derek Straka <derek@asterius.io> wr=
ote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index ea6284264..7fa96a495 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-intervals \
>      python3-ipy \
>      python3-iso3166 \
> +    python3-jdcal \
>      python3-jsmin \
>      python3-msgpack \
>      python3-multidict \
> @@ -75,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON =3D"\
>      python3-gpiod \
>      python3-gunicorn \
>      python3-inotify \
> -    python3-jdcal \
>      python3-license-expression \
>      python3-ordered-set \
>      python3-pillow \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108890):
> https://lists.openembedded.org/g/openembedded-devel/message/108890
> Mute This Topic: https://lists.openembedded.org/mt/104456247/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008c6dd80611c90b13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No ptest results, so this is still considered PTESTS_=
PROBLEMS_META_PYTHON</div><div>Can you check again?</div><div><br></div>202=
4-02-19 18:18:16 - INFO =C2=A0 =C2=A0 - WARNING: meta-python-image-ptest-py=
thon3-jdcal-1.0-r0 do_testimage: There were failing ptests.<br>2024-02-19 1=
8:18:16 - INFO =C2=A0 =C2=A0 - Traceback (most recent call last):<br>2024-0=
2-19 18:18:16 - INFO =C2=A0 =C2=A0 - File &quot;/build/../poky/meta/lib/oeq=
a/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>2024-02-19 18:=
18:16 - INFO =C2=A0 =C2=A0 - return func(*args, **kwargs)<br>2024-02-19 18:=
18:16 - INFO =C2=A0 =C2=A0 - File &quot;/build/../poky/meta/lib/oeqa/core/d=
ecorator/__init__.py&quot;, line 35, in wrapped_f<br>2024-02-19 18:18:16 - =
INFO =C2=A0 =C2=A0 - return func(*args, **kwargs)<br>2024-02-19 18:18:16 - =
INFO =C2=A0 =C2=A0 - File &quot;/build/../poky/meta/lib/oeqa/core/decorator=
/__init__.py&quot;, line 35, in wrapped_f<br>2024-02-19 18:18:16 - INFO =C2=
=A0 =C2=A0 - return func(*args, **kwargs)<br>2024-02-19 18:18:16 - INFO =C2=
=A0 =C2=A0 - File &quot;/poky/meta/lib/oeqa/runtime/cases/ptest.py&quot;, l=
ine 27, in test_ptestrunner_expectfail<br>2024-02-19 18:18:16 - INFO =C2=A0=
 =C2=A0 - self.do_ptestrunner()<br>2024-02-19 18:18:16 - INFO =C2=A0 =C2=A0=
 - File &quot;/poky/meta/lib/oeqa/runtime/cases/ptest.py&quot;, line 120, i=
n do_ptestrunner<br>2024-02-19 18:18:16 - INFO =C2=A0 =C2=A0 - self.fail(fa=
ilmsg)<br>2024-02-19 18:18:16 - INFO =C2=A0 =C2=A0 - AssertionError:<br>202=
4-02-19 18:18:16 - INFO =C2=A0 =C2=A0 - ptests which had no test results:<b=
r>2024-02-19 18:18:16 - INFO =C2=A0 =C2=A0 - [&#39;python3-jdcal&#39;]<br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Feb 19, 2024 at 1:48=E2=80=AFPM Derek Straka &lt;<a href=3D"mailto:d=
erek@asterius.io">derek@asterius.io</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Signed-off-by: Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;<b=
r>
---<br>
=C2=A0meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index ea6284264..7fa96a495 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -23,6 +23,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-intervals \<br>
=C2=A0 =C2=A0 =C2=A0python3-ipy \<br>
=C2=A0 =C2=A0 =C2=A0python3-iso3166 \<br>
+=C2=A0 =C2=A0 python3-jdcal \<br>
=C2=A0 =C2=A0 =C2=A0python3-jsmin \<br>
=C2=A0 =C2=A0 =C2=A0python3-msgpack \<br>
=C2=A0 =C2=A0 =C2=A0python3-multidict \<br>
@@ -75,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON =3D&quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-gpiod \<br>
=C2=A0 =C2=A0 =C2=A0python3-gunicorn \<br>
=C2=A0 =C2=A0 =C2=A0python3-inotify \<br>
-=C2=A0 =C2=A0 python3-jdcal \<br>
=C2=A0 =C2=A0 =C2=A0python3-license-expression \<br>
=C2=A0 =C2=A0 =C2=A0python3-ordered-set \<br>
=C2=A0 =C2=A0 =C2=A0python3-pillow \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108890" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108890</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104456247/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104456247/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008c6dd80611c90b13--

