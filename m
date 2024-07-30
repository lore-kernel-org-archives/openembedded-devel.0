Return-Path: <przemyslaw.zegan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55077C3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 12:15:40 +0000 (UTC)
Subject: Re: [meta-oe,scarthgap][PATCH] libftdi: Fix missing ftdi_eeprom
To: openembedded-devel@lists.openembedded.org
From: "Przemyslaw Zegan" <przemyslaw.zegan@gmail.com>
X-Originating-Location: Krakow, Lesser Poland, PL (178.43.248.243)
X-Originating-Platform: Linux Firefox 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 30 Jul 2024 05:15:30 -0700
References: <CANPvuRnxWrsgMA+be0asr4wFQ+L3mfYUn06ZsqY3LnwVqLgMnQ@mail.gmail.com>
In-Reply-To: <CANPvuRnxWrsgMA+be0asr4wFQ+L3mfYUn06ZsqY3LnwVqLgMnQ@mail.gmail.com>
Message-ID: <22372.1722341730427474245@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="L1clz5Qpk5ShQLR5dOd6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 12:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111480

--L1clz5Qpk5ShQLR5dOd6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In the following configuration as you suggested, ftdi-eeprom option is stil=
l explicitly enabled in libftdi package, which is a bit confusing.
IMAGE_INSTALL:append =3D " ftdi-eeprom"
PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"

Once you apply my patch, you can either select libftdi as a separate packag=
e or explicitly add the ftdi-eeprom option:
IMAGE_INSTALL:append =3D " libftdi"
PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"

Przemyslaw Zegan

--L1clz5Qpk5ShQLR5dOd6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>In the following configuration as you suggested, ftdi-eeprom option is=
 still explicitly enabled in libftdi package, which is a bit confusing.<br =
/>IMAGE_INSTALL:append =3D " ftdi-eeprom"<br />PACKAGECONFIG:pn-libftdi =3D=
 "ftdi-eeprom"</div>
<div>&nbsp;</div>
<div>Once you apply my patch, you can either select libftdi as a separate p=
ackage or explicitly add the ftdi-eeprom option:<br />IMAGE_INSTALL:append =
=3D " libftdi"<br />PACKAGECONFIG:pn-libftdi =3D "ftdi-eeprom"</div>
<br />
<div>Przemyslaw Zegan</div>
</div>

--L1clz5Qpk5ShQLR5dOd6--

