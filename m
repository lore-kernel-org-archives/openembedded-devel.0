Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9EvY-0005JM-0S
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 12:32:48 +0200
Received: by yxe42 with SMTP id 42so511574yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=y/OAlwvVMpN5JMwcDD7vzkaEHL5FUkMNXOHiGQZ6Soo=;
	b=ahP0r9rMWXXVqQH7uRRvMy6AWO99J5Y4fLsoam/KLEka0IZweYQyjc9BrL1qV3yhIk
	2nVmqoa+z+VWndk+LbTg+tB/sgCSpYXIF4RPCIYNjs1ib8zPD7w5+cpGkCy8idCNRd7a
	dSFNWKVE2YNhJsDLBJfulX//ptSLW6VAphG3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=H+wNess7U11YCOVNrRHCVtgCt7etBcHC3cNi7g6nHrRKCKV8pd8/EroQsTkAr3NNpH
	TN2YV2JBt3IZ7cAdsLQWIHlO76AnGMAX9PhbbMO88/1Yt8ac7Rn42hWf9g+rlzPS6yGA
	yetgkxeY5aveJPEuax3VUejvnte+JAf6Wey04=
MIME-Version: 1.0
Received: by 10.42.229.133 with SMTP id ji5mr1983102icb.350.1287743526473;
	Fri, 22 Oct 2010 03:32:06 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 03:32:06 -0700 (PDT)
In-Reply-To: <i9ro9j$jb2$1@dough.gmane.org>
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>
	<i9rbsq$tad$1@dough.gmane.org> <20101022065559.GC3527@jama>
	<AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
	<20101022084301.GD3527@jama>
	<AANLkTin82vWmqN0r=-QZ_Y3m=tAkfd1+N3rVRfFMW9T0@mail.gmail.com>
	<i9ro9j$jb2$1@dough.gmane.org>
Date: Fri, 22 Oct 2010 12:32:06 +0200
Message-ID: <AANLkTimhd=hhL78zi16TO9QkNs8texufV57F6cM0ii7J@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
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
X-List-Received-Date: Fri, 22 Oct 2010 10:32:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/22 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-10-10 11:15, Frans Meulenbroeks wrote:
>> 2010/10/22 Martin Jansa <martin.jansa@gmail.com>:
>>> On Fri, Oct 22, 2010 at 09:32:19AM +0200, Frans Meulenbroeks wrote:
>>>> Nice ideas, but....
>>>>
>>>> As far as I see it there are two often occurring situations:
>>>>
>>>> - a patch is submitted for review and gets zero feedback. I have quite
>>>> a few of these in patchwork. I once proposed that if a patch does not
>>>> get neg feedback in two weeks or so it could be pushed anyway. While
>>>> this got some positive response it was never really made a policy. But
>>>> I must say I'm becoming more and more inclined to push them anyway.
>>>
>>> Maybe it's not written as policy but as koen said, send ping and if
>>> still no reply then probably nobody cares it being pushed (so you can
>>> push it).
>>>
>>>> - a patch is submitted by someone without commit access but no one
>>>> picks up the patch.
>>>
>>> ping stating that author has not commit access would be nice
>>>
>>>> In either case if patches just get archived without being looked at,
>>>> it'll probably have an adverse effects.
>>>
>>> Agreed
>>>
>>>> But we of course still have the problems that
>>>> - people nak recipes but do not update patchwork
>>>> - patches receive improvement suggestions and are not updated in patchwork
>>>> - new versions are posted but patchwork is not updated.
>>>
>>> All 3 cases seems like author fault, sometimes I've contacted author for
>>> patch update and never received reply :/.
>>>
>>
>> Guess we should make all these things more explict in the policy (I
>> think there is a page how to submit patches or so).
>>
>> BTW: wrt the ack suggestion from koen:
>>
>> I feel it is silly to ack my own patch.
>
> You ping your own patches
> -----BEGIN PGP SIGNATURE-----

Yes, I can and I just did some.

But you wrote:
"And if you're going to push an 'old' unreviewed patch, it's easy enough
to ack it on the ml and wait a bit to see if someone suddenly spots a
huge bug in the patch."

I was commenting on that (and especially the to ack in relation with
my own patches).

FWIW
Frans.


