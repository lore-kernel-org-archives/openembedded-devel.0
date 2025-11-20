Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33559CF64AE
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 03:21:13 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25674.1763608871240077530
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 19:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TewcAwL5;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3e89d226c3aso215986fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 19:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763608870; x=1764213670; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPf4QcDhadq3OiyDRFVtq9sAqxlz4qYbhbmMBVQ0oO4=;
        b=TewcAwL5J+lFe3t5HS5dUI6BnENNwdC35QgKBW2xiOX66XKPV9SbrAnjhotTOjjMvd
         M69tqauuOe+WqDVZKii3ROqM/hyJk3BYK5JAb0DymuMD1v4CSbihhC5+lUBIcXV0TnQc
         Oe9kUNbn0EeYh37sD6XgtxKtJl8LV/PqDESzSIManBqCSLB0u1pff94nNbdVQS1xkWaC
         xxOutP0sks2yN2NW2AGN0yDm5LyZ1riNvZJC9sY8s0TWowfpkE2gzrTy0IPqi/oGi7VP
         epLVzlcyDQcjiS+0ApOYNyyBlrReJlXHeI9t73oQ5pKKNZ+8hm13B1I082spvD6yudRq
         wsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763608870; x=1764213670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JPf4QcDhadq3OiyDRFVtq9sAqxlz4qYbhbmMBVQ0oO4=;
        b=gsC2mphEl3fRL2rLPq7u/iB+obncNED8IZkPAzlNghI1EPWU4wS22bx27Oq284EuUx
         1SlOKdFU7jWykOqCY5iP5qOudg0IAtXZxGQeAy4LyRd5WZtZxhcjTiKqDxIhwD7vr1M5
         NhiyFTFJ1kxXklnxHbuWYAbxb4LxHPWEQI3gUmc7igBuY7/nTALj66NnuBM3b6gBVnIX
         8XFKJL/xBN8/0cIcA7sxH8ayfHGGV3WBkY2RTFlFxKbF1UoODlpvxEZUiiEKsR/hnLul
         hWm+6fi/t4qaPSGD9peVuCf4wushqtJOMl1T2cNfcm7WNIlw1oJ55uoXPEAINJI32fkt
         Qpvg==
X-Gm-Message-State: AOJu0YyT/tV30MxvkZiTYHZt+uE8QGNHBo4OnDjUAzJCPgOhFyyiYFhP
	lq3sczcOk5Cn8IzQn4A65U1Qg9r3TyqQ/v6Mlu4TE3x20JkCiZS3xNKN3A0aVo/5KfMYIbSweZ0
	Sq0gbSd7Uk4DWXv0vbjvzKlMS+0/0+l0=
X-Gm-Gg: ASbGnctyO826WG9XgSDUcSBbLYjRkip/9GfKARXgYS1dfrwYWG0TosqnRkoo1s4H9va
	lNVd5/plOdWq0J8offxvokKMOfIGPpOhiJCSHEvpvSsrs04InUrwyczS+WBJy1i3EwxVI+1oV7P
	YdrxSYEmyTNrBX/M0Vet4DuRSd5sZVQMiJrqHMuxaf9ivw7LPTRVyxJr+ZwhVSrcqQAZVO/YCkn
	lNA93sk+mRqCcLbdfGxrpC5Aw/d7/FVfXFAwXTVQ1TXIuW12t3VJ0vvNFnCW5O4fz6Ih5Q1YqGc
	t1lRcZUmYwE8t/w28+s=
X-Google-Smtp-Source: AGHT+IHkv/F0inDV3hfwfi5FqYmm9BgtsusXIVPwwCEDJjTeL/aT9YMl1nWMcNiy2aBHFw68jU2PFj6ECtoaJLMQLqM=
X-Received: by 2002:a05:6808:4f4b:b0:450:d1ba:151a with SMTP id
 5614622812f47-450ff20c178mr969803b6e.13.1763608870319; Wed, 19 Nov 2025
 19:21:10 -0800 (PST)
MIME-Version: 1.0
References: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
 <18796309B75AD22C.1255594@lists.openembedded.org> <CADySD0HjNzgqHbvf=SERmsst-XNeH-ZmgqcXHU6HxCd-M3HREQ@mail.gmail.com>
 <395a0123-3431-4955-b850-ed1cbacd7f38@gmail.com>
In-Reply-To: <395a0123-3431-4955-b850-ed1cbacd7f38@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 20 Nov 2025 16:20:59 +1300
X-Gm-Features: AWmQ_bkSpEna_DRBk2rbHhaax2xMEJVyXXq-0MLk3F30z3zmdmVwyXVTujACECY
Message-ID: <CADySD0GS+vf3meCVV9y_cJvdnA9SyPme8kK-TvSU=8LfqMeykQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 3/6] libplist: add ptest support
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 03:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121920

On Thu, Nov 20, 2025 at 12:08=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> On 11/19/25 11:57, Ankur Tyagi via lists.openembedded.org wrote:
> > ptest summary:
> >
> > root@qemux86-64:~# time ptest-runner libplist
> ...
> > PASS: test/json-int64-min-max.test
> > Converting (failure expected)
> > ERROR: Input plist data is not compatible with output format.
> > ./test/json-invalid-types.test: line 17: [: -neq: binary operator expec=
ted
> > Converting (failure expected)
> > ERROR: Input plist data is not compatible with output format.
> > ./test/json-invalid-types.test: line 23: [: -neq: binary operator expec=
ted
> > Converting (failure expected)
> > ERROR: Input plist data is not compatible with output format.
> > ./test/json-invalid-types.test: line 29: [: -neq: binary operator expec=
ted
> >
>
> This looks like a syntax error due to a missing variable in the test
> script itself

Thanks for spotting this, I'll send a fix in v2.

