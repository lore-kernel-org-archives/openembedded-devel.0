Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OLQ1w-0003AR-Ar
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 02:17:28 +0200
Received: by pvh1 with SMTP id 1so758831pvh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 17:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=20WGscC3QKX8koU7Uto2tfRtJxH8jzW/1RbANjceq6Y=;
	b=UYC06Uh/U2iEOSJwzFMFYKMmTbRt/N2HZ6Zc6fXzdmmEFmJ3TbK2G9UXEAMdbSIc1n
	+hTyjzaRNMMPZF/HL42RqhKum+1O6vXx5uz7ELv2AyUz7K44QBwg8csvaOfZbACbJgGq
	P+TPIPk5V2atdItxZqP60mxlk9wBUCvA8HTbY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TEEac+pC+ndGsWCG/b/K/0DemYJM8B8wjKh8kqYKNeooM8yVaVJispmyYyuIb4KzF4
	dPRLoksNDWEi5Bd+6COHHr0CPupZ7tz9gqUUGhT56ygvX7eFjnqJkxMg3Tmtp0cMY4zN
	ddejvedXx0VFh7SrGHyeiNKiYkK9tRFR7hKwY=
Received: by 10.114.2.25 with SMTP id 25mr10925900wab.100.1275869588055;
	Sun, 06 Jun 2010 17:13:08 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n32sm33452958wae.22.2010.06.06.17.13.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Jun 2010 17:13:07 -0700 (PDT)
Date: Sun, 6 Jun 2010 17:13:07 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100607001307.GA6723@gmail.com>
References: <201006022351.38129.pieterg@gmx.com>
	<201006041044.42032.pieterg@gmx.com>
	<1275649408.23726.5.camel@mill.internal.reciva.com>
	<201006051236.07938.pieterg@gmx.com>
	<1275858029.19175.21.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1275858029.19175.21.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Mon, 07 Jun 2010 00:17:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (06/06/10 22:00), Phil Blundell wrote:
> On Sat, 2010-06-05 at 12:36 +0200, pieterg wrote:
> > Now I get a nice
> > 1.0+git7348+5276f059461b6e9015e46a01b1cabfc42dfa600f
> > PKGV, which is the same in both stable/unstable situations, assuming 
> > the 'stable' rev is the latest rev.
> > And it is of course the same on all buildservers, and doesn't depend on 
> > what's in the cache.
> > 
> > And best of all, no more need for BB_LOCALCOUNT_OVERRIDE nor 
> > BB_GIT_CLONE_FOR_SRCREV, so no more lengthy bb parse sessions.
> 
> Yup, that looks good.
> 
> In the longer term I guess it would be nice to make this less
> git-specific.  But, as you observe, that would mean either copying a lot
> of code from bitbake or waiting for a new bitbake release which exposes
> the necessary functionality.  And, in any case, the majority of projects
> use only a single SCM which doesn't change very often, so I guess there
> will not be too much of an issue in practice.
> 
> Thanks for your work, anyway.  I'll go ahead and check this in unless
> somebody has an objection.

Please go ahead. Seems to work ok here.
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


