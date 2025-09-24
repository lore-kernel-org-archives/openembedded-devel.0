Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E7ECAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:10:16 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.8449.1758705009446473338
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ue0RXJ1j;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-789c9c12c11so699251a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758705008; x=1759309808; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CjTRjqZzRl8zsYz+xRoM1+5Fq4LTNUuOm0c9C34Yks=;
        b=Ue0RXJ1jUyTrdM6CJUOCVzw4xf2DicpPvVEg8ZXW7/Tooy+S5d8xopZCQ6D3PduhMl
         Ii8f0p1Y8T6LIPRyn4lfdAvu5UNGHWz8sEsi7Km9hK1yUuoYbkDF+5jIEK4UMavEX3Ji
         y+Nu70hnxYWJtLr4JaRGVDe2anx2tkIGQfHQ2N7ZM0Ggm/lgoBpORrQOA/4TUrsrQ9gX
         EKrJTbIUdcnRpjOJL7Y59YkP6uKCJLl9mNDE2TH3+xOrbiG3cFjYjDXaufYKO3XKwPkR
         SinNDUhjGRQPQ33+GFJedT+mqrmGFgBdvPs6Hl0kdsipM8IZ0Ld4W9SMFB8EUsCPUNz4
         Msng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758705008; x=1759309808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CjTRjqZzRl8zsYz+xRoM1+5Fq4LTNUuOm0c9C34Yks=;
        b=jdnbHNKaxiRRVbb5Nq8AM+op8ao4sQN0Xh4B0rxuSRwKMp0BUJDTxBLG4eHkn0OxoL
         LUYOU5vbCUbSOlP7INngp8PyykbVUeigx1mAhTByfeEyjnhbd+CalQAC8VFgyo0L8B4S
         cOag26r5S0czUuwQNKj3Q4wEwjb0gPKOqu4Oj7uQFhQffQwPfL8OAomBujlSH0lkP2gM
         yI0S08Uc2NcnGodUsJx1eHzGf2obGNuXyYazg0AYfHbsTZkNzhVfLCKULCUlD5oFGCV/
         G5AGWhx5s4KRjFJ6YWecKDWkDMuCUUvvaBhS44DIsOM48KIhiz2+O0q3IIRqwpLPdnrh
         W18Q==
X-Gm-Message-State: AOJu0YzU2bUQ9KkoQQ/7sSH10Pue2MTo/1Gsc1deIzbGhu1LhuW9GWtT
	lRseXkn751fqmhulutnWGD9q1QjYqHNecPh5oStCpFD30Tr5qwthmGvo725+0NXTUbp9JHjI883
	vQnFItup5+meRSYcHP3X1rWvvv8dIXt92eg==
X-Gm-Gg: ASbGnctWVrOmAMvKc0mbagMYvWegQLzqclavZBnTF06hkB3kqjsLGXqIiyU0T04i8Vh
	PZV+ysaQDn3WWpNoaTuRDkMVpKaDbUorXYgYqOtWHhkUlyuBW7XkZBQqm/kz/i4cVT6P0C4z/aF
	ozkMlrTTW40qqjtv8ZtRe9b6OEl4OVKoOlAmDbk/KMZXt5o9INETPA/U2LWIpUQ7rqrTO13cMFk
	Mf0yVuH1Q==
X-Google-Smtp-Source: AGHT+IFCxIOTfX49aahWhFm77Ktixe2CJCPoUlKrocXKg4axTWypsAtM8smEmjav4FsQP/J1naQPuYsQdGz94mQkJI0=
X-Received: by 2002:a05:6808:2512:b0:437:e790:db64 with SMTP id
 5614622812f47-43f40671516mr832846b6e.6.1758705008621; Wed, 24 Sep 2025
 02:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com> <aNOmviT5mxV1tTKU@nuoska>
In-Reply-To: <aNOmviT5mxV1tTKU@nuoska>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 24 Sep 2025 21:09:57 +1200
X-Gm-Features: AS18NWDMNGTBvwauRDERO5nRcwhKKVFJFhrDMNzoqwvGYrL6I_03uOJYdJLjAuc
Message-ID: <CADySD0HMMVa-tvHrPX8MogBO6sq7+DJ=Bq=at9LpKxPz4HfiGw@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 0/6] cherry-picks from master branch
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119793

On Wed, Sep 24, 2025 at 8:07=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> Please take "fwupd: set vendor_ids_dir" from master branch
> as well to fix build issues with fwupd.
>

Thanks Mikko, I had that change locally but missed it in the series.
Will send v2.

> Cheers,
>
> -Mikko

