Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B7FC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 16:49:37 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.56157.1720025368218160248
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 09:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dkiHbiQE;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-701eea2095eso3345833a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720025367; x=1720630167; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kfwqn9u3QwUnQnSFTXdTARqYMoYkUyGW922ggZogENo=;
        b=dkiHbiQEVuydqizdbZAttMgaOrNyfO7DsGegGIGiM2Rl2gycautp+daL0NAhHwK0/V
         lp/I+45A4UevOatEp5V6HmiSwcAlQs5zrKItXHgOrRtd8Nv3Ff5XxoAHVDW1RGB1vBiB
         Rl2URDx1QYyA/STpEa8NzRVXsaJvba9Dps61aisAYin5ythyJfNO2llaO0kB6lFgxe5E
         XuKhSoEZdS/9ZKEBTiJjMo/dBH2ZSDWrV8fgzc3j9MWPcJ/rmrZBbhw/UEgfpz+50AtW
         ZyoOCcVjQJ5oICtG7VCYhLE6rMp1nMBH6mz2KuPivIQtyolip7jaLjZnPkcIIuLSWtN5
         xa5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720025367; x=1720630167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kfwqn9u3QwUnQnSFTXdTARqYMoYkUyGW922ggZogENo=;
        b=n2dXdiEPY84P8ZdaL/6L1kQfqQjgoE6L+oSh/Ij/zvoFwrNKbblyHqhrQ7eT8czJUU
         T+qsTPT7voOWvpSL31+uK0r2s761ZT96wWq3TFkyVbwa7SHgoMS4o73GItJ6WDxSrQzg
         WRKEMw5leKQEaRFYQ8emwx21UobYA/gAMG7HM2gcsrS2gkCFkMZtXl1sUTDWf7DTydMi
         pI/tLQmAGyhW88Z5KmATfR3f6F0Knz3qXQiiRApOw06U4vewE/dzCwxQ7enxLN7cA8t1
         jmij64SXy9gJEDpD3eCHVXn/K635OOEn2ql7tjGeK5P916NZ2z8s4JYUEHeoKGMK6yuF
         EU/w==
X-Gm-Message-State: AOJu0YwTd6iKGzfs7ZwneoJxEAlcCjQWXO7XhQOq1AGbZ9LiFOj236Hr
	e7bBj4UGFv5P4coHLft1C47QkJlQt+BNgl/M6bTFze8hmzMajy7RRaImVqhg0eee8HlcN+SpeH9
	LIy7lgVGwHyGTdHNfZc5XxGm1mSI=
X-Google-Smtp-Source: AGHT+IE0+9mjXKDyS4qjgSefK1o4f0e3tlmrJ1UwXQO1peuB7wLlULMwm7QV7qERpGdFWiMHzBzIGhik+T+h5fSJtMo=
X-Received: by 2002:a05:6870:b028:b0:25d:eec5:471 with SMTP id
 586e51a60fabf-25deec50565mr2764667fac.23.1720025367444; Wed, 03 Jul 2024
 09:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240703164042.20929-1-ninette@thehoodiefirm.com>
In-Reply-To: <20240703164042.20929-1-ninette@thehoodiefirm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jul 2024 09:49:00 -0700
Message-ID: <CAMKF1soc6CDz51w76z+jbK4Py-xRpjZJi48mksyJw1Y65teSAw@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/1] apache2:apache2-native: CVE status update
To: ninette@thehoodiefirm.com
Cc: openembedded-devel@lists.openembedded.org, engineering@neighbourhood.ie
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 16:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111231

which branch is it for ?
Please mark it accordingly in subject line see -
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#sub=
mitting-changes-to-stable-release-branches

On Wed, Jul 3, 2024 at 9:40=E2=80=AFAM Ninette Adhikari via
lists.openembedded.org
<ninette=3Dthehoodiefirm.com@lists.openembedded.org> wrote:
>
> Update status for: CVE-2007-0450, CVE-2010-0425
>
> The current version (2.4.59) is not affected. It only applies for Windows=
.
>
> Ninette Adhikari (1):
>   apache2:apache2-native: CVE status update
>
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111229): https://lists.openembedded.org/g/openembedde=
d-devel/message/111229
> Mute This Topic: https://lists.openembedded.org/mt/107022825/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

