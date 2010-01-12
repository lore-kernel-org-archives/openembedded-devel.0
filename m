Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUhUb-00013w-0l for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 15:13:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUhSW-0004Yz-3x
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 15:11:00 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 15:11:00 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 15:11:00 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 12 Jan 2010 15:10:33 +0100
Message-ID: <hihvso$eon$1@ger.gmane.org>
References: <E1NTDIp-00055S-0r@melo.openembedded.org>
	<20100112140326.GC10781@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100104 Shredder/3.0.1pre
In-Reply-To: <20100112140326.GC10781@jama>
X-Enigmail-Version: 1.0
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
X-List-Received-Date: Tue, 12 Jan 2010 14:13:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-01-10 15:03, Martin Jansa wrote:
> On Fri, Jan 08, 2010 at 11:46:51AM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 3a9b352acba24c78b562d8dc6527b774cbb86041
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=3a9b352acba24c78b562d8dc6527b774cbb86041
>>
>> Author: Koen Kooi <koen@openembedded.org>
>> Date:   Fri Jan  8 12:44:47 2010 +0100
>>
>> xserver-xorg 1.7.3: fix regression where hal was disabled
>>
>> * this fixes the "my touchscreen isn't working anymore" bug
> 
> Thanks,
> 
> can we add hal conditionaly as XINERAMA is?
> Maybe for both om-gta01, om-gta02?
> 
> We have input configuration in xorg.conf and with hal for input
> detection deprecated by xorg devs I guess we won't change that before
> 1.8 xserver (maybe with deviceKit or something else).

AIUI you can do --enable-udev to get udev based device handling (aka
"The Future") working, but that would involve one of the OE devs
expanding the current touchscreen0 udev rule.
- --enable hal and --enable-udev are mutually exclusive, though.

> Before this change hal could be removed from om-gta*
> 
> I'm also willing to accept that we also need hal from reasons I don't know
> about yet..

e.g. people wanting to use xf86-input-tslib on gta0X, like me :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTILZMkyGM64RGpERAv0+AKCKBN96oE8Yvx1/dK7/y0lG82oMOgCfcgpx
CHftf+HCW1kH9SHY1aKb9gI=
=bmXf
-----END PGP SIGNATURE-----



