Received: from mail-ww0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OBrVu-0004DX-EM
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 17:36:55 +0200
Received: by wwb24 with SMTP id 24so3250850wwb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FFIgZJiGF/woelVwGqcHSoy1S4awBn4bE6kyzkNjRNI=;
	b=LjkaSy5mKOh0PK1Ns/hs+gRhmHPr9NARX9DgfvRrq/v2l2uyMEx/AkUFZ4alDUNtkX
	lOy2UM72Vrl3pgWSL345gQsc2dXS3ik2vF7/zWrtAkbOJI5cWb9dmbwtMlkfbI2C5g+E
	1K5G6rvb/9A0wUVoK9+Pc6pdGwzDE9o6JsVuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZbKuTS1/1076bipkCUOnFGpLvvKdu5vyDbcZFpzIJciE1z+htoZmL4gZYff3Q87hAr
	RDYflpD6CVnbvAYjwVG/Fb+HBRfRrwyzgEZ80YFp2ZomClABk6Sg7D9DfDkO7JZXw7mI
	Dky4CdFTgILQJkWELkYx2rAOS24XVqRlFekaw=
Received: by 10.227.134.84 with SMTP id i20mr5425028wbt.52.1273591981012;
	Tue, 11 May 2010 08:33:01 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p10sm22415699gvf.7.2010.05.11.08.32.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 May 2010 08:32:58 -0700 (PDT)
Date: Tue, 11 May 2010 08:33:08 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100511153308.GB15186@gmail.com>
References: <1273249883.457.336.camel@trini-m4400>
	<g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
	<1273331468.22943.217.camel@trini-m4400>
	<1273429494.22943.225.camel@trini-m4400>
	<20100510054921.GA11084@gmail.com>
	<1273588323.22943.397.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1273588323.22943.397.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.82.51
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calamari (ppc e500v2) failure
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
X-List-Received-Date: Tue, 11 May 2010 15:36:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/05/10 07:32), Tom Rini wrote:
> On Sun, 2010-05-09 at 22:49 -0700, Khem Raj wrote:
> > On (09/05/10 11:24), Tom Rini wrote:
> > > On Sat, 2010-05-08 at 08:11 -0700, Tom Rini wrote:
> > > > On Sat, 2010-05-08 at 09:06 +0200, Frans Meulenbroeks wrote:
> > > > > 2010/5/7 Tom Rini <tom_rini@mentor.com>:
> > > > > > Hey all,
> > > > > >
> > > > > > With DISTRO=minimal and MACHINE=calamari, I see the following failure in
> > > > > > gnutls (using fe4ff6940b06c73d5b88224b99750bf65accf13d in oe.dev):
> > > > > > http://pastebin.com/cjAStcLb and I confirmed this prior to the RP merge,
> > > > > > so this is unrelated.
> > > > > 
> > > > > Which eglibc is that?
> > > > > The issues I had seemed due to some catch22 situation that I cured; I
> > > > > started a clean build yesterday before I left work & can tell the
> > > > > results on monday.
> > > > > My distro was angstrom, machine calamari, this uses eglibc 2.10. Is
> > > > > minimal also using 2.10 or is it at 2.11
> > > > > 
> > > > > I can also try to kick off a minimal build on monday
> > > > 
> > > > minimal is eglibc 2.10.  I'll try an Angstrom build.
> > > 
> > > With Angstrom, gcc-cross-initial fails building libgcc, config.log has:
> > > cc1: error: not configured for ABI: 'spe'
> > > configure:2591: $? = 1
> > > configure: failed program was:
> > > ... standard empty program ...
> > > configure:2605: error: cannot compute suffix of object files: cannot
> > > compile
> > > 
> > > Ubuntu 9.10 x86_64 host
> > 
> > Could you test with attached gcc patch please. This should fix the
> > undefined symbol error. You could use minimal distro for SPE targets
> > it should work. Please let me know if it works for you.
> 
> This fixes the e300c3 / ppc603e issue, but not the gnutls issue (which
> is now seen on those platforms).  So the general problem of -Os + ppc
> not being right with GNU.org toolchains is still there, on 4.4.3 at
> least.

out of order epilogue/prologue are added in gcc 4.4 so I expect 4.4+ to
show this issue. That said, when I tried for calamari from scratch 
bitbake gnutls it went through fine on Kubuntu 10.04/x86_64 build machine.
> 
> -- 
> Tom Rini <tom_rini@mentor.com>
> Mentor Graphics Corporation
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


