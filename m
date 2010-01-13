Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NV132-0006y1-GY
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 12:06:03 +0100
Received: by ywh8 with SMTP id 8so22997370ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 03:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=UcPr9lgdwXEbOW/HaSR3SaQxKYGN2IWgxLrfo4D3d8I=;
	b=wXSlOPYAZYMPzRudNrpbTmR0UvDBeFtsqJyJRr4K4Q1evf5ehpubpDHqy1jrahNYkp
	RDDLw3gMss3Yjt0fCyz65c0HLLWaeJGdiikHOz7RTtcaU/aGTleEaQg7HJfvIJkzxq7a
	P8xkDSjLSCSclh0xe1JvzBgEczmeZSLpM03jo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=fqRkj9PLUjmM/H6lqCucxI/cIyh84cdBaFXrHKhGsv7CwNIaZLA6FHZGXfo1bsVevh
	sxx+Digqkc32WB5eXCeH2uHwd6hIpctKz97276e+T4rdnJQbK99p9KObWny8dynLNM53
	WgmwPCf4bldLQD6blFTkHkTPgVw0AmcoRFPnA=
Received: by 10.151.93.14 with SMTP id v14mr397405ybl.171.1263380628962;
	Wed, 13 Jan 2010 03:03:48 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 7sm11438404yxd.8.2010.01.13.03.03.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Jan 2010 03:03:48 -0800 (PST)
Date: Wed, 13 Jan 2010 03:02:57 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100113110257.GA3243@gmail.com>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100110123923.GB6363@rhein.zuhause.netz>
	<1263156477.3423.6.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263249767.3308.236.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263296160.20557.136.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100113102738.GA15906@gmail.com>
	<1263379487.3228.23.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1263379487.3228.23.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [vdr] TARGET_CXXFLAGS do not include CXX_FLAGS from Makefile
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
X-List-Received-Date: Wed, 13 Jan 2010 11:06:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (13/01/10 11:44), Paul Menzel wrote:
> > > I also get the same error which I did not get before with GCC 4.1.1.
> > 
> > Older versions of binutils/ld can not detect MOVT/MOVW relocations which
> > are absolute and cant be used in PIC code.
> > hence even if the error was there it remained latent.
> 
> Sorry for the noob question. In earlier versions would the resulting
> binaries/packages have been buggy?

Could be

> 
> > > 
> > >         /oe/tangstrom-dev/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.2/../../../../arm-angstrom-linux-gnueabi/bin/ld: hello.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
> > >         hello.o: could not read symbols: Bad value
> > >         collect2: ld returned 1 exit status
> > >         make[1]: *** [libvdr-hello.so] Error 1
> > >         make[1]: Leaving directory `/oe/tangstrom-dev/work/armv7a-angstrom-linux-gnueabi/vdr-1.7.10-r3/vdr-1.7.10/PLUGINS/src/hello'
> > >         
> > >         [… same for all other plugins]
> > > 
> > > The thing that puzzles me is, that in the plugin’s Makefile [4] `-fPIC`
> > > is specified
> > > 
> > >         CXX      ?= g++
> > >         CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
> > >         LIBS     ?= ${LDFLAGS}
> > > 
> > > but in the above command it is not included.
> > 
> > These are conditional so may be you already have defined CXXFLAGS in
> > your environment infact bitbake will do it for you.
> 
> I did not define any CXXFLAGS. It looks like BitBake is setting them and
> not respecting those in the Makefile.

could be bitbake set it up.

> 
> > >         arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -isystem/oe/tangstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidden -c -D_GNU_SOURCE -DPLUGIN_NAME_I18N='"hello"' -I../../../include hello.c
> > > 
> > > Looking at `run.do_install.28829` I cannot see find the `-fPIC` in
> > > there. So my question is, why is it not included. Is it because of »?=«?
> > > How do I get it included?
> > 
> > you could do CXXFLAGS_append = ... in the recipe.
> 
> Is that the recommended behavior? 

yes.

Is `oe_runmake` maybe not the correct
> command to use? As written above, it is very strange for me, that
> BitBake does not respect the flags in the Makefile automatically,
> because I think it is common in upstream Makefiles to use »?=«, is not
> is?
> 

Well bitbake provides/constructs and environment where cross builds can
happen and it has to do so much more to cater to the Makefiles sometimes
which do not understand cross build. 

> Or is that the default behavior running `oe_runmake` in `do_install`?
> 
> 
> Thanks,
> 
> Paul



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



