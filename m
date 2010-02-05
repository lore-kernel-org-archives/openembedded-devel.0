Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NdXah-00060o-2A for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 00:28:02 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NdXYH-00080t-8R for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 00:25:29 +0100
Received: from s207-6-220-230.bc.hsia.telus.net ([207.6.220.230])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Feb 2010 00:25:29 +0100
Received: from dfoley by s207-6-220-230.bc.hsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Feb 2010 00:25:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dallas Foley <dfoley@techsol.ca>
Date: Fri, 05 Feb 2010 15:25:07 -0800
Message-ID: <4B6CA8D3.6050806@techsol.ca>
References: <E1NTDIp-00055S-0r@melo.openembedded.org>	<20100112140326.GC10781@jama>
	<hihvso$eon$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s207-6-220-230.bc.hsia.telus.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <hihvso$eon$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Koen Kooi : xserver-xorg 1.7.3: fix regression where hal was disabled
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
X-List-Received-Date: Fri, 05 Feb 2010 23:28:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 12-01-10 15:03, Martin Jansa wrote:
>> On Fri, Jan 08, 2010 at 11:46:51AM +0000, git version control wrote:
>>> Module: openembedded.git
>>> Branch: org.openembedded.dev
>>> Commit: 3a9b352acba24c78b562d8dc6527b774cbb86041
>>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=3a9b352acba24c78b562d8dc6527b774cbb86041
>>>
>>> Author: Koen Kooi <koen@openembedded.org>
>>> Date:   Fri Jan  8 12:44:47 2010 +0100
>>>
>>> xserver-xorg 1.7.3: fix regression where hal was disabled
>>>
>>> * this fixes the "my touchscreen isn't working anymore" bug
>> Thanks,
>>
>> can we add hal conditionaly as XINERAMA is?
>> Maybe for both om-gta01, om-gta02?
>>
>> We have input configuration in xorg.conf and with hal for input
>> detection deprecated by xorg devs I guess we won't change that before
>> 1.8 xserver (maybe with deviceKit or something else).
> 
> AIUI you can do --enable-udev to get udev based device handling (aka
> "The Future") working, but that would involve one of the OE devs
> expanding the current touchscreen0 udev rule.
> - --enable hal and --enable-udev are mutually exclusive, though.
> 
>> Before this change hal could be removed from om-gta*
>>
>> I'm also willing to accept that we also need hal from reasons I don't know
>> about yet..
> 
> e.g. people wanting to use xf86-input-tslib on gta0X, like me :)

Xorg 1.7.3 and 1.7.4 seems to get stuck somewhere for me when logging out.
If I "--disable-config-hal" and put my touchscreen info back in xorg.conf then 
my touchscreen is Ok. Anyone else have this problem with touch screens or is it 
  just isolated to me ?

> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFLTILZMkyGM64RGpERAv0+AKCKBN96oE8Yvx1/dK7/y0lG82oMOgCfcgpx
> CHftf+HCW1kH9SHY1aKb9gI=
> =bmXf
> -----END PGP SIGNATURE-----



