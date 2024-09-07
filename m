Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42817ECE567
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 19:56:40 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.15599.1725738991087212988
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 12:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eufzBD99;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5e19b1656ddso1720536eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725738990; x=1726343790; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz9YjvjpjdcqzdBrOzRQYhMJOCWZOfCsWlqCS8W6kYM=;
        b=eufzBD99l9Vdpw4xaHwUD2/j1rGnch6X5McgpzyhZINThueNPyaQOhXr6P/ppkSBNy
         FjqO4m0SWP+mlOqY1Hpbu4qPSTl7Dn0o9GEgZZ/Uev6eSuTXYFzvxsYAwoqaCkE6x8tm
         MgYcWFt5OrNxPuds3qtD8bI24/5M9fPIR9bjbwSv6nWbEvyRuqDNKfaMZ9T+4vTF8GKN
         6qbDqdEFqq4zLhwphPQ2Au67DnNdbDT9TAc0eG+mVp8Po+S3HwHLd7FnIbY/hfwOKhdT
         CohRKBtViYFdFksVqIa2nX9IRy3/qwQ2aqQIhwCZmoz+kVROi200HpjAiRI4I5qcZSHx
         6eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725738990; x=1726343790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dz9YjvjpjdcqzdBrOzRQYhMJOCWZOfCsWlqCS8W6kYM=;
        b=PIbXbg/td4lLyWfxVF69qizLIOj6wZjznZtwNPgJh7+YD8QsDARC8oid84EWUYCMJc
         WNQjjYXkub33xStfT3+FMnJvYKTf6Mw8N+wA2Ui0i0RVopkaA6ACAvTI7pUEEpi9/Z+I
         1kvV+7tsEpiYbscJIWHfjIjt5XdDDs1WRYd8fXYFypEYImA8pOTHpqmCihaF8DmlfeJ9
         HHKZaPSPnOl4LScdGnpzhlUwcbNxHBoF8B3TCERS1ISZ53sf36adSkOFWHlK3aXqRDfn
         2egGrjf4FgKT/Mxgke3/mId4nSoRBCV/jQI2gs3RvcYsTidgZBSwfD9uDw8hPF0YIZcj
         pcOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE8VTlrsIrKcy42g8VzUI4ci8Zq/AyBnC7Wmzmgwa/emDLFoe87XXTFhW8KGipzH+wvnTmxWKnPB1yHOeAYqKoZus=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4d+p0L+ydVOTDt3W444Xkh5EbBTICfqvdD5TRb0qVbaHhTOMe
	J4SYDTnZez/aDfDMdYO/P8DFrup5xzpnmXdnigA7lhXZRTfHcmO6Wl3R4u7FeatF9hoNsatp8b+
	51jFlUkaPoSFcr+2ha/qQ3jkgtZg=
X-Google-Smtp-Source: AGHT+IG9i5UGop3iPp2HBxKbGk8yQhhooqw6rvI45NrRjCFwHNOIlnxobaVO4A6cCV9KVHcwD2Gh8/uL1AYGOvqL+eY=
X-Received: by 2002:a05:6820:1c90:b0:5d5:a343:d135 with SMTP id
 006d021491bc7-5e1a9bf47femr8007364eaf.1.1725738990303; Sat, 07 Sep 2024
 12:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240907083446.80928-1-f_l_k@t-online.de> <CAMKF1sqt1BZt_frP-rbPVFzKz4QCo9LrTFVxHsRR9Kp1MjE+qA@mail.gmail.com>
 <CA+chaQdHMh6W920EHbHvE4UfrfDAacWS6C_4X8gsU=mahrkFAQ@mail.gmail.com> <RFGGJS.TVMQIX4IAUA23@t-online.de>
In-Reply-To: <RFGGJS.TVMQIX4IAUA23@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Sep 2024 12:56:04 -0700
Message-ID: <CAMKF1srknG+hwSXAn5A2uoV1ZhOBqCyzL5yubt=-u6rTzDgVeA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] iwd: use internal ell
To: Markus Volk <f_l_k@t-online.de>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 19:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112118

On Sat, Sep 7, 2024 at 11:22=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Sat, Sep 7 2024 at 05:44:19 PM +02:00:00, Martin Jansa <martin.jansa@g=
mail.com> wrote:
>
> explicitly the external on (from oe-core) since https://git.openembedded.=
org/openembedded-core/commit/meta/recipes-connectivity/ofono?id=3D3683f524d=
c60325b3f3b1bc3a32e70a41064ae03
>
>
> Understand. I also know that bluez5 uses ell when PACKAGECONFIG is enable=
d for either mesh or btpclient. But that's not the default. So for consiste=
ncy, maybe it would be good to keep it external for all three?
>
> I'm not sure about this change either, but wanted to bring it up for disc=
ussion because it always feels a bit like groundhog day with iwd/ell.
>
> I'm not that familiar with investigating sstate cache reuse issues. I'm w=
illing to learn more about it, but right now I don't know what exact files =
I would need to compare, or is there something like a tool that can be used=
 for this purpose?

I think ell is in core layer therefore it binds us to the compatible
versions we can use for packages which uses ell. It also depends upon
how upstream is expecting distros to consume it. If they think that
it should be vendored in apps then thats what we should do

