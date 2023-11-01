Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73F6C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 03:49:26 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.49621.1698810558000570637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 20:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fr/PP5UW;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-581ed744114so3349920eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 20:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698810557; x=1699415357; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayHJuIrLtbUvlYeY/I3bdaWlGKQLvK/olAcqZmqbV8U=;
        b=fr/PP5UWGnYtYteL0lgaB+iMzKhxMcM+q3t8OtUEP6EqOE4Ra5JJWQlUn6tf5DBnJT
         oSsxZYhobzBgeM3hRmERF1ED7uYuPE96JRER0H2phjHW6C+MscXxr2MvsxcD4CE/PDU9
         9GyeLiuBr16dcSGvo7g8wEUtmR9/s4kDmJr+niwB5fFZarAlDHayF5BQI52rdxpSnNgY
         UAauOGie0IeDCxlRf6NlkFt312fYqVwwIfWhL1tsVQMfSxWOw7LeTOe29i/Ltels9+qn
         Mr6ysZnDwP1hZ2S0yaA2CskdquvEnYOBPGS0fL6Cv8VBom8TeuPtW1SHg1GHzlFdUjcr
         UD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698810557; x=1699415357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayHJuIrLtbUvlYeY/I3bdaWlGKQLvK/olAcqZmqbV8U=;
        b=opvtD8CA+8JzMy4lrQ7OIrOFpYxfvBugRKAXnu+rq8VpVDCewlgQA9amK/7a4gQwBY
         jdYA8GxsnsP6dacbB3bAayT61GYHM5DeJtX2gcy88TdTunNg8H2ys7t5R8UoRy1G0AeZ
         kW6A3byvhIJPlkNZ4XoqsS9mIUOXn+aqv+Sgmg7JNOXKHKZAI1wPpnjtRTW2sEQqHfc+
         r+7ga3CNMYHEGvJhhKC/zXUY5F3TsZlnr8GQ51E7LdjfmcKuCJ4bkzCaj/pqrMorjUPO
         QhBzRQjv43kvtNpLsqA0rwht8NBWB1TJ5ta2R0nAKF2HRhOtmV413SqGZqPRtop+LcoF
         VuYg==
X-Gm-Message-State: AOJu0Yx1pnCS2cyZhJSG7+uPbYu+BIz5x0HQAdSIpYZpUIQt7cDwCX4P
	lKXYG3MDEiZVqBkkay0n+7qzOWlUR9QBD+/qJVPMt3o6
X-Google-Smtp-Source: AGHT+IHB2qSeqIYDQWN+mXd6nQQRH3A9dz9PjPA+bvctXCyxCeJzmqEAso0Ln8hFc/v8k+ao7z0/ms++bgzyO8wq00Q=
X-Received: by 2002:a05:6870:12d1:b0:1ef:f14e:6f50 with SMTP id
 17-20020a05687012d100b001eff14e6f50mr5369941oam.8.1698810557205; Tue, 31 Oct
 2023 20:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230929213521.2140103-1-derek@asterius.io> <9963595d-863c-bf40-4b6e-65310524e932@windriver.com>
In-Reply-To: <9963595d-863c-bf40-4b6e-65310524e932@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Oct 2023 20:48:50 -0700
Message-ID: <CAMKF1sqBa2zX4eLgAssL0OoWgW+zkmmShzqRig7rXy_igit9bg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-nacl: Add recipe for the latest
 release of PyNaCl
To: Kai <kai.kang@windriver.com>
Cc: Derek Straka <derek@asterius.io>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 03:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105811

On Tue, Oct 31, 2023 at 7:32=E2=80=AFPM Kai <kai.kang@windriver.com> wrote:
>
> On 9/30/23 05:35, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >   .../python/python3-nacl_1.5.0.bb              | 25 ++++++++++++++++++=
+
> >   1 file changed, 25 insertions(+)
> >   create mode 100644 meta-python/recipes-devtools/python/python3-nacl_1=
.5.0.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb =
b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
> > new file mode 100644
> > index 000000000..7d5292745
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
> > @@ -0,0 +1,25 @@
> > +SUMMARY =3D "Python binding to the Networking and Cryptography (NaCl) =
library"
> > +HOMEPAGE =3D "https://github.com/pyca/pynacl"
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cc789b082b3d97e1ccc5261f85=
94d3f"
> > +
> > +PYPI_PACKAGE =3D "PyNaCl"
>
> It is exactly the same recipe with name python3-nacl_1.5.0.bb in the
> same directory. And I suggest to
> remove one of them and let the other one rprovides it if needed.

this seems fine to me. Please send a patch to remove old recipe and
add PROVIDES to new one

>
> Regards,
> Kai
>
>
> > +
> > +inherit pypi setuptools3
> > +
> > +SRC_URI[sha256sum] =3D "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146=
bf545b0f08fb9220ba"
> > +
> > +DEPENDS +=3D "\
> > +    libsodium \
> > +    python3-cffi-native \
> > +    python3-pip-native \
> > +"
> > +
> > +RDEPENDS:${PN}:class-target +=3D " \
> > +    python3-cffi \
> > +    python3-pycparser \
> > +"
> > +
> > +export SODIUM_INSTALL =3D "system"
> > +
> > +BBCLASSEXTEND =3D "native"
> > \ No newline at end of file
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105272): https://lists.openembedded.org/g/openembed=
ded-devel/message/105272
> > Mute This Topic: https://lists.openembedded.org/mt/101667089/3616933
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[kai.kang@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Kai Kang
> Wind River Linux
>

