Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83ACD3E771
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 21:10:48 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.31226.1730841043220290061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:10:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FO60X2ob;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ebc04d495aso3148643eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 13:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730841042; x=1731445842; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RsfvgpWtAoPSzhuInuXo7rRzRh2PXd4zUfzx3ZglpU=;
        b=FO60X2obs+abNxfzZKXeuSCD8O9My4I0Q+CARMDuyv2jIaNq2slo1kV9xUJAqOJEz/
         0dbicbY6nAJ1pt3WzluKjcQrH7rqglwwXzjllPC7Hhg9iw8kAPLSMXU3URQmmXBQRFA4
         EBkWKNEsnprcstv4N+goEdeoSfC4BJ9X7eFZsd1OvASVLEnCdVopjBOI5z5A5HXxSJPa
         U/KWdveGMBHH+w2gnvbzhgkIXoVNpWQVOLXfP13bgTWVljy7PZ/JLk1qkDvuPke94Xy/
         dXctVSevsc7CikBU27qimZLokBULpOcKQwCEBuAc781w4gHkIek05PAjr7NTsLsbW/+q
         B+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730841042; x=1731445842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RsfvgpWtAoPSzhuInuXo7rRzRh2PXd4zUfzx3ZglpU=;
        b=uHvFsGvu+Lyw0QNVqjM8GFsxQd31TNXm3CUnUx/BF4E9DXOxdS+Q8oIfgaoQ5kzRLI
         pGXWfuboPyqItHT0oFy7Fv88iIHNjEyvV1GLIchpyKTY+TW1PjRNhL+jse1+C8lquRpi
         2ee94ujprnUefXIZbdlHPfwWKuPU279m9tVtlutszMvUcXjKAArGvyXOJ3eeIwdudJuQ
         4jSOi5WSjbQLaZMhIfGckTrihlnZGNeokmP9ZjDOdGv5MzGrgogqLAn6gWMWGJufyjFh
         8SGRDWy5z+PxXLn5hraIAIFqNPHgvnCMFtgKXeo9iNvflm1CWRMjmZePt2uhguZW+AXY
         yU3Q==
X-Gm-Message-State: AOJu0Yy4nOxFkIcPgkL24Me0xvJDcfAcxbwSn+FvAxQ6h1DPq8HvUy0/
	motWwIObMympiK3DUftTVvc42uIvCl3VrxY/6HAOivkTCrBEz9QYe0Wsp0JW1ED/cLM4egdbxIl
	tIV8065QW9iZCetn9Z/ak4tjUBZF5yw==
X-Google-Smtp-Source: AGHT+IFunRd0ItXsAzhxHZcZDgMK229ZaffaqtjWtehI8o3UczetFKAyoNTA8B+uI4+pyB9zQ+CH1Y0RO1X447IvhmI=
X-Received: by 2002:a05:6820:16a5:b0:5eb:c6ba:796d with SMTP id
 006d021491bc7-5ec237dc6d4mr26135108eaf.1.1730841042484; Tue, 05 Nov 2024
 13:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20241105183658.34982-2-schonm@gmail.com>
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2024 13:10:16 -0800
Message-ID: <CAMKF1soPxY9ic1WUBPL4iXFgKA6eV8F0a8ab0nDvVfkyJ4Na8w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/161] Drop unnecessary SRC_URI md5sum
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 21:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113616

Thanks for this much needed cleanup. I see that it says patch 0/161,
but then I only see 99 patches on ML.
so something is amiss here. I wonder if there is some throttling on
mailer or some such. so perhaps send 100 onwards
as a new patch series. If nothing works create a pull request

On Tue, Nov 5, 2024 at 10:54=E2=80=AFAM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> Following the note in section 5.5 found here :
>   https://docs.yoctoproject.org/dev-manual/new-recipe.html?highlight=3Dmd=
5sum#fetching-code
> drop the use of the SRC_URI[md5sum] where SRC_URI[sha256sum] is already b=
eing used.
>
> Thanks,
> Jason Schonberg
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113515): https://lists.openembedded.org/g/openembedde=
d-devel/message/113515
> Mute This Topic: https://lists.openembedded.org/mt/109411793/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

