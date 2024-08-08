Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7E7C52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 13:01:17 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.59265.1723122075611101516
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 06:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYlKp0pg;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-66108213e88so9078907b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723122075; x=1723726875; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WQfPjgGwQyx0qpg/eMyY+G94ywbJKQrqsZkoH118rno=;
        b=dYlKp0pgXgWlqH+r9pfd6tjZOvd+KuqGgy4yJH7yBo9CFS7rdYc6UvufjaQJpDSLOI
         kdnlJCsgjaUEXadJ70tQVyuVnJG/o4Fo3Jg7iWagN0Mify5YYUTklIFfK23XKythXabr
         4pxfGn+r6ZFlf4o+Vb6fazhg7yyV2NJBAWEmQi021fb7kID8Wqs6MwiJz51a50/T2E9V
         D99PrJncn4NH0LAWbA//KVv/CuB03HLxoQGo+ZmoyeRv5F2Bq6uZEaHbzl7vr2hkLwkT
         IrSHaa4vzmYnUyr4FhZ6Guwa3vyw+Xs5oKqRVuK7ol71SlO2PKfk6mdq18L5nE+wGf+1
         pv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723122075; x=1723726875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQfPjgGwQyx0qpg/eMyY+G94ywbJKQrqsZkoH118rno=;
        b=c8ZAUa5WHqR10S5VpU859OuHgpsZmxgd/4h7RZPfBADO1ZdZbSbyr4UnLGxCwmnW76
         j0p7IVX+7V77NzGQyHCwARpdYbHmCBtcqqKBDPXTXJAS0w4Ks3ddZKiBk7xCuq4ktxiy
         q7OMHd9wXQqL0zAdnVq39QSayV3/p5jNqTpyUsguHzhaurn7BB8tVnAkUkxWvnivPd/h
         oq0b8pt/ABa6xM8wR0+aAW0JDjkN7TA498YytpIgAO7ks3eOmBeZ2He+TLFza6anIVbR
         hqG9ZHAQuEVsvLsdx+SFxIFzGjZ04BwGAHbkuFyfFUsWVuvu5fsLB7vgL6hzjCuQWtgi
         sgVw==
X-Gm-Message-State: AOJu0Yyo4rL1X0f28N53J2nbSEoS+P1Hfgh7gwSMNdEo1GVjBjmTyYvq
	bTmPZi5Wj0IfBeSN4XB+sp+rOWaJLfk9BM7T81U+mJxxrJt76ijRTshHQlLqpnXfV3hIpCf53xM
	I3g8P1aawRuh1mKWGBVAqrR+NrfM=
X-Google-Smtp-Source: AGHT+IHOOaNyqqk91XE/kPuFEWZXfiWWJgmkDRyAJzhZFshOVrBfI2oRs5HhPJ30rOqICjnSSnPEWbMCvDk85wkeBIM=
X-Received: by 2002:a05:690c:385:b0:627:d23a:4505 with SMTP id
 00721157ae682-69bf744c76amr22601637b3.3.1723122074422; Thu, 08 Aug 2024
 06:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240808122301.2271346-1-leon.anavi@konsulko.com>
In-Reply-To: <20240808122301.2271346-1-leon.anavi@konsulko.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 8 Aug 2024 06:01:03 -0700
Message-ID: <CANx9H-D05BFfAUU3+x+4gF_fUfQyW_4+d1VOdsOtwqBNeAquMA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-pydantic: Upgrade 2.7.3 -> 2.8.2
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002694b6061f2b9fe0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 13:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111661

--0000000000002694b6061f2b9fe0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please hold off on this one, it requires a newer python3-pydantic-core that
I am working on now.

On Thu, Aug 8, 2024 at 5:23=E2=80=AFAM Leon Anavi via lists.openembedded.or=
g
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to version 2.8.2:
>
> - Fix issue with assertion caused by pluggable schema
> - Fix breaking change in to_snake from v2.7 -> v2.8
> - Fix list constraint json schema application
> - Support time duration more than 23
> - Fix millisecond fraction being handled with the wrong scale
> - Handle negative fractional durations correctly
> - Update citation version automatically with new releases
> - Add support for Python 3.13
> - Experimental: support defer_build for TypeAdapter
> - Implement deprecated field in json schema
> - Experimental: Add pipeline API
> - Add support for programmatic title generation
> - Implement fail_fast feature
> - Add ser_json_inf_nan=3D'strings' mode to produce valid JSON
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-pydantic_2.7.3.bb =3D> python3-pydantic_2.8.2.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.3.bb =
=3D>
> python3-pydantic_2.8.2.bb} (95%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.b=
b
> b/meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
> similarity index 95%
> rename from meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
> rename to meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
> index 423fe7673..fb1e7b3ac 100644
> --- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D09280955509d1c4ca14bae02f21d49a6"
>
>  inherit pypi python_hatchling
>
> -SRC_URI[sha256sum] =3D
> "c46c76a40bb1296728d7a8b99aa73dd70a48c3510111ff290034f860c99c419e"
> +SRC_URI[sha256sum] =3D
> "6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a"
>
>  DEPENDS +=3D "python3-hatch-fancy-pypi-readme-native"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111654):
> https://lists.openembedded.org/g/openembedded-devel/message/111654
> Mute This Topic: https://lists.openembedded.org/mt/107788297/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002694b6061f2b9fe0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please hold off on this one, it requires a newer python3-=
pydantic-core that I am working on now.</div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 5:23=E2=
=80=AFAM Leon Anavi via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.ope=
nembedded.org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">Upgrade to version 2.8.2:<br>
<br>
- Fix issue with assertion caused by pluggable schema<br>
- Fix breaking change in to_snake from v2.7 -&gt; v2.8<br>
- Fix list constraint json schema application<br>
- Support time duration more than 23<br>
- Fix millisecond fraction being handled with the wrong scale<br>
- Handle negative fractional durations correctly<br>
- Update citation version automatically with new releases<br>
- Add support for Python 3.13<br>
- Experimental: support defer_build for TypeAdapter<br>
- Implement deprecated field in json schema<br>
- Experimental: Add pipeline API<br>
- Add support for programmatic title generation<br>
- Implement fail_fast feature<br>
- Add ser_json_inf_nan=3D&#39;strings&#39; mode to produce valid JSON<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-pydantic_2.7.3.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-pydantic_2.7.3.bb</a> =3D&gt; <a href=3D"http://p=
ython3-pydantic_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyda=
ntic_2.8.2.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-pydantic_2.7.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2=
.7.3.bb</a> =3D&gt; <a href=3D"http://python3-pydantic_2.8.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-pydantic_2.8.2.bb</a>} (95%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic_2.7.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.=
7.3.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
pydantic_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.=
8.2.bb</a><br>
similarity index 95%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
ydantic_2.7.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.7=
.3.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pyd=
antic_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.8.2=
.bb</a><br>
index 423fe7673..fb1e7b3ac 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c_2.7.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.7.3.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pydanti=
c_2.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.8.2.bb<=
/a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D092809555=
09d1c4ca14bae02f21d49a6&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling<br>
<br>
-SRC_URI[sha256sum] =3D &quot;c46c76a40bb1296728d7a8b99aa73dd70a48c3510111f=
f290034f860c99c419e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc=
09c6b149816604f7c2a&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3-hatch-fancy-pypi-readme-native&quot;<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111654): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111654" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111654</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107788297/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107788297/924729</a><br>
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

--0000000000002694b6061f2b9fe0--

