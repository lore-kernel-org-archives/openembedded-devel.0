Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA17C55182
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 01:36:31 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7657.1785807387857145348
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 18:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hUkeTuwy;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6ac83a09781so272426eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 18:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785807387; cv=none;
        d=google.com; s=arc-20260327;
        b=gfRZwmBWi274O6W8s0G7uiv+99DXTxJU9AT5MAKzEeVMxHxxgGQl+dZWfjOMChLlEy
         J8IotFzMbLnKxtoOpt5q7SRDWO69LfuYJJGt9jrPx8pxcHefRShra3Ky6O5GV7nU+ooM
         W12lIKGEnKLcLyjtH3nbQEGDm3hn7zPy4+4FqHx4/MmOORlgcR0r0idZCP6hvZ99yvwt
         Q7OY7oSGROSRzMBG8qdo11jp5UJ/w66L2WC0sQdX7Zvb0uxw9RPctJsVTaXlubACVlNC
         fRkqGY6fUbQYcmZUj5HXzg9BvSK7m5Wuhg3+1vFBuHFX5pTOVk9NKeFG5OgQE7pRWa0/
         CQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=slbiLr6EgaGHQRlpnWiZTAzMubXiP8SCEyl2mlUg8EI=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=ePlPU6slsuOh9iEH33Df5rzrGIAhBlCfPxq62WvnmjjpcrqwL5hefY6BIHdS9RfQ9h
         1rwcSINBo82y/nMyJT1yM69te6t0fCn5zpi0dKWjmNJSTU7osGQyQ7/DqCyIFfWnmfxT
         qNI8PFr38eoGz0IQyzmHs5P2xHBYq6FFVxnYuOKI5DINEFiXJ5nfFPjnOJ4Za7+PpUDj
         1gNDX1aPcZRYkO/r8aZndYe5yzCRAsAFEAu04TY5vajcMcU8BnFM0FwBPrBF+UXXf7+v
         ILKEwGx4s2kldMDGuIu/tpfyoft0groUVM98iOwzNeJFxORdXlSipWM5Tf9JU2y1O5HK
         2xiA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785807387; x=1786412187; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=slbiLr6EgaGHQRlpnWiZTAzMubXiP8SCEyl2mlUg8EI=;
        b=hUkeTuwy4wEmTgpL/UeswERMVuKzqnVObDLCghu+nIMIINU7QAYMdWWNnfLg4I7ogx
         8fj7iMH6u5DS3X/VtmbJ3hO/XLDsXpFLM6fXlyXTmZEIYIAvZVLZJ7d2YF6TO7up5Pgg
         kSmLtdDkUTCniU+ZVwNaLvQ8ZP6ghYG8mvOTdeSN9qmIMhxrvNnbh7nveHfdVuYMoDP/
         4qpV7zwbxxzk63rt0Pv5VF9W91bqlTaEomnxfucZ4Vda8UACJLij6r6inP6x+sVjLv0a
         5eAx2ORrVXVxsUVA6PwXFuvCO/CdEEgmUDOho77N1QWuJI/87CnnlM4Xks8fZCCNCGZ4
         1V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785807387; x=1786412187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slbiLr6EgaGHQRlpnWiZTAzMubXiP8SCEyl2mlUg8EI=;
        b=ImIc3ihvqZdAF24nM/9+ByzkHCy7uA4avJqN7tBl4p8HAb7yWA3+n59mR8JdcE/PIv
         Ji8OCdbFLu69Ix8NlfXflhFEJ+TlOC+zrmBoZI0FV+Bo4lCmhll+kcHRLl+MM4QjoSVO
         hsYzdXZsc5mak87vP7+6CdLKusUaUKY6bs3gR9MWcLfJiuYqdptbPfZNUSjXu/r8MfE9
         A0orNDYJerEgctpOlg30bizW6Om1KQQ9lS+UsfT1rQGergC5kGicpUXwSY/6memqgaNd
         mtJp+X7fvaxpV90xs/3WIvccvUsouYSHoamza+ywUT0PpjDqr3JibdkE4T/e7VftLK13
         ZcrA==
