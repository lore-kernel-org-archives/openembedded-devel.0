Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2E8C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 09:06:05 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.5039.1718096763454298028
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 02:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=i9wrBhKj;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.174, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so105796781fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718096761; x=1718701561; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syu8GdIow43PW8jlX/ry0XLdvhO5+aB0UEd50KR0Q1w=;
        b=i9wrBhKjFHERUQFRyC9gi1OXm33z4Tb6h1/qXq/8Gn+ThOQwfmWH8cAAEGrPQsXES6
         OILQRAoUz68/pW8RbQx+eEDzp/DS8IFe4ep2W5NT+5wn3DMQEyjj58CoIG/FtKhyH/G9
         ekDH5IodmmTREEtOUJsL0QsOGuSzMN5ONRkaMxrZxMikjb7PIlEDyKwO2GqM835y4k3W
         reSvzbUj2tgS1HBE6bUXYD2eD+9EjcHJedwjvsBGm+rdrBMl9B72qP1b43Etbu3YxeYl
         AJ+c0qEB183RIGTXz5/kc440KF9HXoGF9mmw8o5wVZvoftcVzOEU6gKCIfgHVTrEwqnA
         r0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718096761; x=1718701561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syu8GdIow43PW8jlX/ry0XLdvhO5+aB0UEd50KR0Q1w=;
        b=pQzP20AqBjOXknxoP0EBzUg1sSm0rWx2gNV+pZqlFldtfT9dZ80OcRf67x5F18RA0k
         0jrNb1hNnO5L+ayqsRTYw8UXNYvDJzsZ2r9IDm3ArddVbvJdSfkCMdzg9d6889QZ7znF
         LC0FCgkPvnDfoDNO54k/rGSASS8DPADxuSRWgMqRnRthS8d+HnBIfY8eCkIkdKBqnVFM
         j0SqNIaylINGQ2DmJgOhsXUENHSHrLP6aHfHIg3uGuc6lzONHZm138wwvmGye9KK902A
         JADzW3xXOVQQi8DZI4m65kcF+ICtPWm8fSqeIMEanZ09T+rC42uP9ZO76jjAecbKiGyh
         NP0w==
X-Forwarded-Encrypted: i=1; AJvYcCVWmhMvbp08ZDafO0MRQfiBh21GAuXksEVvISy+1ixbHJe9aFoiMkg4mC8giQbOiqq//0byVoRfnnrFagB3vpF9o1xZWdqLwUOVGPhwFkpIdnxLkpSyBHrETA==
X-Gm-Message-State: AOJu0YwhdwJYFzzUE4FQOMvV1gUvc2wibflr1dOKS08XD4Je8zuX4e6O
	395zj5t9HdVSDuo/CYBbIgqrKhyQbQnVGhHHA3Sg4f7dFV3YwbUy/rniNgQSFprP2Y+VMQ6Igm4
	gdHIZzbsOJd+LCZHL2GFaeXwudmhRHINaSaj4DA==
X-Google-Smtp-Source: AGHT+IGAB7Bze1mrpvzaiIPCCiVoTSfvWClvG7cCd7YbuwhRRLEFJ1k3xRxJkbt3WMvQoVlEip5ygGT3f/QKu9VUzCM=
X-Received: by 2002:a05:6512:31d0:b0:52c:8304:db31 with SMTP id
 2adb3069b0e04-52c8304dce3mr6644176e87.27.1718096761454; Tue, 11 Jun 2024
 02:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240611045820.490708-1-raj.khem@gmail.com> <17D7E2EF3123254A.5431@lists.openembedded.org>
In-Reply-To: <17D7E2EF3123254A.5431@lists.openembedded.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Jun 2024 11:05:50 +0200
Message-ID: <CAMRc=Me0yenAZFqy=q8NxqnR7VTZDzSXY9evSjkJHfPx1=j88w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgpiod-1.x: Fix build on musl
To: brgl@bgdev.pl
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 09:06:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110824

On Tue, Jun 11, 2024 at 9:35=E2=80=AFAM Bartosz Golaszewski via
lists.openembedded.org <brgl=3Dbgdev.pl@lists.openembedded.org> wrote:
>
> On Tue, Jun 11, 2024 at 6:58=E2=80=AFAM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > get a patch backported to fix the build
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---

I made a bug-fix release (v1.6.5) and sent an alternative that simply
updates the package and disables the C++ tests.

Bart

