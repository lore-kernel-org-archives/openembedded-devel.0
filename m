Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqVK9-0002Zj-BO
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 18:40:34 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 3F886144D3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 18:37:28 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsVAApcm0tT4zvyPGdsb2JhbAAHgwWEVZMbAQEBATepaIJSAY0KgTKCX2oE
X-IronPort-AV: E=Sophos;i="4.49,632,1262559600"; d="scan'208";a="49692174"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb1.telenor.se with ESMTP; 13 Mar 2010 18:37:28 +0100
Message-ID: <4B9BCD57.9020308@atmel.com>
Date: Sat, 13 Mar 2010 18:37:27 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268466514-13547-1-git-send-email-ulf.samuelsson@atmel.com>
	<201003131649.39596.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003131649.39596.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 62.127.194.20
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/1] linux-atmel: Add support for latest AT91 kernel
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
X-List-Received-Date: Sat, 13 Mar 2010 17:40:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz skrev:
> Dnia sobota, 13 marca 2010 o 08:48:34 Ulf Samuelsson napisa=C5=82(a):
>> Add support for building AT91 2.6.30 kernel
>> Vanilla 2.6.30 recipe has moved on to 2.6.30.x
>>
>> Add maxim.org.za patches + Atmel experimental patches.
>> (With the exception of the SAM9M10-EK support)
>> Add support for configurable NAND flash partitions
>> Add support for sam9m10g45-ek
>>
>> The contents of the maxim & experimental kernel patches
>> has various authors described inide the patches.
>=20
> NAK - please merge it into linux_2.6.30.bb as there is really no need t=
o=20
> duplicate it.
>=20
> Regards,=20

The reasons for doing it this way, is that this is something
that has received extensive testing by our friends in Rousset.
I tried doing it vs the generic 2.6.30 recipe, but
since that adds a minor patch, this patchset breaks.

If I do it, then this minor patch needs to be optional
and not applied for these boards.
Obviously the minor patch can be applied by someone
with more time to do testing.


--=20
Best Regards
Ulf Samuelsson



