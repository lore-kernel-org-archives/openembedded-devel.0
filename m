Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD7DC7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 11:04:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.8704.1682075081402660916
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Apr 2023 04:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ijNSoBAz;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-2fa36231b1cso979208f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Apr 2023 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682075080; x=1684667080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWG20n3IBKjKhwKiOMoKMzyzPdB/akFrrLYYJQeZJW0=;
        b=ijNSoBAzL0j8Ei06yAZuZchy07ezIytthBPIY4JdIq1J0lZbprzm73T2kgdjECHZ42
         t3uhZcryM/o+gHUVxrStv3fY6MAhnB6O4yBhPWDO+octHMfWmNZtE7SqZfwtMFw9aLn0
         zjb7Rdia40xaDKm2F3QnU+MOhMSpygiGgq3eiHUkAEmeI7CwiROUjJV0zrS2gGyzVhFj
         zHJ2bZcurUKXiZ96jgmbTsLKaLtkyAZCzsSf/StE4nMFgT1ECGLulE292qQtUlpIHQw9
         7jZX1EimDyRiTR+wj7Xc+D+nEdeDZtjuA9iLrEtjhB9Xg1mH46dUhwtRWTOrKc/DeH0N
         WV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682075080; x=1684667080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWG20n3IBKjKhwKiOMoKMzyzPdB/akFrrLYYJQeZJW0=;
        b=kCJoQErtSj46dhE1O9tBIoX/x/j0WzfXIRGb1/7AL+hg71qMrPdeufoOnmd74D0OLF
         nXhXADtSnKgj4BAm+Jret+BKA93+mH0uMe+Y52ojNFewXg71ulhQ8euXlGX3NEEFB3ac
         HNfH9WcTC7zmiI0XMSmUduHmeczRBzoUl5lEF9ONl+Zdtdh7W5ecDUSnRikAZCTR23nm
         97BZuBYKZPLVrShFFaQjJwBN4MobfG72GZz8mJwFJaGR36AAsaZEBJyegyg1m8QPlzex
         4zy3cNz/EqrB1a9GOBKyGh/afbSiZ/8ZbT98R0fOrOmCgC5oFWbVrG9r9HwMLCvl079V
         bd7A==
X-Gm-Message-State: AAQBX9cjHQvdv4k32AloIuyYS1QsV7X/5BlWuODl8QaPkwN4tLfl3wgT
	jfYUvzOXEdd3kbPIrGd0TD9wzrkH3ZvO90Wkc84=
X-Google-Smtp-Source: AKy350bOMdQ3zT1rnZ4I5HyEU5XktJkcI9HXkMWqf72G9dL3BLgBzB0E0e0YLmAyfa4s9bdbycyQbBuRfXuredBHJjg=
X-Received: by 2002:adf:dd85:0:b0:2f1:d17f:cf95 with SMTP id
 x5-20020adfdd85000000b002f1d17fcf95mr3764005wrl.12.1682075079726; Fri, 21 Apr
 2023 04:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230322082921.2464069-1-changqing.li@windriver.com>
 <ad2ad401-b01c-ad73-7a93-a699af8a9fd3@gmail.com> <17ccc23e-537d-ffa6-562a-021633894a08@windriver.com>
In-Reply-To: <17ccc23e-537d-ffa6-562a-021633894a08@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Apr 2023 13:04:24 +0200
Message-ID: <CA+chaQdwfcR9gCfY-5wOSvA8WWP9xDq2NvdbeBGp7SHAsh_X9g@mail.gmail.com>
Subject: Re: [oe] [kirkstone][meta-oe][PATCH] redis: upgrade 7.0.9 -> 7.0.10
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: akuster808 <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009cdb4f05f9d69fc2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Apr 2023 11:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102143

--0000000000009cdb4f05f9d69fc2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What's the status of these changes? I don't see them in
kirkstone-next/langdale-next nor contrib/stable/kirkstone-nut
contrib/stable/langdale-nut

