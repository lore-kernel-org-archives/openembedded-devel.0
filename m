Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OyMgY-0000GV-BZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 12:36:23 +0200
Received: by iwn2 with SMTP id 2so417535iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kQF0eY3C0jr8x5Z5VkOB2NkZ01L240+3GLkE4fvFgPI=;
	b=Lmui0eV9dLXFiRpbes9yRlJ6i6fVUAstRPEYVjoJ8a1o12U6TqyvTT259qPELXkufp
	oRNpk36cC4cKX5rs97TMSMPa2ahJkw25QLpqkyWDp7hNljWK4tG+kfWmo4epcRyp3xMS
	mCRgKNCboTvy1qXBhKXpE+VNEwjbUL28ESjww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=W6J8bJLCPKitQM5D+NcL4kXRV1uk4vbM9YO1RoBReKzBMPMMI4V/9+giZ/hTa8oN2K
	hiSttyJA7vPVVNJe7G9DDYjYWxp0+ofqaG6yNxPkqPQP046kWcfMEDKIhImmyhtUxH2i
	R02yZn+Vgc1BJTkGRuXtD/ohesXP3Ilr11GeM=
MIME-Version: 1.0
Received: by 10.231.33.71 with SMTP id g7mr5930851ibd.54.1285151779108; Wed,
	22 Sep 2010 03:36:19 -0700 (PDT)
Received: by 10.231.161.1 with HTTP; Wed, 22 Sep 2010 03:36:19 -0700 (PDT)
In-Reply-To: <4C99B7DB.8040602@gmail.com>
References: <4C9950D0.7000907@gmail.com>
	<201009220913.06632.marcin@juszkiewicz.com.pl>
	<AANLkTi==90GdQHqJufKx6HEaOsM-y-Sgb7E8WsH0Zmvg@mail.gmail.com>
	<4C99B7DB.8040602@gmail.com>
Date: Wed, 22 Sep 2010 20:06:19 +0930
Message-ID: <AANLkTik62awMj=AX3ndn_QbEQDnSDVuqrKKmza7P0haC@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Wed, 22 Sep 2010 10:36:23 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

On 22 September 2010 17:31, Marco Cavallini <koansoftware@gmail.com> wrote:
> Graham Gower ha scritto, Il 22/09/2010 09:36:
>> On 22 September 2010 16:43, Marcin Juszkiewicz
>> <marcin@juszkiewicz.com.pl> wrote:
>>> Dnia =B6roda, 22 wrze=B6nia 2010 o 02:41:52 Graham Gower napisa=B3(a):
>>>
>>>> --- a/recipes/at91bootstrap/at91bootstrap.inc
>>>> +++ b/recipes/at91bootstrap/at91bootstrap.inc
>>>> +COMPATIBLE_MACHINE =3D
>>>> "(afeb9260|at91cap9adk|at91sam9g20ek|at91sam9rlek|at91sam9263ek|at91sa=
m926
>>>> 0ek|at91sam9xeek|at91sam9261ek)"
>>> mk355 is also atmel at91sam9263 so at91bootstrap is used on it probably=
.
>>>
>>
>> The compatible machines here are those that have a defconfig in the
>> the files/ directory.
>>
>
> Yes please
> mh55 is also atmel at91sam9263 so at91bootstrap is used on it too.
> It also have its defconfig in the recipes/linux/linux-2.6.28/mh355/
> directory.
>
>

Ok, well the defconfigs are duplicated into this recipe dir (probably
a bad thing). To support mh55, you would have to copy the defconfig in
and add it to COMPATIBLE_MACHINE.


