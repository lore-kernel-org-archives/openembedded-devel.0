Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5NJC-0007ud-L8 for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 20:41:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5NIk-0005dN-BL for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 20:40:46 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 20:40:46 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 20:40:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 Oct 2010 20:40:37 +0200
Message-ID: <i8vln6$njo$1@dough.gmane.org>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Mon, 11 Oct 2010 18:41:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-10-10 20:14, Maupin, Chase wrote:
> 
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Frans Meulenbroeks
>> Sent: Monday, October 11, 2010 12:41 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [PATCHv2] recipe licenses: update recipe LICENSE fields
>>
>> 2010/10/11 Chase Maupin <chasemaupin03@gmail.com>:
>>> * While verifying the licensing for the packages I am building
>>>  into my file system I found that for some packages the
>>>  LICENSE value set in the recipe was either incorrect or
>>>  generic and not detailed enough.  This patch is my attempt
>>>  to update the LICENSE fields for these packages to match
>>>  the actual versions of the licenses in the sources.
>>>
>>
>> [...]
>>
>>> -LICENSE = "GPLv2"
>>> +LICENSE = "GPLv2+"
>>
>> Doe we want this?
>> I think most GPLv2 code carries the clause:
>>
>> "This program is free software; you can redistribute it and/or
>> modify it under the terms of the GNU General Public License
>> as published by the Free Software Foundation; either version 2
>> of the License, or (at your option) any later version."
>>
>> Yet currently virtually all of these have GPL or GPLv2 as LICENSE
> 
> Frans,
> 
> My original version of this patch was just changing GPL to GPLv2 for example.  But I was asked about whether it should be GPLv2+ which I guess is more indicative of the "or later" clause.  Does anyone have good guidance here on how to denote things that are GPLv2 only for now (like git which Linux has a note in the COPYING file about it being GPLv2) and things that are GPLv2 or later version?  I'm trying for consistency here but I guess there doesn't seem to be a set policy for how the LICENSE field should be set.

The current policy is:

GPLv1 -> GPL version 1
GPLv1+ -> GPL version 1 or later
GPLv2 -> GPL version 2
GPLv2+ -> GPL version 2 or later
GPLv3 -> GPL version 3
GPLv3+ -> GPL version 3 or later

This was done to make it immediately clear which GPL license it's using
so you can decide to drop GPLv2+ and GPLv3 from your manifest if you
want secure boot or enforce patents.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMs1olMkyGM64RGpERAsAeAJ90Gp4LBCEyDQOYKMQswvyD5ymbhwCdHdH/
2Lt14nkyseMjn1ScePVbF34=
=x1oc
-----END PGP SIGNATURE-----



