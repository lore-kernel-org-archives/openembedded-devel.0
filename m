Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu5az-0007HA-NQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 15:56:13 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.115])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lu5XG-0004PG-VN
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 17:52:20 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 17:52:13 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<1239800506.21612.79.camel@hammer.suse.cz>
	<1239802376.21612.91.camel@hammer.suse.cz>
In-Reply-To: <1239802376.21612.91.camel@hammer.suse.cz>
MIME-Version: 1.0
Message-Id: <200904151752.13116.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] AMD64 and multilib support
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
X-List-Received-Date: Wed, 15 Apr 2009 13:56:13 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 April 2009 17:32:56 Stanislav Brabec wrote:
> Stanislav Brabec wrote:
> > >Next thing is 'libexec' dir. I propose to set it to point to libdir and
> > > be done with that
>
> This is bad, because it forces duplicating of all libexec binaries in
> the system.
> .....
> libexecdir pointing to prefix/lib is much better:
> /usr/lib/libfoo-helper (64 bit instance for both libraries)
>
> Both 32 bit and 64 bit libfoo will use this helper.

Given the nature of libexec dir that might be nice to have, so we wouldn't 
override libexecdir but just not package it for 32-bit arch.

Just one thing - couldn't there be any situation where libexec program output 
would be different for primary and supplementary architectures? And, BTW, 
looking at glibc, it installs "getconf/POSIX_V6_LP64_OFF64" for 64-bit 
and "getconf/POSIX_V6_ILP32_OFF32" with "getconf/POSIX_V6_ILP32_OFFBIG" for 
32-bit.

Although looking at Debian it doesn't have any of this POSIX_* thing at all.


