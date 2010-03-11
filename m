Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NprB3-0007xW-F0
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 23:48:30 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id C4640154D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 23:18:09 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AugSAKv6mEtT4zvyPGdsb2JhbAAHgwWXYgEBAQE3rFqQR4Eygl9qBIYW
X-IronPort-AV: E=Sophos;i="4.49,622,1262559600"; d="scan'208";a="49193399"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb1.telenor.se with ESMTP; 11 Mar 2010 23:18:09 +0100
Message-ID: <4B996C1F.2070707@atmel.com>
Date: Thu, 11 Mar 2010 23:18:07 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100204113145.GR3401@jama>
	<4B96CAD2.90901@atmel.com>	<201003101516.43175.marcin@juszkiewicz.com.pl>
	<4B98053F.5040100@atmel.com>
In-Reply-To: <4B98053F.5040100@atmel.com>
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: pointercal ignored?
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
X-List-Received-Date: Thu, 11 Mar 2010 22:48:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ulf Samuelsson skrev:
> Marcin Juszkiewicz skrev:
>> Dnia wtorek, 9 marca 2010 o 23:25:22 Ulf Samuelsson napisa=C5=82(a):
>>> I have built a custom variant of x11-gpe-image for the SAM9M10.
>>
>> Which machine in OE covers that board? I have to admit that I did not
>> tried to hack mine.
>=20
> I am building the SAM9G45EK, but I am using a 2.6.30 kernel
> patched with maxim.org.za + www.linux4sam.org .exp3 patches
> instead of the 2.6.32 currently in openembedded.
>=20
> Also updated bootstrap and u-boot, but that won't affect this.
>=20
>> =20
>>> When gpe is started, the Y direction seems to be compressed.
>>> When I start the calculator and press at the top of the screen,
>>> the calculator buttons 5 mm below gets pressed.
>>> When I press at the bottom of the screen, the buttons 5 mm above
>>> gets pressed.
>>>
>>> Changing /etc/pointercal manually seems to have no effect
>>>
>>> It's like pointercal gets ignored.
>>>
>>> When others run the same kernel with minor config changes
>>> using the stable branch ans xserver-kdrive, this phenomena
>>> does not happen.
>>
>> Check do you have kdrive or xorg with evdev or tslib driver.
>>
>=20
> I will check, when I am back home.


xserver-xorg-2_1.7.4-r0
tslib-1.0-r23.3
xtscal-0.6.3-r7
xf86-input-evdev-1_2.3.2-r10
calibrateproto-2_0.0+r0+gitr1da6fd1e2c7a49648245c98481fabea8b9690a8c-r0
libxcalibrate-2_0.0+r0+gitr209d83af61ed38a002c8096377deac292b3e396c-r0

There is no PREFERRED_PROVIDER_xserver defined.


> Will also send the patches I added.
>=20
>> Regards,=20
> BR
> /Ulf
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Best Regards
Ulf Samuelsson



