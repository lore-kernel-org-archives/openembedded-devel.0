Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OBi4b-00089t-QC
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 07:32:06 +0200
Received: by pxi14 with SMTP id 14so1858609pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 22:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kIUnJ7Oz640M4WVpHTvs+RKaBJWKNch3bUXeH6/Jv6g=;
	b=f67tifKrCkugqShWkaVcvFl1yWcJexT76m/Rv7vVH5tXqGSoEipbQwtlgKtrVsdSfz
	sOxN/J/YLsi6g2/U/4625NraMp2NT8A7U75UaGJy0NaoG7yWYz4qKAMn13uhROjscWK7
	mLrdvaGZ5XRr/F3gvqSP/lr9vsCvSukNwc1/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ba5m85PUL+j3YpCitSziRZMzOikzrvj73kKprrrE2V8BeOxTMLVN3IIg2g2EpYjn1a
	DaZwYiDz7Lw8fcB1RJQ+whJ00qTcj+fHc+SjY5hBYG7Q4dHSHg3rrq+BO1t8gTDQLq0r
	zCYB3c2of2QCEgDuua57s1Z3p1ysyfMae0f0k=
Received: by 10.115.84.8 with SMTP id m8mr4053000wal.9.1273555691611;
	Mon, 10 May 2010 22:28:11 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c22sm32018530wam.6.2010.05.10.22.28.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 May 2010 22:28:10 -0700 (PDT)
Date: Mon, 10 May 2010 22:28:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100511052818.GA14500@gmail.com>
References: <20100510232720.GA13708@gmail.com>
 <20100511043715.GA3285@jama>
MIME-Version: 1.0
In-Reply-To: <20100511043715.GA3285@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Move gcc 4.4.3 recipes in favour of 4.4.4
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
X-List-Received-Date: Tue, 11 May 2010 05:32:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/05/10 06:37), Martin Jansa wrote:
> On Mon, May 10, 2010 at 04:27:20PM -0700, Khem Raj wrote:
> > Hi
> > 
> > I would like to propose to move gcc 4.4.3 recipes to gcc 4.4.4, 
> > there are no additional patches that we need and 4.4.4 is superset
> > of bugfixes. I want to avoid adding additional recipes if we could.
> > 4.4.3 is not so widely used in distributions unlike 4.4.2
> > 
> > I can also just add 4.4.4 and leave 4.4.3 as it is if someone wants
> > to keep using 4.4.3
> 
> SHR is using 4.4.3 and I don't mind moving to 4.4.4. Thanks for adding
> it.

OK

> 
> > Please cast your concerns
> 
> Any news about 4.5.0 producing segfaulting binaries on armv[45]t?

I have been able to reproduce it using 2.6.33 on osk5912 but no time to
debug so far :(

Thx
-Khem


