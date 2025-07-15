Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E35BC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 06:17:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.1342.1752560209373791092
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 23:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vrMnBEF5;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-556373661aaso4244678e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 23:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752560207; x=1753165007; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=euoUco8XNVNZAz1HxZFyLKGoDMROeHanB3HKsyWDwYE=;
        b=vrMnBEF5Ll28iBeczNhLKQkHjWlttdTHAAMqDR6jKboq2LdGoXIXjvOHuCQ37ra6ez
         K1KnjJMGMq29+sFHxgF4EfzjPALn0tWBCiCzzvIX1eKA1uU8RWoJx7uVmE23t8rayWD7
         SdJ/1vaBo7Z7Dq8MwLofzXp+Qa0XNmChPHvejl4IzfCR07FR/jCM7eaAeI61bvYxvz2Z
         9VJQKMcCuuBHLQ5bpHcu5Mb4yb5KObBMmVA/5Jw/uRyxSJlNIsbbyWvSo88EtfhqFLn1
         ew25njd9qTuPqUwDG2qxaYmFc6NrMk8Q4qCzrBEFH8/rgOoic4cmWzLnKoZDdRq2ZrMs
         7hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752560207; x=1753165007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euoUco8XNVNZAz1HxZFyLKGoDMROeHanB3HKsyWDwYE=;
        b=IQnImFs7ZqSqDb55040R4f4Rj0BKW5VkFGFF7RfO9UHHtJcPObnNUzqPocW7fyuEc2
         Ue2AgE1N0MjMv5xk7+osLQnmq4WjWFFV9cS3nMRfB7gDVDpB3FEP4hjUvs1WTGQ9XDYZ
         80H5vagvXjClcRWEU29ttVsjkzehv74WP2+BcYb6Df894wAPRhG0nL2kGMv7SF1NJTv5
         UaDOE5JyLBRMIV41V9BzmQYCKhGOxRYaa+DoK7PEN+AtKdbZPr0TF1Q4h6MKDqJEflzV
         ON9Yh9niC/E3aVep3kRaHPDj3DabcyQzm6mHxZqVrIbfXKeFkQjE8Y+yDtclH6lRoUhg
         XKYQ==
X-Gm-Message-State: AOJu0YxzxdGYrftsS+OqCUhusPvQ1qRjmXqVubBToGhjnkNq1NwucAHi
	nsnVeZiqBiFjWHWatOKtP6YC+A5fTHKS47VQfOXDpLoHjQNnEV/1ETwklm67Q7+A5fM=
X-Gm-Gg: ASbGncuCULrgxvliGk2hjFdW+FtbztUIj7VZ3NitMDwf6gbfm222HncPSUm+HJC/qrN
	AviXDUIkD+siw+aD6xIPfOOYiEEc+++TQ2PG7d42TiYlTVSxOBDMcDyQ3wwpqCi4Zy+iLSF5FHr
	iCDS3H6UCaxiWF4LB5Al1r2Psgd6NjtUKMLJDamFu2pfgk/C4XhQPPVIdo6gTYJrieZ+Icuwvdg
	biB1iV9t0BjFKTihb7VAkKQXfJKaCFjtF+m6h7p2S7CQi9SOqmFcM4onoXZ/s7EZLF3EnaJn2L3
	0C29zZajmWLXKAXFP/O/eyhePlAXKY9uSF4kQCXkei91vD1oP9eY5qtT+xG3cS7RvbmLWCVIwZa
	fVoOehTPHvTwbvrxwlVcUDjnC7vMP+raxSoZB5bgfR6SPLUunjv1i0Hz6e/f8yOPnPw==
X-Google-Smtp-Source: AGHT+IHG427HP3toYHZkwUbdhKvhDpYAjIThv2+F4Ry0w4wS85cNvWOqKasUXfcq5f5vyjwoHt6w2A==
X-Received: by 2002:a05:6512:3986:b0:553:adff:87da with SMTP id 2adb3069b0e04-55a1ddd116fmr347904e87.29.1752560207315;
        Mon, 14 Jul 2025 23:16:47 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b6070csm2167862e87.153.2025.07.14.23.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 23:16:47 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:16:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH v2 2/4] fwupd-efi: update from 1.6 to 1.7
Message-ID: <aHXyTUPc799i2aJX@nuoska>
References: <20250710085438.270911-1-mikko.rapeli@linaro.org>
 <20250710085438.270911-2-mikko.rapeli@linaro.org>
 <CA+chaQcLTgKxuss7Ge+FH0tx_Todj4d+yBx=PRYPffY-W6tcJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQcLTgKxuss7Ge+FH0tx_Todj4d+yBx=PRYPffY-W6tcJQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 06:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118550

Hi,

On Mon, Jul 14, 2025 at 04:52:40PM +0200, Martin Jansa wrote:
> On Thu, Jul 10, 2025 at 10:55 AM Mikko Rapeli via
> lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > Remove upstreamed patch.
> >
> > https://github.com/fwupd/fwupd-efi/releases/tag/1.7
> >
> > This release fixes the following bugs:
> >
> >     Fix compilation with GNU-EFI 4.0
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  ..._binary.py-Use-env-to-detect-python3.patch | 23 -------------------
> >  .../{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb}    |  5 ++--
> >  .../{fwupd_1.9.30.bb => fwupd_2.0.12.bb}      |  0
> >  3 files changed, 2 insertions(+), 26 deletions(-)
> >  delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate_binary.py-Use-env-to-detect-python3.patch
> >  rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb => fwupd-efi_1.7.bb} (90%)
> >  rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.30.bb => fwupd_2.0.12.bb} (100%)
> 
> Too late, but the rename of fwupd recipe didn't belong there. I've
> just noticed it now when looking at the fwupd upgrade and wondering
> how the PV was updated when the upgrade commit doesn't set it nor
> renames the file (because it was already renamed in this fwupd-efi
> commit instead).

Oops, indeed. Bad that this slipped through.

Cheers,

-Mikko

