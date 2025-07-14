Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E123CC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:53:02 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.80084.1752504773805652186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 07:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U44mS6rB;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-558fa0b2c99so3685974e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752504772; x=1753109572; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUOtTwIub01Y7JnuGqZcbWsFs1P40S0gbH/8dr4yghU=;
        b=U44mS6rB5Rqj318uNOEG7T8irbt1+be8cBY1mGA3BVjN6Wa9oZe1L9fUiDlfo1c0IY
         JVQNLxRPLJQEQ0suWpqeqo/WQ8BcfZbZwdCj6i+WVR8E2F9MHOecf0szWPyh8TsbBBjJ
         0PlaPjFIrAUXvStwRUoq3bbEXBR2kbqyUd3sCeSi7SYT7TNA72kJQa4pY3rCi/E6KasE
         91eBPkuvy8HheYv1VOTn5fB2yAUrZMosccUCQvxWTIPob+tQOc01toYHl8vqJfS09COt
         h/7p/UJ0FCoi01/zdhbFjNNJNuX+OrTBH4T0BmJ3LeJT+/a3MravX8cD2xFMLOvYoaJ2
         62Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504772; x=1753109572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUOtTwIub01Y7JnuGqZcbWsFs1P40S0gbH/8dr4yghU=;
        b=cl2pdzkhpuHv/C9wFXfNTPeSFWtKCN9luony2cSzl38Vt56ImRD5p+5DbMbN3rDQ76
         ZOq9SxCbZE49rYNf0D35NVG96KNoswTztyep2ObC8XB5i25B7iO9TY6J2BirxzRIsWrA
         JxDps1zlL+tpM4KGtLUMXHbCO1ggRMehkeEcPhBuOIJYoO+BkuONSGHE0jUDmGtLCazZ
         pi1Lc71Sx2TXKLj55tRsJi3IMjQMFIFBy1jpcnTZpXd61LiwaGkSK31cbPSLE4fRyv2a
         QskVTJ7u9umF4qvB/4MsVXiZG6iXzrB4fhbaQ1J8bQvlGWc3ppGhw7ztPZ6nuqSWa9D9
         tfQQ==
X-Gm-Message-State: AOJu0Yzr7mArnV1ZtW02K0j3ysG4Q5KGzPdYEDNPQJFd+sj2iDafzo5M
	D9//KtsyaFXxJtJEUreIKUEUDMYfHR2HY3rarURL0IV5CyBtlI2JJ+T9Q5/ws5UPUgb2cbxrQ6B
	qIGrgsjEUL5aKTOd5gTW9/YGcXBI/s54=
X-Gm-Gg: ASbGncv9o2B98Tu2y5FFIUyEMp/5ZJHCEfkuv3LEX3orMZoA4d45ohZrWx/NgtTeF6N
	ULX/uBFevcCuaMb2Ri1CqZQuVP7SnFf1J5it4857WzDtphvEj7vd0nGSHSov60iWsVGPVi0btsd
	CyeyUI9JSsdTrXVVV8+caw2epk3wIl090/ckbtjWmyqpzmpQ3ARTHl0TzGBEvOSPdoxFTXEKNED
	UJCAHARkA==
X-Google-Smtp-Source: AGHT+IFgFZ8wW5FtLM+lOgImj5WXWvMJYdhNXv979O9D6buKt5dt8E49TSJ0af4vKZLQVqy+eCh9v3lchW53l6VTpUU=
X-Received: by 2002:a05:6512:e95:b0:553:2e90:98b4 with SMTP id
 2adb3069b0e04-55a057f0eb4mr4450009e87.17.1752504771708; Mon, 14 Jul 2025
 07:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250710085438.270911-1-mikko.rapeli@linaro.org> <20250710085438.270911-2-mikko.rapeli@linaro.org>
In-Reply-To: <20250710085438.270911-2-mikko.rapeli@linaro.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Jul 2025 16:52:40 +0200
X-Gm-Features: Ac12FXzTWpK-Pgf0kcdLABw6iNYtklyivNkxiiaUHrrT4yX67-vozEkknkLWjmI
Message-ID: <CA+chaQcLTgKxuss7Ge+FH0tx_Todj4d+yBx=PRYPffY-W6tcJQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v2 2/4] fwupd-efi: update from 1.6 to 1.7
To: mikko.rapeli@linaro.org
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 14:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118540

On Thu, Jul 10, 2025 at 10:55=E2=80=AFAM Mikko Rapeli via
lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> Remove upstreamed patch.
>
> https://github.com/fwupd/fwupd-efi/releases/tag/1.7
>
> This release fixes the following bugs:
>
>     Fix compilation with GNU-EFI 4.0
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  ..._binary.py-Use-env-to-detect-python3.patch | 23 -------------------
>  .../{fwupd-efi_1.6.bb =3D> fwupd-efi_1.7.bb}    |  5 ++--
>  .../{fwupd_1.9.30.bb =3D> fwupd_2.0.12.bb}      |  0
>  3 files changed, 2 insertions(+), 26 deletions(-)
>  delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-efi-generate=
_binary.py-Use-env-to-detect-python3.patch
>  rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb =3D> fwupd-efi_1.7.bb=
} (90%)
>  rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.30.bb =3D> fwupd_2.0.12.bb} =
(100%)

Too late, but the rename of fwupd recipe didn't belong there. I've
just noticed it now when looking at the fwupd upgrade and wondering
how the PV was updated when the upgrade commit doesn't set it nor
renames the file (because it was already renamed in this fwupd-efi
commit instead).

Cheers,

