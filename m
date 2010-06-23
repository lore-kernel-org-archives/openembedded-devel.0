Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORTwj-0001Qv-JI
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:41:10 +0200
Received: by mail-pv0-f175.google.com with SMTP id 3so641430pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=1+nsGFx0FAhgsPuGicWmVsGtJ1w6AjBXFPEZv8dCR4g=;
	b=EX05wsB7feJMl17mR3AJvDXVOF7g1poh2WNR9heSkUd4svtQL8Wqvkzb3UYi9g3sDn
	ZMTLYB92HrVltarghGqPwOTNWJWBXm4R+sZa6iDjaVZYVnWVvv+EsKxWMBcVV1xFjvIW
	7jL3a9cljPmQrDMuL/V76j/TFsp8hjxrEBhO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FZtQ4gPd6ipPSwCYAecrHe2X4KwdfqPEyXi8WJA5/w35/+aKHejz3vrZRm63pL+6Qm
	nKb4piacdb5uPsOIrFECoffz3Cr2xG1PCs24N59iy9jxZJhaLkaGOv9ppHxYXAJMsR4X
	fmcdbXe0SxyUPAnms4ICYj3EuwbephmecmGco=
Received: by 10.143.26.12 with SMTP id d12mr7632114wfj.242.1277314594579;
	Wed, 23 Jun 2010 10:36:34 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q10sm4726900rvp.20.2010.06.23.10.36.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 10:36:33 -0700 (PDT)
Date: Wed, 23 Jun 2010 10:37:38 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623173738.GH5535@gmail.com>
References: <4C221A64.1020002@jak.nl>
	<AANLkTikxjC0tXsg2Tz0ilTykFtmhBN7qm5GHMl3HixVK@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikxjC0tXsg2Tz0ilTykFtmhBN7qm5GHMl3HixVK@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DISTRO=Angstrom on i686-generic build failure on base-image
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
X-List-Received-Date: Wed, 23 Jun 2010 17:41:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/06/10 07:57), J. L.  wrote:
> I keep erroring out on the same thing currently.
> 
> 
> 
> On Wed, Jun 23, 2010 at 7:29 AM, Arjan <arjan@jak.nl> wrote:
> 
> > Hello all,
> >
> > I'm new here, so maybe this is a known issue. But I couln't find the
> > solution.
> >
> > Building  the 'base-image' using:
> >
> > DISTRO   = "angstrom-2008.1"
> > MACHINE ?= "i686-generic"
> > this error occurs:
> >
> >  | checking for cups-config... /usr/bin/cups-config

this is the problem. You have install libcups2-dev on your build machine
and its picking that up I think if you remove it from host it should work.


