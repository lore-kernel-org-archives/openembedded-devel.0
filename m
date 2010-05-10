Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OBYGy-0007d6-Qh
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 21:04:13 +0200
Received: by pvc30 with SMTP id 30so118540pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=F0je0UHFq49IfzITMLbc+knON3VXqzdtGn2eUaMLKLI=;
	b=Voh9zG5J3arw8w6M2r1BUm6vsQM1PsDDxOnaJGu+8kFv2MhEVBwlifZIVWCcx1D/sr
	9lKKdCuro7RpZ5nMVqHZvQZyF+g0qS2ariomx5JNttdtk4tX+HokyADhHlXUK08MYHOk
	4CRs/y4h7iBprgJdxymzHXc4D6EEAID8MJ7X0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=W4BRgGpQi5QSYYob5bHiyx/m0p/JeLA19wz+z7Kkb67NQPpSgw0H0TXXFDNZhJKocn
	XqVTO7VqSmm9XjoZ3SvJcQWuhMNdkovnV81/y1oDVzzZRa5p9iBVBzGXWXNByggimgUa
	B1LbWe3DcKTyCQU3J0KbzPhfKDOQ/dT4U2gH8=
Received: by 10.115.84.40 with SMTP id m40mr3504553wal.223.1273518018863;
	Mon, 10 May 2010 12:00:18 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f11sm28065455wai.23.2010.05.10.12.00.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 May 2010 12:00:17 -0700 (PDT)
Date: Mon, 10 May 2010 12:00:24 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100510190024.GA12534@gmail.com>
References: <4BE13C20.1010902@dresearch.de> <4BE81DE7.90609@dresearch.de>
	<1273510550.22943.298.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1273510550.22943.298.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel Headers Quality Issue (was: linux vs. linux-libc-headers?)
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
X-List-Received-Date: Mon, 10 May 2010 19:04:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/05/10 09:55), Tom Rini wrote:
> On Mon, 2010-05-10 at 16:53 +0200, Thilo Fromm wrote:
> > Hello Guys,
> > 
> > this is a somewhat cumulated response - I'd like to address some of the 
> > things mentioned at different points in the discussion in one place. 
> > Please forgive me should I misquote things.
> > 
> > 
> > 
> > Graeme Gregory in <20100505094242.GF2444@xora-desktop.xora.org.uk>:
> > 
> > [Steffen Sledz]
> >  > > It seem's not to be possible to use DEFAULT_PREFERENCE_hipox in the
> >  > > linux-libc-headers recipes. So what's the right way to handle this?
> >  > > Something like PREFERRED_VERSION_linux-libc-headers_hipox = "2.6.24"
> >  > > in angstrom-2008.1.conf?
> >  >
> > [Graeme Gregory]
> >  > I thought glibc was supposed to gracefully fall back on missing
> >  > syscalls?
> > 
> > Glibc is compiled against 2.6.31 headers, which is one of our main 
> > issues here. It only ever *runs* with a 2.6.24 kernel on the target 
> > system, though. So it cannot know about missing syscalls until runtime.
> 
> So, I think some of the confusion here stems from confusion about (and I
> don't know the right answer off-hand) how glibc handles the
> --with-kernel=VERSION stuff.

Well based on --with-kernel supplied to it during build time it 
configures syscalls that are available in that version of kernel.
unlike uclibc which configures based on the kernel headers supplied
to it at buildtime glibc does not assume the version to be the 
one supplied during build but with --with-kernel you can make it
know that it will not be run on kernel versions less than one specified
to --with-kernel

so it should be ok to compile glibc using newer version of kernel and run
it on an older version of kernel.

-Khem


