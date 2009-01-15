Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LNJda-0002DD-Tt
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 05:15:23 +0100
Received: by rv-out-0708.google.com with SMTP id f25so978506rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2009 20:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=fAZLtapsj9GY6F3TN5g+PUFWMEo4d9iXLo333ArUmHY=;
	b=rcHdLNuSxBb7hklNmoxCB+DVJn7cL4Ag4Bo4GX9jfH32pJssO1BSnacvtzktZz4COv
	rjode1TpHxsGZFzg6iU8HW8YvtX9zmBmEdr1SZtE5qQMlUvY7n2viYlusSi9T5EwRiIN
	Io9ViU4NGluaXND7tJS0c3vDwNmd91xlcwTTI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jHGnDixHDWUf22lYQZs8u1icKghodFSasgU6RD5X/BYd3EO9g6qRnttDEbAk16gcs8
	edsvxWPs3q/dRT11hCRX07pq2hAfIXy0j9F2adZJb7g6UvnFtXpGvm1Da8g9Bcmx5kcm
	cnv7N3yCTl6YuBjkc80sRhwehUCXkXKdAA1Lk=
Received: by 10.142.237.20 with SMTP id k20mr311129wfh.218.1231992524652;
	Wed, 14 Jan 2009 20:08:44 -0800 (PST)
Received: from localhost (adsl-71-146-7-99.dsl.pltn13.sbcglobal.net
	[71.146.7.99])
	by mx.google.com with ESMTPS id 22sm55737446wfi.18.2009.01.14.20.08.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Jan 2009 20:08:44 -0800 (PST)
Date: Wed, 14 Jan 2009 20:08:40 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090115040840.GA6717@gmail.com>
References: <496D4B33.60102@gmx.net> <gkk2ut$5m8$1@ger.gmane.org>
	<496DC520.90601@gmx.net>
	<1231931047.2952.208.camel@mill.internal.reciva.com>
	<496DEDF1.9080506@gmx.net>
	<1231944260.9499.87.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1231944260.9499.87.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: "armv6" override not used
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
X-List-Received-Date: Thu, 15 Jan 2009 04:15:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/01/09 14:44), Phil Blundell wrote:
> On Wed, 2009-01-14 at 14:51 +0100, Robert Schuster wrote:
> > it is related to GCC: Although -mfloat-abi=vfp is given __SOFTFP__ is
> > not defined and that is required for libffi because otherwise the sysv.S
> > assembler file uses instructions not available any more on armv6/armv7.
> 
> That sounds more like libffi is to blame.  Shouldn't it be checking for
> (defined(__SOFT_FP__) || defined(__VFP_FP__))?  Or, if you really are
> using soft-float, then presumably gcc is to blame for not defining
> __SOFT_FP__.
> 
> Either way, it seems like whichever package is broken should just be
> fixed, rather than trying to work around it with architecture-specific
> CFLAGS forcing.  Assuming that the problem is libffi trying to use FPA
> instructions #ifndef __SOFT_FP__, then it will break on ARMv5
> architectures as well if you happen to be using VFP.

-mfloat-abi=softfp makes sure that the calling conventions used are compatible with soft-float but gcc can generate VFP code if the architecture supports it and thats why __SOFTFP__ is not defined.

GCC only defines __SOFTFP__ when float abi is soft which means there is
no FPU of any sort.

My understanding is that this define means that code is not using FPU of
any sort and is pure soft-fp not only the calling convention.

by default -mfloat-abi is soft.

You should check the code in question weather it really needs to be soft
float. If thats the case then either you should use -mfloat-abi=soft for
this file.



Thx

-Khem


