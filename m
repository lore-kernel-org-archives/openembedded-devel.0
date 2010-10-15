Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6gM8-0007GV-MA
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 11:13:41 +0200
Received: by iwn2 with SMTP id 2so671379iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AvnUyYNHF7pXpZCJYPc71wjrH59k8LhcQ9woNqhILtc=;
	b=pT0N8lAzDT7D2ZLUE4T6xDgfOSQwDXDEvAuhqf2nMc7JyWzJ76ZAzUhNn10QAsk68A
	Lxx89cZrddUD4EpFFtsd/Dh12OEPNkkHbplkqtYALkWp1nUNTOX+DWRcSBiQQLJfSken
	9aTFemnLgcyiZvzip5VD3LK8hu6IQGlXoW31E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UXsOzD9ijUlv1gEO9WJxhg4t2fA8m8m+6xOVJUeA0lC8+s8KFleKR4d9OzDEAAMGpJ
	fy+fVkX2fvhFmZY7LvT+NdP9CqUmr+XCpp8ItMheY1zdCfrNaoAEJVdHUULYaAv0PJRd
	cbxppdHNHqk/gFsgKt6PFmWN/+Wa3QUhobZUU=
MIME-Version: 1.0
Received: by 10.231.11.71 with SMTP id s7mr322419ibs.85.1287133983854; Fri, 15
	Oct 2010 02:13:03 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 15 Oct 2010 02:13:03 -0700 (PDT)
In-Reply-To: <4CB81961.4050104@gmail.com>
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
	<4CB81961.4050104@gmail.com>
Date: Fri, 15 Oct 2010 11:13:03 +0200
Message-ID: <AANLkTi=M_RR7Qsbge8-FmB0WiS4CcLPVd3GxV4d3z0Ns@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Fri, 15 Oct 2010 09:13:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/15 Marco Cavallini <koansoftware@gmail.com>:
> Marcin Juszkiewicz ha scritto, Il 15/10/2010 10:39:
>> Hi
>>
>> recipes/linux/ contains 235 recipes. I would like to propose cleaning:
>>
>> 1. drop 2.4 kernels - if someone still needs them then .oz354x and .stab=
le
>> =A0 =A0branches have them.
>>
>
> I agree.
>
>
>
>> 2. Drop kernels older then 2.6.20 - it was over 3 years ago so if someon=
e uses
>> =A0 =A0older one then probably also uses 3 years old OE.
>>
>> This may affect (checked recipes):
>>
>> - ep93xx - machines with this cpu are mainline supported, patches from t=
s72xx
>> =A0 and sim.one works
>> - chumby
>> - compulab-pxa270
>> - devkitidp-pxa255
>> - fsg3
>> - gumstix
>> - amsdelta
>> - bd-neon
>> - colinux
>> - epia
>> - geodelx
>> - h1940
>> - h6300
>> - ks8695
>> - magicbox
>> - mtx-3
>> - neuros
>> - sun4cdm
>> - tornado-omap2
>> - wrap-geode
>> - x86
>> - acern30
>> - logicpd-pxa270
>> - mainstone
>> - mx21ads
>> - netbook-pro
>> - triton
>> - blueangel
>> - universal
>>
>> Some of those machines are not maintained anymore, many of them should w=
ork
>> with current mainline kernels. If someone cares about anything on a list=
 -
>> raise your hand.
>
> IMHO many of those machines are still a useful starting point for a lot
> of people.
> Moreover lots of PXA2x0 based board are unfortunately still using them.
>
>
> I vote to keep them a bit longer.
>

Marco, see my list in my previous post.

I would propose to move to obsolete, so they are still there if needed;
And I guess it makes sense to at least rm the pre 2.6.20 recipes that
have newer versions (like e.g.  linux-jlime-jornada6xx_2.6.11.bb)

Frans


