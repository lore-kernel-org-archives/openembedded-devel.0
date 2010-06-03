Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OK5ss-0006vG-SH
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:34:49 +0200
Received: by fxm9 with SMTP id 9so1636071fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mUw1fVbcexIrIBB4BrdMoUh+XmxQXYiPrGVTY1vSBc0=;
	b=W1l8x4t/bVoseotYyTZOB+dZzEvyIvkipxCGwt173QnIP6oQw9nthMIYNvrBinIeaC
	P5Z4Di3fn7REJ1I9QmCen5P7uL82GOk18onGqr8R6lAfBQKdTjZIdw8kcJNVmVR40+Xd
	6/ntFt6tRpwVRs5PbkQFKdmPJhVQ2fwSwOo3k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=U20Fg9dX6YM7/Y66tEoRYnh2cB+nUanx9Rzs5Sqvbqca7DoGI0Pc7al1LLna6yCJn3
	ubeGGFCjweUCSWUwBBP3c/wVqQWqvqEFFZGOIpswjWzbwX9Wn3oWXYahCr54Lh4/7YE2
	ZvX7pHW27X3KB7qXdb2IvubEjLx0AUEVRxx3c=
Received: by 10.223.26.69 with SMTP id d5mr9871533fac.20.1275553822965;
	Thu, 03 Jun 2010 01:30:22 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm56386884fah.9.2010.06.03.01.30.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 01:30:22 -0700 (PDT)
Date: Thu, 3 Jun 2010 10:30:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100603083011.GM16035@jama>
References: <201006022351.38129.pieterg@gmx.com> <20100603043505.GJ16035@jama>
	<201006030915.57362.pieterg@gmx.com> <20100603073717.GK16035@jama>
	<1275552817.4657.32.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1275552817.4657.32.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Thu, 03 Jun 2010 08:34:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 03, 2010 at 09:13:37AM +0100, Phil Blundell wrote:
> On Thu, 2010-06-03 at 09:37 +0200, Martin Jansa wrote:
> > The other is when you change SRCREV in recipe without updating PV. Then
> > SRCPV will give you newer PV which will upgrade resulting package on
> > target.
> 
> If it's just a question of getting the package upgraded on the target
> then you can do that with PKGV; there's no need to fiddle with PV at
> all.  The only case where PV is important is where you need bitbake to
> realise that the package needs to be rebuilt in the first (since the
> SRCREVs aren't going to be sortable), 

Ah right, sure you need both PV and PKGV higher.

> but I think that's already fixable
> with strategic use of PREFERRED_VERSION and/or DEFAULT_PREFERENCE.

How? Can you explain in more detail?

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


