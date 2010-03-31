Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NwwWH-0000Tv-FU
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 13:55:38 +0200
Received: by gwj21 with SMTP id 21so2971gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tP8QBecwBi+Aoot7os7ynvt4G9JBYibLZY+pNk5TLVY=;
	b=Uj79WN4Ym7dzHA2grw+++yguLA+MD7AoJaLoKBq75BZoFIwRkeXt1bfBlVYw4E6pwQ
	MCK2no7l/w2d+LC2OW88x9S6QXSjdJmhNZpp0+xP9cDOP9jjz7D2HddLv8SwzjXaxAlI
	W7xd5krnYyUIYJMwqJSa0SQQQ1eoTuEfEbmWc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CHtVwNjT/FjJego3KFOfxnqcCAMz4OyDjjTRFOmZZacJGeeN1rKpVpwNwuqV/iXqam
	BjwGddMnbtZtvFLKPIiFy/KH2OwVhEDa4vbDf9MuqkiHkxOCGwrSkF8Yb6Oc7v3Wo75V
	z6YnIKEnXjqJMIAy7i78TWx/GhHVKmHzl+s9M=
MIME-Version: 1.0
Received: by 10.100.57.1 with HTTP; Wed, 31 Mar 2010 04:45:53 -0700 (PDT)
In-Reply-To: <1270034881.1681.965.camel@rex>
References: <1270034881.1681.965.camel@rex>
Date: Wed, 31 Mar 2010 13:45:53 +0200
Received: by 10.101.85.11 with SMTP id n11mr709467anl.136.1270035953765; Wed, 
	31 Mar 2010 04:45:53 -0700 (PDT)
Message-ID: <y2oac9c93b11003310445gb3deec55va9bd2664d0336584@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc Recipes
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
X-List-Received-Date: Wed, 31 Mar 2010 11:55:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/31 Richard Purdie <rpurdie@rpsys.net>:
> I've just been looking over OE's gcc recipes and they really depress
> me :(. People touch them just enough to tweak their specific problem
> with no real thought going into the overall architecture and its a
> sprawling mess. I tackled some of this a while back. Sadly its just
> getting worse again.
>
> I've spent some time looking at them trying to identify what I consider
> to be the main sources of ugliness and how we can try and improve the
> situation. I think it might help to set a high level goal for the gcc
> recipes which would be:
>
> =A0 All configuration for a given gcc version should be contained
> =A0 within the high level version specific .inc file(gcc-X.Y.Z.inc).
>
> We'd therefore be frowning on version specific hacks in say the cross
> recipes only.
>
> It would follow that there would be a clear set of include files and a
> clear include structure and that almost all of the variant gcc recipes
> (gcc-cross-initial, gcc-cross-intermediate, gcc-cross-kernel,
> gcc-cross-sdk, gcc) would be boilerplate includes.
>
> Note that information about flags for the cross builds can be included
> in the main common version specific include file.
>
> To illustrate the kind of thing I mean, have a look at this commit:
>
> http://git.openembedded.net/cgit.cgi/openembedded/commit/?h=3Drpurdie/wor=
k-in-progress&id=3D35481122d7e484fb740ad9440fb4c70cb01de48f
>
> The nice thing about this is all of a sudden we have all the flags in
> the same place and it becomes obvious if something is wrong. There are a
> few things that raise an eyebrow there. It also becomes easier to
> abstract some of the gcc-X.Y.Z.inc data into a common include file
> (maybe a gcc-4.3.X.inc for example).
>
> Does anyone else fancy helping trying to clean this mess up. I'm happy
> to review some cleanup patches?
>
> Cheers,
>
> Richard
>
>

Richard,

I share your feeling of discomfort and depression.
Personally I feel cleaning up should start with removing obsolete &
unneeded versions as it is pointless spending time on improving them.
I've tried to stir up the discussion on cleaning up a few times, and
gave up due to too much negative feedback and little positive
feedback.
But still I wonder what is e.g. the use of recipes like 4.1.1 (which
btw was released in may 2006).

Having said that:
I've looked at your commit. Looks fine to me so a +1 & thumbs up.

Frans.

PS: not sure about all the variants, but it might be nice to be able
to use something like BBCLASSEXTEND=3D"cross".
Don't think my pythonese and knowledge of the gcc build system is good
enough to cook up something though.


