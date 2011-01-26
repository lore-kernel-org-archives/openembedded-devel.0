Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Pi4za-0006IO-Dr
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 14:00:58 +0100
Received: (qmail 521 invoked by uid 2404007); 26 Jan 2011 13:00:11 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-120-20.dynamic.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by host4.kei.pl with ESMTPA; 26 Jan 2011 13:00:11 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 14:01:01 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.37-12-generic; KDE/4.6.0; x86_64; ; )
References: <4D3FEC09.5070306@atmel.com>
In-Reply-To: <4D3FEC09.5070306@atmel.com>
MIME-Version: 1.0
Message-Id: <201101261401.02414.marcin@juszkiewicz.com.pl>
Subject: Re: Problem with calibration of AT91SAM9M10EKES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jan 2011 13:00:58 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 26 stycznia 2011 o 10:40:25 Ulf Samuelsson napisa=C5=82(a):
> I have some calibration problem with my private branch
> (ulf/linux-2.6.30-2011-01-??) when building the at91sam9m10ekes board.
>=20
> I am running /usr/bin/run-calibrate.sh,
> but regardless of how I click, during calibration,
> a tap afterwards always results in detection 3 mm above the tap.
>=20
> There is a "pointercal" file generated.
> It appears to me that this is ignored...
> I can tap 1 cm above or below during calibration,
> and still the detected tap is 3 mm above the actual tap.
=20
> Anything else to think about?
> I enclose  /etc/X11/xorg.conf and /etc/ts.conf.

You are using full X11 with evdev driver so tslib is not used at all. You h=
ave=20
to use xinput-calibrator.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz


