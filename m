Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531D7CD6E55
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 02:29:43 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15954.1780367373841633426
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 19:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QuGGFhoP;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69d8ff0ca12so6676637eaf.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 19:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780367373; cv=none;
        d=google.com; s=arc-20240605;
        b=DmLB6cAFn/qv988+4f23eUhgSN66bC3L03u9X8wotXqJQ6Wwab/1Zm4oDj7D1ytknI
         P1R6KhceJuEtW1v9RH5oz7M0u3lh81h97ee445q82ubmCC3iHBuCpA+Pqbm/D9mr1PnS
         6+rI8Z7mjPRjFIvauZsjZaLW24+W74JXySGNCTW19lRgWWN03ydbvNskkpEka5CxkQXg
         7EOlHCuIg/Hv7ovkjrHfE909hp4YTiyqEIdmpzppO2k0tBfTeT5kTVDDDTKsMCu2lDJm
         sSeocYSg7zJlEanIu/OHndDlHiS6ZAiSIh0WMTOK/91xZJNj4wWyvXr2/4KilbL9s55d
         Zb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhbAtW+HTJ2Mrkgsv+LQHSzTeY9Hi/DIoGRmUKp29us=;
        fh=ciRXJXJbqSitAiCpoEvA6VAWrjJ6zuACKKVOC1OiIko=;
        b=e4P7U/4bcSDZqg/rZoZzAO7S8ypDRvhJWR/PmQM1D+lU4UeRkGEActPFJv/yEv5WEB
         /zZH19dUCE9gzkvzYdvCFwdLvV6Rb6irzxMbtZe5CWcR8KPyy01Ygj9VYK8P9uqe4N8G
         HYKd5a7lmCVRu6SnWCjX0KcYib/clvcHz/nVCYBNzNoXnGIMARB8/RT6BTXQuhlGLTKC
         VTIyGv0gRiXXsvCKQxiYIbZ3iuMtMVwQrXJeFrLWgrTcrxuKyuM+TYPiSpuqiRClYgUU
         2/zAl0SL+ZD/7gt4Si2/8qaHHxkajNK3ZpX/Idmno5OOjcZfYGz/A/KMU9ajC2RDVEKO
         KygQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780367373; x=1780972173; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhbAtW+HTJ2Mrkgsv+LQHSzTeY9Hi/DIoGRmUKp29us=;
        b=QuGGFhoPW1mebc9UfpI41DraupWPv9Cb3ENuuBZrD367kxOdTAiOUDFGjaGA4L7Iei
         +sJf+mAJHq+ymgl35pZZ6ow6/Z0hDYV/wqwPcNhMyJi5aEiI/j2cvyUplrypWLDYAUvz
         Sbs4GFr5qCuYjuEl6s9lyh2tdP4HRuXTh7y3fDBuh/anH68wjHL7WGzNnz+AP8+gdPZF
         gxYwOWLtCWoMxXx3QouwKTylkBEtSj4JDE3UbPxztpDCzEGec3xJ2ych5Ts5mZRsZ53E
         x/M2sLeooaLHLnvHraaRP3KiNIIOjaUt+PxNOfoUH+JZyXnehLZGFg7pb4yRpWrFzx+P
         NF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780367373; x=1780972173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhbAtW+HTJ2Mrkgsv+LQHSzTeY9Hi/DIoGRmUKp29us=;
        b=fSYbQSv53BPhvihQ3MelRzywxaqG+YwSZqXsJF/iXv7zZg0wpdPuiuxHbBXVp5FQUa
         BEv+VrCGXe9uF4f+NHvjLLobfEfxApulC4wjORs1XLvuwW090C/D/yW6ooSzF9M9mLI9
         S/sVzFVUSOioIsT9jFhx/1XdG4QL5yGeZ5B4a2ockPkh9MHIPpEb5yjTRehyCd/KoIJ0
         wnK1S7U6iUQq8PLP1nns/iTTN9IpaKmEqFTtsQaq4cpHMnn50546xWHyxjE3ghdCSMjk
         PgqU2lFQU7YMiaIFGPxwyY8xgST1AHZmX8SLNugqoqPXBC7TzVrSqQ52kLO9tgw3Zblp
         C+NQ==
