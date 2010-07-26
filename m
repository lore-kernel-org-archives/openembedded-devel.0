Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OdJSR-00066y-3T
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 10:54:48 +0200
Received: by iwn34 with SMTP id 34so2703902iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=iUGEDRgbAPgdY5D0KjMDTs+7N2cRK2G2nRxWyH8ALpE=;
	b=h8mBv1OwsdheyfGXPGyCQeYnvRQIQbzKTS9NPGXiPLwF+s4FAHm7aW3O+dsSIJhoiI
	5xXQxkMelFd59gHNr1nIi7L+J1HwOl4ecU0pqxEyLesJUbcUycJyIUhRFJxpwN8j7HN1
	jjRK/mm3vlpax0q3oxYp5NWjbFViglkcVuz5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=scC2EvH4w1saOoTf2p353lj2fSafrKT9wRJ+bCKlO26Xz0/PWynX6unYhwU3ogV88P
	OZuBPDXXQjhM/y1e1zgtXhzXCwgD4xrFAM/CcoBaSa/v41C0+wcan2YNkKo3IUfOU5B9
	hNNos90wLDA+IsAACUexyIZOCGekjwY+Q34Ds=
Received: by 10.231.152.146 with SMTP id g18mr8383248ibw.48.1280134472328; 
	Mon, 26 Jul 2010 01:54:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Mon, 26 Jul 2010 01:54:11 -0700 (PDT)
In-Reply-To: <i2jeob$pqe$1@dough.gmane.org>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com> 
	<i2fjoo$iiu$1@dough.gmane.org> <20100724212502.GA4218@gmail.com> 
	<i2gsqi$8sv$1@dough.gmane.org> <i2h6dv$1ni$1@dough.gmane.org> 
	<i2harj$e6t$1@dough.gmane.org>
	<AANLkTik9ZnjaXvx6vxnjzxx013ms+cDjVv1FvsK31r5u@mail.gmail.com> 
	<i2hk5h$86q$1@dough.gmane.org> <1280073236.13006.125.camel@rex> 
	<AANLkTim8kQzq4_BxEAU4rtOqVdieD6q5s4dnr219LRbO@mail.gmail.com> 
	<i2jeob$pqe$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jul 2010 01:54:11 -0700
Message-ID: <AANLkTinpOGh7sCLwTvUj_WWE60Yf6W0PL8eos-jVyQUE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Mon, 26 Jul 2010 08:54:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2010 at 12:50 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 25-07-10 21:43, Khem Raj wrote:
>> On Sun, Jul 25, 2010 at 8:53 AM, Richard Purdie <rpurdie@rpsys.net> wrot=
e:
>>> On Sun, 2010-07-25 at 17:10 +0200, Koen Kooi wrote:
>>>>> And cacao:
>>>>>
>>>>> | configure: error: armv7a systems are not supported at this time
>>>>> | ERROR: Function do_configure failed
>>>>>
>>>>>> yes I was expecting that kind of problems. openssl also has similar =
issues.
>>>>>
>>>>>> another idea that struck me was that we could change the target trip=
let to drop
>>>>>> TARGET_VENDOR and replace it with TARGET_SUB_ARCH and TARGET_SUBARCH
>>>>>> could be anything
>>>>>> we could even make it same as MACHINE_ARCH which means you will buil=
d
>>>>>> toolchain per machine
>>>>>> and they will live together.
>>>>>
>>>>>> then the tool names will be something like arm-v7-linux-gnueabi-*
>>>>>> powerpc-e500-linux-gnu
>>>>>> mips-mips2-linux etc. instead of *-angstrom-*- or *-oe-*-
>>>>>
>>>>>> or arm-beagleboad-linux-gnueabi-* etc if we go with MACHINE_ARCH
>>>>>
>>>>>> that would keep all recipe configury happy as the arch detected from
>>>>>> config.guess will be what
>>>>>> we had (arm, mips, mipsel powerpc etc) so no changes needed but we
>>>>>> will have to drop the brand
>>>>>
>>>>>> does it sound good ? bad?
>>>>
>>>> I don't think abusing target vendor for that is a good idea. And I'm
>>>> quite attached to my angstrom branded toolchains, tbh.
>>>
>>> Note that you can still append your angstrom string to the vendor part
>>> of the triplet...
>>
>> arm-v7_angstrom-linux-gnueabi- =A0etc. is a possibility
>
> that would work for me :)

OK, I have a local patch here to append brand to vendor string in triplet.
I will post it tomorrow morning if it builds my different images.
I think now after these changes triplets will be distinct and we don't
need MULTIMACH* or am I mistaken?

Thanks
-Khem

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMTT5KMkyGM64RGpERAiNNAJ4pWZ3QzrdsF0zioWrU1oAmTuAF8QCghWiA
> jYNyaUoeD+N7muCWMbilM78=3D
> =3Dtcjx
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


