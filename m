Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5129C7EE2E
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:28:05 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9064.1686648479698229178
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dPoAK5SQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30e412a852dso3530351f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 02:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686648478; x=1689240478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+THwyT7ObItQ0xDC8LL/BadmYMdlP6tdEweeNqNESCI=;
        b=dPoAK5SQPYm+Jl1W4jx9Fmc3YiXsbGJkEZkqH4UtSO8wHBoHd+rfwmbmRGau/nEzur
         6a0kQwmMgzHbKdhK5rODNMjw5ks3qHzt5KA6R3YrrQcARGlz8hlT0NicdGOjE83dq5J4
         sODlXOSlT+YzQtQJzcfy7itNiOZJwYaqOUPinPNAYxXjklM5PVubkJSqold+NWi3JniX
         VvyhPIlSv8YVovnMXkYTt/uWxKPXIzrJgqm7x7H6b5DnRM0ztwBGRsw0mqPaDLMDNyX7
         I7/Qz1yR0mvQWUCQ/s3qxvpsDBvI3vQujn6g/Nw1vSO4K4C+YRTFmvEWWP4UtQ2rTjwm
         TF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686648478; x=1689240478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+THwyT7ObItQ0xDC8LL/BadmYMdlP6tdEweeNqNESCI=;
        b=DlB+KGz4/XkqzCeu2D6ddmKAkJT9WXsP5JmhG4zH0vdFjv5/pJuvAJWUM2etlO0Qni
         pneRpzjKNI+pUd6nkOkSuN+8AEymz5T2RPFmLiIWfz+xon45Br5B8U3ZdGzomUBooFFK
         MJkVbQ2jELoTRqWdIbKu5EgFRuZmCrbrhoJUcw5fNCme91J38CVgkFP7lJjFoAWD5oYB
         unrqT+SHtmcYBq37HNYGhvS2yZArIJHZSVwEL30xDjFqfwjtb5jn/xuGkXX0OWBLusZ9
         PnyaJpCuiN4gWK3Jsf/kcI5QS7QPrb1GzSUSaniHzpjh0FwoFWAHYrUSHrnyI2+w/Loa
         zP5A==
X-Gm-Message-State: AC+VfDyk5x5OGHkbTs5yQmmUfwyG7ee7BHyy3WYHAEtxRWRud8nIDs6x
	ZQ4y5crhWBPOrN2dCvkiWsVRI4G+KaTspw9YFe8=
X-Google-Smtp-Source: ACHHUZ62h2Qv+TFUG/yqYO7rv54NDxQSwCfVetny+nez76MpxILJvkehKEYNbPDfXpD6/yg60/aLVBR4cdPs4ldUO2M=
X-Received: by 2002:a5d:4449:0:b0:306:2a1a:d265 with SMTP id
 x9-20020a5d4449000000b003062a1ad265mr5594318wrr.58.1686648477353; Tue, 13 Jun
 2023 02:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230613072303.3170646-1-Qi.Chen@windriver.com>
In-Reply-To: <20230613072303.3170646-1-Qi.Chen@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Jun 2023 11:27:44 +0200
Message-ID: <CA+chaQewhB=kkrqhCQC2qBmZZ5h7fubOGxaYCWcu+K8i+TYa+A@mail.gmail.com>
Subject: Re: [oe][meta-oe][master][mickledore][langdale][kirkstone][PATCH]
 redis: use the files path correctly
To: Qi.Chen@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a8d1305fdff730e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 09:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103264

--0000000000005a8d1305fdff730e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 9:23=E2=80=AFAM Chen Qi via lists.openembedded.org =
<Qi.Chen=3D
windriver.com@lists.openembedded.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Recipes are not expected to set FILESPATH directly, they are
> expected to use FILESEXTRAPATH.


> I can see the seting of FILESPATH in this recipe only wants to
> find redis-7 specific patches and files. This could be easily
> achieved by using redis-7.0.11/ directory to hold all those files.
>

What's the issue with this, yes it's a bit uncommon but since:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone&id=3D3=
deca451692e99d269812959e6b5e0b519a82f30

which correctly uses BPN in FILESPATH I don't see any patching issues with
redis in my world builds. Before it was failing in multilib builds because
it was searching in lib32-redis-7 directory and when not found there it
used GNU_SOURCE.patch from the other directory and failed with patch-fuzz.

If you still want to go ahead with this then you can also
undo GNU_SOURCE.patch to GNU_SOURCE-7.patch rename (which is IMHO the only
file which isn't unnecessary duplicated between redis-6 and redis-7.

--0000000000005a8d1305fdff730e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 13, 2023 at 9:23=E2=80=AF=
AM Chen Qi via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.openembedded.o=
rg">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
<br>
Recipes are not expected to set FILESPATH directly, they are<br>
expected to use FILESEXTRAPATH.=C2=A0</blockquote><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
I can see the seting of FILESPATH in this recipe only wants to<br>
find redis-7 specific patches and files. This could be easily<br>
achieved by using redis-7.0.11/ directory to hold all those files.<br></blo=
ckquote><div><br></div><div>What&#39;s the issue with this, yes it&#39;s a =
bit uncommon but since:</div><div><a href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?h=3Dkirkstone&amp;id=3D3deca451692e99d269812959e6b=
5e0b519a82f30">https://git.openembedded.org/meta-openembedded/commit/?h=3Dk=
irkstone&amp;id=3D3deca451692e99d269812959e6b5e0b519a82f30</a></div><div><b=
r></div><div>which correctly uses BPN in FILESPATH I don&#39;t see any patc=
hing issues with redis in my world builds. Before it was failing in multili=
b builds because it was searching in lib32-redis-7 directory and when not f=
ound there it used=C2=A0GNU_SOURCE.patch from the other directory and faile=
d with patch-fuzz.</div><div><br></div><div>If you still want to go ahead w=
ith this then you can also undo=C2=A0GNU_SOURCE.patch to GNU_SOURCE-7.patch=
 rename (which is IMHO the only file which isn&#39;t unnecessary duplicated=
 between redis-6 and redis-7.</div></div></div>

--0000000000005a8d1305fdff730e--

