Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MiCMV-00060O-Dg
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 21:16:19 +0200
Received: by bwz6 with SMTP id 6so1931517bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 11:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=xQaaOQQckWFuoRRQrm78xq+zgfdJPP/D5pZiJ0Vnw/I=;
	b=raxGmMsoYgegOnJ282xrOgA7BUag5UOWgZLQCJ+H+jm3GZ+6MHQxZYdrCdJHzM3jh7
	LtcMc4JwvhbCcFUQ9ATDZG3ffeTDp5puklR3Mx/eVKpkDkPmClaAQNPB09rNNSQXO5t9
	rOoosmLFNAQ11xHv7Tt6YW3F+2kOsWGf+rUsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oWu4b0CzruQuI1XcgAND+LY1/024r8UTVYYmi2t3f25+S3B3zBR+D9c/9sZQJICsvB
	J9OI2E99C+mCtlvFz9mQ6rgiP9I6nMoUHnKV7B9pHCp6lC5xK1UpanTtpuEgelo4VlSR
	tgH6r9eiuSzHXdB2qBAsque9xUsd4CBn2K9oc=
Received: by 10.103.50.28 with SMTP id c28mr2402761muk.17.1251745065438;
	Mon, 31 Aug 2009 11:57:45 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id e9sm24305520muf.32.2009.08.31.11.57.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 31 Aug 2009 11:57:44 -0700 (PDT)
Date: Mon, 31 Aug 2009 11:57:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090831185732.GA22032@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200908311333.20189.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Mon, 31 Aug 2009 19:16:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/08/09 13:33), Marcin Juszkiewicz wrote:
> What about using MACHINE_FEATURES (or CPU_FEATURES) for things like eabi/spe?

yes that is a very good idea.

> 
> TARGET_OS = "linux-"
> if ARCH in [ppc,powerpc] and MACHINE_FEATURES.find('spe') then
> 
>   if LIBC=uclibc then
>     TARGET_OS += "uclibc"
>   fi
> 
>   TARGET_OS += "gnuspe"
> fi
> 
> Same for adding eabi:
> 
> TARGET_OS = "linux-"
> if ARCH in [arm,armeb] and MACHINE_FEATURES.find('eabi') then
> 
>   if LIBC=uclibc then
>     TARGET_OS += "uclibc"
>   fi
> 
>   TARGET_OS += "gnueabi"
> fi
> 
> spe/eabi can be added to MACHINE_FEATURES in conf/machine/include/tune-* files 
> and distros can choose do they support it or not by DISTRO_FEATURES (examples 
> needs to be changed then to use COMBINED_FEATURES variable). This way no one 
> has to change XY files just because he has new board with ppc500v2 core, we do 
> not have to remember about armv4 devices which are not capable of EABI with 
> gcc 4.3.x and older (but if they will support EABI in future we just change 
> tune-strongarm.inc file).

seems a nice approach. Let me try to implement something on these lines.

> 
> Regards, 
> -- 
> JID:      hrw@jabber.org
> Website:  http://marcin.juszkiewicz.com.pl/
> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


