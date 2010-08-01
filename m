Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OfhCZ-0000il-CL
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 00:40:19 +0200
Received: by pvg13 with SMTP id 13so1208363pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Aug 2010 15:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=dP5+RGr3rKu0DUHjdeLOI8Jw+Ok46/xJlnSf+xXC0i4=;
	b=A1pxTOhNRTKaAOuSKgKX/qMcK4P5hF7iV34Vz0oSFcOwoAT70rWTh4ZyMaPGFacwO1
	0dRsigfNjjBVLh5maACOZVZ2Ic5bnOfv/DzOvi/oGZ+uuYKCPLbx0j4OTeluOil5Sz2Y
	gOBtWNTdv1Od49s/DM2lZJ/gjbFa1siSBgIEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=rCAJt4ap/KkgbrESc4j831G108hgZ2t+owDlKR2+zl8ms6z+IjiMSN7om3nslp8p8D
	3JO2uXlS16Jo66ngRsFY1hmvhTfOwYvnE5k5PPAcjBcy0VnJrGOtUQsIVviy7n17wbr3
	6BiBn+/GYcI5sSVNvKcNQgK43zw9lRr0vzcyc=
Received: by 10.114.60.5 with SMTP id i5mr6225249waa.146.1280702373499;
	Sun, 01 Aug 2010 15:39:33 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d39sm10004797wam.16.2010.08.01.15.39.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 01 Aug 2010 15:39:32 -0700 (PDT)
Date: Sun, 1 Aug 2010 15:39:27 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100801223927.GE30928@gmail.com>
References: <alpine.DEB.2.00.1007260653230.5356@lynx>
	<i2jrl9$4j3$1@dough.gmane.org>
	<alpine.DEB.2.00.1007260744150.11202@lynx>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1007260744150.11202@lynx>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: should beagleboard-demo-image (b-d-i) be theoretically buildable?
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
X-List-Received-Date: Sun, 01 Aug 2010 22:40:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/07/10 07:46), Robert P. J. Day wrote:
> On Mon, 26 Jul 2010, Koen Kooi wrote:
> 
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > It builds fine on all the buildhosts I have (ubuntu 8.04-32bit,
> > 9.10-64bit, debian testing-64bit among others).
> >
> > And I see no logs attached to your email, so I can't help.
> 
>   come on, koen, that last part was uncalled for.  i specifically
> stated that i hadn't run the build yet, i just wanted to know if there
> were any *known* issues for my 64-bit ubuntu 10.04 platform.
> 
>   given that you certainly have *legitimate* reasons to criticize some
> of my posts here, you don't need to make stuff up.

You could also check tinderbox.openembedded.org for build results and
it will help you determine the state of stuff you are interested in.

> 
> rday
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
> 
>         Top-notch, inexpensive online Linux/OSS/kernel courses
>                         http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


