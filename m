Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9BEC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 08:59:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.4011.1667379590506640993
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 01:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YMhv7X6g;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k8so23512395wrh.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VeJH1GN8H+5cUbjziInq5/vmgD1gbGe/xPfwTD5CfSQ=;
        b=YMhv7X6guhFIcEik6Su3iNhZxUqIFezGw0TU3VOfCK/J2FYubYPpF0DS2K2a2IpPCE
         BpQYSSFzKJOKDYlgo4yuO256klmK+4XcEn4TBjUOq6Y619J1tlKe5AQBLzIPfA8hMtlO
         rbtmA/GgroA6esnx8YkrXEUrSpykUZEXJMqn2ci3JCDIAa6bdWTWLXcOkYNyJmJKjChH
         7WM+u5Cond8Cgd3BoQemNxL+7UZyb6KszdsSvC3GltTOnvtZJAKEv0KkJcZTSoXe3WlB
         y7xDbW9fqyYGn5tXwvVzOj4nonkt/AJQJ6eWR6nJ3eDp6sEGzx91sTGfSfHpy6CaRmG+
         rObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VeJH1GN8H+5cUbjziInq5/vmgD1gbGe/xPfwTD5CfSQ=;
        b=dDpxAp7oI8Bh1iKjjMdi9JJNUXy8K02j9bqtvQvarG6y35pCVqreP5bZLWvRkHZN00
         dVzsB2DQhLWKgatA94FUm3zjAXTzfjlLexaDO/DEdFms9PJTYvDRdrdQJiB7KWtDRNKb
         9hfdttAJpM33A0GV8DWztcDgpqUJl8tLiFQCwHpneRdh5nGvuNAVFNpU5fZIZtwQMOTg
         VXY4YXihyRP5ZkHm1QRBBS5+0wAQc/JV4La/CpfNQaXn+a+FDd0Y4KSBAksyIsUr6y71
         9OZGuGnq1c2JLxEEohtjuuMfrcSJyUbeDhsN82qGRVFQtoliK1CFl2Wg7MKNdOfQtXGO
         114Q==
X-Gm-Message-State: ACrzQf119EpfuH3eyYIreXK3tpDNuTNq02ZUVOsudOGD1HdU4JlhQVIZ
	LdQXjMa0UFLWtmja/fEO5ShQsRHXXSFKu76xK1k=
X-Google-Smtp-Source: AMsMyM6xvxyvawbgODdsLhvA+lDKIdlqvYfDaazAg+7cqWIEpaEGhBhFZPgz1bda4CXtsOHTy0KN5hY8T66IJkJezLA=
X-Received: by 2002:adf:a348:0:b0:236:beb8:9698 with SMTP id
 d8-20020adfa348000000b00236beb89698mr10960082wrb.507.1667379588560; Wed, 02
 Nov 2022 01:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <171DB009516B4784.27306@lists.openembedded.org>
In-Reply-To: <171DB009516B4784.27306@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 2 Nov 2022 09:59:37 +0100
Message-ID: <CA+chaQekKZrSc+281qucpjh=4dZCW=0Cb6wDVm1dVV2DTurMxQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] re2: fix branch name from master
 to main
To: Martin.Jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000014fa7805ec7910b5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 08:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99415

--00000000000014fa7805ec7910b5
Content-Type: text/plain; charset="UTF-8"

Armin: ping

Is there any reason, this already missed 2 meta-oe/kirkstone pull requests
from you?

On Thu, Oct 13, 2022 at 7:09 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> re2 $ git branch -a --contains 166dbbeb3b0ab7e733b278e8f42a84f6882b8a25
> * main
>   remotes/origin/HEAD -> origin/main
>   remotes/origin/main
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/re2/re2_2020.11.01.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/re2/re2_2020.11.01.bb
> b/meta-oe/recipes-support/re2/re2_2020.11.01.bb
> index 698fe7e497..5ec1c6b5ab 100644
> --- a/meta-oe/recipes-support/re2/re2_2020.11.01.bb
> +++ b/meta-oe/recipes-support/re2/re2_2020.11.01.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760"
>
>  SRCREV = "166dbbeb3b0ab7e733b278e8f42a84f6882b8a25"
>
> -SRC_URI = "git://github.com/google/re2.git;branch=master;protocol=https"
> +SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.38.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99164):
> https://lists.openembedded.org/g/openembedded-devel/message/99164
> Mute This Topic: https://lists.openembedded.org/mt/94308845/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000014fa7805ec7910b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Armin: ping<div><br></div><div>Is there any reason, this a=
lready missed 2 meta-oe/kirkstone pull requests from you?</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct =
13, 2022 at 7:09 PM Martin Jansa via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Martin Jan=
sa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.j=
ansa@gmail.com</a>&gt;<br>
<br>
re2 $ git branch -a --contains 166dbbeb3b0ab7e733b278e8f42a84f6882b8a25<br>
* main<br>
=C2=A0 remotes/origin/HEAD -&gt; origin/main<br>
=C2=A0 remotes/origin/main<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/re2/<a href=3D"http://re2_2020.11.01.bb" rel=
=3D"noreferrer" target=3D"_blank">re2_2020.11.01.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/re2/<a href=3D"http://re2_2020.11.01.b=
b" rel=3D"noreferrer" target=3D"_blank">re2_2020.11.01.bb</a> b/meta-oe/rec=
ipes-support/re2/<a href=3D"http://re2_2020.11.01.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">re2_2020.11.01.bb</a><br>
index 698fe7e497..5ec1c6b5ab 100644<br>
--- a/meta-oe/recipes-support/re2/<a href=3D"http://re2_2020.11.01.bb" rel=
=3D"noreferrer" target=3D"_blank">re2_2020.11.01.bb</a><br>
+++ b/meta-oe/recipes-support/re2/<a href=3D"http://re2_2020.11.01.bb" rel=
=3D"noreferrer" target=3D"_blank">re2_2020.11.01.bb</a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b5c31eb512=
bdf3cb11ffd5713963760&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;166dbbeb3b0ab7e733b278e8f42a84f6882b8a25&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/re2.git;branch=
=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/google/re2.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/re2.git;branch=
=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/g=
oogle/re2.git;branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.38.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99164): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99164" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99164</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94308845/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94308845/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000014fa7805ec7910b5--

