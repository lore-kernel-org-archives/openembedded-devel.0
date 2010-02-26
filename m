Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nl5vi-0007k0-QV for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 20:32:58 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nl5sz-0003qZ-IA for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 20:30:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 20:30:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 20:30:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 26 Feb 2010 20:27:09 +0100
Message-ID: <hm97ae$bvo$2@dough.gmane.org>
References: <4B87B283.20009@atmel.com> <hm8ggf$j65$1@dough.gmane.org>
	<1267209944.18176.575.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <1267209944.18176.575.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC; Building multiple u-boot images for a single board
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
X-List-Received-Date: Fri, 26 Feb 2010 19:32:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-02-10 19:45, Tom Rini wrote:
> On Fri, 2010-02-26 at 13:57 +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 26-02-10 12:37, Ulf Samuelsson wrote:
>>> If you want to support multiple boot memories, you have to
>>> have multiple boards in the conf/machine directory
>>>
>>> I currently testing a change to at91bootstrap, where a defconfig
>>> is not provided by openembedded.
>>> Instead you provide a list of defconfig's in your machine description:
>>>
>>> I.E: in conf/machien/at91sam9g45ek.conf you have:
>>>
>>> AT91BOOTSTRAP_BOARD = "at91sam9g45df at91sam9g45ek at91sam9g45nf"
>>>
>>> when at91bootstrap is built it will loop through all the boards.
>>> and build three versions.
>>>
>>> I think it would make sense to do the same for u-boot,
>>> so that you can build u-boot for several configurations.
>>
>> Not about u-boot, but slightly related:
>>
>> I need something similar for uImages due to hardware limitations
>> (daughtercards requiring conflicting pinmux) and I have created this for
>> kernel builds:
>>
>> http://dominion.thruhere.net/git/cgit.cgi/openembedded/tree/recipes/linux/multi-kernel.inc?h=ti/staging
>>
>> It's working nicely for my usecase (validate hardware configs with
>> multiple kernels, validate software with only one kernel).
> 
> That indeed looks useful.  Any chance it'll go in soon?  Or what's left
> to cleanup before it can?  Aside from some shellfile for pstaging that
> is.

The goal is "next wednesday" provided the tests on monday/tuesday pass,
but see Denys' respone about shellfile assumptions.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLiCCNMkyGM64RGpERAsmhAJ9gxCksjNChcO0XetYCagaRKGZIUwCeK2m8
1ySucR0YlvS+CYMA++vIsdI=
=Ms5c
-----END PGP SIGNATURE-----



