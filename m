Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950AAE6BF1B
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 14:57:40 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12322.1769785053246432048
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 06:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJEFD8vr;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59deec3d8dcso2859309e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 06:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769785051; cv=none;
        d=google.com; s=arc-20240605;
        b=amXQrmmTf0MV8x2DTO2iWjz+z7vUMBYYB+yLBU6Vy1sEeWrqHnHDWP70dvfpbcDKfG
         tbqHR3S8fMM/rNCIp70mbwWntgXoXMC29+AdTZhPAE981X4PCGMKwYAHiYhzoj4nQ8jT
         nmLMbfKArbaDZdwUIDIoOvBo2/1OrsMN1vqwNsF/A22Y1wJiXgng8e8SJsqVHFvoOT8p
         Tnljds5Ff1jsZWvW9EL3PNSY9j4MP1mAV7uuusv2Hx+6yu98wM2RKXsroYv8TMz1wKqP
         /+Cte3S7cMfYXgeQyyL8Qn1wWIhijYuom8046/r5Jdm4Mp5+anejZIJPF3YidwVsAJfu
         Qt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8gjDnAGzFQJA7eTAgUBXqGYf5C1GzBGcU0ZtdT/fuQg=;
        fh=iuPgE0vqCia+ULEOAROykHtInCWNdKWkXhHUfxtB2n4=;
        b=epQC+O1aA3caK9VLcMf1Y0WsUY2Q6upVuHCHZaTA/55oydj6eeuZnx+yRFKLAXk1Kh
         s0vucbPy3KRHkC7p1Y7VEk4IfuhjPVHGphgczsG3X1ZIIhu98geK1fOAC9RXGUg5r1Zx
         4tQaE3h7hqVURznPqHJO7Q2DmaQplFgcY4Wi9KvbWLEFXp/GVxowxey6bSNZrRw40oIP
         OBrx2MGJy4gQpkAtjpK0iEWfk7n1Bc8TO0lDSLrmG+DMF7sQ7Mq5qx0uT5mOqNk+9GIE
         ww9CUQ0203mBb0sUNcNhc8AHSqLrdkIKDwnLsEiBBy74SHVXDuYrnBp8QdL/VzrwpADz
         nS+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769785051; x=1770389851; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8gjDnAGzFQJA7eTAgUBXqGYf5C1GzBGcU0ZtdT/fuQg=;
        b=VJEFD8vrJfh2mQgnCbX5JwLT2mna7yQqcaxcGNm0wMsFd9d/eyQ5toQn4qENOJEP6Q
         Y9p5+C3LzDNUtaFGYilyKdDw/Rhs/PUCZn94s3jyLfCnTf/M6yUR+f0zWJECS1L8kFrC
         UAAEE5v+duSWDlbRZ10D0PrAUP+Pgp8ZTiQAytRPexEx1YKR7HJn0EJw5/UP9dni4OKl
         jNV+XR/qkCNpqu/ZmgCnx2tlz8AOVpbcks9hMUjtkWSYqlVmXJE/QuR/Mavr6HsZOssE
         Hg/ABcQGG6q4ZIrC9QCQefD3px0cOnbIAQMBe2PRnzn1n7i+lwEXswaYolUxCec+fkLo
         ebwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785051; x=1770389851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gjDnAGzFQJA7eTAgUBXqGYf5C1GzBGcU0ZtdT/fuQg=;
        b=IkZn8MCNDsLprE6WfQ5tEhXIT4cZQZXyEQA/Y2lbih6Pn0j3AK1YIgPCJvPTRdWUbs
         1hCa011qtBX/V4k1zI7Ksffn/He7Pq5RIK3IhNrqz9Q3SGBkFTd7cRv6CU23Xn3rQZsN
         XBOJ5vEFkM6s3nNypOXsKu2wc4HaFLvmS4ENGVc6ajP/AYcIcCx4t6ldx8IqEGtU49RY
         qStYvjOySxb/ToX/68PTTySnSpfyo9Ie9dcV0LDx36bYavRWn5O2g1fEL5Fh3eYcaDRI
         uA5kIWbTqFSwGfY3pY8FXtibpMh3AI1HjPwK47TgohegrYN7ILXxtDxji+OI9OG8NdKo
         XKZA==
