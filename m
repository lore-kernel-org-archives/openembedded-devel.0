Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OK68g-0004YO-65
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:50:59 +0200
Received: by fxm9 with SMTP id 9so1648948fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mhNneNZgCxTi4rQR/7r6CTEDVwcL5DyxIkZVVlAAJbo=;
	b=OFMdW4Y1hf4YEjXhXGD0Ez+PO5nhQsrPVKfYgFrQQnbx5i68u/c8nlMaVCoCuYsBff
	BHxLbdVc13nJomqSIGHJ555AketMz2Exoq9zcP88q5qdteUurDqgne27JHjbxb1n4xsJ
	x24kfbM90UTJzYCo/UcSuCJRIsxtoW+LmLdvY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FtzWV5oEQ8gBZKy02liB/KhYX6eMwkpQeZC/SyMi5/eorJXmJk/y4sBhl4twW5DgQ2
	jRSE1UFRRUpFQu8dt7SAgzZ2YYpqJsjDJf1dCwGbjR4jQcY6fx/nR6da4d64hh8uoCM9
	Gok7+coOKH9whAbAQqoNLim6rji59waB3yNRU=
Received: by 10.223.18.67 with SMTP id v3mr9834998faa.93.1275554802690;
	Thu, 03 Jun 2010 01:46:42 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j23sm56438102faa.14.2010.06.03.01.46.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Jun 2010 01:46:42 -0700 (PDT)
Date: Thu, 3 Jun 2010 10:46:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100603084631.GN16035@jama>
References: <201006022351.38129.pieterg@gmx.com> <20100603043505.GJ16035@jama>
	<201006030915.57362.pieterg@gmx.com> <20100603073717.GK16035@jama>
	<1275552817.4657.32.camel@lenovo.internal.reciva.com>
	<20100603083011.GM16035@jama>
	<1275554237.4657.40.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1275554237.4657.40.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
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
X-List-Received-Date: Thu, 03 Jun 2010 08:50:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 03, 2010 at 09:37:17AM +0100, Phil Blundell wrote:
> On Thu, 2010-06-03 at 10:30 +0200, Martin Jansa wrote:
> > On Thu, Jun 03, 2010 at 09:13:37AM +0100, Phil Blundell wrote:
> > > but I think that's already fixable
> > > with strategic use of PREFERRED_VERSION and/or DEFAULT_PREFERENCE.
> > 
> > How? Can you explain in more detail?
> 
> If you arrange for the autorev'd recipe to be, say,
> DEFAULT_PREFERENCE=1, then I think bitbake will treat it as the desired
> version to build even if SRCREV - and hence PV - would sort lower than
> some other version (irrespective of whether that other version has
> already been built or not).  Then you just need to engineer PKGV to be
> suitably monotonic in order to get the right things to happen inside
> deploy/ and on the target system.

So will bitbake build again the same recipe (because I've built from the
same one before) with lower PV, just because it _still_ has the highest
DEFAULT_PREFERENCE and it's desired version (but still lower PV because
of hash, then before)?.

Maybe I had not enough coffee today, but I still don't understand it,
sorry, maybe someone else can comment?

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