X-Gm-Message-State: AOJu0YyHCvX7Oi2vTdkyOTLnogc+qANx6hfeBEgVsFTF9T3+/rPXTf7r
	+/nIknbxfTHO2LmpYKHLpq555mKzem7PvXlj8wzV7hN72TR2HplmnL+8km7oUg93Uy0a4xG2X9R
	3wHyO/mdz8vSebwxI/C1av16D5P/SA9TLjuRd
X-Gm-Gg: Acq92OFz6jP8HexKFofP7ARlZVZjnwv+NeIbz+4rg8NUvwBNyvRClc78+zXoqOZWlid
	Ttddhtp2HD2CeizvzW8IA3mwfBhyyNXd5Ph1Bae4kS6spPStPIpERn2MIex/JfMbF7rFNc4z2iS
	WyEPY6UFxh7EuQobZZNhAcRBSuSVlYu9kqkepxJS/2rtlz1QgZhcFh1jiZC6/xFSgM5VvQv6Ziq
	tDdjj06a/BhPdTVrUdRc/py33mmltoLdeKhtM63UQDXjGk3bdC3t9jmt+1LQCafkClaAlcKgnGb
	QqQLJBf7stk2wHj6cnjm
X-Received: by 2002:a05:6820:8c8:b0:695:818c:e564 with SMTP id
 006d021491bc7-69e104ae479mr7325843eaf.26.1780367373062; Mon, 01 Jun 2026
 19:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260528095531.4003329-1-Xiaozhan.Li.CN@windriver.com>
In-Reply-To: <20260528095531.4003329-1-Xiaozhan.Li.CN@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Jun 2026 14:29:20 +1200
X-Gm-Features: AVHnY4JAqNlVloezS7a6BF2mEmEqDXPdkyPoCINJ03lAHOpMJjULHP1CroaZ2PM
Message-ID: <CADySD0Em-CA5ScGpJtndLbakTxkFYhkAgba1BP68VzG1PRGeVw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] haveged: upgrade 1.9.20 -> 1.9.21
To: xiaozhan.li.cn@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 02:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127316

Thanks for your patch but there is already a pending one[1]

[1] https://lists.openembedded.org/g/openembedded-devel/message/127213

On Thu, May 28, 2026 at 9:55=E2=80=AFPM Xiaozhan Li via lists.openembedded.=
org
<xiaozhan.li.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>
> ChangeLog:
> https://github.com/jirka-h/haveged/releases/tag/v1.9.21
>
> Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
> ---
>  .../haveged/{haveged_1.9.20.bb =3D> haveged_1.9.21.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.20.bb =3D> haveged_=
1.9.21.bb} (94%)
>
> diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb b/meta-oe=
/recipes-extended/haveged/haveged_1.9.21.bb
> similarity index 94%
> rename from meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
> rename to meta-oe/recipes-extended/haveged/haveged_1.9.21.bb
> index 2ea12b3977..935d6da187 100644
> --- a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
> +++ b/meta-oe/recipes-extended/haveged/haveged_1.9.21.bb
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "https://www.issihosts.com/haveged/index.htm=
l"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>
> -SRCREV =3D "e2d96806273caa9ce7457e2f8669a3c40517ca27"
> +SRCREV =3D "8d1ed0a1f74c0e426e7ebcbdd60cf2a0d1b35cb0"
>  SRC_URI =3D "git://github.com/jirka-h/haveged.git;branch=3Dmaster;protoc=
ol=3Dhttps \
>  "
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127272): https://lists.openembedded.org/g/openembedde=
d-devel/message/127272
> Mute This Topic: https://lists.openembedded.org/mt/119527288/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

