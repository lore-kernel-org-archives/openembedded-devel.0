Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OyUXU-00050j-Bt for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 20:59:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OyUXR-0006lm-CY for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 20:59:29 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 20:59:29 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 20:59:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Sep 2010 20:59:19 +0200
Message-ID: <i7djm7$u5q$1@dough.gmane.org>
References: <4C9950D0.7000907@gmail.com>	<201009220913.06632.marcin@juszkiewicz.com.pl>	<AANLkTi==90GdQHqJufKx6HEaOsM-y-Sgb7E8WsH0Zmvg@mail.gmail.com>	<4C99B7DB.8040602@gmail.com>	<AANLkTik62awMj=AX3ndn_QbEQDnSDVuqrKKmza7P0haC@mail.gmail.com>
	<4C9A4A4F.7060401@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <4C9A4A4F.7060401@mentor.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
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
X-List-Received-Date: Wed, 22 Sep 2010 18:59:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-09-10 20:26, Tom Rini wrote:
> Graham Gower wrote:
>> On 22 September 2010 17:31, Marco Cavallini <koansoftware@gmail.com>
>> wrote:
>>> Graham Gower ha scritto, Il 22/09/2010 09:36:
>>>> On 22 September 2010 16:43, Marcin Juszkiewicz
>>>> <marcin@juszkiewicz.com.pl> wrote:
>>>>> Dnia środa, 22 września 2010 o 02:41:52 Graham Gower napisał(a):
>>>>>
>>>>>> --- a/recipes/at91bootstrap/at91bootstrap.inc
>>>>>> +++ b/recipes/at91bootstrap/at91bootstrap.inc
>>>>>> +COMPATIBLE_MACHINE =
>>>>>> "(afeb9260|at91cap9adk|at91sam9g20ek|at91sam9rlek|at91sam9263ek|at91sam926
>>>>>>
>>>>>> 0ek|at91sam9xeek|at91sam9261ek)"
>>>>> mk355 is also atmel at91sam9263 so at91bootstrap is used on it
>>>>> probably.
>>>>>
>>>> The compatible machines here are those that have a defconfig in the
>>>> the files/ directory.
>>>>
>>> Yes please
>>> mh55 is also atmel at91sam9263 so at91bootstrap is used on it too.
>>> It also have its defconfig in the recipes/linux/linux-2.6.28/mh355/
>>> directory.
>>>
>>>
>>
>> Ok, well the defconfigs are duplicated into this recipe dir (probably
>> a bad thing). To support mh55, you would have to copy the defconfig in
>> and add it to COMPATIBLE_MACHINE.
> 
> It sounds like, and trying not to open a different can of worms, but the
> at91 stuff should perhaps be using one of those hooks for grouping a set
> of machines together?

It is indeed what SOC_FAMILY was designed to do: group SOC related
features instead of formfactor features
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMmlIHMkyGM64RGpERAv2eAKCu02W7Pu7oDz+zZ/hWzyhOrNYPPACeOcvo
mT4UxCfGuVIKC8gIcDFGt8U=
=dV3k
-----END PGP SIGNATURE-----



