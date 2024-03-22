Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF68C54E71
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 06:17:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6500.1711088247721396458
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Mar 2024 23:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mh6+ccV2;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3417a3151c4so1357443f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 23:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711088246; x=1711693046; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUTspnFYZdJ57owpxHA10IRCDF7I2B6+snPO9BOlMQU=;
        b=mh6+ccV2Vcoa43jK5lSwhdBNzmjtw0sU+HCAd2clD/1Vs+g54OGxn6k9VWJt6kBe3w
         +pv+g2sG7im+8DuMphhw1Oeu0ebGsNdjlUMvYttYk4ZDXVSYwzZi1lF5OnG4OVRYoqzz
         jYmTN/+jugpkZ29MIAlG6g7jucwfGq72oz4GpocZAfZcvIiN9tgXPArgHffCFHeCpWov
         qQTkAljKS8RPOxnpgrZaEZi8IoiWb1ejjdMwj2UhfK+fiWSP9yNQG/cCnrP+fTkqiert
         eFF7HkLlhKXTo3xNDb7R+SM3J4nA74yz2aIYyiHvlwLJc+KmLYkhkUpEp3XhYiJf1+Uw
         qd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711088246; x=1711693046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUTspnFYZdJ57owpxHA10IRCDF7I2B6+snPO9BOlMQU=;
        b=KIwPIMjGgVJLaYrKodRUy2TzhLPFGI0bnaHoiwTAQ6cYjaEbnwn7i7UAkd0VIKAR8T
         2Vm6/yB0N/LtpbCXl+L/QVXgcJzE09XJAur8dqtO/z2HNM4iD9ByXi6+qajq942bGiX1
         T2hFKcYXcURxOTKtX/McldPRoYqS1Ig8G/iFKPwJ5j2LrwrbKJkpSSXHzpNqiSVAhxaI
         9IxJFaiqxjxdfQtsY1bwuM3cOe8r8xFXs9Rsh06JH9Lm6ceVNRA5gO8WSXkzHectcRja
         3JQzbAwr6Mni/rBkgte69Id+Iq8NC/EjiqaFblv/M6yXKZd8mGgshAnEV3s/K2AzJnW3
         zL8A==
X-Forwarded-Encrypted: i=1; AJvYcCUB9tEiK+uM5+7nBEwlc8UPZYXgke1fbzlaIMK4gq0+zXmrfvXN6uP2dKxL95x8OyIfPPycrrYsLTSACQFEZKz3xX1qyakGMcdcao92PrfhiAAJ41kcabqMSg==
X-Gm-Message-State: AOJu0YyNRrXBkOPnFhsIiQQn9vJBq6zLyNCY9hcJhXyaBFjrBjyNXN5z
	sPpzk+pmjHoIZXcwmzf1z9sxFmn5l0STXD9UfoHCOy13q0AIj3BHWJZQJVC05G9YdCaK//eiHcN
	G1NukGuU4ICoM4qePEVVfGalWXXM=
X-Google-Smtp-Source: AGHT+IEuk5jNz9SuvrC5M2uJFEnbNKhPW+K3U4ks7iFjxaH//DmBl+gYYFOzHpWhChqGovDZ1/Vj8AD4oLAWqH8bIOA=
X-Received: by 2002:adf:eb11:0:b0:33e:7637:51fd with SMTP id
 s17-20020adfeb11000000b0033e763751fdmr924488wrn.48.1711088245950; Thu, 21 Mar
 2024 23:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <17BE205582F63951.29196@lists.openembedded.org>
 <P19LAS.XNJ0HDKLN7IM@t-online.de> <CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
 <CAMKF1sqhYPiFY3AfwDzydNJaJuF8ye_ng2OuynGH6y+uyenKiA@mail.gmail.com>
 <VVPNAS.FCPMXAAPQ9Y82@t-online.de> <CAMKF1srGvQ3d-L=PR4r3H_tMvbb9jwcgMz6kx6FD1LuVebY-TA@mail.gmail.com>
 <17BE8A4D584EEFD1.29196@lists.openembedded.org> <0URNAS.2AWVCV53YYT41@t-online.de>
In-Reply-To: <0URNAS.2AWVCV53YYT41@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Mar 2024 07:17:14 +0100
Message-ID: <CA+chaQfoiuyC5GNz72zNfkFRL6oTAZ7MOjcF=ZMtPrh7eqJoZA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 06:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109511

The packageconfig for x11 doesn't seem to be enough to disable x11
when it's not in DISTRO_FEATURES.

CMake Error at TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/freerdp3/3.4.0/re=
cipe-sysroot-native/usr/share/cmake-3.28/Modules/FindPackageHandleStandardA=
rgs.cmake:230
(message):
  Could NOT find X11 (missing: X11_X11_INCLUDE_PATH X11_X11_LIB)

Call Stack (most recent call first):
  TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/freerdp3/3.4.0/recipe-sysroot-=
native/usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:600
(_FPHSA_FAILURE_MESSAGE)
  TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/freerdp3/3.4.0/recipe-sysroot-=
native/usr/share/cmake-3.28/Modules/FindX11.cmake:665
(find_package_handle_standard_args)
  server/shadow/X11/CMakeLists.txt:1 (find_package)

On Wed, Mar 20, 2024 at 7:10=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Wed, Mar 20 2024 at 06:49:43 PM +01:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> their dependencies are which are not yet in master branch of the core
>
>
> I tried to mention in the commit message, if an update requires a change =
to oe-core.
>
> For now that would be
> gnome-settings-daemon, which requires gsettings-desktop-schemas 46.0
> gnome-calculator, which requires libsoup with vala support
> gnome-calendar, which requires libadwaita-1.5.0
>
> additionally to complete the gnome-46 port there would be
> nautilus, which will require glib-2.80
> gnome-console and gnome-terminal, which will require vte 0.76
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109498): https://lists.openembedded.org/g/openembedde=
d-devel/message/109498
> Mute This Topic: https://lists.openembedded.org/mt/105020833/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

