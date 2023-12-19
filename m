Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64489C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:05:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.15541.1702998323229288748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KnptzHw4;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c3fe6c08fso53608585e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 07:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702998322; x=1703603122; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2P7y+SX7a53ZcGVypP9v0dAr7ndpKh402Zit23Bo1ik=;
        b=KnptzHw4nQegPY8Za7qfCGjPTS+IH5PtU7zwoYv+pZ1aaL64juqpn9MxA4h4mX95n2
         lq6wFfKRXWQmvNluIv0Sej2jonNK5ZdWst4Xk2+sPhZniNxQi1G886d019uyevBwj6C8
         RWWDdqItFRLKfDoC2WeVzmL0D5auqRawow1LaFSqI0zn24GPGtenLTec5QnlpSUev6Y9
         p62SqS84p2gTDyFk2/t/Ajauwvp172WE2cxNRAR+46l0LWj/6ptv1mmS7/6JEiHT9lgT
         Avgp5iKiSlpet2WlbSerpVYPKgVuNWa5zLinmkLwWacJpwzE2qXH2BOmmtvETqdBRfkB
         MJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998322; x=1703603122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2P7y+SX7a53ZcGVypP9v0dAr7ndpKh402Zit23Bo1ik=;
        b=CHxzJo035GLjJHpAfiTg3bjV0endhkDhjLHOHbusSLBWij8WPMvKPXCqFRtNvQioqT
         6C7GvfuXhO3WGO4zB1Vjak5O59cYUW2hiw/Isso22NF+dvDrW27UCIVoEfuKcObpLjHV
         uq809JLUelUgmD8xoZHCTb9mnOk/z3v9ZSTyoi9Wgpkr40Qpvr6UxTCeeXr5ckrwvajs
         4cCdOkf/lzHFvPHJVTTbsdW7pUIQ2ZlsO/SqAnt0waiuJKVx5u18CiYT4WKvZCy/JVeo
         OHgLsKWpsbudWMN51jMv5jONGBOQONqNmXJ93a8ENo+rNEp7rixiu0EBl0NATnODoZZT
         mh5g==
X-Gm-Message-State: AOJu0YxiPeoqkh+sK/yq+LLbqRHzDs2OihpA6cgj+sAXTU6u1zoSz3qz
	wfKsYdp907QDeOcTAFrKD2OwMiQbPKNSFxMeuo4=
X-Google-Smtp-Source: AGHT+IGXlrtf2eMcfVr6wXsYZOaiH7vhLmY8wSpimzG1MFqsxmyvxHWMw/5ZBtDo6Oew6REO9uZX7mC1uwsopLNJNmw=
X-Received: by 2002:a05:600c:5188:b0:40c:2cb0:b563 with SMTP id
 fa8-20020a05600c518800b0040c2cb0b563mr6867047wmb.121.1702998321400; Tue, 19
 Dec 2023 07:05:21 -0800 (PST)
MIME-Version: 1.0
References: <CA+cAkeqg51T1u1DuPM_5vx+2gAn-6KxWYfY0GYuXdqvM_mbF4A@mail.gmail.com>
 <CAMKF1soZHS40B7x+YvNF_EvnCk=E1+tcSrmEMXY1MVOUgd6CEw@mail.gmail.com>
 <179E5167E10B4EFD.1352@lists.openembedded.org> <CA+cAkeo==U7BGvsV7Hu-zWf=-BvaTZ95LhHU3RUiKvVQGn7zBw@mail.gmail.com>
In-Reply-To: <CA+cAkeo==U7BGvsV7Hu-zWf=-BvaTZ95LhHU3RUiKvVQGn7zBw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Dec 2023 16:05:08 +0100
Message-ID: <CA+chaQexTWaK9CacKpZZAhFZi5orpoSCtzdnL7Wm=PnHLJgSJQ@mail.gmail.com>
Subject: Re: [oe] Crash cross canadian?
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000001164060cde3204"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 15:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107632

--000000000000001164060cde3204
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe you don't see them because they are already applied:
https://git.openembedded.org/meta-openembedded/commit/?id=3D1f9ad22b28c24a2=
89636b1eb049c491e4529337d

and marked as such in patchwork, see:
https://patchwork.yoctoproject.org/project/oe/list/?series=3D&submitter=3D&=
state=3D*&q=3Dcrash&archive=3Dboth&delegate=3D

There was even reply from Khem saying they are applied, see:
https://patchwork.yoctoproject.org/project/oe/patch/cover.1702798681.git.fr=
ederic.martinsons@gmail.com/

Regards,


On Tue, Dec 19, 2023 at 3:55=E2=80=AFPM Frederic Martinsons <
frederic.martinsons@gmail.com> wrote:

> Hello,
>
> I sent a series for adding cross canadian crash two days ago.
>
> But I didn't see these in patchwork:
> https://patchwork.yoctoproject.org/project/oe/list/
> I thought that was automatic, did I miss something?
>
> Has someone in this list saw my patches or should I resent them ?
>
> On Wed, 6 Dec 2023 at 19:26, Frederic Martinsons via
> lists.openembedded.org <frederic.martinsons=3D
> gmail.com@lists.openembedded.org> wrote:
>
>> Ok great, I'll rebase these on master on the coming days. The problem is
>> that my hardware (pretty specifics) just have been upgraded with Kirksto=
ne
>> and since I will not be able to test those on master branch. At least I =
can
>> make it compile, have you some advices to non regressed crash utility
>> (without involving real target test)?
>>
>> Le mer. 6 d=C3=A9c. 2023, 19:11, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :
>>
>>>
>>>
>>> On Wed, Dec 6, 2023 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons <
>>> frederic.martinsons@gmail.com> wrote:
>>>
>>>> Hello list,
>>>>
>>>> Since some times (back to warrior branch I think), I have in my custom
>>>> layer a cross canadian version from the crash tool, I personnally used=
 it
