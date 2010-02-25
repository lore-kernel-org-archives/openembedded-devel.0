Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NkZNF-0000gi-3T for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 09:47:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NkZKY-0001qh-7A for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 09:44:22 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 09:44:22 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2010 09:44:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 25 Feb 2010 09:44:09 +0100
Message-ID: <hm5d8q$6c7$1@dough.gmane.org>
References: <4B84DE66.4080602@dresearch.de> <hm32cp$h8m$1@dough.gmane.org>
	<4B862F8F.4050001@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <4B862F8F.4050001@dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Angstrom, udev, and kernel version
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
X-List-Received-Date: Thu, 25 Feb 2010 08:47:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-02-10 09:06, Steffen Sledz wrote:
> Koen Kooi wrote:
>>> udevd started from within /etc/init.d/udev crashes with
>>>
>>> /sbin/udevd -d --debug
>>> 1266997931.250494 [297] udev_monitor_new_from_netlink: error getting socket: Invalid argument error initializing netlink socket
>>> 1266997931.250718 [297] main: error initializing netlink socket
>>>
>>> Searching the internet for this error i found some hints that this udev version requires at least linux 2.6.27.
>>
>> 2.6.27 is only required for signalfd, your error seems to be about a
>> missing networking option in defconfig.
> 
> Any hints, how we can isolate this problem?

The README in the udev source should have a fairly complete summary of
needed kernel options. If you use angstrom or shr linux.inc will set
them all except CONFIG_NET. So you could try rebuilding your kernel and
see if it works then. If not, compare your .config with the udev readme.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLhjhZMkyGM64RGpERAgVGAJ9UsDHvNhMSZ1Uis6z6Zbg8gwohswCgpN/t
G89BmgNucXDjiBjtlCVJjmw=
=q11y
-----END PGP SIGNATURE-----



