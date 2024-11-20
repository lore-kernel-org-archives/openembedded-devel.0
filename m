Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103B8D743D7
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 20:33:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.25397.1732134811610805164
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 12:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=A9TDY6vd;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.42, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539d9fffea1so121056e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732134810; x=1732739610; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78UUOWyGY2uz92TNQbD57uDnq99PMyMzb7KqoOH8xQs=;
        b=A9TDY6vdfXQdSlX47b4gLJT3ho7rBBKwekvGjH9dm6Z+uU3OpXQ5ndqreF+FvAdIXA
         wMe/3wB205AgSc2HrmozOKaxNXYsG2O+clynahRVoERYa94xhwk9EqRXT4h9ivxf9Zzz
         GqArbkkv2GE6Ki/q5ufFekB7ExG/RQKnUBv8Zyp8BQ2jYYFcXHjToHNck44dqKn6Ymbo
         dgX0yrVVi7qagKj29rh6/2GxxDkUYJBa6Rdt1Eow1vqj8u7IaiRD3wlvNrVSvf3bMUmf
         FpLPsW4NSQ8PJux/Mia6AIEq3yCFmLmk+x2EBVx2RF8UFORDFMz4CM+xRNqjXG5LocFJ
         j26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732134810; x=1732739610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78UUOWyGY2uz92TNQbD57uDnq99PMyMzb7KqoOH8xQs=;
        b=blsuv+Ro6rS3vV8+iCGAD5/VKSLOYeyrUfiA8q5c5qsKzYDCxHqHJlgGF+64YNZdwn
         ES2eucm4bPgO8OReVo1oUkUpqHm9ZHYv6Mc/5jlTqlIb4CzXeQr/yFoe/tyJ96MZgYOV
         VYrsOYAKx54Fz0aTBG9TA6GW797dK42wlsWWHi5DHbMQIvzKJ5h+a5Jz6Q6mVhMXDWRh
         Te9HjWymGrLS7m9+3VA2Dq7u4V9fbyDIUsPLvOt77jNBOprVjMjfaoNd7o0jDfEqpLnN
         I+TYNp1AO2uy+YA9sK5UKLx7dHVaY2NLA6HnSMc8Ar7G+cvlT2kenLHfazQP2HRvV42G
         q0pA==
X-Forwarded-Encrypted: i=1; AJvYcCVd4iitFAdgG4WY8pzWhcxzWC9HnC0p8ggO9g3q2SmnWjH15KRwhRjE4AohY96nzCPU9CoBjlmsiQeaG77aaUtieNc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfBeF6ODwuEdogyZ+787HINOKzJDW9Rx7bMj91X6oJZeFVHgkv
	uHqKOZzxPFM6EdS3awr1XKBwgKBErVqrbknU5wyLGcHnQq1kg8MNkfrvWNC7dBGjjN8IaFrLxnW
	ROQrrDq06b7ExA4Ykjzwu2zRe8IY4E5l1HAA/Jw==
X-Gm-Gg: ASbGncu21pP4ZPmfRE7logoEGCFy6AEieOe1jqVjaE3NSzTR9BtSJEM6SjAXZq2R7Ba
	PCHhaxwJpaD+ARaW7HsKg7tTU4KO0QgjYtMIpe+T3F9O3OJ+AGKL8NYhLENe2Odk=
X-Google-Smtp-Source: AGHT+IGVKkXAUWU6AqgcCsOXIJzURCPQsxot+oyQibvRsq52Bn3bmrCK1HDDz9FMU4YwCzTe9L7MIgoko0h07ZWBVEM=
X-Received: by 2002:a05:6512:b0e:b0:539:f696:777c with SMTP id
 2adb3069b0e04-53dc134176dmr2201740e87.29.1732134809623; Wed, 20 Nov 2024
 12:33:29 -0800 (PST)
MIME-Version: 1.0
References: <20241109132924.4334-1-brgl@bgdev.pl> <CAMKF1sp-HYajgrrGyxLQ7DY7oWDXgOD4tez_LCKM+cr4qOkk5Q@mail.gmail.com>
In-Reply-To: <CAMKF1sp-HYajgrrGyxLQ7DY7oWDXgOD4tez_LCKM+cr4qOkk5Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Nov 2024 21:33:18 +0100
Message-ID: <CAMRc=MdgRw0giy2=EK=wXsNFivi5+GmTa_pWBWA4HxAVQ2kmew@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-fuse: new recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 20:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113938

On Wed, Nov 20, 2024 at 1:59=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> this is breaking YP compatible check. see
> https://valkyrie.yoctoproject.org/#/builders/81/builds/141/steps/12/logs/=
errors
>
> It depends on fuse which comes from meta-filesystems. Perhaps this
> recipe should be added to meta-filesystems layer as well.
>

I sent a v2 moving the recipe to meta-filesystems but on that note:
I'm working on a project that will eventually depend on this package
and python3-gpiod from meta-python. Where would we put the future
recipe for it in this case?

Bart

