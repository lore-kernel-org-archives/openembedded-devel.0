Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgNdo-0006t1-7m
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 21:59:13 +0200
Received: by pwi10 with SMTP id 10so1828090pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 12:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=MRXyKHNGDeoiw4P1eGX8CWPCLFSdEnUWK+Uh5Npji4c=;
	b=DDi5cbj3mxh3AjJr0GdHUU5KTTpMmQ+FdziHX/ZRTXfhCXAuTWuvZpqY9fp7rr9wly
	pC+OfJ6BU5muRxJqOaArzRqPRi0a6cgXDflJ+mI1vXFhNMDOwYxGxJI2Xv0TtHd94n5z
	nyMALXBnvYT+C4IgC99LYObVA8n5eZ72aoZW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rg+qrZZlPwVcF93K5y96FNX7PE6OWKODBkPqUaods6JvX8I8HvSJ3SIde6wJIgq3Sq
	25WhTVho6fh/YBjfWoW3fV9vmAjWwekELvn7CVaT5m3KeYbgO0LKNd30sgR4r8jiDVAa
	gRpDYp+qgwhsil1DzReUqDinabvrk632/eDm4=
Received: by 10.142.1.12 with SMTP id 12mr6994104wfa.233.1280865533868;
	Tue, 03 Aug 2010 12:58:53 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 23sm9557601wfa.10.2010.08.03.12.58.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 12:58:53 -0700 (PDT)
Date: Tue, 3 Aug 2010 12:58:47 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803195847.GB5264@gmail.com>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org>
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
	<i38q56$4hq$1@dough.gmane.org> <20100803133515.GD12134@jama>
	<i39d10$d2f$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i39d10$d2f$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Tue, 03 Aug 2010 19:59:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/08/10 17:36), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 03-08-10 15:35, Martin Jansa wrote:
> > On Tue, Aug 03, 2010 at 12:13:58PM +0200, Koen Kooi wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> Acked-by: Koen Kooi <k-kooi@ti.com>
> >>
> >> If noone objects, can we get this in ASAP?
> > 
> > Building from scratch armv4t then armv6 was ok, building few more
> > packages for armv4t again still worked, but now I've upgraded gcc/eglibc
> > and building eglibc-initial for armv4t first fails:
> > 
> > http://tinderbox.openembedded.org/packages/665289/
> > http://build.shr-project.org/tests/jama/config.log
> > 
> > see 
> > configure: error: compiler support for __thread is require
> > and
> > Fatal error: Invalid -march= option: `armv4t'
> 
> I had that with a previous incarnation of that patchset, but it seems to
> have gone away.
> Do we want to solve this problem first or apply the patches and solve it
> later?

All right the beast is in. Please rebuild from scratch as the location of
toolchain has once again changed.

Thanks a bunch to everyone who helped in testing these patches and thereby
making them worthy

Thanks

-Khem


