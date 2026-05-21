Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E02CD343F
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 04:16:31 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29341.1779336982113308922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 21:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AtLzRGWX;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65318dafbcbso5594093d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 21:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779336981; cv=none;
        d=google.com; s=arc-20240605;
        b=jXExB/3EshWt1kHFvPZtsgxgNSsSDHd5NKjjDR442KKGaIObXVuqJYHqB4mWJksItZ
         6Osp6J5TJldEVBu4xRXCJ61A2K+Zsx6AYVnoAc80Elav65V3/AIpjw5vTRYRJ9r48bKf
         Giq4xmZ3L0EAm4VXU1bshk1/lCrpvVLkhkqFHdMqz06JsChMQT2vgYtQDd4CkCx/RM7L
         PQWdjO5UIb+BdBot4GrG79+iZfJmpMwyAFKAckXXP1jDv2clLzCjBEpk7xxBPYuY6eLo
         Mvh+Ig4Dd1wV8eYwEK6pQhoiJngtjGqZg48AE4DErWjLdF7qXrcqI0RicsIeGL75hqO9
         5d1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xDo+Wea+Tbrm51PA6mPPTPvO//kzA66F/j5ScW6M7dM=;
        fh=4YTjzO0C8RH/MztJHcaGYe1pZCao8Pv/ipu6VaPWe1w=;
        b=ggYF4AyDSccVShOVa+UkpM/6vNqhbL9b5LYggUbADxYDt56/MNemss1ZvVHuWx5Qmi
         UmGK3AWcUBMu2tT1y96KQyu2wLn2XXP3cnZaxmKDnHRG6n/DS3opmqTrkCijYjKNkLqA
         msYbLIvqApsrnZ3bC6zjn5xq/4REBhW4QFOe4roDHKBCUycod3dRprctkTu30bNEqO29
         FCphVHVFjAe9Y5UWnAui4VO7aN9wj2PROjmRX7lmPukMlKCDX4PyV+vT+y4+oARr+oZd
         +4h13fmWW6qHwXLs6NKtUiI/CPesTZCPyK7l2jn2i/cKKAM7aNk8N6kZcQrXLSRUG1Wy
         tc3g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779336981; x=1779941781; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xDo+Wea+Tbrm51PA6mPPTPvO//kzA66F/j5ScW6M7dM=;
        b=AtLzRGWX3e2+Cn3saaF4QKl4At0be/h6H27C19R7di0/uH3WiDQYiPo96fZSjyfw0B
         tv2mcYojZ7ILu806a1vSuLm2BCzPLCLHpjwXZQyGHvHZ+n5VYFWqYNX+xtm5Cbb366EX
         FhrUgZ616vVthw0fYQs1pIue6UMhA76TiCGhyx2yGNrh569FblLpyoOzVlpNxwvJopUA
         lXz1UnXSN0XLem40p/5l9LKrKH5krclhr16rEtOoXf3ZyR/VYm9GtumHzBBRkCZ8wnQK
         Qlm2xamKMzh734oxs7ofv5IzGmoM9u5PKC1OlnVd4/92OF2r9V7b2ICbigpB/lGgeHVS
         khow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779336981; x=1779941781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDo+Wea+Tbrm51PA6mPPTPvO//kzA66F/j5ScW6M7dM=;
        b=mgDHpmo6/BtKaOABqUxQwqKekhV+hMX+r/u9/l+ykAqFK7uM0lZrlHKVxwS7TlGbio
         2I0tricmkQDrARfOrcL8k/tkqt5h/V7D38fmcHSAp6ASbD1a4FVp9puBzQ/Y2mUgklHM
         U8jcQ2L/f1Ocy4MjzN6PMpgeXthfzqQwDX3NMbOtnj81lo7rqBWwmSL6C+Ju7N+ewPh2
         jf+RcwVjMWlnnkhHElc73UHKXZ145IbFjxEvnZVl/eCWGunTzPSyNcB/HUfcKGDFfvcd
         cqaIuo2GlDZjq6YJ+sPsuEJRBMlD7D6OBBUaOxmPU2gdZzRmHbo4yN6QkCETGoSY704l
         BuXQ==
X-Gm-Message-State: AOJu0YxkLIfZu0Gwee7k9Z6EPXYHTah3WoSA364nLiHpxWVG37u+VAY7
	2Ri5cOlR93Bc0Fi4KqXJqNQzt0JGVhxvsF80quSxcTzsxjD1qgnMCiN2OsQcBwpGnstB8qhCiIy
	bHLnpEb1mMyMdFe9vABfLycrMp0tsh+c=
