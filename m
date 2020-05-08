Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.1189.1588963296002993833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 11:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=uQVU8jM5;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=rc5n=6w=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49JfLM5qCHz4t;
	Fri,  8 May 2020 20:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588963292;
	bh=SDFZCE29LwuCX3rdWfPsPS0eU5PKFwEpUetccuVcO7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uQVU8jM5X7B77x6TJosHWPU4IEM8u5MNLo2oRnWWoncrR7pj9qY1g824udj8GL9Wb
	 Xx/X/7yLFtsOyMmZvnq3qNTLmv99XJOB87ULbQ3u88hfk49OjK+O3W5bEDnSfp6AKr
	 p7Jzkbzl2N/Xn4oQHOm9A6Udyb/jWCyOiYchAKRVn8c02Jzdgoa2pgGtLNmpBONESB
	 tIgNE45RcqNc1ee4ihAx4Y8bvri9/lyqh77SGktymUgychnxKUQ2d4YTaD/txqfrT3
	 IX+OPRnqmY0xfMGhrlKjEX7H8CFUxhL98kz4WCFaigVScTF1Y4iJ46p8fncfUPF5j7
	 fA5uXmtB5/pXva+stIPgyFzF7ccSLSp7pQN1AmfcJ2vuX++vgt2CiXTRDbNK6MerDF
	 lYM/7V6zo24qCG+fiLiBVt6NcG9NbZ9mcP/HDzRAeQCYd80OcgcO+bJO6rCuCNCVVC
	 ogqwtcllN+F0Py9kwRp0ww8tGg9OpYsurTs83d8jC4GXB9b5fKV9o3lp5s1ZJ57ZqH
	 FGTU0pxGPoAGavlnJbf9n/ElU6W8QMB4gU9aZEjNl9EX1iweUEadKVcABDDwd4q00V
	 GlPlqAvkM+iMBOPsIdw2pjERB4ISf91ghrMpzB7/hjsR1LZm8d7wfgne7ZUxCdqnA8
	 ZUIGWgx1C5SKSq3larAOSfhY=
Date: Fri, 8 May 2020 21:41:29 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Claude Bing <cbing@cybernetics.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
Message-ID: <20200508184129.GA7248@localhost>
References: <20200507142806.48643a47@cy-rd-cb>
 <20200508105610.GA8452@localhost>
 <090c0075-c785-e3fd-1da4-c56518a64c0c@cybernetics.com>
MIME-Version: 1.0
In-Reply-To: <090c0075-c785-e3fd-1da4-c56518a64c0c@cybernetics.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 08, 2020 at 10:42:22AM -0400, Claude Bing wrote:
> On 5/8/20 6:56 AM, Adrian Bunk wrote:
> > On Thu, May 07, 2020 at 02:28:06PM -0400, Claude Bing wrote:
> >> Explicitly specifying -lrt is required for opcache to be linked against
> >> the proper dependencies.  Additionally, PHP disables libdl when it
> >> detects a cross-compilation environment for some reason.  In order to
> >> load any type of extension, re-enabling libdl is required.
> >> ...
> >> +# link against librt (libc) if opcache is specified in order to avoid the
> >> +# following error:
> >> +# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
> >> +LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
> > 
> > Is this actually a bug in 0001-opcache-config.m4-enable-opcache.patch
> > and should instead be fixed there?
> 
> Yes, that does indeed fix the problem.  Would you like me to reply to
> this thread with a new patch, or create a different thread?
>...

Your original patch is already in master, please submit a new patch in a 
different thread that removes this workaround from php_7.4.4.bb and 
fixes 0001-opcache-config.m4-enable-opcache.patch.

Thanks
Adrian