The current meta-oe/kirkstone redis fails since 7.0.9 upgrade with:

ERROR: redis-7.0.9-r0 do_patch: Fuzz detected:
Applying patch GNU_SOURCE.patch
patching file src/zmalloc.c
Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).
ERROR: redis-7.0.9-r0 do_patch: QA Issue: Patch log indicates that patches
do not apply cleanly. [patch-fuzz]

And I don't see this issue fixed here.

I'll send separate patch to fix just patch-fuzz.

On Thu, Mar 23, 2023 at 2:33=E2=80=AFAM Changqing Li <changqing.li@eng.wind=
river.com>
wrote:

>
> On 3/22/23 19:23, akuster808 wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> > and know the content is safe.
> >
> > On 3/22/23 4:29 AM, Changqing Li wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> Upgrade urgency: SECURITY, contains fixes to security issues.
> >>
> >> Security Fixes:
> >>
> >> (CVE-2023-28425) Specially crafted MSETNX command can lead to
> >> assertion and denial-of-service
> >
> > Was this sent to master?
>
> Yes,  It is another patch, because  the context of the changed line is a
> little different.
>
> Regards
>
> Changqing
>
> >>
> >> Bug Fixes
> >> Large blocks of replica client output buffer may lead to PSYNC loops
> >> and unnecessary memory usage (#11666)
> >> Fix CLIENT REPLY OFF|SKIP to not silence push notifications (#11875)
> >> Trim excessive memory usage in stream nodes when exceeding
> >> stream-node-max-bytes (#11885)
> >> Fix module RM_Call commands failing with OOM when maxmemory is
> >> changed to zero (#11319)
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   .../recipes-extended/redis/{redis_7.0.9.bb =3D> redis_7.0.10.bb}  | =
2
> +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>   rename meta-oe/recipes-extended/redis/{redis_7.0.9.bb =3D>
> >> redis_7.0.10.bb} (96%)
> >>
> >> diff --git a/meta-oe/recipes-extended/redis/redis_7.0.9.bb
> >> b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
> >> similarity index 96%
> >> rename from meta-oe/recipes-extended/redis/redis_7.0.9.bb
> >> rename to meta-oe/recipes-extended/redis/redis_7.0.10.bb
> >> index e4b2d45a4..5f972033f 100644
> >> --- a/meta-oe/recipes-extended/redis/redis_7.0.9.bb
> >> +++ b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
> >> @@ -19,7 +19,7 @@ SRC_URI =3D
> >> "http://download.redis.io/releases/${BP}.tar.gz \
> >>              file://GNU_SOURCE.patch \
> >>              file://0006-Define-correct-gregs-for-RISCV32.patch \
> >>              "
> >> -SRC_URI[sha256sum] =3D
> >> "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb9f65"
> >> +SRC_URI[sha256sum] =3D
> >> "1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb600131"
> >>
> >>   inherit autotools-brokensep update-rc.d systemd useradd
> >>
> >>
> >>
> >>
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101640):
> https://lists.openembedded.org/g/openembedded-devel/message/101640
> Mute This Topic: https://lists.openembedded.org/mt/97773847/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009cdb4f05f9d69fc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What&#39;s the status of these changes? I don&#39;t see th=
em in kirkstone-next/langdale-next nor=C2=A0contrib/stable/kirkstone-nut co=
ntrib/stable/langdale-nut<div><br></div><div>The current meta-oe/kirkstone =
redis fails since 7.0.9 upgrade with:</div><div><br></div><div>ERROR: redis=
-7.0.9-r0 do_patch: Fuzz detected:<br>Applying patch GNU_SOURCE.patch<br>pa=
tching file src/zmalloc.c<br>Hunk #1 succeeded at 32 with fuzz 2 (offset 4 =
lines).<br>ERROR: redis-7.0.9-r0 do_patch: QA Issue: Patch log indicates th=
at patches do not apply cleanly. [patch-fuzz]<br></div><div><br></div><div>=
And I don&#39;t see this issue fixed here.</div><div><br></div><div>I&#39;l=
l send separate patch to fix just patch-fuzz.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 23, 2023 at =
2:33=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqing.li@eng.windriv=
er.com">changqing.li@eng.windriver.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
On 3/22/23 19:23, akuster808 wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 <br>
&gt; and know the content is safe.<br>
&gt;<br>
&gt; On 3/22/23 4:29 AM, Changqing Li wrote:<br>
&gt;&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Upgrade urgency: SECURITY, contains fixes to security issues.<br>
&gt;&gt;<br>
&gt;&gt; Security Fixes:<br>
&gt;&gt;<br>
&gt;&gt; (CVE-2023-28425) Specially crafted MSETNX command can lead to <br>
&gt;&gt; assertion and denial-of-service<br>
&gt;<br>
&gt; Was this sent to master?<br>
<br>
Yes,=C2=A0 It is another patch, because=C2=A0 the context of the changed li=
ne is a <br>
little different.<br>
<br>
Regards<br>
<br>
Changqing<br>
<br>
&gt;&gt;<br>
&gt;&gt; Bug Fixes<br>
&gt;&gt; Large blocks of replica client output buffer may lead to PSYNC loo=
ps <br>
&gt;&gt; and unnecessary memory usage (#11666)<br>
&gt;&gt; Fix CLIENT REPLY OFF|SKIP to not silence push notifications (#1187=
5)<br>
&gt;&gt; Trim excessive memory usage in stream nodes when exceeding <br>
&gt;&gt; stream-node-max-bytes (#11885)<br>
&gt;&gt; Fix module RM_Call commands failing with OOM when maxmemory is <br=
>
&gt;&gt; changed to zero (#11319)<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@win=
driver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 .../recipes-extended/redis/{<a href=3D"http://redis_7.0.9.b=
b" rel=3D"noreferrer" target=3D"_blank">redis_7.0.9.bb</a> =3D&gt; <a href=
=3D"http://redis_7.0.10.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.0.=
10.bb</a>}=C2=A0 | 2 +-<br>
&gt;&gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; =C2=A0 rename meta-oe/recipes-extended/redis/{<a href=3D"http://re=
dis_7.0.9.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.0.9.bb</a> =3D&g=
t; <br>
&gt;&gt; <a href=3D"http://redis_7.0.10.bb" rel=3D"noreferrer" target=3D"_b=
lank">redis_7.0.10.bb</a>} (96%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/redis/<a href=3D"http://redi=
s_7.0.9.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.0.9.bb</a> <br>
&gt;&gt; b/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.0.10.bb=
" rel=3D"noreferrer" target=3D"_blank">redis_7.0.10.bb</a><br>
&gt;&gt; similarity index 96%<br>
&gt;&gt; rename from meta-oe/recipes-extended/redis/<a href=3D"http://redis=
_7.0.9.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.0.9.bb</a><br>
&gt;&gt; rename to meta-oe/recipes-extended/redis/<a href=3D"http://redis_7=
.0.10.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.0.10.bb</a><br>
&gt;&gt; index e4b2d45a4..5f972033f 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.0.9=
.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.0.9.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.0.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.0.10.bb</a><br>
&gt;&gt; @@ -19,7 +19,7 @@ SRC_URI =3D <br>
&gt;&gt; &quot;<a href=3D"http://download.redis.io/releases/$%7BBP%7D.tar.g=
z" rel=3D"noreferrer" target=3D"_blank">http://download.redis.io/releases/$=
{BP}.tar.gz</a> \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 file://GNU_SOURCE.patch \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 file://0006-Define-correct-gregs-for-RISCV32.patch \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D <br>
&gt;&gt; &quot;f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb=
9f65&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D <br>
&gt;&gt; &quot;1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb60=
0131&quot;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 inherit autotools-brokensep update-rc.d systemd useradd<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101640): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101640" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101640</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97773847/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97773847/3617156</a><br>
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

--0000000000009cdb4f05f9d69fc2--

