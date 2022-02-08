Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFFDC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:35:01 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web10.13535.1644338099933795273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=HA14+cFx;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JtTBS49vzz9sjD;
	Tue,  8 Feb 2022 17:34:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1644338096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=km61UCUbc0sy94m8U0p22HsqC4v3pR8JrjpfrmV0EFw=;
	b=HA14+cFx9Gi8BEG/N3CtpXYF3tfNReEUa2HoqYtcKrn/dvWFgF4BRTM8IpuDV8AyAUdRQK
	4w44tmVhJ2+g2545ks9yt8HciXsVIBc9wSnbn0cIuwxMjY2IQb6S4edeCwT06NFG3SvFoS
	RsXPLFpvkC5SW5lY99Z3oosKkwUbsQDy+MnOiFqloQs4rRSsj/Qytg9DG+87WTaAkyI2R4
	8T99q944fgJKF752Z/N5TsNtuAEsvB5/rn9n8geR4iSgGRpVKreUTW//fUJnF1o1TLYEmr
	hsH9icp75WKP+si/QpVF4ZNEQK5y5pyqG2iP8Zy6nJNQb24JiMMNHk7Vyj064A==
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Cc: =george.kiagiadakis@collabora.com
Subject: [meta-multimedia][RFC PATCH 0/2] PipeWire upgrade and WirePlumber
 introduction
Date: Tue,  8 Feb 2022 17:34:38 +0100
Message-Id: <20220208163440.428471-1-crg7475@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 16:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95268

This short series of patches upgrades PipeWire to version 0.3.45 and
adds a patch for WirePlumber, a session manager for PipeWire.

There are two commonly used session managers for PipeWire:
media-session, which is a small session manager intended for very simple
use cases, but mostly functions as a example; and WirePlumber, an
extensible, scriptable session manager that is usable on both desktop
and embedded systems. These days, media-session is considered deprecated
by upstream, which is why as part of this recipe upgrade, media-session
is no longer available. It is fully replaced by WirePlumber instead.
WirePlumber runs as a separate daemon, alongside PipeWire.

This is an RFC because there a few issues unclear at the moment:

1. Should the configurations be separate recipes for easier exchange of
recipes? If so, would it make sense to introduce new virtual packages,
like "virtual/wireplumber-configuration"? These would be used in
RDEPENDS and RRECOMMENDS, and from what I understand, using virtual
packages in these variables is discouraged. However, running PipeWire
without any session manager typically is not useful, so I'd like to at
least print a warning when this is done, since in >90% of all cases,
this happens because the user forgot to add a PipeWire session manager
to the image.

2. WirePlumber currently does not run out of the box, since it is run
system wide (just like PulseAudio for example, and PipeWire itself also
runs system wide), and some of its scripts and modules try to access a
session-wide DBus, which does not exist when WirePlumber is run system
wide. I am unsure about a proper fix. Should upstream add system wide
DBus support? Or is there a way in OE/Yocto to start session DBus for
individual systemd services like WirePlumber?

Carlos Rafael Giani (2):
  pipewire: Upgrade to 0.3.45
  wireplumber: Add recipe

 ...{pipewire_0.3.34.bb =3D> pipewire_0.3.45.bb} | 117 ++++++++++-----
 .../wireplumber/wireplumber_0.4.8.bb          | 140 ++++++++++++++++++
 2 files changed, 219 insertions(+), 38 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.34.bb =3D=
> pipewire_0.3.45.bb} (74%)
 create mode 100644 meta-multimedia/recipes-multimedia/wireplumber/wirepl=
umber_0.4.8.bb

--=20
2.32.0


