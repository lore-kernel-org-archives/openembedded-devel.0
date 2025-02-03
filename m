Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1D3C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 19:47:12 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.97751.1738612022698898516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 11:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FtUN6exI;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-303548a933aso41409251fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 11:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738612021; x=1739216821; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jxrygVvoMDa/a3536xUaB5i9WsaESu5ALlXoQR49Eq4=;
        b=FtUN6exIM7+SGy9uryFSwnrddFI6O0q7Y5h2qt+d2YfHvle8hpeS7PmUNL2H/iJGgb
         Ue04UR+dYAiP68DDhq9pE5N9jKXUAFaprQ6WOHgD9Vf6lNdtqSgF+XnoJjHxBjsYvssP
         tytbj+a1E7qWP2uR8DvT0X3+YUrTW0pSJxWu9TNGKmDNgzr3D9QTtu4d1CAl9UJHYrP9
         7FTqIkUPdBjcx/rYzLGkYYKE+GjiIMxLg98C2wOD9B7e1qBoRDpj6EH0U6FExvLqw798
         KY+U8R2gcWH5bu6eGD8GezCmh/dvu/B+KTRAOiFW98aCcT0o4kYP1HmY7sYDsFikRx72
         LELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738612021; x=1739216821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxrygVvoMDa/a3536xUaB5i9WsaESu5ALlXoQR49Eq4=;
        b=qMjdcTA+1uVQJJeCq/b9zEor+G0MRjUSgDAGxT69s6xJ9t+fVT/80A9qM+xjU8xWqb
         pde9tac3CNt4O+3hZhW4oGvVJpNyp335tTlBcnukv+Q1fl8laTdaHonX4o6mUrKsmeua
         597aqXak4IZnGpX55LOhqG6HiLjrH+bhdKCtPKp6Itk+YRvadmLQVjw5TYn+UxB6f2LV
         kFgShTakkGbaxDqkLKIAq7860GxjYRqMzg3xp359+lDIHR/+RBpgFej0m5KcetIW9hWj
         tSBMOV+QKw6itJK3drNW1pJ/6euEvLzthFQHUJexWPAO7rbTFlkMIhYjSCI6Qdwf7q++
         ocMw==
X-Gm-Message-State: AOJu0YwjcCNMXjjpLYbC3s0Zl+f6gKpSqmBgpxI6RUFEcIUe1pT4J5n9
	V+ikW7GQz0ii6uSUdb1NX8YLVOKvtcDawH6xxxpYdG7qV+OzsrcWi2xJwT3VtBDZC/gPx0kXco+
	rgdxt+Wigz9usKro7ByIHRGoOQ2g=
X-Gm-Gg: ASbGncuqMCiKXVGJl7peqv4AZxDc14WOwd+ZhWqiUaXKgmwmNvhcmK5/lnr2hJKWeHh
	mxXtXVvQKqFWUXWrvQOfGuJd0XGmIWMGxT3fRi3HKHFldmEnigmL1dMzUfhxSihsEt+W6gMlTaB
	BnzEbLm0XUK/5G4GHtQcUympskXPsFJw==
X-Google-Smtp-Source: AGHT+IHWM9QhmAyDsoaJWmsUwI992lxDYddoslM3fwnA1mH6BgbiaVQruB7cFeDCFf4NiU7I+xHjicAWxYXVrpimA1o=
X-Received: by 2002:a2e:b889:0:b0:300:3307:389d with SMTP id
 38308e7fff4ca-30796856d8bmr77591501fa.19.1738612020350; Mon, 03 Feb 2025
 11:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <20250203182210.574300-1-peter.marko@siemens.com> <20250203182210.574300-7-peter.marko@siemens.com>
In-Reply-To: <20250203182210.574300-7-peter.marko@siemens.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 3 Feb 2025 11:46:48 -0800
X-Gm-Features: AWEUYZmqHSg-ekjd2u1TPr0coGVZbzocndWQnbyRWQnbSBthgDwj6mdyhlliT5M
Message-ID: <CANx9H-Bu6-zUepwWm7jrT8-ZTbbufYPuNhtGbLj8JbmR15H9EQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 7/9] python3-protobuf: add MIT to license
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e017d4062d4227c5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 19:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115255

--000000000000e017d4062d4227c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 10:23=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> utf_range is MIT licensed.
> Although the LICENSE file is not distributed in python protobuf,
> this can be read in c++ protobuf recipe where all files are present.


Shouldn=E2=80=99t we include a beginline/end line clause for at least one s=
ource
file? Otherwise only this commit log explains why MIT is present. We want
traceability fir our future forgetful selves.

>
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../recipes-devtools/python/python3-protobuf_4.25.3.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/
> python3-protobuf_4.25.3.bb
> index b92f91b714..fb95340f7b 100644
> --- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
> @@ -1,8 +1,8 @@
>  DESCRIPTION =3D "Protocol Buffers"
>  HOMEPAGE =3D "https://developers.google.com/protocol-buffers/"
>  SECTION =3D "devel/python"
> -
> -LICENSE =3D "BSD-3-Clause"
> +# MIT license is from utf8_range
> +LICENSE =3D "BSD-3-Clause & MIT"
>  LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D53dbfa56f61b90215a9f8f0d=
527c043d"
>
>  inherit pypi setuptools3
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115251):
> https://lists.openembedded.org/g/openembedded-devel/message/115251
> Mute This Topic: https://lists.openembedded.org/mt/110976773/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e017d4062d4227c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 3, 2025 at 10:23=E2=80=AFAM=
 Peter Marko via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedd=
ed.org">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
utf_range is MIT licensed.<br>
Although the LICENSE file is not distributed in python protobuf,<br>
this can be read in c++ protobuf recipe where all files are present.</block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto">Shouldn=E2=80=99t we in=
clude a beginline/end line clause for at least one source file? Otherwise o=
nly this commit log explains why MIT is present. We want traceability fir o=
ur future forgetful selves.</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-protobuf_4.25.3=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4.25.3.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
protobuf_4.25.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4=
.25.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-protobuf_4.25.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf=
_4.25.3.bb</a><br>
index b92f91b714..fb95340f7b 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-protobu=
f_4.25.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4.25.3.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-protobu=
f_4.25.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_4.25.3.b=
b</a><br>
@@ -1,8 +1,8 @@<br>
=C2=A0DESCRIPTION =3D &quot;Protocol Buffers&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://developers.google.com/protocol-=
buffers/" rel=3D"noreferrer" target=3D"_blank">https://developers.google.co=
m/protocol-buffers/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
-<br>
-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+# MIT license is from utf8_range<br>
+LICENSE =3D &quot;BSD-3-Clause &amp; MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D8;endline=3D8;=
md5=3D53dbfa56f61b90215a9f8f0d527c043d&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115251): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115251" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115251</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110976773/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/110976773/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e017d4062d4227c5--