X-Gm-Message-State: AOJu0YytYHcJdD2Boy4V/XARUu9EsiHt6vyxzSxdo/NWfhMG7Eklf8U4
	EqweKxRd5VTOoN/ZqRhwU7yjM4a9p/M+I/n3gfCwIwTzLiixmr0/2uCPMDW3hMm77Je8YExndN/
	r/wFNqveLwZGMDTIWSwBC9hSHnWN6lxc=
X-Gm-Gg: AZuq6aJMQ4pJ97pICQRNLqFzAwmJ+qXRraj8msZvISiWv4i+fq5hkayH7Fhtjrm8PgY
	YIUjJCSkqDzLR5yqFw02HlsFyYCI+alSv9zpvOeSjlv3R7sXFhuYBa0inbr4kB0R2+XYtVx1zy1
	D2Em3IXnvTGmu1aOZ220h3s0CxS4K1SY8otH89D1hJ5LuovBk9Fs8xhuvGCmxAmCT0QiGys4Kxm
	sSgYCpVYXIMj7XbhlJecG+vQCMp6qFl0pypR6CtHzby7MONQxPlvRVMGxj7gln8W9tCEG8=
X-Received: by 2002:ac2:51cf:0:b0:59e:15a:d704 with SMTP id
 2adb3069b0e04-59e163fd66fmr1169881e87.13.1769785050646; Fri, 30 Jan 2026
 06:57:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769715106.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1769715106.git.tim.orling@konsulko.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 30 Jan 2026 06:57:18 -0800
X-Gm-Features: AZwV_QjgLmLok3HKX6H6Tzx5zbnbhhAhexPJeMSITm9RkdQnU5PkYHqmN3ijUWo
Message-ID: <CANx9H-DD_jB88w3FQjkzHK5iqHbDOHqy=nEh75ca9T1OAB_Fpg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/3] Upgrade python3-orjson and enable ptest
To: tim.orling@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000045ca0206499c31a4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 14:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124012

--00000000000045ca0206499c31a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please hold off on this series, (1) I forgot to include the updates
python3-orjson-crates.inc
and (2) python3-pendulum had a new release which should allow us to build
it with python 3.14
and improve ptest passing.

On Thu, Jan 29, 2026 at 5:07=E2=80=AFPM Tim Orling via lists.openembedded.o=
rg
<tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:

