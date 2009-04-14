Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LtoB0-0003sA-Ua
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 21:20:13 +0200
Received: by rv-out-0708.google.com with SMTP id k29so2391792rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=tqWWMcxHkx6jFOP5Qv6Weqg4i7idHIZauhgiCfrhVPk=;
	b=NBDDVth9Yu+z3N9g2qHbKJpYm2mMVll/VXaFTKqs4ot57n3kDhur3TYo+yJKdFLsH1
	wEqLAYreHe5g0Vxu5zdOmQytnpXfjnZ+lPB0lW8z7TameGmjUwm8aIvLGSOUOoMSRVtb
	iwergJb05wNP86vE4vHUx01iuEDzazkwHyG4k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Z5CqJjOwpfKqSLBVSzDQiJOT7Y/osdMq4TD4knOouD3VUzUgOb8whozvbs4r4wT6kZ
	qkkW259B26IZT/Yp66OgBd/e85rmL5akAMUN3RfwcBdfNTHtAFrfv0nyEL4FD6Sr0AXP
	t9F7OVrG3MmwlSZS+8eMgpiIsZM+MCT91ekfA=
Received: by 10.142.58.20 with SMTP id g20mr3473169wfa.1.1239736588187;
	Tue, 14 Apr 2009 12:16:28 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id 31sm22707557wff.35.2009.04.14.12.16.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Apr 2009 12:16:27 -0700 (PDT)
Date: Tue, 14 Apr 2009 12:16:21 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090414191621.GA24045@gmail.com>
References: <49DA2F2C.60008@bolloretelecom.eu>
	<19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>
	<1239096233.16991.525.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1239096233.16991.525.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 209.85.198.245
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Tue, 14 Apr 2009 19:20:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/04/09 10:23), Phil Blundell wrote:
> On Mon, 2009-04-06 at 14:49 -0700, Khem Raj wrote:
> > I think we should configure toolchain to pass this flags by gcc driver
> > while linking instead of making it a part of LDFLAGS it should help in
> > recipes which use gcc to link.
> 
> I'm not sure what that would really buy us.  Unless we're going to
> abandon LDFLAGS altogether then all the packages that are broken today
> would still be broken, it's just that you'd notice the breakage less
> often.  Plus, it would presumably mean that any changes to the value of

yes this would help if we were making changes just to accomodate the gnu-hash
linker option

> this flag would require a gcc rebuild, which seems like it'd be
> annoying.

I think chosing the hash style is something you will chose to have or to have not
at the beginning. However this will only make toolchain to default to gnu-hash 
on supported architectures one can still use --hash-style=sysv if one has to

Thanks

-Khem

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