X-Gm-Gg: Acq92OGDENyuCvQVqqKbK67v893JSf8+rkVRqWtjWJPzxXSF/2Fsxxoedd8Dbfv9C2B
	FKB3WjIZ+2tG/wa6j5tmqG3VJsu3wq1mmWDTz/mCSX6EUV87QuH43w/xcbRrxaq1AtlTkFe+sUt
	Nz8lyc4ruysyhHjZxN2E99j21kHd5dm747fMxOcnr3EbnjsFACkk+B/dk1i8gEuKYjGYknV2Tq3
	NBfrXqreis+DuO/3vVK0MpJ5KFeERfmYfLZVwXp1BVtS/MRS3x+AoQFp3p61MeR31a4l8WnohE0
	mGY8v8gHf21EeLH5OMXR7lfwiza/G5pyrU6QOgR/hukSu1BA6+FHKCwKZaqN2L/73BRIDKL9nI5
	dSdOCVlqI03triSa+Jm73TiMGwIcTHfLSgNh/kuYl2piJB+odHrhp+zidOV205VAJy6YaH10AGk
	ch+8H4
X-Received: by 2002:a05:690e:d05:b0:65c:4b93:4256 with SMTP id
 956f58d0204a3-65eadfa77ddmr997336d50.15.1779336981146; Wed, 20 May 2026
 21:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com>
 <2022222.1778130561122567168@lists.openembedded.org> <2115555.1778654861364723634@lists.openembedded.org>
 <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com> <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com>
 <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
 <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com>
 <1575450.1778745762950591364@lists.openembedded.org> <1575450.1778840626136865406@lists.openembedded.org>
 <1824db6e-eded-4f5f-8626-c74406ef2670@gmail.com> <CAMKF1srFmVDNF=f2aU1SEYFv5MGXgZGOYc9150HDuBeTJg1V8g@mail.gmail.com>
 <1690109.1779097786262242307@lists.openembedded.org> <2251952.1779175643922816455@lists.openembedded.org>
 <2273658.1779287978782701878@lists.openembedded.org>
In-Reply-To: <2273658.1779287978782701878@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 May 2026 21:15:55 -0700
X-Gm-Features: AVHnY4KEBUAAIC579Fg4pxyxWz9fCLv62lck_439Jo8UL3Nqf4BpnMXpjQ4lmw4
Message-ID: <CAMKF1spFueVnbh9+dZOpxxZ-Rw3qFFsXLBkfiNwj7YGvDX=4jA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: ashishkumar.mishra@bmwtechworks.in
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b271b306524c2c55"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 04:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127129

--000000000000b271b306524c2c55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch looks ok. For future, its good to send patches inline instead of
attachments, makes it easy to review them

On Wed, May 20, 2026 at 7:39=E2=80=AFAM AshishKumar Mishra via
lists.openembedded.org <ashishkumar.mishra=3D
bmwtechworks.in@lists.openembedded.org> wrote:

> Hi Khem / Gyorgy & Team,
>
> Can you please let me know if any additional test i can do locally before
> sharing the  patches for android-tools for the aboev CI error
> The details are two thread above at
> https://lists.openembedded.org/g/openembedded-devel/message/127048
>
> I was planning to share the upstream patch tomorrow as have to start
> another work on priority
>
> Thanks ,
> Ashish
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127121):
> https://lists.openembedded.org/g/openembedded-devel/message/127121
> Mute This Topic: https://lists.openembedded.org/mt/119162735/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b271b306524c2c55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch looks ok. For future, its good to send patches =
inline=C2=A0instead of attachments, makes it easy to review them=C2=A0</div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, May 20, 2026 at 7:39=E2=80=AFAM AshishKumar Mishra=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;ashishkumar.mishra=3D<a href=3D"mailto:bmwtechworks.in@lists.openembedde=
d.org">bmwtechworks.in@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div><span style=3D"box-sizing=
:border-box;color:rgb(51,51,51);font-size:16px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;word-spacing:0=
px;white-space:normal;text-decoration-style:initial;text-decoration-color:i=
nitial;font-family:system-ui,Roboto,Arial,sans-serif;background-color:rgb(2=
55,255,255);display:inline">Hi Khem /<span style=3D"box-sizing:border-box">=
=C2=A0</span></span><span style=3D"box-sizing:border-box;color:rgb(51,51,51=
);font-size:16px;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;word-spacing:0px;white-space:normal;text-dec=
oration-style:initial;text-decoration-color:initial;font-family:system-ui,R=
oboto,Arial,sans-serif;background-color:rgb(255,255,255);display:inline">Gy=
orgy<span style=3D"box-sizing:border-box"><span style=3D"box-sizing:border-=
box">=C2=A0</span>&amp; Team,=C2=A0<br><br></span></span>Can you please let=
 me know if any additional test i can do locally before sharing the=C2=A0 p=
atches for android-tools for the aboev CI error=C2=A0<br>The details are tw=
o thread above at <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/message/127048" rel=3D"noopener" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-devel/message/127048</a>=C2=A0<br><br>I was pla=
nning to share the upstream patch tomorrow as have to start another work on=
 priority=C2=A0<br><br>Thanks ,</div>
<div>Ashish</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127121): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127121" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127121</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119162735/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119162735/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b271b306524c2c55--