X-Gm-Message-State: AOJu0Yz72LAdGKGfgZ2hAx+psMU7iW0+xve7B6yyMVEsG9T7rDtPJrxm
	mCT3QabvLAhb3hu2TNpAh3ZHbXY3aS9DBzhit5NMguBEIIYSZzOuW6//ml8DfPzrH+thHSUK5mm
	ns0xqlAekXdWIgqTEgbFR6XqthKMtAnw=
X-Gm-Gg: AR+sD11WT/pef3w5lNB2XczX6EKhiWyP5fLLHtQQWyiKuozePJbroBIh02VbKg3/hYn
	xIbvgN1mQRR+ZTt3LxlygrADEj9w2IBBrFmGfcW3ZWz3f6U0j//bc/64fMKmjXm7G5wc/lz0Xr9
	RQxKEHYQVrYHC0VisXjowGT6K1aoFSzhp5KN+EJLD4I5O7i1/5K5vkFp9F+bT2egajGkMx0UbRm
	YurD13km26c5FllE2fXeGEMRpM/Zp3eK8tr8ozkYXYUPvR5tvKB9H3VeTMuo7x8UGGOZIgk0xxF
	HkmI965jnWQnLLffM76ILWpVQsYeUOZ7O37FHBdHAwGWsyUp
X-Received: by 2002:a05:6820:f07:b0:6ae:4959:e1ba with SMTP id
 006d021491bc7-6ae82990cf7mr2590555eaf.10.1785807386924; Mon, 03 Aug 2026
 18:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260804002727.586577-1-ankur.tyagi85@gmail.com> <CAMKF1spENpUegEZePkKD75zuvgRrS1VQiNdxeWZwXimjvQZuPA@mail.gmail.com>
In-Reply-To: <CAMKF1spENpUegEZePkKD75zuvgRrS1VQiNdxeWZwXimjvQZuPA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 4 Aug 2026 13:36:16 +1200
X-Gm-Features: AUfX_mzivoM1G5kT6YGJ7jE7sUhTkXjtTRxOpy95giouO9ZZ9GrL8Me29IXvdQM
Message-ID: <CADySD0HoRaHcXpcC=7x8uRk1j97kvhedtwKin4x88=U0yVReUg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 1/1] gtkwave: upgrade 3.3.127 -> 3.3.128
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 01:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128705

On Tue, Aug 4, 2026 at 12:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> please rebase on top of master. I applied v1

In that case it will be an empty commit, please advise how to proceed.

>
> On Mon, Aug 3, 2026 at 5:27=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> License-Update: update md5sum as address was replaced with FSF url
>>
>> Changelog:
>> - Hurd compile fix.
>> - Update lz4 to 1.10.0.
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  .../gtkwave/{gtkwave_3.3.127.bb =3D> gtkwave_3.3.128.bb}        | 4 ++-=
-
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.127.bb =3D> gtkwav=
e_3.3.128.bb} (89%)
>>
>> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb b/meta-=
oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
>> similarity index 89%
>> rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
>> rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
>> index 774a30e1a4..62ffafe08d 100644
>> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
>> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
>> @@ -3,10 +3,10 @@ DESCRIPTION =3D "gtkwave is a viewer for VCD (Value Ch=
ange Dump) files which are u
>>  HOMEPAGE =3D "http://gtkwave.sourceforge.net/"
>>
>>  LICENSE =3D "GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef42=
722e"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5b1819073ecce49dec65a690b63=
8c48"
>>
>>  SRC_URI =3D "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
>> -SRC_URI[sha256sum] =3D "f19da2db43b27bbcc669725843451945a68c3a4ce232562=
e341d6f63b80b55e4"
>> +SRC_URI[sha256sum] =3D "817e197fc1808f8aac3543c2c2f9683cb01368c91192b8e=
ae5af58070ef1d1f8"
>>  S =3D "${UNPACKDIR}/${BPN}-gtk3-${PV}"
>>
>>  DEPENDS =3D " \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#128701): https://lists.openembedded.org/g/openembedd=
ed-devel/message/128701
>> Mute This Topic: https://lists.openembedded.org/mt/120587319/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

