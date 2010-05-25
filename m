Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGvXI-0000sQ-Ei
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 16:55:16 +0200
Received: by wyb39 with SMTP id 39so96637wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 07:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=c/yDavoBUMnE6bU1D5EJHdDjjehhIVUtmk+5cv2k2CM=;
	b=LZRh9wQitmK72U5dDAM0a5RLh5G+Ayli986O7OcxgW2x+n5sD9INZ0EvAh46VBN3i1
	+BbAnp1dmsK6YrMK2amDkbAR2/L2PKrKngQ7MxXS9gd+9VLuGGF+mnhD8F3rwyAHAAcP
	lf34r7y9gbMDbnZBjBJC3JtaT/3tuKF5+Ujvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pqQSQrYB/9KkQthqYLE/GwdnvfghyRxWTbyV3Ywaxey55XNmHG4VnMhlq9nGAZFrI0
	wzxetz2/jS7L4nQ1k8jkC/6LD6w73HakEUq4laoqGwap6g1cJpo5wfq38YK7aredGXnn
	YozMhd1IzouJ4gY+2j2cM7kul6nJ2hPFOLTSM=
Received: by 10.216.88.6 with SMTP id z6mr4516899wee.79.1274799068774;
	Tue, 25 May 2010 07:51:08 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g17sm1657381wee.17.2010.05.25.07.51.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 07:51:06 -0700 (PDT)
Date: Tue, 25 May 2010 07:50:55 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100525145055.GE26493@gmail.com>
References: <1274770197-13394-1-git-send-email-raj.khem@gmail.com>
	<htftsf$ilt$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <htftsf$ilt$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev: Use udev.inc and add udevadm to udev pacakge instead of udev-utils
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
X-List-Received-Date: Tue, 25 May 2010 14:55:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/05/10 09:22), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 25-05-10 08:49, raj.khem@gmail.com wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> > 
> > * Main purpose of the patch was to fix the problem where udev-utils was
> >   needed to be in root file system just to get udevadm binary. So this
> >   binary is moved into udev package instead.
> > 
> > * Use INC_PR
> > 
> > * Use udev.inc in all recipes.
> > 
> > * All udev recipes built udev_151 and udev_124 runs fine too.
> 
> I explicitly didn't use udev.inc in udev 151 because it made the recipe
> very hard to read. It would make more sense to do a udev-1xx.inc based
> on udev 151 and use that for future recipes.

On the contrary I thought it was more confusing to include udev.inc in some
and not in others.I find that the recipes are quite similar. infact do_install function could
be also commonized properly and extra bits put into install_append in given
recipes. I did not spend time doing that yet. 
Then the description field is also weirdly overridden in recipes probably
that needs fixing as well.

Any specific reason to have udev-1xx.inc ?

I will leave udev_151 as it is and only commit the udevadm change for now

-Khem


