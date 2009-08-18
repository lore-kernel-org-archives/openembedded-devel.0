Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MdUxz-0004Jy-Jq
	for openembedded-devel@openembedded.org; Tue, 18 Aug 2009 22:07:36 +0200
Received: (qmail 22477 invoked from network); 18 Aug 2009 19:50:28 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 18 Aug 2009 12:50:28 -0700
Date: Tue, 18 Aug 2009 12:50:28 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090818195028.GU2227@smtp.west.cox.net>
References: <1250176750.29049.1003.camel@conroy-linux>
	<20090813155909.GC8906@gmail.com>
	<1250612879.6785.12.camel@conroy-linux>
	<20090818174157.GB25000@denix.org>
	<1250620212.6785.43.camel@conroy-linux>
MIME-Version: 1.0
In-Reply-To: <1250620212.6785.43.camel@conroy-linux>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Tue, 18 Aug 2009 20:07:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2009 at 02:30:12PM -0400, Chris Conroy wrote:

> Sorry for not providing more detail at first...
> 
> With debian renaming on, glibc, for example, gets renamed to 'libc6' and
> packaged as such. Normally, this works because the other packages pick
> up the rename at some point along the way. The comment at the top of
> debian.bbclass states:
> 
> # Debian package renaming only occurs when a package is built
> # We therefore have to make sure we build all runtime packages
> # before building the current package to make the packages runtime
> # depends are correct
> 
> So, glibc is packaged as part of my toolchain's sdk. Building
> meta-toolchain works just fine. Then, I go to build an image using the
> external-toolchain. It fails because opkg cannot satisfy the dependency

OK, here's the problem, I think.  You're trying to make an image for say
i686-armv6-sdk-linux-gnueabi?  What are you expecting to be in this raw
image however, the contents of say meta-toolchain, extracted and put
into a ext2?  For most people, meta-toolchain, and the resulting tarball
are the output that gets used.

-- 
Tom Rini


