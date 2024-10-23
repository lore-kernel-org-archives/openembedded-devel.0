Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96305D2E036
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:40:59 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4891.1729676456168401782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=3bBYv4HF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.43, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e8607c2aso7258964e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729676454; x=1730281254; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWG2u/Vko4SDrCSeIcFi7AAt3wiyZcL5ypIR82WM9Hs=;
        b=3bBYv4HFh5byRJ/HkiHc0O/iPp6UASWROMO8MXdx4aV5f52k21U2DntIzejUaKLANk
         b5o85OeMpKowmkrpJDW7edmVgVQjGmni5y+NHlwp9219LLiSz+t5pXiK5GUaUMldzDJX
         YcW0m/Tjnz9DfTaLDFYu06+NDGTAQVUPREBZ0RmGwjwmQdd9IcFyNhKpDt08KuAlmkNc
         BkTJtBORhMmiqc1AdY/ZnDZyO7C/fnkas9SrzJq93seX+3IQU5AgGj6Ecc3wbznzDJPA
         OzzOryP0pnxXsqoh5qJnqIy/KRfeTOZWWOCIiKaOdh28ASlkUETJFzFnufSOWsQ9E4dy
         JUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729676454; x=1730281254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWG2u/Vko4SDrCSeIcFi7AAt3wiyZcL5ypIR82WM9Hs=;
        b=KoyO82FO8IaYulMYkspGGJUIQwBVn32MHTpDCw9VFPvoQYcWBBN/d10a3nr/gMJipQ
         Rdxl8prpP82ATdF07W9RD54vLdt44kUlNIEl9MsG58jv8/ulgmvb8sQZwOvezpDDMKyx
         iu4SUMHyuJtUyztzt4MmIs1nkhOiM2Qjg8BCGuwqzDjWNw5hoI6yjmHn7PTORcN5fRW3
         Gi/35evQEXAoWExiBjn9KVXZmK7SNO9CXAQtSgUykAGya4Teix1w2+Qt8CHR3uPMb71b
         uJGG6uThgaw0rS8TAgoZZAorHwpeq8Ox6nYrzYjpucXVkpqHWps72lgQOTZj6wdd4BxR
         kdHg==
X-Forwarded-Encrypted: i=1; AJvYcCUCI/4V/qA7rHItthiE3uyzAF6bbuCfXxO9NPKbpN9gcyhid8p0rDikfTkA7N6elS+qNa6rU5+ncrP+aDzylcuba3Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0YznyqBEV5OBJ7ocrOFejGue0n+Fimsn1gVj7b5gvDNwSxaenObu
	OUpCZQzXm6UTDJe1ZEREu8FPDEGiDoQ2LUfga9dJmur8LmAlfNXYS2Pm2+hwag1Rq05yjjP51/7
	UMYYJYUZ7hZOUDTSgvVsGlQKWrrNAOWPLg7jNiA==
X-Google-Smtp-Source: AGHT+IFZmiKskhueBMdcb4pDeTNbHZ4WS/rXy+FGRjfib/xVIpx9//K/9QgzOBoqJBtP0SvLXCdA/Ue/GxGx1eiA+ZI=
X-Received: by 2002:a05:6512:3da2:b0:536:554a:24c2 with SMTP id
 2adb3069b0e04-53b1a303696mr991131e87.13.1729676454180; Wed, 23 Oct 2024
 02:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241022105134.231556-1-brgl@bgdev.pl> <CAMKF1sokb5Kq7TLz5iLMOFAhvzTUQriDLoYzksg47V8oUjoVUw@mail.gmail.com>
 <CAMRc=MdyTphfJEzesjHgmavcTmX1n6fE53b6KB6Q6V3iwQ6CTQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdyTphfJEzesjHgmavcTmX1n6fE53b6KB6Q6V3iwQ6CTQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Oct 2024 11:40:42 +0200
Message-ID: <CAMRc=McX2vyjjLejO4ssh_CdQVFu+YpPv4DnkVrDsP60tanoOQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: update to v2.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Oct 2024 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113145

On Wed, Oct 23, 2024 at 9:29=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Oct 23, 2024 at 6:02=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > it failed to build/fetch
> >
> > https://valkyrie.yoctoproject.org/#/builders/81/builds/81/steps/14/logs=
/errors
> >
>
> I think this is a false positive? Some network error? It works fine
> here if I wget this address and I can fetch it from bitbake alright.
>
> Bart

Ah, nevermind this, I didn't commit the sha256sum change. Let me send a v2.

Bart

