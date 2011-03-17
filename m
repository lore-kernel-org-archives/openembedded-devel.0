Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q0F5g-0000f3-Ba for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 16:26:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q0F3x-0002IS-6N for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 16:24:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 16:24:33 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 16:24:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 Mar 2011 16:24:22 +0100
Message-ID: <ilt936$ab1$1@dough.gmane.org>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>	<1300180117.2522.14.camel@eha>	<1300360696.2132.14681.camel@phil-desktop>	<1300373028.2468.8.camel@eha>
	<4D822021.6030808@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D822021.6030808@xora.org.uk>
X-Enigmail-Version: 1.0.1
Subject: Re: Eliminating dependency race-conditions (was Re: [PATCH] net-snmp: disable libnl use)
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
X-List-Received-Date: Thu, 17 Mar 2011 15:26:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-03-11 15:52, Graeme Gregory wrote:
> On 17/03/2011 14:43, Esben Haabendal wrote:
>> On Thu, 2011-03-17 at 11:18 +0000, Phil Blundell wrote:
>>>> I am still very much interested in discussing how to move this
>>>> technology from OE-lite to OE, but as it impacts all recipe metadata
>>>> (build dependencies has to be redefined), OE community at a large
>>> really
>>>> needs to value the benefits of solving this problem.
>>> The benefits of solving the problem are clearly very great, but I
>>> don't think OE itself is really in a position to embrace a "big bang"
>>> kind of change which would require redefining all the build
>>> dependencies.  I think we need to find a technological solution which
>>> will work with our current DEPENDS scheme. 
>> I know that this seems to be the general consensus in OE, but I do not
>> agree with it.  Sometimes architectural work requires working out the
>> details on a branch, and then when it is mostly done, do the "big bang"
>> which will then not really be that "big" anymore, as most of the issues
>> have been resolved.
>>
>> Is OE really in a position to permantly settle for something suboptimal
>> in such a central area?
>>
> I would suggest a branch of oe-core is the ideal place to do this work.
> It can be proved on oe-core then rolled out to meta-oe at a later date.

OE-core already features per-machine sysroots, so the main problem we
had, relocatability, has already been solved.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNgielMkyGM64RGpERAqcIAKCyT44a9MzDF+esO6DgRbtBXi4L8ACdGzpN
4vN5d5EtUwbo3cNHfMl9XQ4=
=eFCq
-----END PGP SIGNATURE-----



