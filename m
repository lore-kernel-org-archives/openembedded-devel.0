Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F66AD4A5F4
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 07:36:59 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30784.1768808218391607709
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 23:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PegZ61uN;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-65f6f9d84d6so2409892eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 23:36:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768808217; cv=none;
        d=google.com; s=arc-20240605;
        b=gXQ14SPnPq6iyyF3DsdsHjYPyKTH0xmf6UAdlLwyDsi91GqBihLONUR9t/kigH73E2
         K5JBvGFK+98PTC4Rdq2PQm00NEEDlSkWwYxdX0TWmzt3EXg3vaqRr33gFxtGmHUpt61M
         vxCMQIyOFDhx5490xrj8OHoO5F7qQW2zhoOzGEBasJjj7IcnA6trjYhuYeoXveU3Prx9
         w6I+XM2WNjREG8me83RRkM/RT0pAkfGXYD+lwXFpRZ5m5E08mS8MCdSkE4LTMt2mht4b
         Oq4XdgQLnDg5iTl8Z/07lZRjxRDnphPPVENVZZwTgPTcQvgfsFSnVQK+YO3s9r18Clpp
         UL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PSuGZTTZDeRJ1O67hu/jxhCY1NMd2ajEm84yeyJPc9I=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=i60nCRu4iuauRkTh1+hdHgKW8fQ4fS/tbYWsGa/3JQvyHhfyQMo7do1vU+puhEfr2U
         OfTAMs+6sipeQ1os8p2Cf4tSpgF7rffVXpGOWJi+j0e1SPjc9ybB3bF+qrHUgDyYDABH
         ul9sCJgO/0gSclF7Jrofhvrw5q1utPsKs0K+HzkkHErOEfixiAxHOYYYnKqQMgY6VUG4
         K8N/7LWqjz8RdbK9u6OGZkDYPBdxy3r3DCQpjEY31EYo3PaVC4+pRkEqbHROG5ebp6sC
         9XvH5Gg44D8ij0uLLVCNJdn+LowW/QLt75sV5W22Gyp0Kqd04w59FCaZigJOw4DGEg+s
         xF7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808217; x=1769413017; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSuGZTTZDeRJ1O67hu/jxhCY1NMd2ajEm84yeyJPc9I=;
        b=PegZ61uNeqWG0gZXDkmii7WeqYChm9DGbPDiypKdMzCxjs1Tyc4bF0uFR2GDoP3rJm
         R5nUZgG8jf31EqyJBRzZ9PWUKULk+N6st7uPxPyL4zZAl0ZfAbep7Nd1/zMFwlS3LZ7V
         1vwoxHyuYNTFVT6C6x2cDvWSaXbTyHHWqKshUj7O7Yx60hClJ7zlK2dUN5GnbI4Z3f+V
         J33xtBBWRazlxBe6WDOcf//liPjhZfpTlKlRaqmaasy88agoNRlAKxlS2VXl5SRczIDJ
         ko4L3TwDbCEZEyBfNZxb0niTG2++usEI89bGE+9u8yGzFngu4gIVUe36QIAG3gtbApRk
         Ai6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808217; x=1769413017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSuGZTTZDeRJ1O67hu/jxhCY1NMd2ajEm84yeyJPc9I=;
        b=l/UmBFKfGgDhT542RqHjmKEiIlRw9jG5UbjDhfw++d1ekvCkRwi1FESbfFBmnaiGt0
         aN3KGBjT5+4fXL0mznD9W1gWS2gjq8EdUn3emkf2jJgMqnalxaXSMIjoul8vj3bgPlaD
         P/7B3RXAunJS94SeGgvQh/7sNeDxeqvqluZCRQ7O64qUuCDz4CWszaMh38FXPyX4MM6N
         VK8M6nsDt8qaJ+mRKkOk03yA+il2E7Y0tPihoRxxOZCg4Gb2cC+9e49hMUnP8ms7w09G
         L90G9epIyHIix1QMV9xjqHm0d70di0SjL8fDtLWVAvmnxfALo91VDyznX4SEekNK25gh
         bt7w==
