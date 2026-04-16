Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B84F433D6
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 01:42:25 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3369.1776303739780516833
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 18:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c6hCIzIB;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-652f220595fso879572d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 18:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776303739; cv=none;
        d=google.com; s=arc-20240605;
        b=lQkHFBhEoco6H//wZwh2wATanN+Fc+q2yGVdCkPtgJm7I1xz59bM5Y5t5q8Q71BZ3m
         HBk3yshrzAcnd921wTaSBdzEoO3lWiAEL0MF3ZNPh69AEWpvsoWNnHcYyUc3Mff7KiQL
         2jLDOfyoD92wMpuDCh1kPi1h4beKgF1RYz8jFPcJpDfbtVwjpAgLb/OKgFanK+RdgvM9
         BQ+gL9ziGYcjiAqTXY8VvpBXg7yus/9ldkeU+GsSROkUOGY5qRWdEK8T1w6Md37YtpfA
         hi6aOPXs1ACVwQAdrP44K/wq8nDkP9BPwaYv2tW8uDChSw4C/nnWLHHHKOmxgPx1Hegs
         l3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tvckdOT64uzXUwhWfOC5aVq8QHGMX6/nKCnxatbdgt0=;
        fh=tvH0fRzsTzWp7W9pVcVBj/Hg9HcaDtV/l9F/msdGtu4=;
        b=SCCjtgvw/g6Rn9tYHZyedYRAgzBQaDvXM42Ini7BF06kOc8Lt0Ad3zH8V2zVmXrILS
         4P9sI3aiVYHxqA6DN3N6MHxNipfI85chz88eYMuvWfxzsBd9hnXaQvUECf0WWELLSok9
         HcEk8KiLSJuTyruIGRDUqP7hFZSZqRDM4/OQfVY05DQP83pJp+9LEJkeGAyLSh1jQ8Lf
         IjHqWqJP6HYlIg+u3nIBBYjUwrkesUztCYzNgMpoWxS2C1qLtZYK1EV4nC563hO5X2Rl
         mwLqkrAfRU5lvag2cwkU8fBgRASm0v1nXvLpubyUS+jWWNQ9Xp3PlDX534SKkIOl/N1m
         ax3A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776303739; x=1776908539; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tvckdOT64uzXUwhWfOC5aVq8QHGMX6/nKCnxatbdgt0=;
        b=c6hCIzIB8EQdEmRVEsj0BX+auyo+JxHgkM0oU+Y1DYL4OJ2S8r2GlgVN0ihA0A+6ax
         Kn2Ioz3KpiCn2yICD41uRwozWGzIAgN/ZRlyyMK9k9+cBRKpb0XnntokCEzlkTuyX4X9
         SPf6Jfk7bX2bj3TdQaucxqIp1PDhUvzV/zXWV77BlbtprTDQxdBGaoHulZLT0QQw33k4
         bHh43wnLQ2RF/UIQMxbAJPyOuXLIZ+G+3qq+vmoBnBCxdnkbd9Awi++iYKaHS7KzYVjj
         b1FTB0gL4899qDrQJVCoY6zS8NTCcviZk4rRkO8Yoj8Zme8fDxi/CFbphyOMp3D0HSD7
         UIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776303739; x=1776908539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvckdOT64uzXUwhWfOC5aVq8QHGMX6/nKCnxatbdgt0=;
        b=kV8Mmy51Aom5qqeJXLr+bC3D3r0oORCgjah884X61hl3x3uur2CBOEiLAbAVBJJG2C
         FFtw8IeQtw9KaUTrXraDRQ3fW32/hpfJiNLzjcQ81kzNg6divFPB5B3b9GLiJ1U4i7Dt
         sZu+hlmm4mMbEENZ2MyMnF0UIgf/vpZ5k+UwdSz0R8zQnJkuj7lfFq7LsVAyYWw7ul/W
         XsDDAkKQtrnVdV81L1QDSILag7PFq7On8/3TwmphxVIsjdaiV3eR/J8er1LsQpUhl8Is
         1TfSK0K+MYiSJ5rRo5LMRDfPFfOKFHt/tS0Wu3Rli2yZYV83QpDFErtzSidgqXUE2ywB
         CfeQ==
