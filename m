Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F392BFF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 06:34:35 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6913.1777358066528019225
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 23:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ab17DO4j;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so9060873e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 23:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777358064; cv=none;
        d=google.com; s=arc-20240605;
        b=WbLPuzXOMrkq7tkVLy99rUIlFRoa7JXBWggQobX9lJVntJnRgLI0x+2uSRTyRF6iRI
         UErctljqdK/UxSJSA81r+ZmL1ikywLKizoyocETm/JTWYJN0xNQ1edlzDuqYdwNnz2kA
         jN/YpmXkF4JaKz90XDksxuDxr3d6PI16h2H6HiIibLKS08yDtdygYcjyL3mHpaPaOa8X
         +ptX39Zgydfpx7iS4ouMXHmSdq0WHjJTplcJYWOibL4AqYM/RIqVjhpTR+E8pX55dvy/
         dMCMwxjeAKkPpUHqMIr1M495ZIZwQ/QnTdWEBld9epm4tgSzye4/0eBSpeIV6jP3nUy+
         BFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDTQTlwX3eL1lebPEm6/Ui3YYf7FK+VSzWK1y7qYY18=;
        fh=QyNlTcM4pCHJ+HePzkUueMGg5A0IgVxFVjJ/bv3YUOo=;
        b=UwSxQq0T00rI8KTQ594zgXWdibHBgbyK28BAsjCFtdP+3SvVfkP1Sj332I9a4KwXi8
         5I70KY5GrxPQxPKIgZwBWlw+vDdmPo1Nxm7jF5Lj1F88p9+FMi/of6qHNCH7g4GUa0qx
         SgL8YIWPhj6x3m7wUOrV62/pfpMWbbHHVA1BOsjmRBk1uxPlbyEzuPHHHbWpxXfBcGGX
         1NNnI7RsrErL4qMiLLNr/c/GORpYJj8gZR58sqDsR5W8WrchIZPCEwBhW31lE120oThs
         wmQCXdstSuzRBSr52oLNi4iQl/xmxEN1mC0GUhPYQfNYNIH9LnNj617CofUkOcjamLDX
         5veA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777358064; x=1777962864; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDTQTlwX3eL1lebPEm6/Ui3YYf7FK+VSzWK1y7qYY18=;
        b=Ab17DO4jWBA4WDnLO71Bi+0VkSzBBfK9y2XETyQWSETTUJznG2KojbqzkGAPUIvVeO
         T/ApJ4/7PWZ1O0P5H7gBslm1+w95YKteOYM9sNrER51uOGMBAC9jh8D5gg85bKLpK8Yx
         bMtSq4Sashsz/Kpj6fw0eXKBgyYOAMowIJWMGAUePm7ySyXAnlzk7eAErbt0EHhm0fro
         lqxj7PfRe/aZrS8DJfeooA1A1HSPLXZHiN63a8JkurLM3kd3fZVu74P5De6Ft3X0Jffw
         T+wV1eQz/eP9ysekyp87p50CtqSSC4rzQKLSJAfpTXztCyp3N1gHfy/cEEAOHjbqUV2z
         aEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777358064; x=1777962864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDTQTlwX3eL1lebPEm6/Ui3YYf7FK+VSzWK1y7qYY18=;
        b=qRxfQf8FIN7tsPd/u7WlCT7I0kMGwlyzu6fgh3zVvBREbMZF3tiozpIwYuW3/BIO6v
         JgjuAy2x3EdXTeFuLPVtM+brpT0jJbrQpFJ+FCktv6XcvgqHBY+jEJBqY6rHbmg1Iyw1
         0MFO1MG+PuGd1S6HVEMif4ener404HCF9+MbQW+PyxqvyA5/D58OhyWgEGaUysqgY5FT
         JualM3h761C6OZvgOuA59ihIBnGBqm/wA9HSxa83L2mLjF63gBzxZk2pK+4KiFVJe8Dh
         fLw2Dyl2UPSQKu/7OKXmSS24J8DOigtdm3xd+avz0ZvOJa6PGIN1U9I/EIovJXf5zpnz
         3Iyg==
