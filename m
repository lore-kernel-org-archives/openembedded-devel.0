Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCXe5-0000TK-NG
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 14:36:10 +0200
Received: by fxm11 with SMTP id 11so1177603fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 05:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=mFbX0BZTmYW6sHmcAhYbRjGTrvpTy5sW4RaSJua+6YU=;
	b=XfeaxHYSteKT60/3SKGcU3N4qYr/RtiBj0e/bUXqlbi2gVDgEtW/MZvm1HptTO2T67
	V8txrW9Xqa6XtiNVuGTtJ8lGu2VESOSFd0Z2Wlf0bAEWTotrTDNTUPZSq6p9gKgUGa7l
	J5Y0bdD9CYDOfwMDr7BYwEOxI+VIpEAytYmhE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UN77FwQRqzOsIPqblnFBQSbw+70IZbip6YjdgL8EvOSFRJVfP2XMwseLeYQmn6KtLb
	eKNQLElIlUdS2Sgi+3mjyUvgwpSc03X4ca+izZYqmiA2Ugeu+GeHSgL8ToIFnNfYrJ4i
	qNut49GgkyJ7Ra4Q1AAsVR/WsLKWAqYqAaWWo=
Received: by 10.223.68.13 with SMTP id t13mr1675842fai.69.1273753934657;
	Thu, 13 May 2010 05:32:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 7sm5637283far.18.2010.05.13.05.32.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 May 2010 05:32:14 -0700 (PDT)
Date: Thu, 13 May 2010 14:32:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513123216.GM3370@jama>
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005130953.59314.roman@khimov.ru> <20100513064037.GB3370@jama>
	<201005131223.22252.khimov@altell.ru>
	<alpine.DEB.2.00.1005130815410.8372@lynx>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1005130815410.8372@lynx>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some possible fixes in the OE web pages
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
X-List-Received-Date: Thu, 13 May 2010 12:36:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 13, 2010 at 08:20:46AM -0400, Robert P. J. Day wrote:
> On Thu, 13 May 2010, Roman I Khimov wrote:
> 
> ... mmap_min_addr stuff snipped ...
> 
> > The real solution is in the kernel, it should be fixed for latest
> > Ubuntu and hopefully Fedora will catch up on this issue too.
> >
> > http://git.kernel.org/?p=linux/kernel/git/jmorris/security-
> > testing-2.6.git;a=commitdiff;h=822cceec7248013821d655545ea45d1c6a9d15b3
> >
> > Interesting that openSUSE with 2.6.31 kernel doesn't have such
> > problems... And our main build machine with Debian stable + 2.6.30
> > kernel works fine too. Probably this check got introduced in 2.6.32.
> 
>   not sure which kernel *version* it showed up in, but it appears to
> be a result of this commit from nov of last year (which you can see
> ended up being unnecessarily restrictive -- d'oh!):
> 
> commit 0e1a6ef2dea88101b056b6d9984f3325c5efced3
> Author: Kees Cook <kees.cook@canonical.com>
> Date:   Sun Nov 8 09:37:00 2009 -0800
> 
>     sysctl: require CAP_SYS_RAWIO to set mmap_min_addr

... repeated stuff snipped ...

You should finish reading the thread again :).

Yes, that's the same commit as 
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=1b426b8382d2a7864b63051b0707e577f2c0ce69
says.

Workaround to qemu-native already pushed. So now it should work on every
system with with readable /proc/sys/vm/mmap_min_addr or
/proc/sys/vm/mmap_min_addr <= 65536.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


