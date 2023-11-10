Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7291AC4167B
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 13:23:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.26886.1699622624122037939
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 05:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kvqAtRa+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32fa7d15f4eso1294802f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 05:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699622622; x=1700227422; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n5C9Xvjm7iJ2vYSLJJWK9IZ2UVEhFy1eEleRah2nQX4=;
        b=kvqAtRa+BMT05AlX+qU6htpY5cw21tFCbDxm6WeclhhXhBiFBFYljJYXZEnfbJHYYI
         MuEe50a5DfayhC5Pve9WEbVJWrjPIzVUfm5SLraPDtK2b+82zF7g2kigK2mPGdvzcQSh
         Es1MoLBs4b6kZ6ZSgsluptJEUcD48UM8gWDdAc0xrUJ+wC8ESN6FYaq2FeKkrmosU9aS
         jOuR8q8iNButZ2Wczre5mcCZ8KHSQgLBsy+JsskJFf60/NAqpPW7NSRVQckPTd7QEEuA
         voDcJf0mqJCIRUAi+oNMluMFpWi9I6MKHGYqCEdIu01O2MQs5sk/o2Hcf6E581fTAexG
         HOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699622622; x=1700227422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5C9Xvjm7iJ2vYSLJJWK9IZ2UVEhFy1eEleRah2nQX4=;
        b=q/wjHZ9EgDlFjNDjfMKtDKjhzAni9muiLRq3og45kILAy73bLnEaf1zwGBZYIi4x/L
         rYo+MoLkIhXheHANEP6U/k3/oTm6F1qYs+awVb3oLE9Ofzeoz5UsBdoYAepmnmyRh9OJ
         taDE6tdaLCVclTnqmA0U5m95/ZWY0CuKBYoD7g9iRcyg9pLz4sFjUrhTxCezefhIB4+O
         jRjK5RqixFeX2EGJJ/Kb8j4KD+JsER2lGhlYEJ3VJetx/0tI4+wPzu3bn1EBk5jRniZw
         /HN4lP3hfxcWJF98bX0wwVkHY75KJshvCtnim9Vi38SLTpSUgC2SgqsTmtvrQDqBQQ8s
         f/Yw==
X-Gm-Message-State: AOJu0YwsoJHKFRoiGDV+wJXpjbHx3pMC07CU2x7pGBOa9DFJIVLalZ9G
	3dKeCQm/Vj8zJIH0ApasKuIhhLCo0Yo/L/1/OLpw2c3SpLs=
X-Google-Smtp-Source: AGHT+IHb4xR50R6yptoBANYepx6Yrmb+bEZYYvJbboiiT6cD0LX6TzattYKyrBZaqhlXWn7dA13ksFp1gLxVoTJtm9I=
X-Received: by 2002:a05:6000:4c:b0:31a:b3aa:d19b with SMTP id
 k12-20020a056000004c00b0031ab3aad19bmr6144735wrx.23.1699622622369; Fri, 10
 Nov 2023 05:23:42 -0800 (PST)
MIME-Version: 1.0
References: <9B6z.1699621499757734697.wXhd@lists.openembedded.org> <CA+chaQdP_-pf+TEhZyeabdV4-Q6Qd2t4+aYyL25ZTxvS7h=qNQ@mail.gmail.com>
In-Reply-To: <CA+chaQdP_-pf+TEhZyeabdV4-Q6Qd2t4+aYyL25ZTxvS7h=qNQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Nov 2023 14:23:29 +0100
Message-ID: <CA+chaQdAEMeAfpyx4B5GnT+tgsMk+gHhCunEmXa8TEMT0ok1dg@mail.gmail.com>
Subject: Re: [oe] [master][PATCH] SRC_URI master branch is deprecated and main
 is the new master branch
To: ashwin.naik@sasken.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a89b070609cc3ae2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 13:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106548

--000000000000a89b070609cc3ae2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And even dunfell already has it since 6 months ago:
https://git.openembedded.org/meta-openembedded/commit/?id=3D29e3a918ac80f98=
f3bad70eec50a9ada1a47fc41

