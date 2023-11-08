Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F71C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 08:20:05 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9164.1699431597515653838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 00:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gQCLMDQ1;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-32df66c691dso3694629f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 00:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699431596; x=1700036396; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jyPxUYCHPLSwL28u9TGWG6mETruoYH8Sx/YQocjgigQ=;
        b=gQCLMDQ1GRcBvBPp00N3vSfTAnnXlaDMyvTwNvxbwSBpke8HgP0yzo7x0m4+9BETzo
         gXWhFOdgfVwUpotjlhzAlKuU9NGZLx9Dd8xLACma+/N7ZXgFfTJ8ah6qnzbtkDzEpQ0I
         daWCjPmv9Suy/4WwDmY7qew/DlM8N3QyzuX1W+q2fOsMh7hxI7LVrTVxDPR2beUINnc5
         jLjDZBVTttRptlVFqeZNlUbMv24buWUrQsRgh+iEuU5CuLUygFPO1My2+fS7IR1y1JI9
         RCYh1O0k1tHn6cg7dMRPcVrp7C9LGVQUWb36eS+kHdzps9gsbRMZcKK7XvFI/aswOvTg
         ZNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699431596; x=1700036396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyPxUYCHPLSwL28u9TGWG6mETruoYH8Sx/YQocjgigQ=;
        b=b/Xf+EHqfcmqmt9RFrwtxSsZn+hLD34z5r81IsyYpf7/9vNzbEQStMq4y2r//B7Xn1
         vIKdK6+1JhTv12I+Tq5ePsrjlpYo94Xj3+F/u20lnK/1m8aN2NIo/j3bpp6H1BIkmAV9
         JCFv8xAKq03Q+tvcZ5DtGPcgwHGUzxYadoaBiP+OPD85Btd/jZ0RXeKlbtpD0wVveRwk
         xa9Z9XNsZk8zOMnjSuiNls7d/i++jhCK7lf0SQIMmPevI8iAJ2IUiRSZiQKfrT3m3YmO
         bY7Z5/DzYkubdIU4bXWjrTpZ19XaYFHl9VW5YPURxSwKjE5CUAfVnNHhew/W7c1TwaLo
         pPsw==
X-Gm-Message-State: AOJu0YzEqCXoPAqZvlStKQlzn5oV4SVgihvjW7nKssydzgUOFCvK4HPW
	6fpwKv2VhgiKPO0V7YhQv2aV7V7dydbUbQHyNLE=
X-Google-Smtp-Source: AGHT+IG/7KddUeZwVHL5YqqaQtZnN34qHJ3smlE8cMk3kgPNzWaydejACDwao+L6X+pSW3yahnG7rr/70o0kbSEb6bY=
X-Received: by 2002:a5d:6791:0:b0:32f:908e:c7e0 with SMTP id
 v17-20020a5d6791000000b0032f908ec7e0mr830876wru.28.1699431595463; Wed, 08 Nov
 2023 00:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20231030222448.1474551-1-raj.khem@gmail.com>
In-Reply-To: <20231030222448.1474551-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Nov 2023 09:19:43 +0100
Message-ID: <CA+chaQdAsO8fJQp0V5jo+DN2sV9p2RCPUoC4UWzQpSE3m=cO4A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] emlog: Add PV
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009157b506099fc082"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 08:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106470

--0000000000009157b506099fc082
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why with explicit +git{SRCPV} for nanbield and master? I thought we don't
use that since:
https://lists.openembedded.org/g/openembedded-core/message/185842

On Mon, Oct 30, 2023 at 11:24=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> This is 0.70 release with few more commits on top.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/emlog/emlog.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/emlog/emlog.inc
> b/meta-oe/recipes-core/emlog/emlog.inc
> index 0972aff32c..160a5a9f87 100644
> --- a/meta-oe/recipes-core/emlog/emlog.inc
> +++ b/meta-oe/recipes-core/emlog/emlog.inc
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
>
>  SRC_URI =3D "git://
> github.com/nicupavel/emlog.git;protocol=3Dhttps;branch=3Dmaster"
>  SRCREV =3D "a9bbf324fde131ff4cf064e32674086c4ced4dca"
> -
> +PV =3D "0.70+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>
>  EXTRA_OEMAKE +=3D " \
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105799):
> https://lists.openembedded.org/g/openembedded-devel/message/105799
> Mute This Topic: https://lists.openembedded.org/mt/102286619/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009157b506099fc082
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why with explicit=C2=A0+git{SRCPV} for nanbield and master=
? I thought we don&#39;t use that since:<div><a href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/message/185842">https://lists.openembedded.=
org/g/openembedded-core/message/185842</a><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 30, 2023 at=
 11:24=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.kh=
em@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">This is 0.70 release with few more commits on top.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-core/emlog/emlog.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/em=
log/emlog.inc<br>
index 0972aff32c..160a5a9f87 100644<br>
--- a/meta-oe/recipes-core/emlog/emlog.inc<br>
+++ b/meta-oe/recipes-core/emlog/emlog.inc<br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9=
ba36caa9b7df079bae19f&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/nicupavel/emlog.=
git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
github.com/nicupavel/emlog.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<b=
r>
=C2=A0SRCREV =3D &quot;a9bbf324fde131ff4cf064e32674086c4ced4dca&quot;<br>
-<br>
+PV =3D &quot;0.70+git${SRCPV}&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot; \<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105799): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105799" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105799</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102286619/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102286619/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009157b506099fc082--

