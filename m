Received: from mail-gx0-f217.google.com ([209.85.217.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NV0Up-0005HM-Ff
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 11:30:42 +0100
Received: by gxk9 with SMTP id 9so49950297gxk.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 02:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=W7byFO3pJQ8u792+kV13ALdzhX61ArwPd2A/tssWsqE=;
	b=TJ+GZ8stmh4akKwVXA4j//nrv/nN20euLDbpKWZvMOqiKZ07oI+1gOK66w8qRpY5i3
	DYZD1mat1mwamrG/ymTEugRt97dDHz7OaddeXA64udeOS2GQ1DGSbPipaOq5wIwRr6JL
	/uKqWx6DGPu7ywn7k2E3c5fsKtgnAP209LPFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=x47iqXT03bxsnoSbLQqauTTDJYddzsuOKpj37uO+FCkuC95eRT5qveRDJVTXhdcED2
	cZTCnrl8A/Q68uMxvOKvtRFc4smA8B+C300R+qTkI/STGWtmbuqLfZYAhQ+sj0/ua0mT
	PEFamSYpyEPqyz9yO+KZYZN9b+WKACCUtPuS0=
Received: by 10.150.25.30 with SMTP id 30mr694257yby.83.1263378508488;
	Wed, 13 Jan 2010 02:28:28 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 9sm11459817yxf.41.2010.01.13.02.28.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Jan 2010 02:28:27 -0800 (PST)
Date: Wed, 13 Jan 2010 02:27:38 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100113102738.GA15906@gmail.com>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100110123923.GB6363@rhein.zuhause.netz>
	<1263156477.3423.6.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263249767.3308.236.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263296160.20557.136.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1263296160.20557.136.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.217.217
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [vdr] TARGET_CXXFLAGS do not include CXX_FLAGS from Makefile (was: vdr: questions regarding cplusplus.patch)
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
X-List-Received-Date: Wed, 13 Jan 2010 10:30:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (12/01/10 12:36), Paul Menzel wrote:
> Dear OE hackers,
> 
> 
> Am Montag, den 11.01.2010, 23:42 +0100 schrieb Paul Menzel:
> 
> […]
> 
> > Putting
> > 
> >         PREFERRED_VERSION_binutils               = "2.20"
> >         PREFERRED_VERSION_binutils-cross         = "2.20"
> >         PREFERRED_VERSION_binutils-cross-sdk     = "2.20"
> >         
> >         PREFERRED_VERSION_gcc                    = "4.4.2"
> >         PREFERRED_VERSION_gcc-cross              = "4.4.2"
> >         PREFERRED_VERSION_gcc-cross-sdk          = "4.4.2"
> >         PREFERRED_VERSION_gcc-cross-initial      = "4.4.2"
> >         PREFERRED_VERSION_gcc-cross-intermediate = "4.4.2"
> > 
> > in my `local.conf` and running `bitbake vdr` gave me an error in
> > `do_compile` for `libcap_1.10.bb`.
> > 
> >         arm-angstrom-linux-gnueabi-ld -soname libcap.so.1 -x -shared -o libcap.so.1.10 cap_alloc.o cap_proc.o cap_extint.o cap_flag.o cap_text.o cap_sys.o
> >         arm-angstrom-linux-gnueabi-ld: cap_text.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
> 
> I opened a new thread for this [2].
> 
> Anyways compiling the plugins for VDR in `do_install` [3]
> 
>         do_install () {
>               oe_runmake 'DESTDIR=${D}' \
>                          'PREFIX=${prefix}' \
>                          'CONFDIR=${sysconfdir}/vdr' \
>                          'VIDEODIR=/var/lib/vdr/video' \
>                          'PLUGINLIBDIR=${PLUGINDIR}' \
>                          'LOCDIR=${datadir}/locale' \
>                          install
>         }
> 
> I also get the same error which I did not get before with GCC 4.1.1.

Older versions of binutils/ld can not detect MOVT/MOVW relocations which
are absolute and cant be used in PIC code.
hence even if the error was there it remained latent. 

> 
>         /oe/tangstrom-dev/cross/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.4.2/../../../../arm-angstrom-linux-gnueabi/bin/ld: hello.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
>         hello.o: could not read symbols: Bad value
>         collect2: ld returned 1 exit status
>         make[1]: *** [libvdr-hello.so] Error 1
>         make[1]: Leaving directory `/oe/tangstrom-dev/work/armv7a-angstrom-linux-gnueabi/vdr-1.7.10-r3/vdr-1.7.10/PLUGINS/src/hello'
>         
>         [… same for all other plugins]
> 
> The thing that puzzles me is, that in the plugin’s Makefile [4] `-fPIC`
> is specified
> 
>         CXX      ?= g++
>         CXXFLAGS ?= -fPIC -g -O2 -Wall -Woverloaded-virtual -Wno-parentheses
>         LIBS     ?= ${LDFLAGS}
> 
> but in the above command it is not included.

These are conditional so may be you already have defined CXXFLAGS in
your environment infact bitbake will do it for you.

> 
>         arm-angstrom-linux-gnueabi-g++ -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -isystem/oe/tangstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -fpermissive -fvisibility-inlines-hidden -c -D_GNU_SOURCE -DPLUGIN_NAME_I18N='"hello"' -I../../../include hello.c
> 
> Looking at `run.do_install.28829` I cannot see find the `-fPIC` in
> there. So my question is, why is it not included. Is it because of »?=«?
> How do I get it included?

you could do CXXFLAGS_append = ... in the recipe.


