Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OoVjW-0002AK-47
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 08:14:43 +0200
Received: by gxk2 with SMTP id 2so543650gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=YZsbkAAM4fygeCJzUByEhC00TOWOpkBS9xZ+kX6Kfpg=;
	b=x+cdsFX8QQpLtXXhRMgrwUG+JSBWcQDJCrF5wFZk4nA0PXVCejRfqC2MJ+zGCjpP3O
	k/xDhh0oML27GNmu9oGXSF7C1k1djzV32J+3kp1+hbwE/LtglSovWh6YpaKUrZdApFN5
	nUsEX5T+YJg1k07N8ZElstEQaaJ1si441hIgw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BBZCZTbeyz1EjXOAHWounDmmIVSqrAeTq0F17OwaW9RkFe0/r/kh49H/fms/h/p0ZY
	lfXgVWaYa9YRl1s5zVPh6PDtyLBZP2f3Ot58iCyr8eROiRbeLLqaFW9qg/4bjlp2oAmx
	+a1Y64JBdpaWQJzOnbS+2pq/WUGlZkAJ36ZO4=
MIME-Version: 1.0
Received: by 10.90.88.8 with SMTP id l8mr162049agb.205.1282803253606; Wed, 25
	Aug 2010 23:14:13 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Wed, 25 Aug 2010 23:14:13 -0700 (PDT)
In-Reply-To: <AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
Date: Thu, 26 Aug 2010 08:14:13 +0200
Message-ID: <AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
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
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Thu, 26 Aug 2010 06:14:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/25 Chris Larson <clarson@kergoth.com>:
> On Wed, Aug 25, 2010 at 2:04 PM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> Is it possible to add a file to SRC_URI for target only in a combined
>> native/target recipe?
>>
>> Of course I know I can fully redefine SRC_URI, but I feel that is less
>> desirable.
>> The issue is that the target recipe needs an additional patch that the
>> native recipe cannot use.
>>
>> Or do we need to introduce an _target suffix?
>>
>> Guess an intermediate variable also could do the trick.
>> E.g.
>>
>> PATCH = "xx.patch"
>> PATCH_virtclass-native = ""
>> SRC_URI = "source and files and patches ${PATCH}"
>>
>> not really ideal either.
>>
>> I saw some other places where we need to tweak similarly with DEPENDS
>> e.g.
>> DEPENDS = "x"
>> DEPENDS_virtclass-natvie = ""
>>
>> guess here _target could help too.
>>
>> Any ideas/comments/patches/... ?
>
>
> Something like this should work:
> DEPENDS += "${@['', 'foo']['${BPN}' == '${PN}']}"

Wow.
I think it indeed does, but my knowledge of the language is not that
good that I can say for sure.
The construct above also is not too understandable for beginners. I
think in this case I prefer an overrriding _virtclass-native
assignment (or a new-to-be-introduced _target suffix).

Frans


