Received: from mail-iw0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OA55w-0000Qm-T7
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 19:42:45 +0200
Received: by iwn1 with SMTP id 1so217365iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=vXxNMSCOsibf7beODZi1EadaLMSI66bv7CUr1SWntI4=;
	b=AiJGg0ESa13OHDNejsyt8RyMo6tMPU2x1VveCUy7okJF7lgLPXDxwEDSbSyOcgN+a4
	zlqS+auSKXkFGMYhTnqyKmLGF1hxWOhTgU68gtHLgtK7ldXWoKzI/1WNIxGkHtixPg1l
	HHDjq2xHuqcrBG5riBGBsy9C/1sxSKDpa0d0A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=H9g1XJ9iZeIpBlyIxpmERkK9niyZ5U0Gg6GE+nazAzdzfI6p9wTj7pyLOH4CuUpBQc
	84H7x/8N7W4mBAbzWm0LvG+A+kVjZlVLDnjBZ7+s9pSQs048xISfugS5xWnINh8qZ8wv
	Ool/7LV8Nk79wwM8Z4sxwjAdSSUijqwGWbz6I=
MIME-Version: 1.0
Received: by 10.231.168.1 with SMTP id s1mr1350519iby.84.1273167467522; Thu, 
	06 May 2010 10:37:47 -0700 (PDT)
Received: by 10.231.39.73 with HTTP; Thu, 6 May 2010 10:37:47 -0700 (PDT)
In-Reply-To: <v2n141020e31005061031ub521d900vf405fe9c6e682e7f@mail.gmail.com>
References: <m2pac9c93b11005060635j1abeb64er76c391d607e43993@mail.gmail.com>
	<v2n141020e31005061031ub521d900vf405fe9c6e682e7f@mail.gmail.com>
Date: Thu, 6 May 2010 10:37:47 -0700
Message-ID: <v2i19c1b8a91005061037wd1ee7aabzf9b95957582f335e@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.223.171
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 06 May 2010 17:42:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 6, 2010 at 10:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
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
>
> So this patch seems OK to me. I was expecting PR bump too, but it's not
> a big issue today, because many people rebuild from scratch,
>
> Regards,
>

Yeah, I did not bump the PR thinking that a rebuild is enforced with
branch merge
but RP mentioned that the new changes are compatible with the old
staging so I should have
bumped PR we can still do it if needed.


