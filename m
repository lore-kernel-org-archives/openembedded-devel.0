Received: from [209.85.142.187] (helo=ti-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JSXdT-000680-4c
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Feb 2008 14:08:21 +0100
Received: by ti-out-0910.google.com with SMTP id a6so715618tib.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2008 05:08:05 -0800 (PST)
Received: by 10.151.38.12 with SMTP id q12mr3642689ybj.174.1203685683901;
	Fri, 22 Feb 2008 05:08:03 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id 1sm1895694nfv.3.2008.02.22.05.08.01
	(version=SSLv3 cipher=OTHER); Fri, 22 Feb 2008 05:08:02 -0800 (PST)
Date: Fri, 22 Feb 2008 15:09:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080222150945.18f94036@widy.localdomain>
In-Reply-To: <1203589276.9329.6.camel@dax.rpnet.com>
References: <1203589276.9329.6.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.142.187
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: Library file extensions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Feb 2008 13:08:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 21 Feb 2008 10:21:16 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> Hi,
> 
> As some may have gathered I made some experiments with using Poky to
> cross compile things to run on the iPodTouch which is
> arm-apple-darwin. THe good news is they were successful however
> Darwin creates some interesting challenges for OE, one of them is the
> dynamic libraries being called *.dylib, not *.so.

The easiest way to account for would be to introduce something short
like:

SO ?= "so"

But if, as look at the patch below shows, we need to actually account
for cases like .so.<ver> vs .<ver>.dylib, then apparently it's the way
to go.

> 
> I've had the following patch in Poky to assist with this problem. It
> would need to be rolled out over all .bb files with custom FILES
> eventually but it has the advantage that can happen over time so the
> question is more whether this is a good idea and whether the approach
> is acceptable?
> 
> We would probably hit the same issue with windows .dll files and this
> solution would solve that too.

Yes, I actually hit that when doing win32 mini-port, and thought what
chore it would be to get such configurable support upstream, and update
all cases .so is used ;-). So, I just used native unix scheme for DLLs.

> 
> Comments welcome...
> 
> Cheers,
> 
> Richard
> 
> #
> # old_revision [5fb8cfe19138b98226fe92044d302c9379dad84d]
> #
> # patch "conf/bitbake.conf"
> #  from [a605bd5d4d48054b72d21c74a922a9a0a2d12a76]
> #    to [1655c26111af10134f07eafd1e29ef00d8cd8f5f]
> #
> ============================================================
> --- conf/bitbake.conf	a605bd5d4d48054b72d21c74a922a9a0a2d12a76
> +++ conf/bitbake.conf	1655c26111af10134f07eafd1e29ef00d8cd8f5f
> @@ -157,12 +157,17 @@ MULTI_PROVIDER_WHITELIST = "virtual/libi
>  
>  MULTI_PROVIDER_WHITELIST = "virtual/libintl"
>  
> +SOLIBS = ".so.*"
> +SOLIBS_darwin = ".*.dylib"
> +SOLIBSDEV = ".so"
> +SOLIBSDEV_darwin = ".dylib"
> +
>  PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
>  FILES = ""
>  
> -FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/*
> ${libdir}/lib*.so.* \ +FILES_${PN} = "${bindir}/* ${sbindir}/*
> ${libexecdir}/* ${libdir}/lib*${SOLIBS} \ ${sysconfdir}
> ${sharedstatedir} ${localstatedir} \
> -            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so*
> ${datadir}/${PN} ${libdir}/${PN}/* \
> +            ${base_bindir}/* ${base_sbindir}/*
> ${base_libdir}/${SOLIBS} ${datadir}/${PN} ${libdir}/${PN}/* \
> ${datadir}/pixmaps ${datadir}/applications \ ${datadir}/idl
> ${datadir}/omf ${datadir}/sounds \ ${libdir}/bonobo/servers"
> @@ -171,7 +176,7 @@ SECTION_${PN}-doc = "doc"
>              ${datadir}/gnome/help"
>  SECTION_${PN}-doc = "doc"
>  
> -FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
> +FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV}
> ${libdir}/*.la \ ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
>                  ${base_libdir}/*.a ${base_libdir}/*.o
> ${datadir}/aclocal" SECTION_${PN}-dev = "devel"
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


