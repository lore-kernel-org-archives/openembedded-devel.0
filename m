Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76590CEE344
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 17:33:10 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2656.1763487189238688732
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 09:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dC4HiSE3;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63e19642764so4857748d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763487188; x=1764091988; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zw2H33lbMYNeuJbKj39Rn6GP309h8PRbJELCI08fHuM=;
        b=dC4HiSE3xNuswVCoKCYbKUr2OCr9wNViPNQY8kTCNc7Ky2SJxrJ59cJniiFv2peFYR
         oISf3ydUZPRi0QopsiKbuo+6s9/Nl18ZIZCOjrdpdL6k6n8IL7Bk343zZo0/wXl9jNpf
         7sIEy4Vs9jiKgS74leGDfDsSHPlW4cI5PaX0Jx+5LFhjrqjy9VY8F/Odf6IxP0Sv+W4v
         bwEAC2Ivt+WMc8JijWXq86motfHUCd1IWRaJqu2GhbHsh9/xo4TQfZpwhLdrLUMXX8T+
         nCYo/Fwa0F5FAM2s9T9jtKlqIfKW0nAvG2aVzZXjQ2olEqISLvanN+E9zzKatFTAFCpw
         BeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487188; x=1764091988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zw2H33lbMYNeuJbKj39Rn6GP309h8PRbJELCI08fHuM=;
        b=D2kfkjVY6DxUYpKor2cqwsXP98gBk0divohaEGzxzALVibqogp4F8VA7wezY87+RJu
         yswSS0V8vJ1jkX6wyqyHNWimfBhzwn+tlyUWokqIErIBg405h+TX8s8rUo2EHSzEeGDG
         xVdlEjcFrn083XPhCL5cGcqATWzbuzLZb1Hl/OOFcrSjtlYQSvks+I7CCjMPhAfsWlAl
         iYQqp9LL6Qxsmi3knz4O3iAX6kSUI+PIoAOqL+Dg9qtFkZbXhQ83lodyo+f+BV5EynFH
         bkENVjLK6ONnEV4FeKBP5KX0wUJtGqRhUM7bdyIjTM3XvuIuu8I1h32VT8UvfnZ8+B61
         cNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzpko7TlRoznAzMlGV0Xyo7lYA1PJ3bS+K2zRZzHlhZgCpP/mcpe7zYRae/HEpCNN/7timL35dVUUzq0tRLoH0PO0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzaeupzZQ2q6bvII3r6eUUgHt6mz5HRLtoLz3wSD4WPNV1k2Piu
	pTsyLtEL3fLBy/mwvbehQMIo/RYYqn6tMZVWoyqEq3+W+3ei64jYFB/+vO8xt4YUlKQmM7E751K
	ser6oQBdndcX0FSwPyVyyKMZA85QIcUQ=
X-Gm-Gg: ASbGnctg9houAhwYxH/4xAK/0IXMyZf4X2tfO4MJdsPe8nc+CCVPnvF5v3HUXRWcQzT
	Q4jKvAj/EHM3SYGAwbqTIDxP2zOx2RgQJ0sN7lq88W4/TmzVb4RDyz1405ceEtLQk46u68FZkNf
	2g/h1O7W1+1pAgOrZTFj/wduvNjR49ItGNuzlsO9dVanvL/gy8JRyxgY3tfw/ufTHaeqidD51uc
	792+Z2MEwi2SNZaX7GWXmQD8fh72o+JVBMkF3TqfIMvT8w/vDJIggGApwNvMQiqpJWEwpcWXyFs
	n1pmcMGhDwWMUYrH4cmBIQEUHoM4aRI9c38kh1GguPf1c41C9wwnX7/vmMWqKVnYF37ZdB/vZ3r
	HdbnyEC3f1XQOsCn77XbW4A==
X-Google-Smtp-Source: AGHT+IEylohsJ6ihZyeHYSDEdqpGcOuUMI/DVd3zIO9nDD9RH548aSukdwV9kalzaMN3aLziX8yE/D9VewhT2JwwSxQ=
X-Received: by 2002:a05:690e:2501:10b0:63f:bab4:fdd3 with SMTP id
 956f58d0204a3-641e7553220mr11960467d50.3.1763487188290; Tue, 18 Nov 2025
 09:33:08 -0800 (PST)
MIME-Version: 1.0
References: <20251117093853.844143-1-skandigraun@gmail.com>
 <BA866AFA-CD11-4615-8AA4-04646194A330@arm.com> <CAMKF1sq9Oi45L2okL4PtEwCQNmeMAa7UjuNnQOwEd=VUU20JJQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq9Oi45L2okL4PtEwCQNmeMAa7UjuNnQOwEd=VUU20JJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Nov 2025 09:32:42 -0800
X-Gm-Features: AWmQ_bkDcIzNUEl85hY9lT6hBzFFIVrXKwRzEZfcWP4vjTXQHyoIYqpiEsDiqpU
Message-ID: <CAMKF1soFfGk3hH0JgKRmqomuFbDj1vx9Th29Ek8pZxBur2N+Ng@mail.gmail.com>
Subject: Re: [oe] CVE report - master - 2025-11-17
To: ross.burton@arm.com
Cc: "skandigraun@gmail.com" <skandigraun@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006c90ac0643e1db66"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 17:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121865

--0000000000006c90ac0643e1db66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yasm was punted as dependency in chromium 6 years ago.

