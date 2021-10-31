Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2851DC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 18:30:37 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.33861.1635705036064601560
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 11:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z3tsEkUe;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id m21so15150217pgu.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VmSbOJUqGQI9M2fYFl5Xmja9BsyrKZwtR6Ax0FbcT4I=;
        b=Z3tsEkUeMyPOpcDJs8r3rqGtSl1FQYmbfWM5HW5W9LT4xyvCwZ2gwcDtL+ts9Emy7u
         7LriuxY4cHq5lFqhX8UupbR9Mw4KgXIMmH+AHfTgmiVNZEmo6dj0hgKnbhp0+U//HHv+
         cdXyyaiFTsqsmOlH3dcdRCz1b9zElIbVRAyC/e4lowMd+/A7lBHKrEfBWQRVKj5Bkrhu
         O1rSNhswTUrfo88Ap1QqZI4nBPVF0I47mbeDgPmudcsy81wiIs6wvtrALGKnMeH/uSU8
         j9kZWFx4/kPU4q2Y8y/gWRCiAB9Y9m072oyxfuXVGUNxAaUemVZ39dqvc9IKk1aVRmp4
         Jwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VmSbOJUqGQI9M2fYFl5Xmja9BsyrKZwtR6Ax0FbcT4I=;
        b=Q3PG6lvhmw6P9irmQtVMyVsWJKxe3adPNbgMUPdeGnkRzYvkpHwSsSn66F4ren8Ya7
         4ZpOn7ICf8dRqbOUkLZF3EpYvZ4AMjGx/NlHxlaIK8Ouyun6GFUodmgZpnH3YVjkYtTt
         pj4EUdLRyfY7sBKqVK2xYezrR2vZR6BzAWgYjpN8mHcidwceCT3BBKkRLszjEB3Nsqf0
         xA7+dGE96JPIHiM+wa0u9OAfMGRy4AFcmu10Ikxjh0G7JYA6zYWZj6u0xhJ87CRxim9V
         FPFhdk6g2Fsmdq71FJWYHpnsu97ZKo9hYqtYZqsnxl+Jr5Qlh9C0dOoJ+TQ++VdiHEa7
         L4fQ==
X-Gm-Message-State: AOAM5307sX94sDce3D46zeY7IcT8OgVbZmmtL/KTFXNCpFhW9YEJCwEH
	YLOJVmZpqjDSQpZUPCWTA2BfIF5IeO8bRBdwjGQ=
X-Google-Smtp-Source: 
 ABdhPJwjOBPcXx6lJkYE1exRRGY3dzP9FCbrcH9K/fAmaYRpFBtmLcl7FMaG5kuVpcZpLhW/ohWz7IOepfCZo3j9UAk=
X-Received: by 2002:a63:1cd:: with SMTP id 196mr18125420pgb.39.1635705035579;
 Sun, 31 Oct 2021 11:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <1a982ca4-a237-d4c7-bc1d-ae3669f3dd0f@gmail.com>
In-Reply-To: <1a982ca4-a237-d4c7-bc1d-ae3669f3dd0f@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 31 Oct 2021 19:30:24 +0100
Message-ID: 
 <CA+chaQe6wMKxfRqq9GcP++d8nRtpBw+iWBSewN5QzwvfeBoe3w@mail.gmail.com>
Subject: Re: [oe] dunfell-next merge request Oct 19th
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009a63b405cfaa41da"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Oct 2021 18:30:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93681

--0000000000009a63b405cfaa41da
Content-Type: text/plain; charset="UTF-8"

FYI: The same is now needed for hardknott as well after last
oe-core/hardknott update.

On Tue, Oct 19, 2021 at 5:22 PM Armin Kuster <akuster808@gmail.com> wrote:

> The following changes since commit
> 3cf22d15885cf0e3e16078705e9a20f3d21f12db:
>
>   tcpdump: Update CVE-2020-8037 tag (2021-10-01 14:49:10 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 814eec96c2a29172da57a425a3609f8b6fcc6afe:
>
>   gattlib: Place pkgconfig file in correct package (2021-10-14 13:57:41
> -0700)
>
> ----------------------------------------------------------------
> Konrad Weihmann (1):
>       gattlib: remove includedir from base package
>
> Richard Purdie (1):
>       gattlib: Place pkgconfig file in correct package
>
>  meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93471):
> https://lists.openembedded.org/g/openembedded-devel/message/93471
> Mute This Topic: https://lists.openembedded.org/mt/86442364/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009a63b405cfaa41da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI: The same is now needed for hardknott as well after la=
st oe-core/hardknott update.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Oct 19, 2021 at 5:22 PM Armin Kuster =
&lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The followi=
ng changes since commit 3cf22d15885cf0e3e16078705e9a20f3d21f12db:<br>
<br>
=C2=A0 tcpdump: Update CVE-2020-8037 tag (2021-10-01 14:49:10 -0700)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded" rel=3D"no=
referrer" target=3D"_blank">https://git.openembedded.org/meta-openembedded<=
/a> dunfell-next<br>
<br>
for you to fetch changes up to 814eec96c2a29172da57a425a3609f8b6fcc6afe:<br=
>
<br>
=C2=A0 gattlib: Place pkgconfig file in correct package (2021-10-14 13:57:4=
1<br>
-0700)<br>
<br>
----------------------------------------------------------------<br>
Konrad Weihmann (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gattlib: remove includedir from base package=
<br>
<br>
Richard Purdie (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gattlib: Place pkgconfig file in correct pac=
kage<br>
<br>
=C2=A0meta-oe/recipes-connectivity/gattlib/<a href=3D"http://gattlib_git.bb=
" rel=3D"noreferrer" target=3D"_blank">gattlib_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93471): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93471" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93471</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86442364/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86442364/3617156</a><br>
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

--0000000000009a63b405cfaa41da--

