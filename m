Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoN1r-0005JC-DO
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 22:57:29 +0200
Received: by iwn2 with SMTP id 2so849528iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2xAnkBDISIkvO72vg4jATcLGdRGi4QzPagWfZ1d3WAg=;
	b=HVRMbhnAvp/mRv/8UaPUWzU1UYSh+NLwQ+WkZwJDnkq0YVXg8z5pDdkiBfeXtMPyZ5
	gLE0Tto/XByI8vGTr6nk8kYZvqFN10HlScmhNNuOhNZytNejXjFJkZ3u2NSVwI2i+loh
	4GrxLUkpy8pWiOHI+DE26MZXR5gnXrp+V2vTY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JSuutfEgCD8BfwKiTe7I8LycSjEGJGk6+iwtBPd6L2Yx1erqV1UGGg39NaFvDOWznn
	ud2iFaL3F8X4kX+53ZublFz74aubrbh3geoQ7htgWZ/lER04ProasH7ZTJ10zQ9aJQGi
	b98lkkroeNnnJgzTvxFG6wDatPLBx+CJD+ylw=
MIME-Version: 1.0
Received: by 10.231.118.28 with SMTP id t28mr9377331ibq.131.1282769797774;
	Wed, 25 Aug 2010 13:56:37 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 25 Aug 2010 13:56:37 -0700 (PDT)
In-Reply-To: <4C757565.3010107@mentor.com>
References: <AANLkTimd9f1LPJ8f7Bi1+8V7T8dJ-C+3m5NxgWGQ8Tuw@mail.gmail.com>
	<201008252132.03713.roman@khimov.ru>
	<AANLkTinQqY=C+7ES=qZ8vRuQi_UOWOKX4PHQ7XFtqH2k@mail.gmail.com>
	<201008252221.59989.roman@khimov.ru> <4C757565.3010107@mentor.com>
Date: Wed, 25 Aug 2010 22:56:37 +0200
Message-ID: <AANLkTi=C2B9VxaR0EVGWJf-ayoQ12shcvbO_Enp3KbEZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
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
X-List-Received-Date: Wed, 25 Aug 2010 20:57:30 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/8/25 Tom Rini <tom_rini@mentor.com>:
> Roman I Khimov wrote:
>>
>> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 25 =C1=D7=C7=D5=
=D3=D4=C1 2010 21:59:31 =C1=D7=D4=CF=D2 Frans Meulenbroeks
>> =CE=C1=D0=C9=D3=C1=CC:
>>>
>>> Ok, as you are definitely more knowledgeable than I am, I follow your
>>> =9Aproposal. As you are probably the owner of the recipe (and have more
>>> =9Aknowledge) can you give followup to this.
>>
>> Well, MAINTAINERS file disagree a bit with this ownership, but seems lik=
e
>> I'm the one who cares most about it at this day and age, so. Patch will
>> follow.
>
> An also active (yes, I'll call March active) developer. =9APerhaps it's O=
K to
> have > 1 MAINTAINER for a recipe, and you'd like to sign up for some of t=
he
> other thing you've been keeping a good eye on? =9AThanks :)
>
> --

I think it is fine to have more than one developer for a recipe.
guess this also applies to e.g. the linux and u-boot recipes

Frans


