Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoKGX-00060v-Lt
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 20:00:04 +0200
Received: by gxk2 with SMTP id 2so301562gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YsT3BPo2esCmIq7CsCCR187eQSF6Cj8HkSS29hWlUj4=;
	b=O99dzfMdsP5rGFKLuin8FoGlAUMrYAmyJFh13poCMwPcOXapUVftPKKIooB4CuYOyQ
	N7d0dcbtRhEGlYi45zjNfPbrZyoTdoygn8hFxQhahiWaAPhevUndPYHh3ltfhPhtoZma
	J7cWAkgnwxCrsBSAzuWuNRg16PFWA0QTh6vNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xUu2o0EMSlPPwNdEieqmhtqqdgz4UMMbj6l2CR47rD3pui+YNHNaS6TbHCZPaJ2hDv
	4ISJaBBMKKza9woPiJHl/OR6RanDhXyW6wIJG4WhVEmvxIHkhFUNyt84icJ5DgtACRtV
	lw8eHZkAxq1kcV7/UBBDi8gGbKmdUGYrIa0oE=
MIME-Version: 1.0
Received: by 10.100.6.11 with SMTP id 11mr8255920anf.33.1282759171204; Wed, 25
	Aug 2010 10:59:31 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 25 Aug 2010 10:59:31 -0700 (PDT)
In-Reply-To: <201008252132.03713.roman@khimov.ru>
References: <AANLkTimd9f1LPJ8f7Bi1+8V7T8dJ-C+3m5NxgWGQ8Tuw@mail.gmail.com>
	<201008252132.03713.roman@khimov.ru>
Date: Wed, 25 Aug 2010 19:59:31 +0200
Message-ID: <AANLkTinQqY=C+7ES=qZ8vRuQi_UOWOKX4PHQ7XFtqH2k@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: squid: remove 2.x versions
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
X-List-Received-Date: Wed, 25 Aug 2010 18:00:04 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/8/25 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 25 =C1=D7=C7=D5=D3=
=D4=C1 2010 21:12:02 =C1=D7=D4=CF=D2 Frans Meulenbroeks
> =CE=C1=D0=C9=D3=C1=CC:
>> Triggered by the recent commit from Roman:
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db0f0b3ab=
87cf8
>> 5c76498b57f8300539d133efa6f There are various DoS issues resolved in 3 t=
hat
>> =9Aare not resolved in 2.x (http://www.squid-cache.org/Advisories/)
>>
>> 2.6 is not a recommended version any more. 2.7 is lagging a version
>> (latest is stable9).
>> I propose to remove the 2.x versions and keep only 3.1.7
>
> I'd remove 2.6 and leave 2.7 since AFAIK it is officially maintained (STA=
BLE9
> has almost no changes compared to STABLE8, I've seen that and not bothere=
d to
> update even when we've been on 2.7):
> http://www.squid-cache.org/Versions/v2/2.7/changesets/SQUID_2_7_STABLE9.h=
tml
>
> 3.x and 2.x branches are very different so there are situations where 3.x=
 has
> a bug and 2.x doesn't (3.1.6 bug is in this category)
>
> 2.x also has some features 3.x doesn't:
> http://www.squid-cache.org/Versions/v3/3.1/RELEASENOTES.html#s6
>
> 2.6, especially since it's STABLE14 and no one cares to update it to late=
st
> STABLE, yes, good candidate for removal.
>

Ok, as you are definitely more knowledgeable than I am, I follow your propo=
sal.
As you are probably the owner of the recipe (and have more knowledge)
can you give followup to this.
You have my ack for 2.6

Frans


