Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NeFNv-00056H-1H for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 23:13:46 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NeFLV-0000jZ-Oz for openembedded-devel@lists.openembedded.org;
	Sun, 07 Feb 2010 23:11:13 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 23:11:13 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2010 23:11:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 07 Feb 2010 23:10:52 +0100
Message-ID: <hkndpa$d3j$1@ger.gmane.org>
References: <1264620764-22806-1-git-send-email-ynezz@true.cz>	<hkn3ds$ci0$1@ger.gmane.org>
	<20100207204235.GT24852@ibawizard.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <20100207204235.GT24852@ibawizard.net>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] rt2x00: new recipe for rt3070 version 2.1.2.0
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
X-List-Received-Date: Sun, 07 Feb 2010 22:13:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-02-10 21:42, Petr Štetiar wrote:
> Koen Kooi <k.kooi@student.utwente.nl> [2010-02-07 20:14:05]:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 27-01-10 20:32, Petr Štetiar wrote:
>>> This patch adds support for rt3070 kernel driver, used for example by the new
>>> Belkin F6D4050v2 USB WiFi stick.
>>
>> How does this differ from recipes/ralink/rt3070_2.1.1.0.bb and why is it
>> in another directory?
> 
> Hm, looks like I overlooked this recipe:( I've seen rt61 and rt73 recipes in
> rt2x00 (was searching for packages starting with 'rt') dir and I thought, that
> this dir is appropriate for my recipe also.  Anyway rt3070 is called 3070, but
> it's 2870 with some mods, you can see outputs of 2870 in dmesg, even config
> file is called RT2870sta.dat, it's a weird driver but the only option.
> 
> There's a difference in my recipe also, I create empty RT2870sta.dat file,
> because I was unable to get it working with it (what a driver reading config
> files from userspace) and I use it with iwconfig successfully.
> 
> There's a bug[1] for it and probably can be closed, patch[2] which can be
> discarded also. And FYI the direct links at Ralink's site don't work
> anymore(you've to agree with GNU/GPL EULA :D before downloading it), so I
> kindly asked Laibsch if he could mirror it on OE.
> 
> So, should I prepare a patch which will move recipes from rt2x00 dir to ralink
> dir and move my recipe there(newer version)? Thanks for you time reviewing my
> patch.

I have no strong opinion on that, I would only like to keep the wifi of
my touchbook working :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLbzpsMkyGM64RGpERAuweAJsGhuhaZsCgEQquAg12Y9S3VEuQMgCfVXWx
w5x8t7ISW1SOH9Yj0r6vtr0=
=PZcN
-----END PGP SIGNATURE-----



