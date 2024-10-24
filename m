Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326DFD0BB6F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 08:29:16 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.9831.1729758554348885105
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 01:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=ifCpG105;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.210.169, mailfrom: brgl@bgdev.pl)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e983487a1so470700b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729758553; x=1730363353; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOwoWsMSC7vO2TyfVe0hq6i118iFGBKD175WfHlyQY4=;
        b=ifCpG10573GljgxyNu9wcXk129D8ti7GKg+CXwzAN0dKRi8RxZUie9b2YwMRPVlRCC
         P6MSwkA9mc4RXwNxmOIMYV1HQwT1LimMQFkUC1CxaGZYFQz1ncDJ6P75E17qierrCDoZ
         XL6jOlK9H9zQ4FMkH2Q+bOToeiQ3lqorHaICtYoccCatX8os9OfH7v6obYNkvWnIZZzV
         bUSMDaSLW76Nya6Vhb32V5eBoO9RjzSUStby5omkyKN4VQjX5unxiOwnWXLnig6H/oR+
         Kf+1xsAZxCxllai4Dr3Oagdy6Xid7yr4m8SORZwN/PvzJoVm3AYZqUAWkgUufb028emm
         7zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729758553; x=1730363353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOwoWsMSC7vO2TyfVe0hq6i118iFGBKD175WfHlyQY4=;
        b=VR7oS2iavMzd9Zy+81vJHZ7u5AMJbc25yYnCf4qsu4KBGNWfwdZquWtiMJEVS3reuH
         lOnuOqtCd+jvRigB982kQbQfcceu4eFe0GQ7kdwj3Af8vG36qGGOwKZUhnHdQR4s/bOB
         /AMKeRAppXRFYHtbvG0qKTxgB5rtmfxEqD3urLKHDagFymoWesJC6R2Vz15++lfO5Ksk
         aXyUwLBa8uOe2XAaA+152GuH8Ezj0nR2s/U7Q8JU4Kyl1q4ZNiEWybY8cOTBMrolbs3c
         QNNixGm34gevRu0gahVw7UbFTLtYIgxHe5pm9dmnB9vz5D+ck0ZcIf+g8aYJGHOAqcDL
         ZmlA==
X-Forwarded-Encrypted: i=1; AJvYcCUd+J7wr/UgZt8H47kPUEHyN2Ev/BHoPf3pgSRThtiOzkA0aFbfSLgCRCXsiEQ9VdBJ6p1BfDHH60scQq4/0cNFncU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTn4NlcPxmShz7AJfWBS+LqCJFZJTNCxsCuuL8dmc4R9caCwKF
	ha+Tg5S6OFUhaouFZWZsc8ZMKX5XtJ6bREC7h/Rb+sKXaLCC5Y4IM3ZcfSDvSzvDgRUHhtsx83P
	f7Se8ZiwO6Xor7DBUWSOFS9jEqBnR1Gvmlaxa+A==
X-Google-Smtp-Source: AGHT+IFX3IO/YLxv0IPhFfGdRXHwjm9vZD9qVXqVCYXTnswA35aUq/Ew6BSfELdH7EIBAnIKE5kG4D1ULA9sH1VGuLY=
X-Received: by 2002:a05:6a00:3c94:b0:71e:4c34:e294 with SMTP id
 d2e1a72fcca58-72030a40222mr7885725b3a.7.1729758553555; Thu, 24 Oct 2024
 01:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241023094359.31912-1-brgl@bgdev.pl> <ee1589760be17c6ebdd2223dfa24a8c1515e90c5.camel@siemens.com>
In-Reply-To: <ee1589760be17c6ebdd2223dfa24a8c1515e90c5.camel@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 10:28:59 +0200
Message-ID: <CAMRc=MfFdXaD-c4GbAgOxs9qCVjoUYQje+o_Fy-Gh30X9TJ0SA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] libgpiod: update to v2.2
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 08:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113163

On Wed, Oct 23, 2024 at 11:06=E2=80=AFPM Sverdlin, Alexander
<alexander.sverdlin@siemens.com> wrote:
>
> > +
> > +# Enable all project features for ptest
> > +PACKAGECONFIG[tests] =3D " \
> > +    --enable-tests --enable-tools --enable-bindings-cxx --enable-bindi=
ngs-glib --enable-gpioset-interactive --enable-dbus, \
> > +    --disable-tests, \
> > +    kmod util-linux glib-2.0 catch2 libedit glib-2.0-native libgudev, =
\
>                                                                        ^
> Would it make sense to append " dbus" above?

Not above, below. This would be a run-time dependency for tests.

>
> > +    bash glib-2.0-utils libgpiod-manager shunit2 \
> > +"
> > +PACKAGECONFIG[gpioset-interactive] =3D "--enable-gpioset-interactive,-=
-disable-gpioset-interactive,libedit"
> > +PACKAGECONFIG[glib] =3D "--enable-bindings-glib,--disable-bindings-gli=
b,glib-2.0 glib-2.0-native"
> > +PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,glib-2.0 glib-2.=
0-native libgudev"
>                                                                          =
               ^
> Would it make sense to append " dbus" above?

We already add dbus to RDEPENDS of the manager package but yeah, this
probably makes sense. Especially with the above update.

>
> > +
> > +PACKAGES =3D+ "${PN}-ptest-dev ${PN}-glib ${PN}-manager ${PN}-cli"
> > +FILES:${PN}-tools +=3D "${bindir}/gpionotify"
> > +FILES:${PN}-ptest +=3D "${libdir}/libgpiosim.so.*"
> > +FILES:${PN}-ptest-dev +=3D "${includedir}/gpiosim.h"
> > +FILES:${PN}-glib +=3D "${libdir}/libgpiod-glib.so.*"
> > +FILES:${PN}-manager +=3D " \
> > +    ${bindir}/gpio-manager \
> > +    ${sysconfdir}/dbus-1/system.d/io.gpiod1.conf \
> > +    ${datadir}/dbus-1/interfaces/io.gpiod1.xml \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_syst=
em_unitdir}/gpio-manager.service', '', d)} \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}=
/init.d/gpio-manager', '', d)} \
> > +"
> > +FILES:${PN}-cli +=3D "${bindir}/gpiocli"
> > +
> > +RDEPENDS:${PN}-manager +=3D "dbus"
>
> Would it make sense to add
> RDEPENDS:${PN}-cli +=3D "${PN}-manager"
> ? Or is gpiocli still functional in some way without gpio-manager?
>

No, it's not. Good catch.

> > +
> > +SYSTEMD_PACKAGES =3D "${PN}-manager"
> > +
> > +python __anonymous() {
> > +    distro_features =3D d.getVar("DISTRO_FEATURES").split()
> > +    packageconfig =3D d.getVar("PACKAGECONFIG").split()
> > +    pn =3D d.getVar("PN")
> > +
> > +    if "systemd" in distro_features and "dbus" in packageconfig:
> > +        d.appendVar("EXTRA_OECONF", " --enable-systemd")
>
> Will it make sense to add
>            d.appendVar("DEPENDS", " systemd")
> build-time dependency?
>

No, I don't think so. This can only happen if we already know we're
using systemd.

Bart

