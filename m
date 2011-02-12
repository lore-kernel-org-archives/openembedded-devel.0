Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po3Bk-0000jC-Fj
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 01:18:12 +0100
Received: by yie16 with SMTP id 16so1292035yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 16:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=SnV5yNz6tlsiOHIwSsWZ/m+7CFx8AKUE9goQgNBNLrQ=;
	b=bIWzsUk1LBv3SpqlGjvBN/3DzXEF6nC9YrYJYVHQ59hl5iVIcP9Dv8N5eUZQp31SBR
	CasIFWDrC7mbORHv5mzBlEnPe3EZZ1sh9ZW4aKtolN+vkbKsXuKlS+2mY4+m6BEA+vqn
	Eo2iMbhjfKelbfqIhzxgfElnrJisi19HYvCNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=hLfSOngXXYdRc/N53om8m2bLb7fXWMNH09ee9IR2f7re306biua6BWYm5mvlygwIAB
	+Z4RxJNeLfmu4wYwdvoN0cS78f2K4+2mzhKxR8Bx4fiFJzIjO+fq0aWFHPQuUeuXw4fN
	5HsLKXCDm6y1g72I7eoDY3miNtM5B25SPNYXI=
Received: by 10.147.98.1 with SMTP id a1mr1437468yam.16.1297469825498;
	Fri, 11 Feb 2011 16:17:05 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n63sm885395yha.20.2011.02.11.16.17.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 16:17:04 -0800 (PST)
Date: Fri, 11 Feb 2011 16:16:56 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110212001656.GF1010@gmail.com>
References: <1296592622161142500@rkmorris.us>
MIME-Version: 1.0
In-Reply-To: <1296592622161142500@rkmorris.us>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-users@linuxtogo.org
Subject: Re: tslib Issue
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
X-List-Received-Date: Sat, 12 Feb 2011 00:18:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/02/11 14:37), openembedded@rkmorris.us wrote:
> Hi,
> 
> I have successfully build and then run several OE images on my target hardware (h1940) - and have noticed an interesting oddity (bug?).
> 
> If I run the opie-image for example, everything works just great. However, if I run an X-based image (like, say x11-gpe-image) when the GUI starts up tslib calibration is run ... but then basically thrown away, as the driver for the touchscreen is set to evdev by default (and the touchscreen isn't calibrated / does not work right). If I manually build and install xf86-input-tslib, and then configure the input as tslib (not evdev) - once I restart gpe-dm it works as expected!

are you using X11 with evdev driver then tslib will not be used at all. You
have to use xinput-calibrator.
> 
> Is this supposed to be the case, or perhaps something not configured quite right in the builds?
> 
> Thanks!
> 
> ... Russell
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


