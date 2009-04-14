Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ltrus-0004FU-DY
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 01:19:49 +0200
Received: by rv-out-0708.google.com with SMTP id k29so2464781rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=z1BYZXr4KC1KGBKr07691tFjftG6k9DpfghEp/82GSo=;
	b=Ez8LWfASiYs0uCI7tWudLV+iKjO88CzG3Ld+mSeS4uI1zGf1VcukIeyCehoIdPvS+j
	2K+OFf8mJWKw28GAbLZSdS71V0NOm2SCGAA8qvnjXSSh3Je9QtYymIQOim8/gZrDW3s0
	RAdMdiBtene5Pzcp/qdVyFF6znZiwKtnDMexc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iCZ3b2M7fY+07byQwznO1d5UfYHSziidV6FH6psMLWNS1v53CrqbQdWwzAVo3d+GoT
	bunMT7NkmOGU/c59tvMcAf+GEbYiXNYtq4b29uFxFV5YU89mbEkCvAcpiClJ2FprXgel
	Mk0cnKKAEr4r3gp6DmXthbfIKuyFV6Pkl5HnU=
Received: by 10.141.48.10 with SMTP id a10mr56276rvk.250.1239750962559;
	Tue, 14 Apr 2009 16:16:02 -0700 (PDT)
Received: from gmail.com (adsl-71-146-24-121.dsl.pltn13.sbcglobal.net
	[71.146.24.121])
	by mx.google.com with ESMTPS id k2sm16070050rvb.24.2009.04.14.16.16.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Apr 2009 16:16:01 -0700 (PDT)
Date: Tue, 14 Apr 2009 16:15:57 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090414231557.GB25757@gmail.com>
References: <SNT105-W20AA5F2E8A600866EEDD6D907C0@phx.gbl>
	<20090414224141.GA6479@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20090414224141.GA6479@rhein.zuhause.netz>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 209.85.198.246
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: uclibc build error
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
X-List-Received-Date: Tue, 14 Apr 2009 23:19:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/04/09 00:41), Henning Heinold wrote:
> On Tue, Apr 14, 2009 at 11:30:49PM +0300, Mauri Sandberg wrote:
> > 
> > There are two peculiarities when I am trying to build uclibc for DNS-323 using angstrom stable/2009.
> > 
> > For some reason OE chooses version 0.9.30 over 0.9.30.1. I had to specifically choose the latter.
> > 
> > Anyhow, both of these fail miserably with something that does not really tell me much.
> > 
> > <clip>
> > NOTE: make STRIPTOOL=true LD=arm-angstrom-linux-uclibcgnueabi-ld LOCALE_DATA_FILENAME=uClibc-locale-030818.arm.tgz CC=ccache arm-angstrom-linux-uclibcgnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mthumb HOSTCFLAGS=-I/home/maukka/oe/dns323/build/tmp-dns323/staging/i686-linux/usr/include
> >   GEN include/bits/sysnum.h
> >   GEN include/bits/uClibc_config.h
> >   LN include/pthread.h
> > ...
> >   CC ldso/ldso/ldso.oS
> > ldso/ldso/dl-elf.c: In function '_dl_dprintf':
> > ldso/ldso/dl-elf.c:913: error: unable to find a register to spill in class 'LO_REGS'
> > ldso/ldso/dl-elf.c:913: error: this is the insn:
> > (insn 121 120 122 6 (set (reg/f:SI 406)
> >         (plus:SI (reg/f:SI 25 sfp)
> >             (reg:SI 405))) 5 {*thumb_addsi3} (nil)
> >     (expr_list:REG_DEAD (reg:SI 405)
> >         (nil)))
> > ldso/ldso/dl-elf.c:913: confused by earlier errors, bailing out
> > make: *** [ldso/ldso/ldso.oS] Error 1
> > FATAL: oe_runmake failed
> > </clip>
> > 
> > Full log at http://tinderbox.openembedded.net/builds/138258/
> > 
> > -- Mauri
> 
> This is the error comes from building uclibc with thumb support. Khem started to fix it, but
> it isnt fixed already yet. Try to use ARM_INSTRUCTION_SET = "arm" in the uclibc.inc for now.

alternatively use gcc 4.3.3

> 
> 
> Bye Henning
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


