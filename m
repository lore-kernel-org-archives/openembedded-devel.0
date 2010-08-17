Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OlER7-0006wC-Eg
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 07:10:10 +0200
Received: by yxd39 with SMTP id 39so1786069yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 22:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=UhEHzivZif7YC9SCkr8DpBQzKnOuj7uFi/vT8ux7WKg=;
	b=WsYH+3ppilzho4rX9DBWfjmDnggPdyQf6kcs1wFgMbacQrjgLSqg+X4uAobC0slrQR
	62D4NKtwJKNONV3CcCxyV1+UXw2s6/LBoMrlw8e58+9qPhXyZyZIzOxxstJ5gi8zYGqh
	epTgSmvLnOLIbEgylr1vEQZqjb39MvYhpw1XM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=i+nqHNzGKndSWKrA8T7ahUKn7pyf/AYrQaBSY3OkhU+UBph8bVkpAq/GywRKrbvHHW
	Eq4CmqhnbX9AflfIiq0Vel60taGgEPZo9FCNKOl8OaVMu4RpItSiCTJlm/M2QxBPTWNT
	YoKJw68O4o73Ze0GRDZ4ozJeDDh2yKSx62HHg=
Received: by 10.231.17.1 with SMTP id q1mr7056641iba.17.1282021790203;
	Mon, 16 Aug 2010 22:09:50 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e8sm5603722ibb.14.2010.08.16.22.09.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 22:09:49 -0700 (PDT)
Date: Mon, 16 Aug 2010 22:09:56 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100817050956.GA17124@gmail.com>
References: <4C69F1E7.50000@balister.org>
MIME-Version: 1.0
In-Reply-To: <4C69F1E7.50000@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: alsa-utils failure
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
X-List-Received-Date: Tue, 17 Aug 2010 05:10:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/08/10 19:20), Philip Balister wrote:
> At least one other person is seeing this. Mine is on a clean build
> on a new F13 machine. Any thoughts?

it seems something is seeping in from your host environment. mostly it
could be because of ncurses. ncurses on your build box probably is compiled
with --with-termlib and this gets picked up when configuring the target
ncurses recipe and then linker does not find libtinfo in the sysroot that
we created. It would be nice if you could find why -ltinfo is being
configured in nucurses. A workaround would be that you compile ncurses
after adding --with-termlib to configure option but that might have wider
implications.

Thanks
-Khem

> 
> Philip
> 
> gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/po'
> | make[1]: Nothing to be done for `all'.
> | make[1]: Leaving directory `/home/balister/oe/tmp/work/armv7a-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/po'
> | Making all in alsamixer
> | make[1]: Entering directory `/home/balister/oe/tmp/work/armv7a-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/alsamixer'
> | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
> -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb
> -DCURSESINC="<ncurses.h>" -isystem/home/balister/oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer
> -O2 -ggdb3 -L/home/balister/oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/home/balister/oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> -Wl,-O1 -Wl,--hash-style=gnu -o alsamixer alsamixer.o -lncurses
> -ltinfo -lasound -lm -ldl -lpthread
> | /home/balister/oe/tmp/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> cannot find -ltinfo
> | collect2: ld returned 1 exit status
> | make[1]: *** [alsamixer] Error 1
> | make[1]: Leaving directory `/home/balister/oe/tmp/work/armv7a-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/alsamixer'
> | make: *** [all-recursive] Error 1
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> NOTE: package alsa-utils-1.0.20-r2: task do_compile: Failed
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