X-Forwarded-Encrypted: i=1; AFNElJ/lpCBaHp4TSpGZnMw3fMGcYZHmi2IdNjfgsSfQld5ROYaj1NVBaQ9qAkEr0CWZi4ycmGQCv+CxTbYs2KGki1u9lKw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1XOYK2fsRc5sOGztF8NT0dvDzrf7byDgFQyozLIZik5oyC1/b
	aB+4DMHi7Woqq6ZTK1pYl1ylvCsUkhZewq/9X760cHs2hUPyLYnfJWKADDlzSC3Z1QFTj7sc4CG
	d7ldXpDT7MLyB9F2xa1GICcObj4z804o=
X-Gm-Gg: AeBDieuSahE1UWtzP78Kg//qu8vcX4StQmDL2cZNzinpOjdtau3R6oZmjjalbi5ksit
	S5R8Kl6FuAvxq3wjr7iuCFuUIr161BJkWih+BaZmaDWCqfwLNkhMyVqKgWDYtj7NBoaxZJVauGn
	h36vAyGpJ1eOTnjB4wGWsINeGbl0CrPOzkNfO7X8W4Zg0UZypTwVHTYkFak2T89lPaiZ5UF19Cs
	Xfgew6TaEqNOFbiMxuRbJN/uWT1IOThbGPcxaK5RFlXJIlNezzlqZ0tHY+yAkR5eTCt6TY4sqCj
	awQMIJgAtomt8S1JZHNQlgoyCPNc77LY2HMsKXmxNU2A2bg=
X-Received: by 2002:a05:6512:3e0c:b0:5a1:33b6:2b6d with SMTP id
 2adb3069b0e04-5a74641607bmr681224e87.14.1777358064034; Mon, 27 Apr 2026
 23:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260424064603.728430-1-skandigraun@gmail.com>
 <CAMKF1sp4hCeyML8MMaOne2t2p_1+oKH37mvJUjF4M-soB2U_6A@mail.gmail.com>
 <CAMKF1so9vPsqk7eTi_ypsr-TiTJSeZFNPgri1KvvKzaT+yinug@mail.gmail.com>
 <18A9E5089EA766DA.2188217@lists.openembedded.org> <CAO5Uq5TarogKhyRTSZeYaZmSPPhJb0k2bKCJhSG3hev-Wf9m-g@mail.gmail.com>
 <7380b427-4e88-4eaa-906d-6274080ff715@gmail.com>
In-Reply-To: <7380b427-4e88-4eaa-906d-6274080ff715@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 28 Apr 2026 07:34:12 +0100
X-Gm-Features: AVHnY4Lii-oxBm7LE87NdUEvGP_Pu-T2GBqdW0HDurX9KbAuPtHFVCI9CJBcZ-o
Message-ID: <CAO5Uq5RB4M5DDsUfaYm-Fh7+WmcFDcZntQxv_EdQ0xbFuvzGgA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] mbedtls: add recipe for v4.1.0
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 06:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126647

On Mon, Apr 27, 2026 at 3:08=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 4/27/26 11:09, Alex Kiernan wrote:
> > On Sun, Apr 26, 2026 at 12:35=E2=80=AFPM Alex Kiernan via
> > lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> >>
> >> Just dropping mbedtls/ecp.h looks like it might be sufficient for mdns
> >> (untested because of the mbedtls build failure around qemuwrapper):
> >>
> >> diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> >> index 6726ef9b9145..c2e47ba232a5 100644
> >> --- a/mDNSPosix/mbedtls.c
> >> +++ b/mDNSPosix/mbedtls.c
> >> @@ -31,7 +31,6 @@
> >>
> >>  #include <mbedtls/error.h>
> >>  #include <mbedtls/pk.h>
> >> -#include <mbedtls/ecp.h>
> >>  #include <mbedtls/ecdsa.h>
> >>  #include <mbedtls/entropy.h>
> >>  #include <mbedtls/ctr_drbg.h>
> >>
> >
> > Scratch that... the changes needed are much more than simple header rem=
oval.
> >
>
>
> Good to know, thanks - but I think this also means that it won't get
> into Wrynose unfortunately. Doing big changes on multiple recipes is
> just too unstable for a stable branch, I guess.
>

Given how much of the legacy API they've removed/the transition to
PSA, I wonder if we're at the point of needing mbedtls3 as a separate
recipe - for mDNSResponder we're at Apple's mercy to upgrade it to
something that works with mbedtls4, or we'll just carry patches
forever. The only saving grace might be they seem to be engaged with
matter-openwrt:

https://github.com/project-chip/matter-openwrt/tree/main/third_party/mdnsre=
sponder/patches

--=20
Alex Kiernan