https://chromium.googlesource.com/chromium/src/third_party/yasm/+/306b2b1d4=
fdb53a7ede81911a02dfd4b8efbfe4d

On Tue, Nov 18, 2025 at 7:54=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

>
>
> On Tue, Nov 18, 2025 at 6:53=E2=80=AFAM Ross Burton via lists.openembedde=
d.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
>> On 17 Nov 2025, at 09:38, Gyorgy Sarvari via lists.openembedded.org
>> <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-3345=
5
>> > - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-3345=
7
>> > - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-3345=
8
>> > - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-3345=
9
>> > - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-3346=
0
>> > - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-3346=
1
>> > - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-3346=
2
>> > - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-3346=
3
>> > - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-3346=
5
>> > - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-3346=
6
>> > - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-3346=
7
>> > - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-3346=
8
>> > - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-3040=
2
>> > - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-3197=
2
>> > - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-3197=
3
>> > - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-3197=
4
>> > - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-5125=
8
>>
>> Proposal: delete yasm.  It advertises itself as a rewrite of nasm, but
>> nasm is still alive and did a major release just a few months ago. Nothi=
ng
>> else in meta-oe depends on yasm, and according to the layer index[1] the
>> only interesting recipe that depends on yasm is chromium, which I basica=
lly
>> refuse to believe won=E2=80=99t work with nasm (mainly as the debian pac=
kaging for
>> chromium doesn=E2=80=99t depend on nasm or yasm[2] so this dependency is=
 likely
>> obsolete now).
>>
>> I can send a patch... :)
>
>
> I think we need to ensure chromium can still build without it otherwise I
> am with you on this proposal
>
>>
>>
>> Cheers,
>> Ross
>>
>> [1]
>> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dde=
pends%3Ayasm-native
>> [2]
>> https://salsa.debian.org/chromium-team/chromium/-/blob/master/debian/con=
trol
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121860):
>> https://lists.openembedded.org/g/openembedded-devel/message/121860
>> Mute This Topic: https://lists.openembedded.org/mt/116334910/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000006c90ac0643e1db66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">yasm was punted as dependency in chromium 6 years ago.<div=
><br></div><div><a href=3D"https://chromium.googlesource.com/chromium/src/t=
hird_party/yasm/+/306b2b1d4fdb53a7ede81911a02dfd4b8efbfe4d">https://chromiu=
m.googlesource.com/chromium/src/third_party/yasm/+/306b2b1d4fdb53a7ede81911=
a02dfd4b8efbfe4d</a></div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 18, 2025 at 7:5=
4=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Nov 18, 2025 at 6:53=E2=80=AFAM Ross Burton vi=
a <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openemb=
edded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedde=
d.org" target=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On 17 Nov 2025, at 0=
9:38, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;skandigraun=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.=
com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; - yasm: CVE-2021-33455: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33455" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33455</a><br>
&gt; - yasm: CVE-2021-33457: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33457" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33457</a><br>
&gt; - yasm: CVE-2021-33458: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33458" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33458</a><br>
&gt; - yasm: CVE-2021-33459: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33459" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33459</a><br>
&gt; - yasm: CVE-2021-33460: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33460" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33460</a><br>
&gt; - yasm: CVE-2021-33461: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33461" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33461</a><br>
&gt; - yasm: CVE-2021-33462: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33462" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33462</a><br>
&gt; - yasm: CVE-2021-33463: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33463" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33463</a><br>
&gt; - yasm: CVE-2021-33465: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33465" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33465</a><br>
&gt; - yasm: CVE-2021-33466: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33466" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33466</a><br>
&gt; - yasm: CVE-2021-33467: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33467" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33467</a><br>
&gt; - yasm: CVE-2021-33468: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33468" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33468</a><br>
&gt; - yasm: CVE-2023-30402: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-30402" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-30402</a><br>
&gt; - yasm: CVE-2023-31972: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-31972" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-31972</a><br>
&gt; - yasm: CVE-2023-31973: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-31973" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-31973</a><br>
&gt; - yasm: CVE-2023-31974: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-31974" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-31974</a><br>
&gt; - yasm: CVE-2023-51258: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-51258" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-51258</a><br>
<br>
Proposal: delete yasm.=C2=A0 It advertises itself as a rewrite of nasm, but=
 nasm is still alive and did a major release just a few months ago. Nothing=
 else in meta-oe depends on yasm, and according to the layer index[1] the o=
nly interesting recipe that depends on yasm is chromium, which I basically =
refuse to believe won=E2=80=99t work with nasm (mainly as the debian packag=
ing for chromium doesn=E2=80=99t depend on nasm or yasm[2] so this dependen=
cy is likely obsolete now).<br>
<br>
I can send a patch... :)</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I think we need to ensure chromium can still build without it oth=
erwise I am with you on this proposal=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
Ross<br>
<br>
[1] <a href=3D"https://layers.openembedded.org/layerindex/branch/master/rec=
ipes/?q=3Ddepends%3Ayasm-native" rel=3D"noreferrer" target=3D"_blank">https=
://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3A=
yasm-native</a><br>
[2] <a href=3D"https://salsa.debian.org/chromium-team/chromium/-/blob/maste=
r/debian/control" rel=3D"noreferrer" target=3D"_blank">https://salsa.debian=
.org/chromium-team/chromium/-/blob/master/debian/control</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121860): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121860" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121860</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116334910/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116334910/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>

--0000000000006c90ac0643e1db66--

