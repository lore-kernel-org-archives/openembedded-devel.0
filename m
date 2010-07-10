Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OXTzN-0006Kj-3f
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Jul 2010 08:56:43 +0200
Received: by bwz10 with SMTP id 10so1854079bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 23:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=evryZmnzkLkpgyUbiaKlLaO+yhgrDKKMmpCMzbgXnYs=;
	b=IvGyX8LMb5ihFxulmK7iOih+9sQi7aKQO+Tax+hEvsVqgwYAq/Nu0tugXyuigpIv7K
	1x5rD2PrqNC7eieJYKmkjImUVeZhS2OQyMKKmUcrx12yfRRXjif9Xj9ArHU0/peteeDb
	dm5GNJJoUaAalEBKKpLkl/WhlnQlRuTLyohQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sqrYXuLe8k1vdzX8JjT1bNy6V1PLRGY7CViNk9Op7p3BJT1w0P+yddJZzJOXuBlJbs
	F/MStWB+VLIQX91mXghNHFGFo9jYfaAnL54mMtiBmQV0/wjgbDr1pPJg5LjrJq83lOnl
	QLCvo9XxrQj7LCloOKX6UqntjYFEveIE3JiBk=
MIME-Version: 1.0
Received: by 10.204.48.75 with SMTP id q11mr8429249bkf.0.1278744708673; Fri, 
	09 Jul 2010 23:51:48 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Fri, 9 Jul 2010 23:51:48 -0700 (PDT)
In-Reply-To: <20100709204055.GA12163@excalibur.local>
References: <20100709204055.GA12163@excalibur.local>
Date: Sat, 10 Jul 2010 08:51:48 +0200
Message-ID: <AANLkTimFoNpQmccMnnwO5lCg2XsByBiNlRp8DyvfjAFf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Sat, 10 Jul 2010 06:56:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/9 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> I want to gather some feedback what people are feeling about a new stable
> branch. It feels like the right time to do it soon. We have so many big changes
> in that are not likely to get into stable/2009 like:
>
> - New staging
> - BBCLASSEXTEND
> - Checksums in recipes
> - Faster BitBake
> - Enhanced java support with openjdk/icedtea
> - And many I forgot...
>
> With the latest fixes for the file:// problem the build feels stable at last for
> me. I have not been involved with the latest stable branch so this is really
> only a RFC from my side. Please let me know if you see big issues for such a
> move.
>
> Open questions:
> ---------------
> - Do we feel comfortable with doing a new branch now?

I'd say we should wailt until bitbake 1.10 is officially out (I assume
from your previous "Faster bitbake" that you want to move to 1.10)

> - What version of bitbake we would like to have for this?

I'd say 1.10

> - What boards/images/distros will be supported in stable/2010?
>
> I my be biased here regarding my work for BugLabs, but I feel me diverged that
> much from stable/2009 that it gets problematic to get changes in and syncing
> them with .dev. As well the overall build experience on .dev is pretty good the
> last weeks. The file:// problems aside.
>
> Another idea we just discussed on IRC was to have a model somehow related to
> what debian is using. An ongoing flow of patches from .dev to a testing branch.
> Perhaps automated with buildbot to move into testing when some certain builds
> have passed with this commit. And also an _ongoing_ stream well tested patches
> from testing into stable which eventually makes a time-based release every X
> months form this ond move on.
>
> That all needs to be filled with more details, but it could be a start. Let me
> know what you think.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


