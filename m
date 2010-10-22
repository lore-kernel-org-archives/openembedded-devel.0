Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9DjF-0004W2-QT
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 11:16:02 +0200
Received: by iwn6 with SMTP id 6so25951iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=/mcaA7V/PP2ZAa6C/fvnCORnn7bUL4JrATlDv/FDWSs=;
	b=Lg3ZswabWlQgoWBh/npe0VwdK/19SgcZlRc7rKVqGcSEkf9X9NXgJuoexLbwQa7tl7
	tbnHJxyWL3pXLxShrqTDwkfe7R0dhW8SozUZGRtJOitu2rKUumSRMqLX6tYNe8qpC7VE
	V0oXflCp3yvASlAmYnuYmJNDRnz71YjilxwDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=G2eakqDimgKkSVizSN2BCNCbMdF6aAUNUbCEjZI6srRbxTjr4d3K7n527P19AlMvPp
	dpPCIpoQjYmzFWEPdP5tIgEULrfmzMD4uurcRwhTY2B3pJnehqFd5a9D2aNY7mJEht2R
	ggr8r45T2ecV0urbGlzV35f26FWbITFqOUToM=
MIME-Version: 1.0
Received: by 10.231.167.67 with SMTP id p3mr2260674iby.20.1287738924736; Fri,
	22 Oct 2010 02:15:24 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 02:15:24 -0700 (PDT)
In-Reply-To: <20101022084301.GD3527@jama>
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>
	<i9rbsq$tad$1@dough.gmane.org> <20101022065559.GC3527@jama>
	<AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
	<20101022084301.GD3527@jama>
Date: Fri, 22 Oct 2010 11:15:24 +0200
Message-ID: <AANLkTin82vWmqN0r=-QZ_Y3m=tAkfd1+N3rVRfFMW9T0@mail.gmail.com>
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
Subject: Re: patchwork cleanup call
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
X-List-Received-Date: Fri, 22 Oct 2010 09:16:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/22 Martin Jansa <martin.jansa@gmail.com>:
> On Fri, Oct 22, 2010 at 09:32:19AM +0200, Frans Meulenbroeks wrote:
>> Nice ideas, but....
>>
>> As far as I see it there are two often occurring situations:
>>
>> - a patch is submitted for review and gets zero feedback. I have quite
>> a few of these in patchwork. I once proposed that if a patch does not
>> get neg feedback in two weeks or so it could be pushed anyway. While
>> this got some positive response it was never really made a policy. But
>> I must say I'm becoming more and more inclined to push them anyway.
>
> Maybe it's not written as policy but as koen said, send ping and if
> still no reply then probably nobody cares it being pushed (so you can
> push it).
>
>> - a patch is submitted by someone without commit access but no one
>> picks up the patch.
>
> ping stating that author has not commit access would be nice
>
>> In either case if patches just get archived without being looked at,
>> it'll probably have an adverse effects.
>
> Agreed
>
>> But we of course still have the problems that
>> - people nak recipes but do not update patchwork
>> - patches receive improvement suggestions and are not updated in patchwork
>> - new versions are posted but patchwork is not updated.
>
> All 3 cases seems like author fault, sometimes I've contacted author for
> patch update and never received reply :/.
>

Guess we should make all these things more explict in the policy (I
think there is a page how to submit patches or so).

BTW: wrt the ack suggestion from koen:

I feel it is silly to ack my own patch.

wrt patches from others without commit access; if it is a patch that
could have been pushed without review if the author had commit access
and I feel comfortable with the patch ("looks sensible"), i'm inclined
to push it on that persons behalf.

and if the patch seems dangerous or is in an area that is way out of
my league, I won't touch it (and won't ack either).

Frans


