Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OglfC-00058t-Iw
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 23:38:15 +0200
Received: by yxi11 with SMTP id 11so2340040yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3ZAbVL2A2Kjt6K2aQ6BkI1fmb+Cc3ERThlxj1SCxkTA=;
	b=XOicjgYU3iCIkc88qJ9vPVYEK8hGkFL6yvf9jy5A1aRNRM1LpuemSEcdJUybfmd8kG
	cVS2+0Eh0W7cSHVNfqlKv8mGh+K+m7G07hS9xzetl67aGPfcoSifzprXa85OiclQb19q
	XdaEQjlrjhGjahC8h79Fw+wGfhefTo7Dfa7Fw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vcakdmlvgmS2l6VhB4fRw7lcJuYl6tx8gwB6UmwQ3LowV+/Ac/2Wog5Tzvoq5k9MQX
	9zgvAMWCtfVk8ZkbIte7vS+gfjv/H0WGYy/b9fM6aQT7abZ+noY39uwK+yYXsIRsPzhF
	AyMulS/HwhKSw9CpF5jFNYeR9sHEa6vVB70AM=
Received: by 10.231.157.212 with SMTP id c20mr10725688ibx.186.1280957886274; 
	Wed, 04 Aug 2010 14:38:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.12.137 with HTTP; Wed, 4 Aug 2010 14:37:46 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F0802E91E8FFA@dlee06.ent.ti.com>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com> 
	<1280915670.2692.350.camel@mill.internal.reciva.com>
	<AANLkTinBPTAF2UH0weQ7FKpHqFUBeLkzoO8kuQg41e+0@mail.gmail.com> 
	<131E5DFBE7373E4C8D813795A6AA7F0802E91E8FFA@dlee06.ent.ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Aug 2010 14:37:46 -0700
Message-ID: <AANLkTi=8efwOur=U1Od-fMS7BdHGEBjydwYWona_NgVh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Wed, 04 Aug 2010 21:38:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 4, 2010 at 1:24 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Wednesday, August 04, 2010 2:49 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [PATCH] base.bbclass: add support for SOC_FAMILY in
>> COMPATIBLE_MACHINES
>>
>> On Wed, Aug 4, 2010 at 2:54 AM, Phil Blundell <philb@gnu.org> wrote:
>> > On Tue, 2010-08-03 at 16:47 -0500, Chase Maupin wrote:
>> >> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
>> >> =A0 setting for a recipe.
>> >> * This will allow recipes to work for entire families of
>> >> =A0 devices without having to maintain/update the compatible
>> >> =A0 devices as new devices are added into a family
>> >
>> > I don't suppose you'd consider refactoring your MACHINE names in order
>> > to allow a simple regex in COMPATIBLE_MACHINE?
>>
>> that would be a good approach too. Has it been
>> considered.
>
> As I mentioned before, we are matching the machine names to the name of t=
he actual device. =A0Unfortunately, not every device that falls into an SOC=
 family has a similar name and cannot all be dictated by us. =A0For example=
 in omap3 SOC_FAMILY there is:

and omap3 family is armv7-a or cortex-a8 based can it have different
CPUs and be still categorized as omap3
is there omap3 specific you need which is not covered with armv7-a or corte=
x-a8

>
> beagleboard
> omap3evm
> nokia900
> dm37x-evm
> archos5
> bug20
>
> and many many more. =A0These machines are defined by a variety of compani=
es, some from TI, some community, Nokia, Archos, etc. =A0I don't think it i=
s likely that we will get agreement on the naming between all the groups. =
=A0I know that just within TI the naming is driven by marketing names for t=
he devices.
>
>>
>> I don't have a strong
>> > objection to this patch but, conceptually, it seems a bit ugly.
>>
>>
>>
>> >
>> > p.
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