> From: Tim Orling <tim.orling@konsulko.com>
>
> This series upgrades python3-orjson to 3.11.6 and patches it to support
> building on non-x86* architectures like riscv64 and arm64.
>
> 7 of the ptests are skipped because of missing python3-pendulum, but it
> does
> not yet support python 3.14.x
>
> Tested on qemux86-64, qemuriscv64 and qemuarm64.
>
> The following changes since commit
> 7bbe4a4e200452b1fd6c09c7fcf36c4b229146f6:
>
>   php: upgrade 8.5.1 -> 8.5.2 (2026-01-20 14:35:59 -0800)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib
> timo/python3-orjson-3.11.6
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/pyth=
on3-orjson-3.11.6
>
> for you to fetch changes up to ecd3b46d0c63b03fc434ee3763292acab1463941:
>
>   python3-orjson: use git fetcher; enable ptest (2026-01-29 11:26:47 -080=
0)
>
> ----------------------------------------------------------------
>
> Tim Orling (3):
>   python3-orjson: upgrade 3.10.17 -> 3.11.6
>   python3-faker: add v40.1.2
>   python3-orjson: use git fetcher; enable ptest
>
>  .../ptest-packagelists-meta-python.inc        |    2 +
>  .../python/python3-faker_40.1.2.bb            |   45 +
>  .../python/python3-orjson-crates.inc          | 2243 ++++++++++++++++-
>  ...rd-avx512-module-with-x86-target-cfg.patch |   37 +
>  ...e-detection-macro-in-pystrref-object.patch |   34 +
>  .../python/python3-orjson_3.10.17.bb          |   22 -
>  .../python/python3-orjson_3.11.6.bb           |   45 +
>  7 files changed, 2357 insertions(+), 71 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-faker_40.1.2.bb
>  create mode 100644
> meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-modu=
le-with-x86-target-cfg.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature=
-detection-macro-in-pystrref-object.patch
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-orjson_3.10.17.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-orjson_3.11.6.bb
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123993):
> https://lists.openembedded.org/g/openembedded-devel/message/123993
> Mute This Topic: https://lists.openembedded.org/mt/117537804/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000045ca0206499c31a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please hold off on this series, (1) I forgot to include th=
e updates python3-orjson-crates.inc<div>and (2) python3-pendulum had a new =
release which should allow us to build it with python 3.14</div><div>and im=
prove=C2=A0ptest passing.</div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 29, 2026 a=
t 5:07=E2=80=AFPM Tim Orling via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;tim.orling=3D<a href=3D"mailto:konsulko.com@=
lists.openembedded.org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Tim Orling=
 &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orlin=
g@konsulko.com</a>&gt;<br>
<br>
This series upgrades python3-orjson to 3.11.6 and patches it to support<br>
building on non-x86* architectures like riscv64 and arm64.<br>
<br>
7 of the ptests are skipped because of missing python3-pendulum, but it doe=
s<br>
not yet support python 3.14.x<br>
<br>
Tested on qemux86-64, qemuriscv64 and qemuarm64.<br>
<br>
The following changes since commit 7bbe4a4e200452b1fd6c09c7fcf36c4b229146f6=
:<br>
<br>
=C2=A0 php: upgrade 8.5.1 -&gt; 8.5.2 (2026-01-20 14:35:59 -0800)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> timo/python3-orjson-3.11.6<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Dtimo/python3-orjson-3.11.6" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/python3-o=
rjson-3.11.6</a><br>
<br>
for you to fetch changes up to ecd3b46d0c63b03fc434ee3763292acab1463941:<br=
>
<br>
=C2=A0 python3-orjson: use git fetcher; enable ptest (2026-01-29 11:26:47 -=
0800)<br>
<br>
----------------------------------------------------------------<br>
<br>
Tim Orling (3):<br>
=C2=A0 python3-orjson: upgrade 3.10.17 -&gt; 3.11.6<br>
=C2=A0 python3-faker: add v40.1.2<br>
=C2=A0 python3-orjson: use git fetcher; enable ptest<br>
<br>
=C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python/<a href=3D"http://python3-faker_40.1.2.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-faker_40.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A045 +<br>
=C2=A0.../python/python3-orjson-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2243 ++++++++++++++++-<br>
=C2=A0...rd-avx512-module-with-x86-target-cfg.patch |=C2=A0 =C2=A037 +<br>
=C2=A0...e-detection-macro-in-pystrref-object.patch |=C2=A0 =C2=A034 +<br>
=C2=A0.../python/<a href=3D"http://python3-orjson_3.10.17.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-orjson_3.10.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A022 -<br>
=C2=A0.../python/<a href=3D"http://python3-orjson_3.11.6.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-orjson_3.11.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A045 +<br>
=C2=A07 files changed, 2357 insertions(+), 71 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-faker_40.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-f=
aker_40.1.2.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-orjson=
/0001-Guard-avx512-module-with-x86-target-cfg.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-orjson=
/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-orjson_3.10.17.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-orjson_3.10.17.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-orjson_3.11.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
orjson_3.11.6.bb</a><br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123993): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123993" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123993</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117537804/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/117537804/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000045ca0206499c31a4--

