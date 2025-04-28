Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE047C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:52:09 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.48812.1745848325007295196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WqnrrRXN;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f9832f798aso3850718b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745848324; x=1746453124; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SpE18ZZTn7U7+4DW86xJBHG76wpzVN6XYHXMXBexho=;
        b=WqnrrRXNyQlXfRpu88XkyPVdqRjds6uf4jy8504r7SJOPSqS0/18jjNBmcbLtGXSfA
         n8qOE1iX6ONm7vvv1RP7d+AQNt4BvXee9A7xaFv8Qa7+YBzQJElmByg1ZSbkO7BEsuiB
         yMTuHykOVRDtJtXUWSkwq+BRgdAqiPKIXxWZbyyu4gUFpWhMGWPlESosvhidYg0VLuYX
         QvQmTdp4iJ1yZ8O8CnyL41EDf/rrUd88Os1SAyBj7Fkzhm76T18HemZM/79aTEZUW/24
         vKAy9+SdSEJStyAfvCYu1yJ0NiB6ASiRbX61oAdNAELwRFo4Y3mC7MWrq2pT0AjH24AF
         8WTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848324; x=1746453124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SpE18ZZTn7U7+4DW86xJBHG76wpzVN6XYHXMXBexho=;
        b=l81ctU17qfw1c8z6VjAV3gnhSxzTreVM2O9BQ6xVZ3GDKaFuQjw5948N7G6SxslSNR
         dbZa90OB7qr2YGR8iDbaFSn0G7kIvwVYGOTOvgIo3QGpkiNVWE/MaJuLQvQlxMi9MzeS
         EM98pmYjVnEGQ55E07XKQVHpQT02VOQ31vEB3UTTGDRuqNVj2KP6/ZFSoFxR6RvZhE3M
         TQw8Tnu1tcwdybsbKHCxkuaQ3ONPsUM9BCJKXTGJAyRwqECPLvqphj2jPCfvVqQqoRdS
         js0DfG+zd9XlRgXWNyy/tmKXOgRj9pMf2gp7qgmTzQU5+FMXXYfizl25NO8Jn4Gz9WYG
         dSVw==
X-Gm-Message-State: AOJu0YzdQ9Z+LxfR0GhdcIZNdvzaeP/FqEI0racp4NzmwPRJMtt6xcce
	Vjfv0aDP19AyQaZJzfV4ATXS+50PylN5rzyX1QpesBlHSmyGnOVHeRgHM3/UIFKrcnsyq7vyntu
	GQBKkXsL5MLmdulFgxtGsPu+R3Tw=
X-Gm-Gg: ASbGncttp+TPiByc1Z4W2BvT5V39T0Ztazt2oXxUueSM9WXOfx5alrMSMMFu4Llwrd0
	j0hATXQl+vkMZ1/U568UHVgil3wTv1ceNki0/c7Y5RQd2n0bFd2dp9U/+P0vhVCkrI5l6mV5job
	uev9gFIJaje4WV2DOVxg1M
X-Google-Smtp-Source: AGHT+IFFLhoHIx0f0ABCd+6GE13GlpP9WzFuUTxLCFwwgbROTQyM5HtgAe3D/9xgF//wRfPMG3FczOs5iKlc63b1Xqw=
X-Received: by 2002:a05:6808:2e46:b0:400:fa6a:6726 with SMTP id
 5614622812f47-401f27c4bf1mr7619701b6e.0.1745848324295; Mon, 28 Apr 2025
 06:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250422131332.5039-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250422131332.5039-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2025 06:51:37 -0700
X-Gm-Features: ATxdqUFYUNEmqClm8ljnxNkLOaeOwhf6a9zFWUYIg0gBjueYZrM8K8-JAuS9u4A
Message-ID: <CAMKF1srh_AZf33nZF37fx_nb3KubM_Vg3t4gEdxf3J=0+MYzpQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Fix using CMAKE_INSTALL_LIBDIR
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 13:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117195

fails with
ERROR: libsimplelog-1.0.5+git-r0 do_fetch: Fetcher failure: Unable to
find revision fa8c68f8dfcf72adb346f1f4d6dfad02829052b5 in branch main
even from upstream
ERROR: libsimplelog-1.0.5+git-r0 do_fetch: Bitbake Fetcher Error:
FetchError('Unable to fetch URL from any source.',
'git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain;protocol=3Dhtt=
ps')

you should try to do a clean build with
bitbake -ccleanall libsimplelog
bitbake libsimplelog

On Sun, Apr 27, 2025 at 1:49=E2=80=AFPM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> Fix using CMAKE_INSTALL_LIBDIR instead of hardcoded 'lib'
> Increase v1.0.4 to v1.0.5
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> index 461b96035..764425dbc 100644
> --- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D22cdd382a6=
275cb4c2e75c517952ac7c"
>
>  SRC_URI =3D "git://github.com/thuanalg/simplelog-topic.git;branch=3Dmain=
;protocol=3Dhttps"
>
> -PV =3D "1.0.4+git"
> -SRCREV =3D "781f5eaa1713e7f60e9ee79ab5143c0bacfcccef"
> +PV =3D "1.0.5+git"
> +SRCREV =3D "fa8c68f8dfcf72adb346f1f4d6dfad02829052b5"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117173): https://lists.openembedded.org/g/openembedde=
d-devel/message/117173
> Mute This Topic: https://lists.openembedded.org/mt/112489399/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

