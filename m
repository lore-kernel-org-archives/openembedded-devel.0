Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oga44-0004SW-CV for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 11:15:09 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oga40-0006A3-TD for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 11:15:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:15:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 11:15:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Aug 2010 11:13:32 +0200
Message-ID: <i3bavs$8c4$2@dough.gmane.org>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<20100804001959.GF17391@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <20100804001959.GF17391@denix.org>
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
X-List-Received-Date: Wed, 04 Aug 2010 09:15:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-08-10 02:19, Denys Dmytriyenko wrote:
> On Tue, Aug 03, 2010 at 04:47:20PM -0500, Chase Maupin wrote:
>> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
>>   setting for a recipe.
>> * This will allow recipes to work for entire families of
>>   devices without having to maintain/update the compatible
>>   devices as new devices are added into a family
>>
>> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> 
> Acked-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Koen Kooi <k-kooi@ti.com>






> 
> While SOC_FAMILY feature is relatively new on its own, it was designed and now 
> being extensively used with TI machines and corresponding recipes as an 
> effective override - e.g. covering many OMAP3-based machines with a single 
> VAR_omap3 = "VAL" expression.
> 
>> ---
>>  classes/base.bbclass |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index 1847491..02c7875 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -389,7 +389,9 @@ python () {
>>              import re
>>              this_machine = bb.data.getVar('MACHINE', d, 1)
>>              if this_machine and not re.match(need_machine, this_machine):
>> -                raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
>> +                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
>> +                if this_soc_family and not re.match(need_machine, this_soc_family):
>> +                    raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
>>  
>>          need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
>>          if need_target:
>> -- 
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMWS88MkyGM64RGpERAnkkAJ94TErZj0L40RwgMpHejgg8nO+CpgCeNVHI
6uB1qsq0Mj4IP48OxmIyTas=
=jTnu
-----END PGP SIGNATURE-----



