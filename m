Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EBAC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:25:07 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.20533.1743517500055508219
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cuc91pJk;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-60298ec60e8so1253147eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 07:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517499; x=1744122299; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwLsmwgnMbJawyUJk7qjkX74cHNcxLK3wZs3qXZSGfw=;
        b=cuc91pJkxNXkRqOH0uI42l6JNo9uRuNlEDkxMTlsBe+tE9+iBpEyGCf+6rIPNHc3V4
         xmbNEOYep8fp1nlTCKavfXQV3aPr/wfo423r3w5wTOhDf07LCIUaxoNrZ8zYI1GvZGny
         h88+mGwpJa3KDDAp67OIhoUy9aAZUb+mlI064kE88jatWkT/uCojdekxDpsvRFji9yXp
         wioV5hy3TUvwNW6Ma9jeFgdt3BzRWR0TVwQpklGyIMeoblE2x8USnG8LLoTf+8TquYgF
         PkhpLuN1HwxixsgASqSs5NUAgPDCZb7djfz3HCKCGdPjN5VA84zqzuiyQGrPwhQrBGs5
         eIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517499; x=1744122299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwLsmwgnMbJawyUJk7qjkX74cHNcxLK3wZs3qXZSGfw=;
        b=KlalibPg7fVOK642XahyGz9k0Tg/sjfhulH+JLo7XoyGc1QHaxlXd4vVCwXQNk3WrK
         w9hasU3YpIMr9oxFEj/L8XAy7oaP9P/OD7IpD+c0x95ZtPbuQRTilB2P7akrf0fZEu5Z
         L54/S1tJbS92VXJR7g9dykqNZ/thNCI+97AMCqBSTmZfoDboBtT1KiEjXYXjCJCbCuPm
         h2EynLzEEzicXlZpBjilsSocPRAVnxPauJqmeSKUQ0Y5qWjMi6l5+8y70oXgp3xHGhIs
         ql+KuWYWAGUwu7V1KNVvP6BdGFbqV4S/5Q+g1ZKjONTws9aqfe56GhLf4PCZ440yjM5U
         GrgA==
X-Gm-Message-State: AOJu0YwwjvOU+y3PWrhds6CkYzVUJCOZDJ9RJ+K63uHz5m2rVkdn5wAB
	/595/HrxWiBapdICkoeWYrUTGtaDHgmkM0Y9lgeWv8DFUb+3dhlHWsaENBqULPtWv50Df8zFqOx
	gvCJ5eZXL0Jn3mfcpsDD+8sC+SZkw408gUcs=
X-Gm-Gg: ASbGncta9oDU1RZ/zE2WOR/blRjFmk5LPJhChU8ClYqgclZ/chZC7ei4eAW8NFIMXfs
	N0oH2hpgkp1rbKC+UjTb8Vbzuk1C1CUhNme9AfKPd83cTSde6U9E8F04U2OOoCmkIlWc2+XNnFk
	dFnCe0rZcpaz/tB5VvCGOjy32+wfQqh71ogTvbxbDp
X-Google-Smtp-Source: AGHT+IHCyBoPpr8svStwQXGyjIcMmsxVnTjvUshwjAeheioe1lCPjSL7Wi/J6JtDy68SbQUjrWBL8lKd60TVyswMfN0=
X-Received: by 2002:a4a:ee86:0:b0:602:47ec:3df0 with SMTP id
 006d021491bc7-60290f5ad74mr5929669eaf.5.1743517499227; Tue, 01 Apr 2025
 07:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250401100832.1477718-1-mark.yang@lge.com>
In-Reply-To: <20250401100832.1477718-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 07:24:33 -0700
X-Gm-Features: AQ5f1JqV5WtaasxfuouJORfo1kVLg0MyUxSNZe97BusRkEbxmG-ea6tHzV211L8
Message-ID: <CAMKF1srQ84kH=VtadJdfgFUdNzB9SRM5ieytVeY7Ye8Y2n8iLA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mcpp: Stick to C17
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 14:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116478

On Tue, Apr 1, 2025 at 3:08=E2=80=AFAM mark.yang via lists.openembedded.org
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * Fix build error with gcc-15 by renaming goto labels
>   see more details:
>   http://errors.yoctoproject.org/Errors/Details/850149/
>   ../../mcpp-2.7.2/src/system.c:3436:15: error: expected identifier or '*=
' before 'true'
>
>   true, false are reserved keywords in gcc-15
>   Rename goto 'labels' from 'ture' to 'true_label', from 'false' 'false_l=
abel' to avoid conflicts.

It might be worth using true/false conditionally e.g. see
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/e=
2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch

>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipe=
s-devtools/mcpp/mcpp_2.7.2.bb
> index 0c1815732f..dfa77770a7 100644
> --- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
> +++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
> @@ -21,3 +21,7 @@ BBCLASSEXTEND =3D "native nativesdk"
>  # http://errors.yoctoproject.org/Errors/Details/766883/
>  # mcpp-2.7.2/src/expand.c:713:21: error: assignment to 'char *' from inc=
ompatible pointer type 'LOCATION *' {aka 'struct location *'} [-Wincompatib=
le-pointer-types]
>  CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> +
> +# http://errors.yoctoproject.org/Errors/Details/850149/
> +# ../../mcpp-2.7.2/src/system.c:3436:15: error: expected identifier or '=
*' before 'true'
> +CFLAGS +=3D "-std=3Dgnu17"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116470): https://lists.openembedded.org/g/openembedde=
d-devel/message/116470
> Mute This Topic: https://lists.openembedded.org/mt/112022139/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

