Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIcGQ-0002yF-C8
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 08:18:00 +0100
Received: by iwn38 with SMTP id 38so519729iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 23:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=q/RqIgYKLXupJrBaN9gtS799dxsC5BVK8U9hs7bZJM0=;
	b=cbhXqf5DYc5T7wOttxWzHWLd/ng1FCToo5VIF1a10EG4ULVLxTosUwk3HHCCvXoyVp
	Si2UhICBJ0DIqaOd09QovLqDLpBnFyKSbB4x/KkeUIx1L5QTXj4Imf1FI35TPD6xINXa
	9Ek/x5yrUBEpO9JpMeJxh/o+fEYxTQcJNOfbo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=g15ntw5F5OMK14N+gKd8sueckemszO/uuk6BAbEb72uk1CI+x9MGcU0EytbiMtj4d5
	su5uMxLhzm7wyiw17FFQmt9nL5rO2Y95PpnPMelC9SlNNuRqcBpvFp9v6/97L0NRWMAm
	PqeeXYqNhgdxhjSIBIg4jtrFyACHeaRa7vbiM=
MIME-Version: 1.0
Received: by 10.231.37.201 with SMTP id y9mr6759528ibd.76.1289978161208; Tue,
	16 Nov 2010 23:16:01 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Tue, 16 Nov 2010 23:16:01 -0800 (PST)
In-Reply-To: <AANLkTin7+WQY-gmfye=U5pFJ4QfOYRY-Da93oBTgxvV2@mail.gmail.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<1289947184.11873.3.camel@mattotaupa>
	<AANLkTinuJ6bx+iHNq-4VLKNkaHbwaPitm7f6hZ=VM9az@mail.gmail.com>
	<AANLkTim2Q8BfAx=z3=RLSCQkFo-Wk6HFnbBnF562NGDM@mail.gmail.com>
	<AANLkTin7+WQY-gmfye=U5pFJ4QfOYRY-Da93oBTgxvV2@mail.gmail.com>
Date: Wed, 17 Nov 2010 08:16:01 +0100
Message-ID: <AANLkTikVaAmMc0rVSmeiuwm646Dvh8iVVLkYsGF_w5zL@mail.gmail.com>
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
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Wed, 17 Nov 2010 07:18:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/17 Khem Raj <raj.khem@gmail.com>:


>> What about new recipes?
>
> Depending upon how they pan out. Suppose if you add a new recipe for a
> working recipe
> that has implications if it gets picked up by default so need to make
> sure it works on tested sets.
> some entirely new recipes should be ok recipes for version upgrade
> need to be watched out

I agree on that. Actually I was referring to really new recipes, not
new versions of an existing recipe.
>
>> I have a few new tasks and a new image that I was planning to add
>> tonight, but didn't get to it.
>
> post them if you think they make sense in release and do not involve
> other meta recipes.

Whether they make sense depends probably on your perception.
I think they do, that's why I've been working on them, but it is
highly likely someone feels it does not make sense.

Rationale to get them in the archive is twofold:
- others can build and use the image too (it is an image for my james project)
- it can be incorporated in the regression testing. (and frankly I
would like to get them into this thursday's testing-next)

The new image does depend on the new tasks. No one depends on the new
tasks (that's why the are new)

>
>> Also I will have a working uclibc++ recipe by tomorrow or so. (the
>> current one does not build for me).
>
> Post them to ml.

Will do.
>
>> I feel changes like those are pretty harmless.
>>
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


