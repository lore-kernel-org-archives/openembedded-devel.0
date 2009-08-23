Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MfFUs-0008Dp-FR
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 18:00:46 +0200
Received: by wa-out-1112.google.com with SMTP id m34so324578wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2009 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=vkkleBnth9hkEoWcxE3XNS7nGvMDTYWeHAWASXN/nuw=;
	b=Rh7ZQjUgzJ9guUXl1UrC5lkVHMRSNpteKtG00wPSuY81SQZq67ARTpqNiEWLhGMmNp
	SewIfsJsHBI5uOA9kKCNofMbhetqv8TXmmdmHLxbYCcPBXf0gunX28r8/bsQ7bDk2+N0
	XqLRDy8NUfkKi3woGRU329KIRluHEmkp/M/SE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BL62BaCoQuFvfVqlMygQEFWZVm7j7z8ZefCgo/ArrD2tLdQmVjMub/2O+gBWjpXSIt
	pojo0nc4UM0Ib4d0OTbfInRVvoLSfxQYEdMsQ95llQNkR+tk+tCyqpCzZPghJRlDGi76
	66nh6lvX7Do6Rygein0RTaupyYHmXOysQK5to=
Received: by 10.114.54.15 with SMTP id c15mr4255339waa.193.1251042188238;
	Sun, 23 Aug 2009 08:43:08 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id m28sm6836905waf.37.2009.08.23.08.43.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 23 Aug 2009 08:43:07 -0700 (PDT)
Date: Sun, 23 Aug 2009 08:43:00 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090823154300.GA9250@gmail.com>
References: <4A8D4947.5030108@gmail.com>
	<200908201526.46349.holger+oe@freyther.de>
	<4A8D98FB.5000400@gmail.com>
	<200908210343.48652.holger+oe@freyther.de>
	<4A8F9BE3.1020606@gmail.com> <4A8FA20F.5050401@gmail.com>
	<20090822231735.GA12848@gmail.com> <4A90C2F4.1010300@gmail.com>
	<20090823065305.GA6361@gmail.com> <4A91434D.6070203@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4A91434D.6070203@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Sun, 23 Aug 2009 16:00:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/08/09 19:25), Dmitry Vinokurov wrote:
> Khem Raj wrote:
> >On (23/08/09 10:17), Dmitry Vinokurov wrote:
> >>>>>ERROR: '/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb'
> >>>>>failed
> >>>>>--------
> >>>>>
> >>>>>I.e. bitbake again confused cross-gcc and x86-gcc. Updated my OE
> >>>>>with git pull, removed tmp/ and made rebuild -- same result.
> >>>>Looks like error is in wrong ./configure parameter:
> >>>>--host=i686-linux instead of --host=arm-oe-linux-gnueabi .
> >>>>Now I'm trying to find, why --host was set to i686 and where it can
> >>>>be changed.
> >>>its a cross package so host being i686-linux (I suppose you are building
> >>>on i686 box) is ok. Look into the config.log error message should be in
> >>>there
> >>>
> >>>-Khem
> >>Hm, "configure --help" says "--host=HOST cross-compile to build
> >>programs to run on HOST [BUILD]" and as I understand, I will run
> >>programs on ARM, so it should be 'arm-oe-linux-gnueabi'.
> >>
> >>Anyway, even if host should be x86, instead of i686-linux-gcc it
> >>finds arm-vfp-linux-gcc and fails.
> >
> >dont confuse pure cross with canadian cross. You are doing a normal
> >cross build here which means build machine is same as host machine.
> >
> >Your problem is probably because you are overriding CC and friends
> >which could be confusing (already confused) configure even more.
> >
> >Try setting CC_FOR_BUILD=<your native compiler on the build machine>
> >
> >Thanks
> >
> >-Khem
> Thank you for your help. I'm newbie in OE and crosscompiling at all
> and may confuse some things.
> 
> Just now I've tried to build some not so simple as helloworld but
> not so complicated as kernel -- bc calculator. And I'd like to say
> that during configure stage it sets:
> --build=i686-linux --host=arm-oe-linux-gnueabi --target=arm-oe-linux-gnueabi
> 
> Builded bc works fine on my board and this is normal, not canadian,
> cross build.

its a target package being built on build machine. Your build was failing to compile a package which
will run on your host (similar to cross compilers) they are not same
cases. module-init-tools would be analogically similar to bc but not
module-init-tools-cross which is the package you reported failing.


> 
> --
> Best Regards,
> Dmitry Vinokurov
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


