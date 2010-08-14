Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OkJPP-0008Tg-VZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 18:16:52 +0200
Received: by wyb38 with SMTP id 38so4034189wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+f36p5O7oz+Jh/AkKt9czf4qm5O2Vw0KXz3UyWkqP3g=;
	b=KaCWDdvOZpoeWmaG9b/dm/7dNOhYlyGCw5FuPeDt5UK/YDTytmdC5LNARy0dPBSWJd
	mjUkMRZCmiuMhL4F/KGPpp4XBsqkOqSb5p5gIFbL+dQCy5eEn3r8gZDaYo72Mp6Iw0ui
	/uEfEdlZFlXv/zIjFrQFpcFfJyUuY/Bwm3Xv0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=x963BaLplsGSgDHZISru9/RpwaGfSZi82mPRchrRmJCjHO3DaUvhrUreBXh0BdtjYg
	kBskbi6UCUJ1uCZUwJ2AOgeZfVevlRwgaM5N4Zuz+Acp09CXU+UrQJZ/m9UFVfYSSo5M
	y6zvnulLx+y/egkXeRJVZRajj0bQQiyxo7EMI=
MIME-Version: 1.0
Received: by 10.216.70.201 with SMTP id p51mr764908wed.24.1281802572110; Sat,
	14 Aug 2010 09:16:12 -0700 (PDT)
Received: by 10.216.135.18 with HTTP; Sat, 14 Aug 2010 09:16:12 -0700 (PDT)
In-Reply-To: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
Date: Sat, 14 Aug 2010 09:16:12 -0700
Message-ID: <AANLkTina16zJVc+O13hPdpLzwV9X5mXAFhhUG5BWsb04@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sat, 14 Aug 2010 16:16:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

I agree with you AJ, its become a serious pain to just get a built
image. I myself have only built once completely and have yet to again
since figuring out the changes I needed to make to that image. I would
like to help myself but someone like me whose not very competent in
this area finds the documentation a tad lacking to properly learn the
ways to help. I still have yet to figure out how to even get my own
program from the net to build with OE as just following the hello
world does not seem to be enough for me to grasp how to do it with an
actual problem. Which runs me into my next issue I can not properly
modify the way some programs build to get the features I want.

I have also noticed on the gumstix boards while most of the time it
seems its the same errors people get, every once in awhile you see
some people with one issue and others with another.

I am sure this wont be of much use as a post but figured I would chime
in from an inexperienced beginner trying to get a footing in here and
to actually be able to use things properly.



On Sat, Aug 14, 2010 at 8:46 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> This is about the 4th time that I've `rm -rf`-d everything and started from
> scratch and never yet got a working `bitbake omap3-console-image`
>
> Every time I `git pull` it's a different set of problems. It's never the
> same package twice, but they never all compile for the basic console image
> anywhere from 4 to 20 hours in.
>
> Fortunately, I do have a machine that did build omap3-console-image a few
> weeks ago at work. But I've never been able to get it on my machine at home
> (same os) to start playing around with.
>
> What needs to happen in order for things to git checked that they work with
> at least a few common meta-tasks before being pushed out?
> And is there anything I can do to help? (Donate some machine time to run
> tests, for example)
>
>
> Obviously, we all have our day jobs and whatnot, but this is becoming really
> frustrating for me and I'd like to see things improve.
>
> AJ ONeal
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