X-Gm-Message-State: AOJu0YzbmjZERHfMn1hbpvYNtWfON5oYB2gorzOeR8JwQT0TiVNsZoRS
	m9Mrpv6xcWll7zC3DY73PQD6rHij2A15WdMVf2y3yYJQ8zj9iYymx54TyUlTOZlIGIwVn6srdQ8
	rY0WB4To4o9ANt3Ku0ixHbOhokKFfd/lMIWGx
X-Gm-Gg: AeBDiesPcNsYyBX6f18GPOUx971Fb+G8IEy1Fq2EQucelfcGEq7v3aWDWtIr9kIbuQ2
	zpcAx9FRSAXj57fxDk1cDJ8BqMxeQTcdxPyq1hWe2kQrnzYC0aykeFK8V81V2PwcHro6caui1eV
	laG+ux8fDuYqrGxGv12TMMU+1bSza+ONBt8I0CKiLDDDAtorM1Kj3igeNqnM6FHSI8iB4BSyUfd
	RXKvc0EL8LblXuS6QMaIVv79JtPIMdWWr/Q/B3ywppGXUlLYJ8k3+Wwt4e5BF+ITnsOTI1HTzR1
	sjieHyUvViMtn7/A2a/1Y53FAcalb+FRHwALw7fvMl3cAtCV/L3iEzSbMm4HMg0p009wr/kxC2v
	zVCHS4LEh3U1fIeHngRErBIk/qMFoBmU10Mt2ii5G5t+ST1lKxTnKV5L2pFYWPTnxiSXPlCFMG7
	bKO8CsxHsbtFA6Op4=
X-Received: by 2002:a05:690e:b81:b0:651:ddd4:f4ec with SMTP id
 956f58d0204a3-651ddd545f0mr9619414d50.61.1776303738768; Wed, 15 Apr 2026
 18:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqRqM_7By=0ntP2AWyfricTQMn34i-hZv-4xSfCvLHTxA@mail.gmail.com>
 <7DE05FF4-B88D-4D86-A6BE-8EDC1DD90E2A@michael-fitzmayer.de>
In-Reply-To: <7DE05FF4-B88D-4D86-A6BE-8EDC1DD90E2A@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Apr 2026 18:41:52 -0700
X-Gm-Features: AQROBzBnGTJ8PcpJWvBP_vNhi2mBiKBTVUky-y_HrLj1yDPSDl-qOAvqksrpeAc
Message-ID: <CAMKF1sqWpfSsFVSiBkiQCQkv0pjTSh1i9HJuX06E_EkBd4jmyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to release version 2.02
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005cd1fb064f89f147"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 01:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126375

--0000000000005cd1fb064f89f147
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 6:14=E2=80=AFPM Michael Fitzmayer via lists.openemb=
edded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:

>
>
> > On 16. Apr 2026, at 00:08, Khem Raj <raj.khem@gmail.com> wrote:
> > =EF=BB=BF
> > Seeing a patch fuzz. Did you do a build test ?
> >
>
> I manually edited the upstream status after patchtest reported a problem,
> but yes.
>
> I built it and ran qemu afterwards to see if everything works as expected=
.
>
> What can I do to resolve this problem?
>

bitbake recipe -ccleanall
bitbake recipe

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126374):
> https://lists.openembedded.org/g/openembedded-devel/message/126374
> Mute This Topic: https://lists.openembedded.org/mt/118838261/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005cd1fb064f89f147
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 15,=
 2026 at 6:14=E2=80=AFPM Michael Fitzmayer via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;mail=3D<a href=3D"mailto:micha=
el-fitzmayer.de@lists.openembedded.org">michael-fitzmayer.de@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>
<br>
&gt; On 16. Apr 2026, at 00:08, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; =EF=BB=BF<br>
&gt; Seeing a patch fuzz. Did you do a build test ?<br>
&gt; <br>
<br>
I manually edited the upstream status after patchtest reported a problem, b=
ut yes.<br>
<br>
I built it and ran qemu afterwards to see if everything works as expected.<=
br>
<br>
What can I do to resolve this problem?<br></blockquote><div><br></div><div>=
bitbake recipe -ccleanall</div><div>bitbake recipe=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126374): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126374" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126374</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118838261/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118838261/1997914</a><br>
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

--0000000000005cd1fb064f89f147--

