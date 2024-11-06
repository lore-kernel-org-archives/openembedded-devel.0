Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC006D40D18
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 01:09:41 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.35917.1730855375466117230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 17:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jeqwA7Zg;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5ebbed44918so3594079eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 17:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730855375; x=1731460175; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9r1wTKZOYVn6DxiobOzhffpdipy+UGX1j2/skX99t8=;
        b=jeqwA7ZgOOFllDlD4lrProDDE+Hfuy1UT4bwXzUkBz86tOxplgXWpXaZ7pwDEP2L4w
         3jEtM/gfui0i99zWHRRPpWM+uftq87K1zgD51pzX/wlxLD5mAHuY2yfUFgvabZhzLScN
         VdaezQbth+FDIsuSNT+RUWJVaOEgF5tlfr5D010eZytRtsI8fvmiitM1waThvWUWqw6y
         tiI8s7hzWznBw0pTPUy2qv5flilG0q8oRWkPYTvFg188ZEGrrX/M5bH8IQvZAgZysaH6
         XmmUwoQgI4kwdhnnyspK5Yl54y8x1AP98qMMIfPKFksIAxkSvzcBxvMjfJS3KUBUCT+t
         6HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730855375; x=1731460175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9r1wTKZOYVn6DxiobOzhffpdipy+UGX1j2/skX99t8=;
        b=CZfXuJUPs60yz+hXyxUOBxIrJ8HjxJeOJ16YALFCzU3A5VLe+qyt9ZnYQe7JAC3iWO
         il1u/kTW1SNkDTc1mKSKLEY/2utX4Vs9Vqv9l9KLWwTtx4Q2o0p/+PAx+OF0kMqtTrSy
         CRaPlCK3OH8HUiRfhX18bmI4A9+79TqjF6rtpHfeknh/qt3aNNkGwwLRrjpBLV719qRA
         ZnM6rCmE6gbfTxOeXbdJBEznK/924tc3wDtoQ2XXApQyp0jN/3SE8RdC6Hdc7Hq7Z6yH
         ODlpg+JSvR1kdtACoCXogW/LN6boDy05xi4KDu9yD/Ui5/VlORelh0YYkL/fTlqxxaf0
         mrSg==
X-Forwarded-Encrypted: i=1; AJvYcCUr+2JH/ZKFLU54KbXJvvsTmlgfexEBy4y+IAOrZ/253ENJNDAUk2wdEvKYNYICwY6K5z8Y/XymTwWEeh+d7QH4T08=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvPfy0b4+jJ6gmAysOlalSH/7O3pJmV1qQxiUQr8Kj0uCGaUbT
	3Cl2bhxVKzHdLqWOAqTuHezqq2OGoi6+PJ/vj9qJKqmn6XvadctWxfn5THRIMAXoiTjheciDjlM
	iAp60kYntB+lrF21fhBd0osYq7ZM=
X-Google-Smtp-Source: AGHT+IFOAQ2D0zpzsl3bIee1aOLypfeoxH79FQJUItlsU84f7e79iy2qCPh51BLb3ZOJy7kS3oHrarcbNXcH83wJSXg=
X-Received: by 2002:a05:6820:1ca6:b0:5e5:c073:9ea5 with SMTP id
 006d021491bc7-5ec5ec942e3mr15973524eaf.6.1730855374670; Tue, 05 Nov 2024
 17:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20241105183658.34982-2-schonm@gmail.com> <CAMKF1soPxY9ic1WUBPL4iXFgKA6eV8F0a8ab0nDvVfkyJ4Na8w@mail.gmail.com>
 <CABTo8gA+4kJDeMOWOWqiAcwZdCa9XFxpVq9cyAQXQUD_dUFz8Q@mail.gmail.com>
 <CA+chaQeHTahXvMFvrG26LUz3kJZoU1huGuPYGo7bRcvXEro5pQ@mail.gmail.com> <CAMKF1srvM_0RE1HokPTDKCx94Q3qSuoO-d_2Vw2-ouSrY_dA5Q@mail.gmail.com>
In-Reply-To: <CAMKF1srvM_0RE1HokPTDKCx94Q3qSuoO-d_2Vw2-ouSrY_dA5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2024 17:09:07 -0800
Message-ID: <CAMKF1sqT6DwtN+9v0Z4u+eNnDcomJd5Y+TpP9PO3Ve9Pz+tmqQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/161] Drop unnecessary SRC_URI md5sum
To: Martin Jansa <martin.jansa@gmail.com>
Cc: schonm@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 01:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113684

in the broken down list patch 107 is missing, as well. I would say do
all 161 recipes in one go in single patch.

On Tue, Nov 5, 2024 at 5:08=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> yeah I think thats perhaps a better way to get this all in once.
>
> On Tue, Nov 5, 2024 at 3:02=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
> >
> > Why not send all these simple one line changes in single commit per
> > layer? They aren't controversial nor need separate explanation for
> > each recipe.
> >
> > On Tue, Nov 5, 2024 at 11:59=E2=80=AFPM J. S. via lists.openembedded.or=
g
> > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > I did indeed run into mail throttling.  I will keep my submissions
> > > shorter in the future.
> > >
> > > The remaining 100-161 should be on the mailing list at this point.
> > >
> > > Please let me know if you encounter any issues.
> > >
> > > Thanks,
> > > Jason Schonberg
> > >
> > > On Tue, Nov 5, 2024 at 4:10=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
> > > >
> > > > Thanks for this much needed cleanup. I see that it says patch 0/161=
,
> > > > but then I only see 99 patches on ML.
> > > > so something is amiss here. I wonder if there is some throttling on
> > > > mailer or some such. so perhaps send 100 onwards
> > > > as a new patch series. If nothing works create a pull request
> > > >
> > > > On Tue, Nov 5, 2024 at 10:54=E2=80=AFAM J. S. via lists.openembedde=
d.org
> > > > <schonm=3Dgmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > Following the note in section 5.5 found here :
> > > > >   https://docs.yoctoproject.org/dev-manual/new-recipe.html?highli=
ght=3Dmd5sum#fetching-code
> > > > > drop the use of the SRC_URI[md5sum] where SRC_URI[sha256sum] is a=
lready being used.
> > > > >
> > > > > Thanks,
> > > > > Jason Schonberg
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#113678): https://lists.openembedded.org/g/openemb=
edded-devel/message/113678
> > > Mute This Topic: https://lists.openembedded.org/mt/109411793/3617156
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

