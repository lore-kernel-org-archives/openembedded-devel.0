Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555F8C35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:15:10 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.53663.1742220909079479557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XuGHpcUP;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499659e669so4866521e87.3;
        Mon, 17 Mar 2025 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742220907; x=1742825707; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZAKxdrVuqA1wlTPGfmWCuoifIitQYAIHnUksxyrURY=;
        b=XuGHpcUPq82pv6zfWVFOYbgm1TsJo6Rv96JuYWxnRRxgHc6uye7QersSgTzU+tnAw5
         L7MvegIcaWGXhsgAHlNCr5H3n1CRPYcfV3WXIPqa73q6K6nHvDH9BGxs+TFxbHqs0Aok
         2xScE5C9HLvNDfYjT5e0OC2YncyMg8JzkvvowbJDXb6PO38uG0z/6Ix39g1K4SYax8gd
         G/ldqbQ8DT3rqnWV8Mtkhng3aG0KhdluUUTQ8sTtBGGxTDNKDlN4gr+8aTvdoFVQtmS0
         ahfx6TiwOC3GwMRJxWmvYMw1GEb0P8P/b0JT1+hSL8uFGrFYuWQI5+dDbQRlxG9h7B0A
         qbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742220907; x=1742825707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZAKxdrVuqA1wlTPGfmWCuoifIitQYAIHnUksxyrURY=;
        b=UEzLrPv4yTQeB05EBDwNWpvVFGm1g8PnfdEswegUVpoP/JF+SuLGQz7bGijNtkTYjx
         y16AwpBXtXJhLdr2UCXhyN/1tnnQwRQPQwckDIi3yrgpbJgkVhH+8cGMUkP2LylVUOkl
         dunpIozwcnyDS2YjwSz4lsfht7NLXj7W4l2+bXy5WJQmmgK+bbSAuQ/D52Lk8gIiTWIw
         VE6UadBrAPwxdP2GVRJ/VFVQRsAj3LgbSguRuVJu2cCdBzGBPkQBMYBczPHO/4ZodmWO
         CHuhYR/dPUL4/uR+b+YZ+xQOV5q67HSDcJ1Doc+Bs3uohdzMOuWqFc3qjuDvKwp5iVTc
         hGpg==
X-Forwarded-Encrypted: i=1; AJvYcCVGz0w0pjr4Kj0ax0mdRKDaoSyc0jm+YU4YYFOx1O30LcCHfQp38zJtIHRKQrc9dGdKXgJKcDmjGerzxyHyAb1ehvU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQL3ELTftPLGlL4VR0l/1Fr4tcHAFp0OEgQp8CkuHsCFkHZPU2
	hhTcW/CCvWLKGY7f2rHeZcm5KEhGWQaIpkAlV+zFLSe/+GQ5t9IPMjB2950Ft7SNsXFBougxe1X
	Z6vnCApVZ/pBcCIr/xaINwbNNCcA=
X-Gm-Gg: ASbGncsa1Jmz7/bq+wcvQPYjDjuzwN+gf/Zcv/w48tamykMxGW+b2xBoLG591obk+bZ
	P1MNBlr4It+IbEWX890OV6kQ4spBuAYz2JH759aq6xtnzmFZyHG11eGCveNXV1vjT1ilcPABnYt
	GQW4MxHnnhXoX39i6jsYeIJ0NYyJPC
X-Google-Smtp-Source: AGHT+IG1LajYhSl9uNDc8/xG6gueVh91Ve5lBEYQ6pTuX2q9Af2sHu4058t0rQl3PQbWrfzr6rzcaq+I6hvQuhttPnE=
X-Received: by 2002:a05:6512:308b:b0:549:903a:1c2 with SMTP id
 2adb3069b0e04-549c39aab60mr8305203e87.49.1742220906876; Mon, 17 Mar 2025
 07:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <182C5B28D7D9F838.16826@lists.openembedded.org>
 <AK92TS.Q739GCR1HSTF2@t-online.de> <CA+chaQcVqO2qSReiy5tgc4EKhsZxJKd823wdZj=BgoHYPDYLHw@mail.gmail.com>
 <182D9870774557FF.29351@lists.openembedded.org> <6YT9TS.YS0RC8OOHV0C2@t-online.de>
In-Reply-To: <6YT9TS.YS0RC8OOHV0C2@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Mar 2025 15:14:54 +0100
X-Gm-Features: AQ5f1JqOxJ_LMlVDC4abv01ab6SunPCoEYlHmDMM9NMFpYZjozVGJVOj1X0_phA
Message-ID: <CA+chaQenovg97MbY9HNqoaWT3=3yiW2-Z3ncvZrdCxvnEDB6vw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libsdl3: add recipe
To: f_l_k@t-online.de
Cc: "Martin Jansa via lists.openembedded.org" <martin.jansa=gmail.com@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 14:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116029

Thank you Markus, you're faster than me, will include both your fixes
for next world build, but LGTM.

On Mon, Mar 17, 2025 at 3:07=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> For libsdl2-compat it looks like at least currently x11 (and also opengl)=
 is required:
> https://github.com/libsdl-org/sdl2-compat/blob/4453e2d05881c3616af8ca71f7=
c4267c60f993d8/src/sdl2_compat.h#L1279
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116027): https://lists.openembedded.org/g/openembedde=
d-devel/message/116027
> Mute This Topic: https://lists.openembedded.org/mt/111678038/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

