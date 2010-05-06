Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OA66Q-0003e0-9a
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 20:47:24 +0200
Received: by gya1 with SMTP id 1so181456gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4dqQy8zgB9vXhUlpu5NuJmL9bqQtvRtJbxakF5IUax4=;
	b=JO7MPY57hEK3YZZPYUhKxSh7xwRacWOul4tkVAi1yM5DSpxiQ4ooGJlK3U5nWJvy8A
	DjmeHxk57e5kLt/gsfmFj8YxAnfd5pCrqd0gcewt1b/RKKrd8xFMFOLnwFC7C45IDvva
	rbirsyiEjpZT582b3hAXPhWfPsR541l8IkbXM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eE23y+q/QVB30cC/4UzJxbCDhfPfzab76SD9fS4ptIkuX5X9BvvowVMQBbGzAAO40F
	u0wSCnFuxn2scZkYAvtuIznhSTZVxrCoMDjfNlvcFOdFhx26kJCxem958UyAkEfi1ZMH
	q5NrGwPNAbdH3Oe6i+Af4g6bIRyNl3GZ16LRo=
MIME-Version: 1.0
Received: by 10.101.55.2 with SMTP id h2mr9305576ank.95.1273171397196; Thu, 06 
	May 2010 11:43:17 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Thu, 6 May 2010 11:43:17 -0700 (PDT)
In-Reply-To: <v2n141020e31005061031ub521d900vf405fe9c6e682e7f@mail.gmail.com>
References: <m2pac9c93b11005060635j1abeb64er76c391d607e43993@mail.gmail.com>
	<v2n141020e31005061031ub521d900vf405fe9c6e682e7f@mail.gmail.com>
Date: Thu, 6 May 2010 20:43:17 +0200
Message-ID: <s2vac9c93b11005061143mab3462f4sb14fd57dfe197707@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4134f55dc7d99516d750b24a60e5cec400ae5ef3: eglibc: Move away from legacy staging
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
X-List-Received-Date: Thu, 06 May 2010 18:47:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/5/6 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, May 6, 2010 at 3:35 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> I feel the above commit is not sound.
>> If I pull the head eglibc does not build for me because apparently
>> eglibc-initial does not stage limits.h any more.
>> If I revert to the commit before this one, eglibc and eglibc-initial
>> build, so this seems to break things.
>>
>> It might be that this went unnoticed, because there is no PR bump in
>> this commit (which I would have expected, but technically if the new
>> and old staging result is identical is not necessary).
>
> Hi,
>
> What version are you trying to build?
> Today I've built version 2.11 before this patch as well as after this patch.
> Both during rebuild from scratch and both after RP's WIP branch merge.

I'm trying to build 2.10; distro is angstrom, machine is calamari
(which is a powerpc).
As far as I know I did nothing specific to pin eglibc to 2.10, but
will verify that tomorrow at work.

PR bump as such was not needed for me as I was away for 4 weeks and my
previous version had an older PR anyway.
What I found was that eglibc-initial did not stage limits.h whereas
the version before the commit did (as is confirmed by the log, I still
have the older logs lying on my system at work if needed).
This becomes an issue when building eglibc 2.10 as configure cannot
find limits.h (in the check for gcc -E).
If anyone needs more info feel free to email me or ping me tomorrow on irc.

Frans.