X-Gm-Message-State: AOJu0YxlXI57o4WmfivQcaAt3SW/2OCsgWskrLgHld7h/3uuRsnYuMzQ
	OnYCgAYoJRe9M7MoLeCpwYqkKBLOe0yLcJyNonmDPqkgtH4RWn1zT7voiTsaoEWNB2Sai9mxzYA
	Wk4ZfNY398wXBZE3654FVZk0XgbJXlvJJRw==
X-Gm-Gg: AY/fxX5vfE40p/8ZEaGOP57a+AETG664waUo8hov+l1Tct+DMlzeTvTOOI8+JoHZbwk
	9K0usNBni8HaOjCNqCfOcLzG5yg8CT8OAVWFTOzkkmudfUSEOYWMg3FLhIIkbotCWOXSHqsdCsH
	w+L8K0K6DMwsH8gRJWtCtxsGsc6mkjE6QzlCx0qQM6dEqt7gW0ljAEuVOAAiEpfPEiGCA8k85dQ
	PT3yzQmntn5NU5cL8CsGjpSH7wPV7cOma3ZJ3ARjNXieWCJ++CfmlwFc83eZHjTvvISdLWu
X-Received: by 2002:a05:6820:1908:b0:65f:1012:68aa with SMTP id
 006d021491bc7-6611795a080mr4763805eaf.1.1768808217540; Sun, 18 Jan 2026
 23:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
 <20260114130100.1016416-3-ankur.tyagi85@gmail.com> <CA+s=J=zG5ULpadto1sfkVkLZjkuEjhjdKc3WbJ+ayr7StfC7Og@mail.gmail.com>
In-Reply-To: <CA+s=J=zG5ULpadto1sfkVkLZjkuEjhjdKc3WbJ+ayr7StfC7Og@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 19 Jan 2026 20:36:46 +1300
X-Gm-Features: AZwV_QhTuXdunnQ0-Lq4p6ZrY5GgccgJXeCl4uz6Lb4ua8tngijDN-VLqiXDOa0
Message-ID: <CADySD0HKCytNo0-7ugF=seC159s9_TNnr4T4Ny0=fyeiL7XAyA@mail.gmail.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 03/20] python3-aiohttp: patch CVE-2025-53643
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 07:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123589

On Mon, Jan 19, 2026 at 4:01=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> On Wed, Jan 14, 2026 at 9:01=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Details: https://nvd.nist.gov/vuln/detail/CVE-2025-53643
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../python3-aiohttp/CVE-2025-53643.patch      | 189 ++++++++++++++++++
> >  .../python/python3-aiohttp_3.9.5.bb           |   4 +-
> >  2 files changed, 192 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp=
/CVE-2025-53643.patch
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-aiohttp/CVE-20=
25-53643.patch b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-20=
25-53643.patch
> > new file mode 100644
> > index 0000000000..99ed1ca395
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-5364=
3.patch
> > @@ -0,0 +1,189 @@
> > +From 2b45c0cc5f94a4aab25e80580db73c5da1152030 Mon Sep 17 00:00:00 2001
> > +From: Sam Bull <git@sambull.org>
> > +Date: Wed, 9 Jul 2025 19:55:22 +0100
> > +Subject: [PATCH] Add trailer parsing logic (#11269) (#11287)
> > +
> > +CVE: CVE-2025-53643
> > +Upstream-Status: Backport [https://github.com/aio-libs/aiohttp/commit/=
e8d774f635dc6d1cd3174d0e38891da5de0e2b6a]
>
> Please also include the changes done to the original change .. in this
> case, dropped test and changelog ..
>

Thanks for the review, I will send v2 accordingly.

> Thanks,
>
> Anuj

