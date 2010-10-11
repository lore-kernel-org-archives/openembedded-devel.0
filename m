Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5D9Q-0008Ph-5A for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 09:50:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5D91-0003b6-9p for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 09:50:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 09:50:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 09:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 Oct 2010 09:47:32 +0200
Message-ID: <i8ufek$27r$2@dough.gmane.org>
References: <F34D057F-F640-4BB6-841B-2B66AFE37A99@mac.com>
	<AANLkTin8xbEBR=mVr3PHN9cjwqtUoM9BxpYkgBE7p_UY@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTin8xbEBR=mVr3PHN9cjwqtUoM9BxpYkgBE7p_UY@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building for multiple machines
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
X-List-Received-Date: Mon, 11 Oct 2010 07:50:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-10-10 08:27, Frans Meulenbroeks wrote:
> 2010/10/11 Elvis Dowson <elvis.dowson@mac.com>:
>> Hi,
>>        What should I do build for multiple machines ?
>>
>> I have an overo-oe repository, but I need to temporarily build u-boot for a different board.
>>
>> In my auto.conf, the entry is MACHINE="overo"
>>
>> u-boot board definitions for say beagleboard, have named the board "beagle"
>>
>> So, would an appropriate command be
>>
>> bitbake u-boot-omap3 MACHINE="beagle"
>>
>>
>> Elvis Dowson
> 
> I guess trying this would ahve been much faster than waiting for an answer here.
> 
> And OE does not have an auto.conf

OE *does* have an auto.conf, pretty much since the start:

koen@dominion:/OE/org.openembedded.dev/conf$ git blame bitbake.conf |
grep auto.conf
00f6a165 (Chris Larson 2004-12-09 01:08:40 +0000 695) include conf/auto.conf
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMssEUMkyGM64RGpERAqxMAJ9ORcv5iii/70qi6c7EC7ReXlKSQgCgm4UF
qgXeKzlpaIRCTrylt4wM+hU=
=eNId
-----END PGP SIGNATURE-----