>>>> for analysing vmcore from an arm target (cortex a53) offline within th=
e sdk.
>>>>
>>>> I recently upgraded to kirsktone and the update of this version was a
>>>> little tricky (must have played with LDFLAGS, gdb target build and hos=
t and
>>>> so on...)
>>>>
>>>> I finally managed to get crash working for all my hardware (both
>>>> include aarch64 and x86-64 arch).
>>>>
>>>> I would like to know if it would be acceptable to have a cross canadia=
n
>>>> arch in meta-openembedded (from what I see, there is only native and t=
arget
>>>> flavor)?
>>>>
>>>
>>> It=E2=80=99s fine. I guess there were no such recipe needing it so far.=
 Please
>>> submit your patches
>>>
>>>
>>>> If you think it is accurate, I'll work to push some patches against
>>>> master.
>>>>
>>>> Please tell me, thanks!
>>>>
>>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107631):
> https://lists.openembedded.org/g/openembedded-devel/message/107631
> Mute This Topic: https://lists.openembedded.org/mt/103018278/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000001164060cde3204
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Maybe you don&#39;t see them because they are already appl=
ied:<div><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?=
id=3D1f9ad22b28c24a289636b1eb049c491e4529337d">https://git.openembedded.org=
/meta-openembedded/commit/?id=3D1f9ad22b28c24a289636b1eb049c491e4529337d</a=
><br></div><div><br></div><div>and marked as such in patchwork, see:</div><=
div><a href=3D"https://patchwork.yoctoproject.org/project/oe/list/?series=
=3D&amp;submitter=3D&amp;state=3D*&amp;q=3Dcrash&amp;archive=3Dboth&amp;del=
egate=3D">https://patchwork.yoctoproject.org/project/oe/list/?series=3D&amp=
;submitter=3D&amp;state=3D*&amp;q=3Dcrash&amp;archive=3Dboth&amp;delegate=
=3D</a><br></div><div><br></div><div>There was even reply from Khem saying =
they are applied, see:</div><div><a href=3D"https://patchwork.yoctoproject.=
org/project/oe/patch/cover.1702798681.git.frederic.martinsons@gmail.com/">h=
ttps://patchwork.yoctoproject.org/project/oe/patch/cover.1702798681.git.fre=
deric.martinsons@gmail.com/</a></div><div><br></div><div>Regards,</div><div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Dec 19, 2023 at 3:55=E2=80=AFPM Frederic Martinsons &lt;=
<a href=3D"mailto:frederic.martinsons@gmail.com">frederic.martinsons@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>I sent a series for add=
ing cross canadian crash two days ago.</div><div><br></div><div>But I didn&=
#39;t see these in patchwork:=C2=A0<a href=3D"https://patchwork.yoctoprojec=
t.org/project/oe/list/" target=3D"_blank">https://patchwork.yoctoproject.or=
g/project/oe/list/</a></div><div>I thought that was automatic, did I miss s=
omething?</div><div><br></div><div>Has someone in this list saw my patches =
or should I resent them ?</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 6 Dec 2023 at 19:26, Frederic Martin=
sons via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.=
openembedded.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@=
lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"auto">Ok great, I&#39;ll rebase these on master on the coming da=
ys. The problem is that my hardware (pretty specifics) just have been upgra=
ded with Kirkstone and since I will not be able to test those on master bra=
nch. At least I can make it compile, have you some advices to non regressed=
 crash utility (without involving real target test)?=C2=A0</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le mer. 6 d=C3=A9=
c. 2023, 19:11, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div><br></div><div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 6, 202=
3 at 10:02=E2=80=AFAM Fr=C3=A9d=C3=A9ric Martinsons &lt;<a href=3D"mailto:f=
rederic.martinsons@gmail.com" rel=3D"noreferrer" target=3D"_blank">frederic=
.martinsons@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"auto">Hello list,<div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Since some times (back to warrior branch I think), I h=
ave in my custom layer a cross canadian version from the crash tool, I pers=
onnally used it for analysing vmcore from an arm target (cortex a53) offlin=
e within the sdk.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I rece=
ntly upgraded to kirsktone and the update of this version was a little tric=
ky (must have played with LDFLAGS, gdb target build and host and so on...)=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I finally managed=
 to get crash working for all my hardware (both include aarch64 and x86-64 =
arch).</div><div dir=3D"auto"><br></div><div dir=3D"auto">I would like to k=
now if it would be acceptable to have a cross canadian arch in meta-openemb=
edded (from what I see, there is only native and target flavor)?=C2=A0</div=
><div dir=3D"auto"></div></div></blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">It=E2=80=99s fine. I guess there were no such recipe needing=
 it so far. Please submit your patches</div><div dir=3D"auto"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=
=3D"auto"><br></div><div dir=3D"auto">If you think it is accurate, I&#39;ll=
 work to push some patches against master.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Please tell me, thanks!=C2=A0</div></div>
</blockquote></div></div>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#107631): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/107631" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/107631</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103018278/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103018278/3617156</a><br>
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

--000000000000001164060cde3204--

