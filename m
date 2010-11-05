Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PEIwL-0001SZ-0y
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 10:50:33 +0100
Received: by fxm3 with SMTP id 3so2167441fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 02:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ar4x7HKcZ7DtJBdM+gpZEYsvDM0CPTCe0XCKpaLnFrs=;
	b=Aocsnc+GLg8/t9rHFghx8miqK+dgaRsPCu0tTEdB+fKHxLGiRvYeIu55l0UczD1cEh
	23BeYyure+6xbNarIti5jDIAoGKGQikV70IVQARxmezLWYD26N/s74li1c9yTvk8J6K8
	iP+TfZkV23/jxaT7bk2W10+fXx9qzbYJXyILo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=B2qyG+iHbZaovSxTwWJXI917wdsKGEYqZ8w58PXtRDup7ivgWDg5niyKnftn5DolFm
	OOfYEO5wfNUVJQLIlKg9MRPk27/gDfD7h6nO5eKWbXl88R0OFBZzV7fUHWWUOtQUavpd
	JghOrWujPdbG2tou6xZuneNgavvd0LixtVAUE=
Received: by 10.223.114.135 with SMTP id e7mr723948faq.78.1288950580283;
	Fri, 05 Nov 2010 02:49:40 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u8sm507048fah.12.2010.11.05.02.49.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 02:49:39 -0700 (PDT)
Date: Fri, 5 Nov 2010 10:49:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101105094915.GM3440@jama>
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
	<20101104220649.GE28852@denix.org> <4CD3349D.6060904@eukrea.com>
	<20101104224752.GH28852@denix.org> <20101105065240.GI3440@jama>
	<4CD3CCDE.3080306@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4CD3CCDE.3080306@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Fri, 05 Nov 2010 09:50:33 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 05, 2010 at 10:22:38AM +0100, Eric Bénard wrote:
> Le 05/11/2010 07:52, Martin Jansa a écrit :
> > what about branching future release those 2-3 weeks ago and keep master for
> > active development?

no new recipes during at least last week of stablizing was also proposed
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-November/026552.html

> Stabilizing the master branch is active development as this allows to have
> stronger fundation for the next features you can introduce 2 or 3 weeks after 
> the stabilization weeks starts.

I agree but pushing new recipes to master and cherry-picking of fixes
from master to "next release" would also work and even allow testing of
fix.patch in master before cherry-picking it.

> > I know it could lower number of people using this future release branch
> > during testing period before release, but still seems better then pushing 3
> > weeks of commits from my local branch as soon as release is branched and
> > master open for new recipes again.

> That's the way linux, u-boot & co are running and when the new merge window
> opens several thousand of patches can be merged in a few days.

And also why there is linux-next, but I agree that in our scale we can keep new
recipes and features in local checkouts/out-of-tree branches without too
much pain in merging them after 3 weeks.

> If we don't do that, the idea of stable release which implies detecting and 
> fixing potential failures introduced by previous big changes will fail.

IMHO forcing main branch to be closed for new stuff (gcc branches after
stage1, before opening stage1 for new version) is used mostly to force
developers to use branch which is supposed to become stable without
tracking only the latest.

But as I said before I don't mind (much) keeping new recipes locally for
those few weeks or even pay more attention to my not-embedded-related daywork
instead of playing with OE :).

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


