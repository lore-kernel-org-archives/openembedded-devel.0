Return-Path: <przemyslaw.zegan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F246CC3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 11:02:39 +0000 (UTC)
Subject: Re: [meta-oe,scarthgap][PATCH] libftdi: Fix missing ftdi_eeprom
To: openembedded-devel@lists.openembedded.org
From: "Przemyslaw Zegan" <przemyslaw.zegan@gmail.com>
X-Originating-Location: Krakow, Lesser Poland, PL (178.43.248.243)
X-Originating-Platform: Linux Firefox 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 30 Jul 2024 04:02:37 -0700
References: <CANPvuRk-ty2q93DyYhke9iAK+1MU5AUk6h4Qj4AdGpdpyEwPnw@mail.gmail.com>
In-Reply-To: <CANPvuRk-ty2q93DyYhke9iAK+1MU5AUk6h4Qj4AdGpdpyEwPnw@mail.gmail.com>
Message-ID: <10204.1722337357143129339@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9fhV68a066UX48vYEp6Y"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 11:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111478

--9fhV68a066UX48vYEp6Y
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Package ftdi-eeprom does not exist separate, it is part of libftdi package.
My configuration in local.conf:
IMAGE_INSTALL:append =3D " libftdi"
PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"

This patch does not make ftdi_eeprom install by default.
Second line in my configuration enables this feature, if you remove this li=
ne ftdi_eeprom will not be build and place in the generated image.

Przemyslaw Zegan

--9fhV68a066UX48vYEp6Y
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi,</div>
<div>&nbsp;</div>
<div>Package ftdi-eeprom does not exist separate, it is part of libftdi pac=
kage.<br />My configuration in local.conf:<br />IMAGE_INSTALL:append =3D " =
libftdi"<br />PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"</div>
<div>&nbsp;</div>
<div>This patch does not make ftdi_eeprom install by default.<br />Second l=
ine in my configuration enables this feature, if you remove this line ftdi_=
eeprom will not be build and place in the generated image.</div>
<div><br />Przemyslaw Zegan</div>
</div>

--9fhV68a066UX48vYEp6Y--

