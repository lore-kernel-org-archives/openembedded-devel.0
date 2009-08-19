Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MdnSr-0000f5-8T
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 17:52:41 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C780026541E for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 17:35:28 +0200
Message-ID: <4A8C1BBF.3060209@atmel.com>
Date: Wed, 19 Aug 2009 17:35:27 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8516BF.9080405@atmel.com>	<h63h7v$8pk$1@ger.gmane.org><4A8581D9.9010205@atmel.com><1250264545.12282.1271.camel@mill.internal.reciva.com><4A85C292.9030605@atmel.com><1250284105.4215.144.camel@lenovo.internal.reciva.com>	<1250377221.5033.16.camel@utx.utx.cz>
	<7241d4b698883690f3f63d1c022d63fe.marcin@juszkiewicz.com.pl>
In-Reply-To: <7241d4b698883690f3f63d1c022d63fe.marcin@juszkiewicz.com.pl>
Subject: Re: No graphic when loading "x11-gpe-image"
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
X-List-Received-Date: Wed, 19 Aug 2009 15:52:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-Printable

marcin@juszkiewicz.com.pl skrev:
> Dnia Sun, 16 Aug 2009 01:00:21 +0200 napisano:
>=20
>> Phil Blundell p=C3=AD=C5=A1e v P=C3=A1 14. 08. 2009 v 22:08 +0100:
>>> On Fri, 2009-08-14 at 22:01 +0200, Ulf Samuelsson wrote:
>>>> The full command line is:
>>>> exec Xorg -br -pn  -dpi 100 -rgba bgr
>> -screen 240x320 :0 -noreset
>>>> It complains about an unrecognized option "-rgba"
>>> Yeah, that looks like the startup scripts are trying to pass kdrive
>>> options
>> to Xorg.  I guess you need to either install kdrive, or patch
>>> the scripts to do the right thing for Xorg.
>> Yes, this script is broken - it checks, whether Xorg is installed. If =
it
>> is, but the
>> platform was originally designed for kdrive, it breaks.
>>
>> There was a thread "?[RFC] Xserver-common 1.30" about it few weeks ago=
=2E
>>
>> Maybe a new platform specific package with a working
>> xorg.conf will be useful.
>=20
> There is a xorg.conf for at91sam9263ek present in metadata - you need x=
server-xorg-conf package installed with xserver-xorg 1.6.1 and evdev driv=
er. No keyboard/mouse/tslib drivers are needed - evdev handles touchscree=
n on at91sam923ek just fine (even do not require calibration).
>=20
> If there will be a problem with start then use xserver-common 1.30 inst=
ead of 1.25 (default one).
>=20
>=20


I have it running after some time, and I have resolve all the issues,
with the SAM9263EK except the touchscreen.

It is not fully integrated with my openembedded branch yet.
I put another jffs2 filesystem in the upper 128 MB
and patch up the stuff built by embedded by running a script
right after login which mounts the other filesystem
and copies over a lot of stuff.

Will integrate this into openembedded eventually.

>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Best Regards
Ulf Samuelsson