so maybe you're on some even older release which isn't supported anymore.

On Fri, Nov 10, 2023 at 2:22=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> This surely isn't for master where it was fixed 2 years ago:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Deab5e822a91ad=
95cf0e7d2406ba3ab5304748713
>
> If you need this fix in some other branch, then send the cherry-pick of
> this with correct e-mail subject indicating the branch.
>
> On Fri, Nov 10, 2023 at 2:05=E2=80=AFPM ashwin.naik via lists.openembedde=
d.org
> <ashwin.naik=3Dsasken.com@lists.openembedded.org> wrote:
>
>> From 23c3517e62158e390617686abd1a5525d27fa223 Mon Sep 17 00:00:00 2001
>> From: "ashwin.naik" <ashwin.naik@sasken.com>
>> Date: Fri, 3 Nov 2023 15:24:24 +0530
>> Subject: [PATCH] SRC_URI master branch is deprecated and main is the new
>>  master branch
>>
>> Below failure log is observed while using master branch to fetch.
>>
>> ERROR: googletest-1.10.0-r0 do_fetch: Fetcher failure:
>> Unable to find revision 703bd9caab50b139428cea1aaff9974ebee5742e
>> in branch master even from upstream
>> ERROR: googletest-1.10.0-r0 do_fetch: Bitbake Fetcher Error:
>> FetchError('Unable to fetch URL from any source.',
>> 'git://github.com/google/googletest.git;branch=3Dmaster;protocol=3Dhttps=
')
>>
>> Signed-off-by: ashwin.naik <ashwin.naik@sasken.com>
>> ---
>>  meta-oe/recipes-test/googletest/googletest_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb
>> b/meta-oe/recipes-test/googletest/googletest_git.bb
>> index 898f23faf..35fe1bed0 100644
>> --- a/meta-oe/recipes-test/googletest/googletest_git.bb
>> +++ b/meta-oe/recipes-test/googletest/googletest_git.bb
>> @@ -11,7 +11,7 @@ PROVIDES +=3D "gmock gtest"
>>
>>  S =3D "${WORKDIR}/git"
>>  SRCREV =3D "703bd9caab50b139428cea1aaff9974ebee5742e"
>> -SRC_URI =3D "git://
>> github.com/google/googletest.git;branch=3Dmaster;protocol=3Dhttps"
>> +SRC_URI =3D "git://
>> github.com/google/googletest.git;branch=3Dmain;protocol=3Dhttps"
>>
>>  inherit cmake
>>
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#106546):
>> https://lists.openembedded.org/g/openembedded-devel/message/106546
>> Mute This Topic: https://lists.openembedded.org/mt/102505851/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000a89b070609cc3ae2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And even dunfell already has it since 6 months ago:<div><a=
 href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D29e3a9=
18ac80f98f3bad70eec50a9ada1a47fc41">https://git.openembedded.org/meta-opene=
mbedded/commit/?id=3D29e3a918ac80f98f3bad70eec50a9ada1a47fc41</a><br></div>=
<div><br></div><div>so maybe you&#39;re on some even older release which is=
n&#39;t supported anymore.</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 10, 2023 at 2:22=E2=80=AFPM Mar=
tin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">This surely isn&#39;t for master where it was fixed 2 y=
ears ago:<div><a href=3D"https://git.openembedded.org/meta-openembedded/com=
mit/?id=3Deab5e822a91ad95cf0e7d2406ba3ab5304748713" target=3D"_blank">https=
://git.openembedded.org/meta-openembedded/commit/?id=3Deab5e822a91ad95cf0e7=
d2406ba3ab5304748713</a><br></div><div><br></div><div>If you need this fix =
in some other branch, then send the cherry-pick of this with correct e-mail=
 subject indicating the branch.</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 10, 2023 at 2:05=E2=80=AFP=
M ashwin.naik via <a href=3D"http://lists.openembedded.org" target=3D"_blan=
k">lists.openembedded.org</a> &lt;ashwin.naik=3D<a href=3D"mailto:sasken.co=
m@lists.openembedded.org" target=3D"_blank">sasken.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div>From 23c3517e62158e390617686abd1a5525d27fa223 Mon Sep 17 00:00:00 20=
01</div>
<div>From: &quot;ashwin.naik&quot; &lt;<a href=3D"mailto:ashwin.naik@sasken=
.com" target=3D"_blank">ashwin.naik@sasken.com</a>&gt;</div>
<div>Date: Fri, 3 Nov 2023 15:24:24 +0530</div>
<div>Subject: [PATCH] SRC_URI master branch is deprecated and main is the n=
ew</div>
<div>=C2=A0master branch</div>
<div>=C2=A0</div>
<div>Below failure log is observed while using master branch to fetch.</div=
>
<div>=C2=A0</div>
<div>ERROR: googletest-1.10.0-r0 do_fetch: Fetcher failure:</div>
<div>Unable to find revision 703bd9caab50b139428cea1aaff9974ebee5742e</div>
<div>in branch master even from upstream</div>
<div>ERROR: googletest-1.10.0-r0 do_fetch: Bitbake Fetcher Error:</div>
<div>FetchError(&#39;Unable to fetch URL from any source.&#39;,</div>
<div>&#39;git://<a href=3D"http://github.com/google/googletest.git;branch=
=3Dmaster;protocol=3Dhttps" target=3D"_blank">github.com/google/googletest.=
git;branch=3Dmaster;protocol=3Dhttps</a>&#39;)</div>
<div>=C2=A0</div>
<div>Signed-off-by: ashwin.naik &lt;<a href=3D"mailto:ashwin.naik@sasken.co=
m" target=3D"_blank">ashwin.naik@sasken.com</a>&gt;</div>
<div>---</div>
<div>=C2=A0meta-oe/recipes-test/googletest/<a href=3D"http://googletest_git=
.bb" target=3D"_blank">googletest_git.bb</a> | 2 +-</div>
<div>=C2=A01 file changed, 1 insertion(+), 1 deletion(-)</div>
<div>=C2=A0</div>
<div>diff --git a/meta-oe/recipes-test/googletest/<a href=3D"http://googlet=
est_git.bb" target=3D"_blank">googletest_git.bb</a> b/meta-oe/recipes-test/=
googletest/<a href=3D"http://googletest_git.bb" target=3D"_blank">googletes=
t_git.bb</a></div>
<div>index 898f23faf..35fe1bed0 100644</div>
<div>--- a/meta-oe/recipes-test/googletest/<a href=3D"http://googletest_git=
.bb" target=3D"_blank">googletest_git.bb</a></div>
<div>+++ b/meta-oe/recipes-test/googletest/<a href=3D"http://googletest_git=
.bb" target=3D"_blank">googletest_git.bb</a></div>
<div>@@ -11,7 +11,7 @@ PROVIDES +=3D &quot;gmock gtest&quot;</div>
<div>=C2=A0</div>
<div>=C2=A0S =3D &quot;${WORKDIR}/git&quot;</div>
<div>=C2=A0SRCREV =3D &quot;703bd9caab50b139428cea1aaff9974ebee5742e&quot;<=
/div>
<div>-SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/googletes=
t.git;branch=3Dmaster;protocol=3Dhttps" target=3D"_blank">github.com/google=
/googletest.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;</div>
<div>+SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/googletes=
t.git;branch=3Dmain;protocol=3Dhttps" target=3D"_blank">github.com/google/g=
oogletest.git;branch=3Dmain;protocol=3Dhttps</a>&quot;</div>
<div>=C2=A0</div>
<div>=C2=A0inherit cmake</div>
<div>=C2=A0</div>
<div>--=C2=A0</div>
<div>2.25.1</div>
<div>=C2=A0</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#106546): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/106546" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/106546</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102505851/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102505851/3617156</a><br>
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
</blockquote></div>

--000000000000a89b070609cc3ae2--

