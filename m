Received: from smtp-out11.han.skanova.net ([195.67.226.200])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NpSrz-00022w-J6
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 21:51:12 +0100
Received: from [127.0.0.1] (87.54.11.122) by smtp-out11.han.skanova.net
	(8.5.114) (authenticated as u82406562)
	id 4B911C5400220354 for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 21:46:59 +0100
Message-ID: <4B98053F.5040100@atmel.com>
Date: Wed, 10 Mar 2010 21:46:55 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100204113145.GR3401@jama> <4B96CAD2.90901@atmel.com>
	<201003101516.43175.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003101516.43175.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.67.226.200
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_WEB,
	SPF_SOFTFAIL autolearn=no version=3.2.5
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
X-List-Received-Date: Wed, 10 Mar 2010 20:51:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: Quoted-Printable

Marcin Juszkiewicz skrev:
> Dnia wtorek, 9 marca 2010 o 23:25:22 Ulf Samuelsson napisa=C5=82(a):
>> I have built a custom variant of x11-gpe-image for the SAM9M10.
>=20
> Which machine in OE covers that board? I have to admit that I did not t=
ried to=20
> hack mine.

I am building the SAM9G45EK, but I am using a 2.6.30 kernel
patched with maxim.org.za + www.linux4sam.org .exp3 patches
instead of the 2.6.32 currently in openembedded.

Also updated bootstrap and u-boot, but that won't affect this.

> =20
>> When gpe is started, the Y direction seems to be compressed.
>> When I start the calculator and press at the top of the screen,
>> the calculator buttons 5 mm below gets pressed.
>> When I press at the bottom of the screen, the buttons 5 mm above
>> gets pressed.
>>
>> Changing /etc/pointercal manually seems to have no effect
>>
>> It's like pointercal gets ignored.
>>
>> When others run the same kernel with minor config changes
>> using the stable branch ans xserver-kdrive, this phenomena
>> does not happen.
>=20
> Check do you have kdrive or xorg with evdev or tslib driver.
>=20

I will check, when I am back home.
Will also send the patches I added.

> Regards,=20
BR
/Ulf




