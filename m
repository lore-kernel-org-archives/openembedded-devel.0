Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.2814.1587800026850027703
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 00:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aWb3jcfo;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id t8so5889609qvw.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0w1mEreywY+33F28XytHB25cz0kcoYV20UQZc9+7vl0=;
        b=aWb3jcfoLvNParyddoPyLmLCxAFaN36BOgzUuv1LN7SGrxlcZFJ7eI1tsFR0PTFYeh
         TWcXviHbDP++C/hmLK54dLcUHifYHqrZ7xm1ABAFK4UYir2zKa7q/7gMmyC8avN3WcQt
         7Z+1gGbGt7i1/3Y2qtGSM+IWI6OlOwHyQI9bsP7lGJHeHwbF7RGh1lknnY8qpV7JGxw0
         AC3ijRxAp6wayP72mXtO/DHgBiuhfTqMzzeWv51mka2Wr6/5ghRg/IgYPn8rYhxwT+AU
         qw5t9+eiWzOA9UPg891gbG6aQ+zuRinL4Y8vEwM6W6AyNt5crHNoLXfdlAoffEM1/oHE
         yJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0w1mEreywY+33F28XytHB25cz0kcoYV20UQZc9+7vl0=;
        b=AHnXxqfY/VSNJL5SaIZRl6kFjgk+IhLMBRYf/d5XY0VmvooQ6H4PukLD1u8JHZ+MxV
         0CFB5CLUh9vkAoxgyvy3rODINXZPGJcuBa6/vA93aVi21sdPqqDzELXf0Gmcu18i85QP
         CyQVm0snr4B+zDukp0XKlERCdMHz6sLJ+U4nbxIX2HB/dgyxl6MbAPQeuBRzReI+s/W3
         luY9Rm/AbKhE/w4eSt9fb4ybykEYZ+WfpYAIb4JCJzH6TGyE/sWa3Y/WKfFt7vDjXoc6
         iN50FGOD4P/w5bykja3H0nvOJPf+knBysfhZCahmu5kPfbCrZ0FB46kMKw7BuejVaoTS
         4u8Q==
X-Gm-Message-State: AGi0PubgLofDVzMFLFmr8ugipF/ScepirA+DiLuBcG3JAY+b5SqvXchw
	QABzMpUNkCOKBpsyCtmTsrpN5T9Icg3dasWWjlU=
X-Google-Smtp-Source: APiQypJ4XHd2DFCl0lrsBo88tgqQgybpPlJDgh+e/kbBctI1rj8afIx0zspMxlYAj2I7qAV/69w3yDeFTOKRu/AOuNw=
X-Received: by 2002:ad4:4182:: with SMTP id e2mr13262141qvp.61.1587800025865;
 Sat, 25 Apr 2020 00:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
 <CAMKF1sq0uK6F0h=MANR1kUNjwUzZOUO-RT+Gh2ACYqaJLkv9bA@mail.gmail.com>
 <CANjKyuzzm8C-TzB1AJCC0YYX8TsiWEU+JiA9xQLBL0tYF30eWA@mail.gmail.com> <CANjKyuy-wtt6Pu_mEONy6QFm1jBa0wgK+Ps-pTaMHc51Fd0uow@mail.gmail.com>
In-Reply-To: <CANjKyuy-wtt6Pu_mEONy6QFm1jBa0wgK+Ps-pTaMHc51Fd0uow@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 25 Apr 2020 00:33:17 -0700
Message-ID: <CAMKF1spRK42s4Fd5c0JVsm0r1w+UT357_e6up6B=rvfXshgLSg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] opencv: 4.1.0 -> 4.1.1
To: =?UTF-8?Q?Gr=C3=A9gory_Vimont?= <gregory.vimont@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gregory Vimont <gregory.vimont@softbankrobotics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 5:51 AM Gr=C3=A9gory Vimont <gregory.vimont@gmail.c=
om> wrote:
>
> Hello,
> How can I reproduce this build configuration ?
>

MACHINE=3Dqemumips bitbake opencv


>
> Le ven. 17 avr. 2020 =C3=A0 09:57, Gr=C3=A9gory Vimont <gregory.vimont@g=
mail.com> a =C3=A9crit :
>>
>> I don't know what went wrong, I see only Warnings there.
>>
>> Le jeu. 16 avr. 2020 =C3=A0 20:38, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>>>
>>> This fails on mips/glibc
>>>
>>> https://errors.yoctoproject.org/Errors/Details/404685/
>>>
>>>
>>> On Thu, Apr 16, 2020 at 7:17 AM Gregory Vimont <gregory.vimont@gmail.c=
om> wrote:
>>> >
>>> > Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
>>> > ---
>>> >  .../opencv/{opencv_4.1.0.bb =3D> opencv_4.1.1.bb}             | 6 +=
++---
>>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>>> >  rename meta-oe/recipes-support/opencv/{opencv_4.1.0.bb =3D> opencv_=
4.1.1.bb} (98%)
>>> >
>>> > diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-o=
e/recipes-support/opencv/opencv_4.1.1.bb
>>> > similarity index 98%
>>> > rename from meta-oe/recipes-support/opencv/opencv_4.1.0.bb
>>> > rename to meta-oe/recipes-support/opencv/opencv_4.1.1.bb
>>> > index d781da600..5074eb2fa 100644
>>> > --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
>>> > +++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
>>> > @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
>>> >
>>> >  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>>> >
>>> > -SRCREV_opencv =3D "371bba8f54560b374fbcd47e7e02f015ac4969ad"
>>> > -SRCREV_contrib =3D "2c32791a9c500343568a21ea34bf2daeac2adae7"
>>> > +SRCREV_opencv =3D "ddbd10c0019f3ee5f43b7902d47e7fc4303a6574"
>>> > +SRCREV_contrib =3D "0915b7eaddba3c06d83e201c9a7595e73801f417"
>>> >  SRCREV_ipp =3D "32e315a5b106a7b89dbed51c28f8120a48b368b4"
>>> >  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>>> >  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>>> > @@ -51,7 +51,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;na=
me=3Dopencv \
>>> >             file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-c=
p-unit-g.patch \
>>> >             file://download.patch \
>>> >             "
>>> > -PV =3D "4.1.0"
>>> > +PV =3D "4.1.1"
>>> >
>>> >  S =3D "${WORKDIR}/git"
>>> >
>>> > --
>>> > 2.17.1
>>> >
>>> >=20
