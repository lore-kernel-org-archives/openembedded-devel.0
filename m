Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BA3C369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 07:13:25 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.11695.1745910804148037358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 00:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=N9G/MdzJ;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.218.43, mailfrom: jester@theyoctojester.info)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2963dc379so823877466b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1745910802; x=1746515602; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EmsMod0/pRWgkYGB7IQ4CXlN+AY8dvhjngb9+/voPbg=;
        b=N9G/MdzJLSNnPkxUcdPKzR26yXNm010ztHR7zj/9aih/ezrYFpg24RdvE4vqE2lDfl
         ngv/15Ehxjt2p24+yarVuvahz9FOJEdo25Q32C1P/5sRQH6sKP7Kxcl2YUsIFLm1USr9
         eXiBmpEDq4SMxixMv669ahdi7KHM6Y/BcDKFzXWiW9hmoqaLKVG1Ck9Be6zrjJCZN+Ai
         Rt1WoMhWS3eEnX+r8OXOkVlO3LY0BF/7czy5jXX1jXtmILZbzQbQj911sgJZ9lD1/Rl4
         b6eNpokjtpgxzfLh/ZlI4nb6d9dlEgKDLyB5R69Z6ymBfdeKkakeAIRqrEhx+ck82euN
         VODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745910802; x=1746515602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmsMod0/pRWgkYGB7IQ4CXlN+AY8dvhjngb9+/voPbg=;
        b=bIVnK15lAq7xbfbyW8PAAcNOJUifUra/iu/j+IBrvxFOtit8ngyw3MjBkaV8pz1B2w
         lnND3MxhctJ/ceHtvYnS3LkSTEi49X7homJruHMxx8wjPgBUBEw1ESaby6yEeM9MWlk3
         zLFbFp0FBfIutPk6fYgO+RcpmSfylkQpgMvkTH0aJCj7gCD1pDNIPdduBMe8Ru4ufZDT
         /y4rX469ioslWsEkqQDa32J4Z6KnVdf8LOdm4BjoW5dmo8BqgJyWkjHCCMIdaHsWJx33
         K9Ox7B12bcAkqQ+7vQcHF4e9PnfttrNQtGOZocO8tp5uBfXXrLoDQ8NHPBW350IE7Xdl
         fweg==
X-Forwarded-Encrypted: i=1; AJvYcCUvXwlGweWCX23dcJvyC9f9MEVV4dOtvttumWZagh0dCRspCvHZP2x01e+FgyJbGVxUEe3TUosOsgAHfer1RJtsgSk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx+WSaKFhERwXq2NtpG14EKJmuGPWewEb8w+EwXEPcSSjQnzsRz
	DbXGA2V8KqY3C6cshRYsN5al55aIZg3I3qJ6Ey7moTZ2IEd1ySMiEuioBgKJm+OAyRlCgYO6g/3
	W9T3j3uvcabYSmbvw31RqJKg97KMFX63G+T3+aQ==
X-Gm-Gg: ASbGnctLlewVLuxid3mjDz0WrfCmX3kstxYjitX9WhYHchKTXDihOTqEVoIxDop/qjt
	WQRNntfTnGFYKqWxofShoifNdxJ8aiL62IPc5o2iEYg1boLQEVDd7SEYg6WMnvXtmbV3vJIZezw
	uE32Z2ShiyW/KfqBQ6+KQ9
X-Google-Smtp-Source: AGHT+IGBesPnw4WY8xmbyPDQ9G9oSz3AmGbvuzGWn6SJumEi79TJaL/rGiJ0Ea1YOrnA3AvED20u3nrKZFg+jUKL8hI=
X-Received: by 2002:a17:907:3f9a:b0:abf:6ebf:5500 with SMTP id
 a640c23a62f3a-ace848f78cfmr1100427266b.16.1745910802183; Tue, 29 Apr 2025
 00:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <382f1864-39e5-4c5f-8407-296c64cc7155@windriver.com> <28c0da79-8fcc-45d8-8067-ad1b028472b9@gmail.com>
In-Reply-To: <28c0da79-8fcc-45d8-8067-ad1b028472b9@gmail.com>
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Tue, 29 Apr 2025 09:12:56 +0200
X-Gm-Features: ATxdqUEzFYLa_Mv0tDoAC9-OCOOyAB7BBf4c1YJEqn3zdhBgjd72QPNlPa_OGB0
Message-ID: <CAEt6Nwo_Qo46KXVv2xt7+NH-UEAkYkbipE5ToKdO+usaW3pfkg@mail.gmail.com>
Subject: Re: [oe] About Nmap License
To: skandigraun@gmail.com
Cc: yi.zhao@eng.windriver.com, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002c88360633e58971"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 07:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117229

--0000000000002c88360633e58971
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Howdy

On Mon, Apr 28, 2025 at 9:10=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

