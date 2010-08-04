Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ognp2-0007oW-FL for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 01:56:37 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ognox-0001AP-DJ for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 01:56:27 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 01:56:27 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 01:56:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Aug 2010 01:56:19 +0200
Message-ID: <i3cun3$aoh$1@dough.gmane.org>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<1280915670.2692.350.camel@mill.internal.reciva.com>	<AANLkTinBPTAF2UH0weQ7FKpHqFUBeLkzoO8kuQg41e+0@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0802E91E8FFA@dlee06.ent.ti.com>
	<AANLkTi=8efwOur=U1Od-fMS7BdHGEBjydwYWona_NgVh@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <AANLkTi=8efwOur=U1Od-fMS7BdHGEBjydwYWona_NgVh@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 23:56:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-08-10 23:37, Khem Raj wrote:
> On Wed, Aug 4, 2010 at 1:24 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org
>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>> Khem Raj
>>> Sent: Wednesday, August 04, 2010 2:49 PM
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [PATCH] base.bbclass: add support for SOC_FAMILY in
>>> COMPATIBLE_MACHINES
>>>
>>> On Wed, Aug 4, 2010 at 2:54 AM, Phil Blundell <philb@gnu.org> wrote:
>>>> On Tue, 2010-08-03 at 16:47 -0500, Chase Maupin wrote:
>>>>> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
>>>>>   setting for a recipe.
>>>>> * This will allow recipes to work for entire families of
>>>>>   devices without having to maintain/update the compatible
>>>>>   devices as new devices are added into a family
>>>>
>>>> I don't suppose you'd consider refactoring your MACHINE names in order
>>>> to allow a simple regex in COMPATIBLE_MACHINE?
>>>
>>> that would be a good approach too. Has it been
>>> considered.
>>
>> As I mentioned before, we are matching the machine names to the name of the actual device.  Unfortunately, not every device that falls into an SOC family has a similar name and cannot all be dictated by us.  For example in omap3 SOC_FAMILY there is:
> 
> and omap3 family is armv7-a or cortex-a8 based can it have different
> CPUs and be still categorized as omap3
> is there omap3 specific you need which is not covered with armv7-a or cortex-a8

DSP, SGX, IVA, DSS, AESE, ISP, take your pick.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMWf4jMkyGM64RGpERAnM2AKCR2UEEdmgB/WFr0F9UZ55DqffJ0ACgrROX
7OIjSOU9ki67zIi8c1Xx66k=
=nZ7Z
-----END PGP SIGNATURE-----



