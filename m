Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oth0d-00048U-Tj
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 15:17:50 +0200
Received: by ywa8 with SMTP id 8so617915ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KlBYcorDk4Ne8YUIacZ21nOrc18XvFxNvSXnScLq570=;
	b=JsgfLAJBhQDcV/+BevXKTtARQ5tR/EASLt5Iwwbd6IC13rFLUESKEGdNqvZz6n72jT
	dK9ZMpaWjWcumRaTkEAJRK8jd6S26E+Ww53he2Se3o/eyOrnfjOa2c+Nj+j47BHPTS/9
	+106jCU8wq+usrD3Pvr0s/Ovm00el0gdO3UL0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=c8DvHI6lMAa7m4AXRxAiXcyzSNVc5SpHJ8qTWf2iaV6NcuprWA3//BKq1iJf1mYAHY
	7yYn9GJm4WUSThjuI9yni+MSP7zMw5PRg9DpyT1JYXHE3Gc0tgGxa+2axQPhYJpN/l87
	0KhlgIgI9Uu8zzf25jmcyehZpnyTVkyS148lQ=
MIME-Version: 1.0
Received: by 10.100.139.7 with SMTP id m7mr182208and.49.1284038214976; Thu, 09
	Sep 2010 06:16:54 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 06:16:54 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310BFAA13@dlee06.ent.ti.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFAA13@dlee06.ent.ti.com>
Date: Thu, 9 Sep 2010 15:16:54 +0200
Message-ID: <AANLkTikLhZ-vsO34S30T5RekoaKJpwyECmjyryY8d6wV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Thu, 09 Sep 2010 13:17:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/9 Maupin, Chase <chase.maupin@ti.com>:

>>
>> I'm not too sure on the usefulness of it either, but there is some
>> breakage so we should either revert the patch or fix it.
>>
>> Actually the SOC_FAMILY got pushed before the review was concluded.
>> Technically it got the ack's but the discussion was still ongoing when
>> this was pushed.
>> What also makes it fishy is that all acks are from the same company
>> (which is the same one as the person who submitted the patch):
>>
>> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>> Acked-by: Denys Dmytriyenko <denys@ti.com>
>> Acked-by: Koen Kooi <k-kooi@ti.com>
>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>>
>> I would suggest modifying the commit policy disallowing these kind of
>> things, saying the two Ack's must be from two developers not
>> affiliated with the same company.
>> (actually we might even want to take it further and saying that global
>> changes that affect everyone would require ACK's from developers from
>> more than one distro).
>>
>> Question to the TSC: should the SOC_FAMILY patch be reverted and put
>> on hold until there is agreement whether or not we want this?
>
> Frans,
>
> As the person who submitted this change I'd like to ask that it not be re=
verted. =A0I am using it currently so that when defining COMPATIBLE_MACHINE=
 for recipes targeted at OMAP3 devices I do not have to keep a rolling list=
 of all the various OMAP3 devices. =A0This can quickly become:
>
> COMPATIBLE_MACHINE =3D "dm37x-evm|am37x-evm|omap3evm|am3517-evm|beagleboa=
rd|......"
>
> Instead by allowing SOC_FAMILY to be used as a COMPATIBLE_MACHINE this ca=
n be handled cleanly with:
>
> COMPATIBLE_MACHINE =3D "omap3"
>
> Please consider this use case. =A0I would much prefer if your fix was put=
 into the base.bbclass than if this were removed.
>

Chase,

I understand your use case.
The major concern I see is the overlap with MACHINE_CLASS.
Anyway, I have no real objections against SOC_FAMILY.
The only observation is that it has been introduced a little bit
hastily without the community reaching consensus.

Frans.

PS: thanks for the ack that arrived while I was typing this
PPS: wrt COMPATIBLE_MACHINE: I think it is possible to use wildcards,
so *if* the machines with omap3 get that as a prefix it could also be
used
(and yes: this is just an alternate option, and I see the con's of it)


