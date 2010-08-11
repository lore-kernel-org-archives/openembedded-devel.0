Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OjGmI-00011K-Ku
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 21:15:56 +0200
Received: by gwb15 with SMTP id 15so158303gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 12:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0MPd5ITZ65Zl+oPFm/gN6KcxjpDeLOWE8bb5hv5yaPY=;
	b=WwdNjPxo7MVKw8LAC/ihs4D54lQYwMk9XAJq1VaiMQx1WNr+05tGKz8y9mDAcVLKXm
	aPVjwQ0Mxc/ft3JuaID64d2knfDTdSskRoG/KS2RGMgzLMpo7RehHXtRF4q67yjjtmKa
	ukm2BPMk6kOTI6FJeB/psA7UX9PPYGAqjIKvc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HUU2Mi4bfN/NYNCysKqdibkw8xR/lZf6gF+urEKDmd49Ds1rOazR6XdI3tw5CRD5wF
	Z4YErVsClC0dQ+MD9Mwg5YPr3LTDQfqiEbfCjj8zAzh5cPXxipyjEupY8YjZc9Ddx7h0
	qqsy45BHPWvzxVgawh3uV4KnI7ES/76CZFeIk=
MIME-Version: 1.0
Received: by 10.151.143.19 with SMTP id v19mr12983533ybn.161.1281554131611; 
	Wed, 11 Aug 2010 12:15:31 -0700 (PDT)
Received: by 10.150.53.9 with HTTP; Wed, 11 Aug 2010 12:15:31 -0700 (PDT)
In-Reply-To: <i3udjt$8l9$1@dough.gmane.org>
References: <4C61E523.7070405@gmail.com> <i3tp29$uvf$1@dough.gmane.org>
	<AANLkTin=ZaqVrBgzXYjfy_nchZVSh5eBUuqXQBRryEwt@mail.gmail.com>
	<i3udjt$8l9$1@dough.gmane.org>
Date: Wed, 11 Aug 2010 21:15:31 +0200
Message-ID: <AANLkTimy+1YViDdGStjSiy6qrsYTZGOmY4y4tU8sX+Op@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Mass convert PREFERRED_VERSION_* to be weakly assigned.
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
X-List-Received-Date: Wed, 11 Aug 2010 19:15:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/11 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-08-10 13:56, Frans Meulenbroeks wrote:
>> 2010/8/11 Koen Kooi <k.kooi@student.utwente.nl>:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 11-08-10 01:47, Graham Gower wrote:
>>>> find conf -type f -exec sed -i -e 's/^PREFERRED_VERSION_\([^ \t]*\)\([ \t]*\)=/PREFERRED_VERSION_\1\2?=/' {} \;
>>>
>>> NAK, Angstrom pins things with a hard assignment for good reasons. We
>>> are open to discuss specific issues you have with versions for various
>>> recipes, though.
>>
>> Well, I would like angstrom to move to the latest version of mythtv.
>> Would that be possible (and if not what is the problem with mythtv 0.23)
>
> For mythtv I try to use a grace period so other distros have the chance
> to have packages for the new mythtv. My backend runs debian, so I
> generally wait for debian-multimedia to catch up.
> I think it's safe to switch to 0.23.x now, and for future releases we
> can see if this policy can be thrown out.

Seems a good plan to move.
I just bumped SRCREV to 25609; building it as I write this.
It'll remain 0.23+fixes.
Apparently 02.3.1 maintenance also takes place in 0.23+fixes (there is
no 0.23.1+fixes and 0.23+fixes also refers to 0.23.1)

FM