>
> On 4/27/25 09:39, Yi Zhao via lists.openembedded.org wrote:
> > Hi all,
> >
> >
> > The nmap has changed its license to NPSL (Nmap Public Source License)
> > since 7.90[1][2]. This has caused a lot of discussion, as NPSL is no
> > longer considered a FLOSS license[3].
> >
> > According to [1] and [4], 7.92 is the last dual-licensed version:
> > "Note that some releases of Nmap may fall under a previous version of
> > this license, or a different license entirely. The exact terms for a
> > given version of Nmap can be found in the included LICENSE or COPYING
> > file. To ease the transition to the NPSL, the first three Nmap releases
> > made under that license (Nmap 7.90, 7.91, and 7.92) may also be used
> > under the previous Nmap license terms by anyone who prefers those. "
> >
> > For other distributions, Fedora has kept nmap at 7.92[5]. Suse has kept
> > 7.92 in OSS repo and moved 7.93+later to Non-OSS repo[6].
> >
> > So do we need add a recipe for 7.92 and set it to default build?
> I don't have a lot of opinion about setting default versions, but for
> what it's worth, I think it would make sense to have a separate recipe
> with the last GPLv2 version.
>

That's essentially what meta-gplv2 (
https://layers.openembedded.org/layerindex/branch/master/layer/meta-gplv2/)
was for. It was a transitionary solution, and its dead and gone now.


> >
> >
> > [1] https://nmap.org/npsl/
> > [2] https://lwn.net/Articles/842436/
> > [3] https://github.com/nmap/nmap/issues/2199
> > [4] https://nmap.org/changelog.html#7.92
> > [5] https://bugzilla.redhat.com/show_bug.cgi?id=3D2296006
> > [6] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1211571
> >
> >
> > Thanks,
> >
> > Yi
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> You automatically follow any topics you start or reply to.
> View/Reply Online (#117203):
> https://lists.openembedded.org/g/openembedded-devel/message/117203
> Mute This Topic: https://lists.openembedded.org/mt/112479917/4689568
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> jester@theyoctojester.info]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002c88360633e58971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Howdy</div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 28, 2025 at 9:=
10=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex"><br>
On 4/27/25 09:39, Yi Zhao via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt;<br>
&gt; The nmap has changed its license to NPSL (Nmap Public Source License) =
<br>
&gt; since 7.90[1][2]. This has caused a lot of discussion, as NPSL is no <=
br>
&gt; longer considered a FLOSS license[3].<br>
&gt;<br>
&gt; According to [1] and [4], 7.92 is the last dual-licensed version:<br>
&gt; &quot;Note that some releases of Nmap may fall under a previous versio=
n of <br>
&gt; this license, or a different license entirely. The exact terms for a <=
br>
&gt; given version of Nmap can be found in the included LICENSE or COPYING =
<br>
&gt; file. To ease the transition to the NPSL, the first three Nmap release=
s <br>
&gt; made under that license (Nmap 7.90, 7.91, and 7.92) may also be used <=
br>
&gt; under the previous Nmap license terms by anyone who prefers those. &qu=
ot;<br>
&gt;<br>
&gt; For other distributions, Fedora has kept nmap at 7.92[5]. Suse has kep=
t <br>
&gt; 7.92 in OSS repo and moved 7.93+later to Non-OSS repo[6].<br>
&gt;<br>
&gt; So do we need add a recipe for 7.92 and set it to default build?<br>
I don&#39;t have a lot of opinion about setting default versions, but for<b=
r>
what it&#39;s worth, I think it would make sense to have a separate recipe<=
br>
with the last GPLv2 version.<br></blockquote><div><br></div><div>That&#39;s=
 essentially what meta-gplv2 (<a href=3D"https://layers.openembedded.org/la=
yerindex/branch/master/layer/meta-gplv2/">https://layers.openembedded.org/l=
ayerindex/branch/master/layer/meta-gplv2/</a>) was for. It was a transition=
ary solution, and its dead and gone now.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1=
px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:=
1ex">
&gt;<br>
&gt;<br>
&gt; [1] <a href=3D"https://nmap.org/npsl/" rel=3D"noreferrer" target=3D"_b=
lank">https://nmap.org/npsl/</a><br>
&gt; [2] <a href=3D"https://lwn.net/Articles/842436/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lwn.net/Articles/842436/</a><br>
&gt; [3] <a href=3D"https://github.com/nmap/nmap/issues/2199" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/nmap/nmap/issues/2199</a><br>
&gt; [4] <a href=3D"https://nmap.org/changelog.html#7.92" rel=3D"noreferrer=
" target=3D"_blank">https://nmap.org/changelog.html#7.92</a><br>
&gt; [5] <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2296006" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.c=
gi?id=3D2296006</a><br>
&gt; [6] <a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D1211571=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.opensuse.org/show_b=
ug.cgi?id=3D1211571</a><br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Yi<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
You automatically follow any topics you start or reply to.<br>
View/Reply Online (#117203): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117203" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117203</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112479917/468=
9568" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112479917/4689568</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:jester@theyoctojester.in=
fo" target=3D"_blank">jester@theyoctojester.info</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002c88360633e58971--

