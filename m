Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB2DCAC58E
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:14 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web10.5489.1757616881389789495
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 11:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Od66dNdY;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-601b1535047so728376d50.1
        for <Openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 11:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616880; x=1758221680; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chEcLhV9x+GoStdvbnsKXFrz44L/4UPKFd2X2oqjwu8=;
        b=Od66dNdY3ctDwH8El2rUecD41cktgkS2nWSMfmIepWI5wc+IAEJyz1hYpD4QHvko2F
         iRev0dJgawlhp+fZcY74RM+c2OgKhYc0Wj6x9OR1FgKiJoK3j5R6mr50G5yZD6y9c7XZ
         7Oepjd/vWqaToAu7Skkj2zZlGC/8PTuv1Crb/s9VJys4lhlkm2kdMqettinEyMEkYD9f
         XQEZd68cAAxEa61CJtLhV7NI7RpvqGg+4r2EiixXp7o4m95AfB53EDglvEIMMBOvZpyn
         mzQa5zTjA+wt1fMhn/7h/H8+PaGKJ77AZ85FRsYYtqj1vX83BFc5hH1FWZANZTNgNAM5
         8Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616880; x=1758221680;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chEcLhV9x+GoStdvbnsKXFrz44L/4UPKFd2X2oqjwu8=;
        b=pHWCneDvLat67aax5hMlRsa2Q8/XCakzL8EIzDsLcsiZ64Kp2ugOEnQ4M1CRiHy+40
         6GpcEWJGoG8VPds2AOIwZIKmWSsfhReX4q/ck/8nuJ1MU+nhPo6al760AthJ/KFtxBQQ
         QkwJ9lYGcv7RlJXiQWUumtfb29Awscp3KdMxqX1hSQ/0FKXmQrjBCaTKWA53W4gVgNNR
         93Eo2sSWJ/e1sdiW/nmoG/jL7acJlNnhysG7EQaFfpLyaGy7CHizL6svOGWRwfG3MCvB
         6lP42G9eZ/6AaNtN1GyvKX65yUaPMRknhsehZYcceTu58S9YIFtn+my9pQlM95YCKxTJ
         LE1A==
X-Gm-Message-State: AOJu0Yx0KiqgDfYEbfnaGgx2K0SMFTqCrJ/6CML6E881AI4HfZIVutiQ
	mj5e6CltT+14ScLEiCl0u+e6573fbPlI/akl2JXvjOHWi3wUow4aw3OIMxHc2HFrzeYFOvINh1n
	V+pvIA+WB3pQ6Fle4s4uwWI2SO1aJFcKefDYy
X-Gm-Gg: ASbGnctV9e8i3vWB+bk0M82YTMd5gpIdfopvYWlt2STZ3uUez3edOFzq6YlLa4FoznJ
	kucz0Nfgu6eHEJn0WeGSAIBGab8eDBeq2rov3Wh15iKhk/fDGr4M8QSzgXgC5fdF/LDFkULLAPR
	fRjxutmIBZt413aHcBU5CEOKiJCAwQhbgHSxy5Jg7CgjGEIrbhdHIe52yKV9pBI72RDxF1uIuDw
	s/Fl3a0c/Cz05iT2N0XLzWdLy1rbL6ske/2wwY3Ir1kazlZWgUsI0Vh8fgBDSepdhfiK7ST1QTk
	JFUowJylXKpCsN2FeNlGCwsh3Jhn1CSO4wT67NVcd4kqEm2JP3e/SvhP9pESW+Cx
X-Google-Smtp-Source: AGHT+IHipmegwJW4AQtYes7Ej7uJLCklzUFjqKpAo0p15Wxq6u/EtUzrPwvG9AT766CRb1p9Yf2KOWG0P2WsvWiRu2A=
X-Received: by 2002:a05:690e:1a23:b0:622:b42f:4817 with SMTP id
 956f58d0204a3-62723ab1768mr446140d50.29.1757616879909; Thu, 11 Sep 2025
 11:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqhzO979KgHE9BEfbw5xe7NH0GKZji9VHOAy6pn+E9NDQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Sep 2025 11:54:13 -0700
X-Gm-Features: Ac12FXyaMwUIGUgu9Z4K9sPclJ5ncGu_vUQQCIbf8tYJnQmJqGrtVNOYMTpFgTE
Message-ID: <CAMKF1srN7LZORRCgvMP6e9Z-h6twprwBHw1h7oxRfYEBPXresw@mail.gmail.com>
Subject: Re: Stable branch maintainership
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 18:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119372

Hello All,

Thanks for considering this and responding to the call.

Anuj and Gyrogy have offered to help in maintaining the stable
branches and Ankur Tyagi has also offered to help with the stable
branch workflow. I will work with all of them in dividing
Thanks for signing up for this work. For now, Anuj will be maintaining
scarthgap LTS release, Gyorgy will maintain Kirkstone LTS and
Walnascar releases. We will work towards infra and process next.

Thanks
-Khem

On Mon, Sep 8, 2025 at 2:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Dear Community members,
>
> Armin has been doing awesome work in maintaining stable release for
> meta-openembedded layers for many releases, however his situation has
> changed such that he is not able to continue the meta-oe stable
> maintenance.
>
> We have three branches in maintenance, kirstone, scarthgap and
> walnascar at the moment and
> a backlog has been piling up. Several members have raised concerns on
> mailing lists on pending
> updates for the stable branches
>
> I would love to have someone step up to help with the stable
> maintainers role. Which would
> be looking for stable branch patches on mailing lists and reviewing
> them and creating a staging
> branch ( like contrib/stable/kirkstone-nut etc ), testing and
> preparing final pull.
>
> Armin used his own machines to run the CI, we now do have a machine
> available for OE CI
> which we should be able to use for the CI loops for these branches if nee=
ded.
>
> Looking forward to hearing from you
>
> Thank you
> -Khem

