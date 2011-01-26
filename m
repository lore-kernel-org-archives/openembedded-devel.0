Received: from smtprelay-h31.telenor.se ([213.150.131.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pi9eu-0005Jk-PM
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 18:59:56 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id 96106C125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 18:36:14 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtAVAE7qP01T4zjzPGdsb2JhbAAMhAaESY19jisBAQEBNaw7kHyBI4M4dASMKQ
X-IronPort-AV: E=Sophos;i="4.60,381,1291590000"; d="scan'208";a="169188442"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 26 Jan 2011 18:36:13 +0100
Message-ID: <4D405B8C.805@atmel.com>
Date: Wed, 26 Jan 2011 18:36:12 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D3FEC09.5070306@atmel.com>
	<201101261401.02414.marcin@juszkiewicz.com.pl>
In-Reply-To: <201101261401.02414.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Wed, 26 Jan 2011 17:59:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

2011-01-26 14:01, Marcin Juszkiewicz skrev:
> Dnia =C5=9Broda, 26 stycznia 2011 o 10:40:25 Ulf Samuelsson napisa=C5=82=
(a):
>> I have some calibration problem with my private branch
>> (ulf/linux-2.6.30-2011-01-??) when building the at91sam9m10ekes board.
>>
>> I am running /usr/bin/run-calibrate.sh,
>> but regardless of how I click, during calibration,
>> a tap afterwards always results in detection 3 mm above the tap.
>>
>> There is a "pointercal" file generated.
>> It appears to me that this is ignored...
>> I can tap 1 cm above or below during calibration,
>> and still the detected tap is 3 mm above the actual tap.
>
>> Anything else to think about?
>> I enclose  /etc/X11/xorg.conf and /etc/ts.conf.
> You are using full X11 with evdev driver so tslib is not used at all. Y=
ou have
> to use xinput-calibrator.
>
> Regards,

Hmm, I thought I was using xserver-kdrive!

(Have PREFERRED_PROVIDER_xserver =3D "xserver-kdrive" in the machine conf=
=20
file)

Looking closer at the image (x11-at91sam9-image), it contains
XSERVER =3D "xserver-xorg \
            xf86-input-evdev \
            xf86-input-tslib \
            xf86-video-fbdev "
so the xserver-kdrive is overridden.

This was copied from "xorg-image.bb" which I guess then have the same=20
problem
using full x-server and tslib.
"qt4-x11-base-image.bb" has this combination as well.

"xserver-common_1.33.bb" is built and contains:
+++++++++++++++++++++++++
RDEPENDS_${PN}_append_angstrom =3D " tslib-calibrate "
RDEPENDS_${PN}_append_shr =3D " xinput-calibrator "
-----------------------------------------------------
and I am building "angstrom" I do not get "xinput-calibrator"

I added xinput-calibrate to the x11-at91sam9-image, but after the build,
Removed "xf86-input-tslib", but the dependence on "tslib-calibrate"
remains in "xserver-common_1.33.bb"
Maybe this needs to change as well.

I get the  same startup calibration program ("run-calibrate.sh"  calling=20
ts_calibrate).
with the same poor result.

There are no scripts calling "xinput-calibrator".
Shouldn't that happen at startup?

Can call it manually, and then suddenly I am much better off.
Still  it not perfect though.

Any clue to get xinput-calibrate to run at first boot?

Best Regards
Ulf Samuelsson



