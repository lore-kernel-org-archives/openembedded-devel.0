Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mbcxv-0005Ga-Qs
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 18:15:48 +0200
Received: by rv-out-0708.google.com with SMTP id l33so1491317rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=fFo3qE6RVj7Ql8UDOlAfwl5h8BkS/f6scmE1PKQgKl4=;
	b=Qa1NmoXEn6OlgCG1Xx7nIK6TCnPr1CrTGMn80MEMUmDB9R8u4fjsZyEOab5Ec+ocmR
	6qrhIpyfil3v+qxsdPk6K2pNk7c80IK2uSMwHANePbA4if/Z4gFYiCYu7J5DcMsaJH3A
	Df8vBW8Yk/J6RyLp4wd10aG0mZhzOxElv0z3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=om4HWceJLjDadxtBjN5X7rgv+CcWGXjlc0pSUHaqugL0zjDMuQz5BbWRqxrYkulTj+
	tcCKcmx+H7PXmyb3FNN4MiEaJ+KQ0HeyD3KVF00SAqpevLd1z0Ph5rIdfLgcvL4FeLxB
	YABTVyNlRUjQoMVspyoU8q/kfELyLCeZYXiVo=
Received: by 10.141.28.2 with SMTP id f2mr581788rvj.119.1250179155542;
	Thu, 13 Aug 2009 08:59:15 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id g14sm2649432rvb.10.2009.08.13.08.59.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Aug 2009 08:59:14 -0700 (PDT)
Date: Thu, 13 Aug 2009 08:59:09 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090813155909.GC8906@gmail.com>
References: <1250176750.29049.1003.camel@conroy-linux>
MIME-Version: 1.0
In-Reply-To: <1250176750.29049.1003.camel@conroy-linux>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: gcc-cross-sdk (GCC 4.2.3) limits.h woes
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
X-List-Received-Date: Thu, 13 Aug 2009 16:15:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (13/08/09 11:19), Chris Conroy wrote:
> I've spent a pretty good chunk of time this past week trying to get a
> working external toolchain, but I've hit a bit of a wall and can't
> figure out how to fix this last problem.
> 
> I'm trying to build a gcc-cross-sdk with GCC 4.2.3, and for a while I
> faced a chicken-and-egg problem of finding limits.h where the creation
> of the cross-sdk would succeed only if the eventual install location
> (in /usr/local/path/to/toolchain/ existed). By pulling in the
> sdk-libstdc++-includes.patch from poky, I was able to remove this issue
> during the creation of gcc-cross-sdk.
> 
> Now, chicken and egg fixed (properly?) using the external toolchain
> results in cross packages failing to find limits.h (specifically, the
> #include_next<limits.h> in ${prefix}/usr/include/limits.h. It's unclear
> to me which (if any) limits.h should be installed (and where).

limits.h should come from glibc. which should include the one provided
by gcc in include-fixed gcc-cross-sdk should have done that.
Deleting include_next is not the correct thing to do.
> 
> I've run through the gcc-cross-sdk work directory and was unable to find
> any obvious choices (all of the copies there also asked for an
> include_next).
> 
> If I make the assumption that this is just an erroneous include_next, I
> can successfully compile and run some packages. However, I cannot build
> the kernel because it fails on the assembly inside asm_offsets.c. This
> leads me to believe that removing that include_next was not a valid fix
> (no surprise there), and perhaps fixing this limits.h issue properly
> will be the last step in creating a working external toolchain. I don't
> see any obvious choices within gcc, but perhaps I need to pull from
> glibc, glibc-initial, or perhaps a particular host file?
> 
> Note that this is NOT GCC 4.3.x which moved the fixincludes directory
> and made some issues with finding limits.h. Most of the references I've
> found to this bug indicate that people had this working before upgrading
> to 4.3.x, and therefore I'm a bit surprised to be running into a similar
> issue with 4.2.x
> 
> (For reference, this is with glibc 2.7 and binutils 2.19 for a
> mipsel-linux target building on an x86_64 host)
> 
> --Chris Conroy
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


