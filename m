Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEF9E9381E
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 05:43:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.265658.1776059038345457058
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2026 22:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TkVAEgDD;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38dd575bca3so39493071fa.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Apr 2026 22:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776059036; cv=none;
        d=google.com; s=arc-20240605;
        b=EqzcG4qrcDQ0oLSkvAavQtqkhGeiAayPffSyEhzN7TMqfSJ1SnZlRJw0+xf0f8Oe8K
         q4UxZUdoiO3fVDuega6H4GCHjFCPQgnGdy+0GEkHDCUsve+NXf+nl2Rh0X+pAmGlc+SX
         2Lka3MGsHf/h2EdlB2GfwdKQZnUje5at/Zm9oiGHyxt16MKXW8Y+H+No09WxVGXA6V/i
         aWd+VilhVjkXqpYj5vVwFWTs3Ul1BBs/kFTCdz1QcGjLJ3apZ6tSLMwWPiJvHoG+CjuC
         pHEA6Z9IElmhphk+9wATsKTK19WnYmsjolgmt6QTfQn2CuthZEsrOLaZ5jn9OaLstumx
         T31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aoTDoEKPJJ7oORGok1g/qKKkkmMgzjWgZIoQ7uLTDCU=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=AG8O24X/RaSgGNDG10SsjXaK+66JMVTPHXCs+u9JkAiMl3NZu/umUL26PuhyJVqzFg
         AC7R8799O1bwAdf9PWtOn0tIJRUtlVRMp+GD8hBwKwbtHxu6EyN/F32rOYJHP9ghxmls
         zB4zTyFAnULEBE3m7GSqELDA9LGGfcv4GwbDJl4RFL7K5MadUV8jgAT0Bg4d3bmIRdY0
         zjARGO7Gj+6ItNzhZC+dKyBzgMyQvtLuxJy6jkVUepfqzsnIKeE77vP9chSAjezuyLr+
         fsM4soUaI6fXKVxRGMCjtzwTCf3hf6z4FiQTL6DrYx7E5y791QZObqKJvzafZTLH2p4o
         ouXA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776059036; x=1776663836; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoTDoEKPJJ7oORGok1g/qKKkkmMgzjWgZIoQ7uLTDCU=;
        b=TkVAEgDDKCKSuJvzJL8x2UJDPRrpv4xMRUYu2w/2KLD0ivFWWHtTzrIKPW/oubwgsN
         sGiFjCpOjFszNy76MVV3GnFQ0S4tYUMXcFcjcmiknhyK8YeCNeHFmJVOqBa2JkNGCdFy
         anMOMaA1Yxbif4DERXpZKr3QZtdD7rijhoEy/wuMQawnuZW6rxxQA/NtkvR5KGYG2nfr
         N/ykmEfXfkXsvY1t0GLauoPCfBaN3g89SZEghZBE4k+MkGDawHcC0No12OKSrta0Howf
         l6jaFOP+HPZxXKCDV0QyMH9NV+pxLuT6CXDZGkSGpD0p8ewn0/Z6s8f62RHJNSHfc1b/
         biSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776059036; x=1776663836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aoTDoEKPJJ7oORGok1g/qKKkkmMgzjWgZIoQ7uLTDCU=;
        b=Mh8ShWswnEIqnZM+4vfrnnl5q03T8Vnu75MxaVgI8LZaxOEhjAOxqxyh2LFkkvNkl8
         0EE6PW9r83IhGzwiLkThJy7mtC1xn5oJYpBJS13FNekHx3Bf7G8cvOjye1JmAoZMMOiC
         RGaVAZldClqLSc792K+Uc0uF+bIDKV9I41OfUqLzvS8tRgk9N8x3sSPFtjsggmSBXLaQ
         BjHI8TfYqTcuJWGW93+DFKp915HcKcJjmzXQzrQJdQ+D7tYLGPyy/Vheh5gBp6iHw9Jd
         SfJb31w/fEGsoruP7ndBVQYONRKnRK5vOhhiVfkdlXzNUPhzJl1wR24a077LRFrpSlT0
         LJVg==
X-Gm-Message-State: AOJu0Yz/So9Ys7zEf3zPnLUx9UPu5Mazawf9eO2RXkqIRkha+1i0WmQu
	xB5f6rKK6IR6EVFgAF0TXFGDAEkv2aIC8e2vLwZBb3BwxszMBiQDkJRf1kziLTItdsu72PUu71t
	xWTIOYSA+j0IQPLcqV6q3s2ayVnXlQJs=
X-Gm-Gg: AeBDieuoP9rMXpIdt+jj76HSPjnDkJVhdHtyK0K2qoG0vbRsx7dWuayFG5ysxMMdhXe
	QqBxt3BrOmqAoYySRIB1UFFToWMZGGHxCEMzapQ8Rn5kCuo+mxm9ce7g0eJAeh0JjvYNiQMBnsZ
	ERaQZIpT1IFwi5Z6+j7mpCMWTUqFJ4TDV6ETpWsY8DTFw8BEl+cNeBUS2D50mndvEo7Ok3GWMgc
	eJggM8x2uIIpCfFtZ+7FonxUR9XZXI4+tQZgAKTLHr9zhmBbwbAuCebPLafxF76feWgMSHzWRsN
	CtDa6iKA0eeetyNPJ+y5YiEumaxM3C+DjbSWZYlPIo7NW2gv/oCBtq93GcrrFTs6Qw==
X-Received: by 2002:a05:6512:3b84:b0:5a4:6e:ef5e with SMTP id
 2adb3069b0e04-5a4006ef179mr145276e87.7.1776059035764; Sun, 12 Apr 2026
 22:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260413024804.1678-1-wangmy@fujitsu.com>
In-Reply-To: <20260413024804.1678-1-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Apr 2026 07:43:42 +0200
X-Gm-Features: AQROBzDC87VCd_u7wqIFlzMp8Pkbm1iLZxOQR6DDlXL8Jymh7xIonp7whsgKaVQ
Message-ID: <CA+chaQcEYDO5-jNRVZajTm2mvbnkbParUAXndNGFn-PE72-+OQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] dovecot: rename downloaded file name
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 05:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126269

On Mon, Apr 13, 2026 at 4:48=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Add downloadfilename to SRC_URI to ensure the downloaded file has
> a consistent local name, avoiding potential future filename conflicts.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb b/m=
eta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
> index a6b78ea781..9b3666863c 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
> @@ -9,7 +9,7 @@ SECTION =3D "mail"
>  LICENSE =3D "LGPL-2.1-only & MIT & Unicode-3.0 & BSD-3-Clause & PD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb805cc6bdb95ba8fc2398a55fd50=
877"
>
> -SRC_URI =3D "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
> +SRC_URI =3D "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz;downl=
oadfilename=3D${BP}.tar.gz \

dovecot-${PV}.tar.gz is ${BP}.tar.gz, isn't it?

To avoid the issue with modified tarball I was assuming something like:

# 2.4.3 tarball was recreated, see
# https://dovecot.org/mailman3/archives/list/dovecot-news@dovecot.org/threa=
d/V37BEIZTNQODMWIHMTQK5DSOM5RDJ7NF/
SRC_URI =3D "https://dovecot.org/releases/2.4/${BP}.tar.gz;downloadfilename=
=3D${BP}-recreated.tar.gz
\


>             file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-st=
ate.patch \
>             file://dovecot.service \
>             file://dovecot.socket \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126264): https://lists.openembedded.org/g/openembedde=
d-devel/message/126264
> Mute This Topic: https://lists.openembedded.org/mt/118798933/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

