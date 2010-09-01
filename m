Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OqugW-00008S-6m
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:17:33 +0200
Received: by wwb31 with SMTP id 31so236664wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 14:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=WMOJP6jZHdCd7C4OiU5oX4PSPDl9oyUK9PKD0K9qmss=;
	b=esrAMcfWJBwdYvPy/RPKO1wGqG7EOEsG4UjLypQtviqb028GAy7LIvAcB+FwCrBumU
	0yvLETvQ08OCuekpixBymIkgIHD7N/AsUHZD5aWYgDzYJnZdJOi36UXK0zC2GUmVH+cy
	60c2eq+AgKXZ1UX6Ot6y9A7UmAn/nQb9mMhGw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ocSYdAXhbehBxUgsmGCL+6s5l1HC1R0qOo2G9luR/dttwUCsUeI91mti45HQwKQ7YU
	put8F77D7ZPivNECPmZ9j5BRfmd4vC4ZxMThzaof/2KaemSqLP5vYlu25NMjgcGdnUVM
	Jwoqd5eJcSCV/wK6BXwGBfqXpf1PtTkfHGq94=
MIME-Version: 1.0
Received: by 10.216.11.3 with SMTP id 3mr795467wew.89.1283375817926; Wed, 01
	Sep 2010 14:16:57 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Wed, 1 Sep 2010 14:16:57 -0700 (PDT)
In-Reply-To: <i5m4sn$l1b$3@dough.gmane.org>
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
	<AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
	<i5m4sn$l1b$3@dough.gmane.org>
Date: Wed, 1 Sep 2010 17:16:57 -0400
Message-ID: <AANLkTimttxo+X6DaN8SatwXbKYJWoTJQ27D3bhW9FEq5@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-30
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
X-List-Received-Date: Wed, 01 Sep 2010 21:17:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 1, 2010 at 2:09 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-08-10 13:05, Cliff Brake wrote:
>> sending again as it appears the last email did not make it ...
>>
>>
>> ---------- Forwarded message ----------
>> From: Cliff Brake <cliff.brake@gmail.com>
>> Date: Mon, Aug 30, 2010 at 11:51 AM
>> Subject: testing branch 2010-08-30
>> To: openembedded-devel@lists.openembedded.org
>>
>>
>> Hello,
>>
>> Last weeks testing cycle was a good success I think -- thanks to all
>> who participated.
>>
>> http://wiki.openembedded.net/index.php/Testing
>
> Looking at the wiki it seems that extending tinderbox to show results
> for a certain git revision would be a lot easier to maintain, no?

Thanks for the ideas, and we need to look into using Tinderbox more.
One thing I don't want to loose is the following:

1) a simple table where users can quickly get an idea of what should
build.  It would take some work to get this extracted from the noise
in Tinderbox, though not impossible

2) I'm afraid if we don't have a somewhat manual process with a known
test cycle, pretty soon people will just drop off and quit running
test cycles, especially if there is no easy visibility of results
(speaking to myself first).  How do we keep from getting lazy as
testing is generally not a lot of fun?

3) it will still be some manual work to maintain the "testing" branch
that is buildable for most tested platforms.

To me the biggest problem is actually getting a significant number of
people running test builds, and summarizing these results in a easy
form.  Everything else is secondary at this point.  Going forward, I
would like to automate where we can using tinderbox, etc.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


