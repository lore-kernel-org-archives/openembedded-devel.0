Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA64C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 15:27:53 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.52263.1744644471841752708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 08:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mzr2rQHf;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60499a266dfso30060eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744644471; x=1745249271; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jq6AW0LvTxzAig2cu1RASRJoah/+e7Jokq52H+G30Vs=;
        b=mzr2rQHf0G3/b+MBzkF+KXfreZPw0ps6VpJm4xGoTp2DwgEw/ymklbja14ekjU7zJh
         mGzdEilnSMs9hsVFMju7MKbkc1fYdw+fsWarpQTAfNayAQhKzxS2h8i06q8c0Us5AQjU
         Kvn47hCldhjdGwAxu9Hg2DKsO9NCu3D685akDH6R/XqaCWIaYXeIOINnBPct9JsguAKo
         uf/XhKC4eoqJRwX7J+gO2+WOZqCztY3IhM2udvRtrErqcVPCJVhNns4kB4XLxnua7bUU
         Rpuz2joMdptFWsBdsbgvuJZrcTFPysg5FbRJ++RYPan99IldCPO3eVz4XTpEqyJGfdqj
         Fvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644471; x=1745249271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jq6AW0LvTxzAig2cu1RASRJoah/+e7Jokq52H+G30Vs=;
        b=kz/sJeD+I4qF/2gggzeLAD0hZisaK2SoEy0VsevP2VI5ovHSiZCD7GqUK8lu9JWOn7
         +pXJev0nwDJuc+TXzioA+h+Yanyvk2NgRS3r2Cj1G+CwsfSUfL+gJ7DjkpHyXemBT3yu
         L29AiZcmaUUBal6Pt5ZUcD17ciTzrQSBygIfB74R4xEP8jD2MM++MSqGv/2Li1lgN9dN
         +aTIGrQHg4RLWcyFyFKIa07cwZ8Xr2HevzZsf1n1lCtKPK0anv0gE4onIL4ygtGDM4uZ
         x7PBkhN2/fwIcRM2rF5vL0P8shZ1i9Scm1CQrFvkNDNQzwj4kBvlYT3GArFNGRlyQCQO
         gBWQ==
X-Gm-Message-State: AOJu0YwnIs/OWxrt+X9UGwES1ZYMRL3pI+EnDLDIgC1pEsAmsERSSmwG
	yCC1MvuktqoeuKhit50YTZLtiWm4KuH56QCiHrawkmuJQOxlC8sorDI78IEgbD2RFkZMnyMWNfr
	2RZUV3i5okusRADG5S/voXT+FoAc=
X-Gm-Gg: ASbGncsauNHUJq19FXVTxg1070cqjso8g6MCA90qDFY02HGg6B4Rv2TakiphPDWZNn1
	IiiaT+YuAdg3nY7G7W1cCtBho/sPqyrnBXvIXCzbQGLKIUxQZT2wukSVlCt04+gq3sWT9NGFb3T
	MOI5OCRx69aWCeYTJ9nVsn6Q==
X-Google-Smtp-Source: AGHT+IFxT5Rzeof+ZccnejThxOv+Yhs5S3B2JUhe1p9+Z8GT67dEs+ju9Gb1OFgMV65g3HNYT+dIiTHE3YOwRkLJZ4U=
X-Received: by 2002:a05:6820:1f03:b0:603:ffc3:60e3 with SMTP id
 006d021491bc7-6046f4e0092mr6937376eaf.1.1744644470927; Mon, 14 Apr 2025
 08:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250414015658.5684-1-nguyenthaithuanalg@gmail.com>
In-Reply-To: <20250414015658.5684-1-nguyenthaithuanalg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Apr 2025 08:27:24 -0700
X-Gm-Features: ATxdqUGzyjFsNR_vk9TZwV8YGd-Bi1wxr0Yb7kh1Hsi8HvoPgRKmSR-L1rfTf50
Message-ID: <CAMKF1sp3ju0t5OnHH9wADov5EQDWBRew7We_p+FxHDBjQLgkMA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] 1. Thank for Khem Raj's advice about
 cleaning unnecessary data.
To: nguyenthaithuanalg@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 15:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116853

On Sun, Apr 13, 2025 at 6:58=E2=80=AFPM Thu=E1=BA=ADn Nguy=E1=BB=85n-Th=C3=
=A1i via
lists.openembedded.org
<nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> ---
>  .../recipes-libsimplelog/libsimplelog/libsimplelog_git.bb    | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.b=
b b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> index 7a27fd302..0415bf485 100644
> --- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> @@ -1,9 +1,4 @@
> -# Recipe created by recipetool
> -# This is the basis of a recipe and may need further editing in order to=
 be fully functional.
> -# (Feel free to remove these comments when editing.)
>
> -# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best gu=
esses - it is
> -# your responsibility to verify that the values are complete and correct=
.

Please squash both changes together into one and send a version 2 of
your changes

>  SUMMARY =3D "simplelog-topc - Simple, STABLE, powerful of logging librar=
y in ANSI C/C++. Ready for billion records."
>  DESCRIPTION =3D "Async and Fast C/C++ multi-thread logger with topics. N=
o external dependencies."
>  HOMEPAGE =3D "https://github.com/thuanalg/simplelog-topic"
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116838): https://lists.openembedded.org/g/openembedde=
d-devel/message/116838
> Mute This Topic: https://lists.openembedded.org/mt/112250943/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

