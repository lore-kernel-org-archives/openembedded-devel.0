Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B1FC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:08:07 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.20055.1743516480051546324
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMo1nsZ7;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f68460865aso3798259b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743516479; x=1744121279; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxSREi0T8Td1Zy1mWMPfJhuDJ9yn9ZQv7dxcLqdhsLM=;
        b=mMo1nsZ7L3fx8Mxb1XF9ONezI2P+2Dlxewhgj7v02gunBMumvIOLTIejspcKccZphW
         hIgAmnRE5qLJNvZKOmpZoDE6FhrJrElELhPP+AYE3UjiLkHOwB/YmlKGLkrbJu6Vm0hg
         k3BqV5wsE912s4JDpm4sdPU1KjersQllEmqroXAE8xa6HzLIi09hu5tPWQBth13ynvGV
         pg22Efm72D2BDI7TAB2TpnUtMkjw5XVYKxT59A/p3le7IXfPTdsoT659uU23XD0oFNZi
         1fKAYlKv+n3MxA3I23Kziz3X7e9448n1OJFjovEyfM2XJ3HPE9X2fIoCeLUEWmFpNS9/
         I6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516479; x=1744121279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxSREi0T8Td1Zy1mWMPfJhuDJ9yn9ZQv7dxcLqdhsLM=;
        b=uZ+AKzT3bzuWvcjiIVAGPeWqgaRjZtO17OK48rK23+qWCfcDXz89KKu23kigE44oL9
         Uu6NoUcaMyjM5soWVyJMLoZLrkB/C56BJaE14u4hSCE60ZQJy6+AiwnLf+s5frPLH4mH
         nx6PT5FO3fTSxWMag+ZzZHwkx7MapLCiDktFSi6JqmFSxltgHR0UJZPWsni74FqeRWr6
         gMyrqU888R5PZKIcFZ0PpfQQmoz75I4SRr8B1GHJzzQ4LPB9gN9kVYdmCredB7VXN/ht
         UsYt04NsMh+beETSzhwncTIAF4wSlBoLUAdc0u/X1t7lf4MCytTRm30gEGdVOeg58ohq
         U4kA==
X-Gm-Message-State: AOJu0YxIQsbA9MxWL6+b16cANGNSw9IVE6JH7Wv0H+FH/gGvW3MgVVNn
	u+bRLk8WXZjQGOOoWyzsuUZatyy19id8N4QD+8fy/pU3Cf3wypgMihPKhn8LFA3ZwaUU44Kf8JV
	D6ak0kJDpQ8XqDUE/kowSSx7FP7kvCVTQ
X-Gm-Gg: ASbGncu0ppRF2lnf58DIPOg+B6+PD0Vl/NQ1wuTBKan6zoPX+dTNGnGUgdPimw55aRT
	HmHmAVu1yK4mmIn2SWx80MtkApKnOXsr1cRNHDu+++IHF8xnuUaCcRd4Tb3D4PcDDLti10PCcm3
	CuZUrctrgcZpS8bLhvqh3bMrZscWN4TOWh5Y1oYJj8
X-Google-Smtp-Source: AGHT+IFVCk6PxTh9KnM6cbDQeGfCbJM+C26a3v0JxU6b3Nzbncj8YoCtmXJkZ/7QhEt62pTuWeA/2AWc1mTVCpMTzB0=
X-Received: by 2002:a05:6808:17a8:b0:3f7:6824:5839 with SMTP id
 5614622812f47-3ffe4e6ca4amr1891327b6e.19.1743516479348; Tue, 01 Apr 2025
 07:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250401065148.1388290-1-f_l_k@t-online.de>
In-Reply-To: <20250401065148.1388290-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 07:07:31 -0700
X-Gm-Features: AQ5f1JrdfEk0Y7PP18zKbOph07Y_pfdmczMM1LMv66uXYpN7GIPxQ7rzED3UNzw
Message-ID: <CAMKF1srHSe=cPVq+H6ii7Aw0=c4aRvxVJwcVKCRR+r-PmxT62A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mpv: disable lua for arm
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 14:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116475

On Mon, Mar 31, 2025 at 11:51=E2=80=AFPM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> luajit currently fails for arm:
> e -c -o lj_vmmath_dyn.o lj_vmmath.c
> | In file included from /usr/include/sys/cdefs.h:731,
> |                  from /usr/include/features.h:524,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_asm.c:6:
> | /usr/include/bits/long-double.h:23:10: fatal error: bits/long-double-32=
.h: No such file or directory
> |    23 | #include <bits/long-double-32.h>
> |       |          ^~~~~~~~~~~~~~~~~~~~~~~
> | compilation terminated.
> | In file included from /usr/include/sys/cdefs.h:731,
> |                  from /usr/include/features.h:524,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_lib.c:6:
> | /usr/include/bits/long-double.h:23:10: fatal error: bits/long-double-32=
.h: No such file or directory
> |    23 | #include <bits/long-double-32.h>
> |       |          ^~~~~~~~~~~~~~~~~~~~~~~
> | compilation terminated.
> | In file included from /usr/include/sys/cdefs.h:731,
> |                  from /usr/include/features.h:524,
> |                  from /usr/include/bits/libc-header-start.h:33,
> |                  from /usr/include/limits.h:26,
> |                  from /usr/lib/gcc/x86_64-poky-linux/14.2.0/include/lim=
its.h:210,
> |                  from /usr/lib/gcc/x86_64-poky-linux/14.2.0/include/sys=
limits.h:7,
> |                  from /usr/lib/gcc/x86_64-poky-linux/14.2.0/include/lim=
its.h:34,
> |                  from host/minilua.c:33:
> | /usr/include/bits/long-double.h:23:10: fatal error: bits/long-double-32=
.h: No such file or directory
> |    23 | #include <bits/long-double-32.h>
> |       |          ^~~~~~~~~~~~~~~~~~~~~~~
> | compilation terminated.

The problem here is that you need to install 32bit build environment
on build host. luajit cross build does need that
especially when target will be 32bit

>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.40.0.bb
> index 3d54bbb341..55da637227 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
> @@ -25,6 +25,7 @@ inherit meson pkgconfig mime-xdg
>  LDFLAGS:append:riscv64 =3D " -latomic"
>
>  LUA ?=3D "lua"
> +LUA:arm =3D ""
>  LUA:mips64  =3D ""
>  LUA:powerpc64  =3D ""
>  LUA:powerpc64le  =3D ""
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116464): https://lists.openembedded.org/g/openembedde=
d-devel/message/116464
> Mute This Topic: https://lists.openembedded.org/mt/112020693/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

