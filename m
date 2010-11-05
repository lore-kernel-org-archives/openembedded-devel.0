Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PEGBM-0001Y5-DJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 07:53:52 +0100
Received: by bwz10 with SMTP id 10so2564382bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=2xlBel01nWYCgTuLZ0Tclo7mY7c7BG0OC/0MKyGHoaU=;
	b=GvCYatP/AuIhTz6uG3n9xOo8kOEXupaQWQDpD5IO1+QD3BdkF6hp/e93zg5VGvv6Nw
	SVBAuIDUblo0Ydqq4KFsNYqjPvv2mXT9lKWA5wtIjSISu4aUxywVL4MSQ1BTDUcNHVjl
	G4cBLOY5Rqh3NkCEVrv2Dz4cR/kFazgesKfMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wB7KvOJ8V74waOW2jqBd6yosOmfYe5IBzPCNFHZnVZ5gwgFriWrl2hCiA+9RIRVW0h
	edim/exqfuj1nd8Qa4IdQv/324wu82FKwdkQvrhfnbeExuI1EejEcyG/p6oEGgo0poqr
	0OsSOfgO9IN3Fzel7eb9CVwoaVFIgiz+C0Kwc=
Received: by 10.204.117.199 with SMTP id s7mr1516699bkq.15.1288939981816;
	Thu, 04 Nov 2010 23:53:01 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id g8sm704934bkg.23.2010.11.04.23.52.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 23:53:00 -0700 (PDT)
Date: Fri, 5 Nov 2010 07:52:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101105065240.GI3440@jama>
References: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
	<20101104220649.GE28852@denix.org> <4CD3349D.6060904@eukrea.com>
	<20101104224752.GH28852@denix.org>
MIME-Version: 1.0
In-Reply-To: <20101104224752.GH28852@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
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
X-List-Received-Date: Fri, 05 Nov 2010 06:53:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 04, 2010 at 06:47:52PM -0400, Denys Dmytriyenko wrote:
> On Thu, Nov 04, 2010 at 11:33:01PM +0100, Eric B?nard wrote:
> > Hi,
> >
> > Le 04/11/2010 23:06, Denys Dmytriyenko a ?crit :
> >> On Thu, Nov 04, 2010 at 09:04:43PM +0100, Leon Woestenberg wrote:
> >>> Hello all,
> >>>
> >>> at OEDEM we discussed the need for OpenEmbedded releases.
> >>>
> >>> - OpenEmbedded releases are planned in certain months, so that we can
> >>> plan stabilization efforts in the future.
> >>> - Each release is a point release in time.
> >>> - A release is a candidate branch point for a stable branch (which can
> >>> be maintained by those who use it).
> >>> - The next release is planned 2010.12, more specifically December 1st.
> >>> That's only four weeks from now.
> >>> - The 2010.12 release is hand-picked from a recent testing branch.
> >>
> >> - OpenEmbedded releases are planned to be time based and happen every 3 
> >> month
> >> (quarterly), starting with the first one on December 1st.
> >>
> > - what about a "no major change" freeze period for 2-3 weeks before each 
> > release to have a enough time to stabilize a little bit the beast ?
> 
> I thought Leon kind of mentioned it in the first bullet point above, but 
> probably not very clear. And yes, we definitely need a 2-3 weeks "feature 
> freeze" period for stabilization. Thanks for pointing it out.

what about branching future release those 2-3 weeks ago and keep master
for active development?

I know it could lower number of people using this future release branch
during testing period before release, but still seems better then
pushing 3 weeks of commits from my local branch as soon as release is
branched and master open for new recipes again.

Regards,
 
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


