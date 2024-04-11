Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0877C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 23:38:49 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.34947.1712878725509250257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 16:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZvUcOiVD;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6164d7a02d2so3164607b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 16:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712878724; x=1713483524; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Djb4KqbVPkhQeA5xbDUlpfZCr859u0J4C4tyfkESUxI=;
        b=ZvUcOiVDJJ/Jru0hq7XMyLOFP9YnK7zTrSVXdIBzE106ywt5/dzBt1mnKpkH6DNgA5
         E9/SlS7tEqelDMP5sxU6AEqH/P/1qZm+Gs/qLivZMbSL/Dwr3aHhamZQaA9f8MIX6Vxx
         /6aCajhHwLbvsznBXYocPsYfmAhpBKn8LrdXgo47gXq5EHXdPo3Jbc4+CWmow0C6nVPd
         nNfPxnQErMOHSjZ4ssiaqrHs3mRX2qNX56JuFvCiZGHNrhxVA7Z8xZIva3y1JD2Los9X
         nLrk5wm9kwqKqLKo5Uteo8bMMnRWYB7S6ZZ0VJFO0ZPELc8J0Ehv7f1GdXAkqM0BGIpl
         lvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712878724; x=1713483524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djb4KqbVPkhQeA5xbDUlpfZCr859u0J4C4tyfkESUxI=;
        b=da5GSjOLTd0X1KNGS9M84vlocLKDhYQBZk1D3tX8AwbcAgMUDb/C5Ho09x2jIWgg44
         ZgmOB+3B09MyZxfCBBDeMIvuiQp8h619M20Pkx1sh4af4kpMN6NzJzWo6u7MCg5C1US+
         IS5lHzVxCmBPJFYCKj/46+vH1a4FwEc9wqMAkqgJemxnNnRlCbEd2RgRd0i/EqiDD6vo
         Q9ntZ6976P5GBkZOAzCTfkOWN7hxk9oAHZcYANpsq8aHjrFj4eGVRgL9POUW4MEf4xoq
         Xex7XvzzTBW2GF5hsLgoUBgg4y8J8w8ZQsxNeLR4rY4TBy47hacEVePZNjqXjnplOc8W
         w8zA==
X-Forwarded-Encrypted: i=1; AJvYcCWMTJ8N0qAzTMo9eT0o7/Cx9LXKcSrgEs7hscUH/ZGPVU1/fSw9jVqMKkjyo+XqKb+DnR2OAfVOUdcfCLbWz2GJ8ttIZFw2GPGW12PnLNPxoKOm6gDWa485gQ==
X-Gm-Message-State: AOJu0YyRekEAufeK4pjXnUikhQ6E1NxyLYereWN0KhcgzLmJvQ4EXa0f
	c7KMQ3C6q48DIRiWTATJchUZf77UhMz0B8SZdcivJTcYSSkYLksj/9ntcDhcSryYS8/KYwFrfyX
	alDz5i8Rpoc8K+6hITJKWDzjkJxhBFA==
X-Google-Smtp-Source: AGHT+IF3N6zpjfxxdTe00baVV21x3+T/lXpShEEEeaB81cdqn6HS7l3GAEUyCCGGZeJSTuTwflW1bBCEWAjVv4EjINo=
X-Received: by 2002:a05:6902:3c8:b0:dcf:30dc:127c with SMTP id
 g8-20020a05690203c800b00dcf30dc127cmr940824ybs.18.1712878724591; Thu, 11 Apr
 2024 16:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240411192456.2974073-1-geoffrey.parker@arthrex.com> <20240411192456.2974073-2-geoffrey.parker@arthrex.com>
In-Reply-To: <20240411192456.2974073-2-geoffrey.parker@arthrex.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 11 Apr 2024 16:38:33 -0700
Message-ID: <CANx9H-CyW7d0QPWDeFubU=XOXJ0ca5KZxF1pe=y+88MVEZX6VA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pycurl: extend for native
 and nativesdk
To: Geoff Parker <geoffhp@gmail.com>
Cc: Geoff Parker <geoffrey.parker@arthrex.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec39370615daa759"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 23:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109930

--000000000000ec39370615daa759
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Same as the other in the series. We need confirmation that you have
personally built both conditions and all dependencies were met.

I apologize for being pedantic, but we must have traceability to these
changes.

On Thu, Apr 11, 2024 at 12:33=E2=80=AFPM Geoff Parker <geoffhp@gmail.com> w=
rote:

> From: Geoff Parker <geoffrey.parker@arthrex.com>
>
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>  meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> index fb2a41d26..a6863e21f 100644
> --- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> @@ -17,3 +17,5 @@ SRC_URI[sha256sum] =3D
> "5730590be0271364a5bddd9e245c9cc0fb710c4cbacbdd95264a3122d2
>  DEPENDS =3D "curl"
>
>  inherit pypi setuptools3
> +
> +BBCLASSEXTEND  +=3D "native nativesdk"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109925):
> https://lists.openembedded.org/g/openembedded-devel/message/109925
> Mute This Topic: https://lists.openembedded.org/mt/105470005/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ec39370615daa759
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Same as the other in the series. We need confirmation tha=
t you have personally built both conditions and all dependencies were met.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I apologize for being pe=
dantic, but we must have traceability to these changes.</div><div dir=3D"au=
to"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Apr 11, 2024 at 12:33=E2=80=AFPM Geoff Parker &lt;<a hre=
f=3D"mailto:geoffhp@gmail.com">geoffhp@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">From: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@art=
hrex.com" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
<br>
Signed-off-by: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@arthrex.c=
om" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-pycurl_=
7.45.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycurl_7.45.2.bb</a=
> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pycurl_7.45.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycurl_7.45.=
2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-py=
curl_7.45.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycurl_7.45.2.=
bb</a><br>
index fb2a41d26..a6863e21f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pycurl_=
7.45.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycurl_7.45.2.bb</a=
><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pycurl_=
7.45.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycurl_7.45.2.bb</a=
><br>
@@ -17,3 +17,5 @@ SRC_URI[sha256sum] =3D &quot;5730590be0271364a5bddd9e245c=
9cc0fb710c4cbacbdd95264a3122d2<br>
=C2=A0DEPENDS =3D &quot;curl&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
+<br>
+BBCLASSEXTEND=C2=A0 +=3D &quot;native nativesdk&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109925): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109925" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109925</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105470005/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105470005/924729</a><br>
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

--000000000000ec39370615daa759--

