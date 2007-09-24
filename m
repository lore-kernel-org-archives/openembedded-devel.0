Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IZjiy-0008Tj-5h
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 10:55:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8O8p851011548
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 09:51:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11403-03 for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 09:51:04 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8O8p2X6011542
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 09:51:03 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46F75B64.1C3AE60B@vollmann.ch>
References: <1190191062.7630.17.camel@localhost.localdomain>
	<46F75B64.1C3AE60B@vollmann.ch>
Date: Mon, 24 Sep 2007 09:51:02 +0100
Message-Id: <1190623862.6176.20.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: cross and staging directories
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
X-List-Received-Date: Mon, 24 Sep 2007 08:55:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2007-09-24 at 08:38 +0200, Detlef Vollmann wrote:
> Richard Purdie wrote:
> > I've been experimenting a bit in Poky to find out exactly why we need
> > the cross directory.
> > 
> > The motivation for this is the load of files we duplicate in both,
> > particularly linux-libc-headers, headers from glibc-initial, glibc and
> > glibc-intermediate and libs from glibc and glibc-intermediate.
>
> So your idea is to omit the cross directory and install the
> cross compiler inside staging?
> Or to keep the cross compiler in cross, but install the libraries
> in staging only?

Initially, I want to leave the compiler in cross but install libraries
and headers into staging only which is what the patch did.

Whether we can improve things further than that remains to be seen - one
step at a time :).

> Some files are linked in directly from fix places relative to the
> gcc binary.  So if gcc is in cross and you call it with
> '/path-to-cross/bin/powerpc-angstrom-linux-gcc -v hello.c'
> you'll see something like
> /path-to-cross/bin/../libexec/gcc/powerpc-angstrom-linux/4.1.1/collect2 ... \
>  /path-to-cross/bin/../lib/gcc/powerpc-angstrom-linux/4.1.1/crtend.o \
>  /path-to-cross/bin/../lib/gcc/powerpc-angstrom-linux/4.1.1/../../../../powerpc-angstrom-linux/lib/crtn.o
> 
> If you move the compiler somewhere else, only 'path-to-cross' changes,
> but the rest keeps the same.
> 
> So, files like crtsavres.o and crtend.o are taken from
> 'path-to-cross/lib/gcc/powerpc-angstrom-linux/4.1.1'
> while crti.o is taken from
> 'path-to-cross/powerpc-angstrom-linux/lib'
> 
> So, if you install the cross-gcc into staging/bin, everything is fine.
> But if you install the cross-gcc into staging/i686-linux/bin,
> crti.o isn't found anymore.

I understand that. For now I've worked around this by symlinking cross
to staging which to me is neater than having two copies of all these
libs/headers installed (and makes the builds faster and more space
efficient).

In the future I'd prefer to see the symlink removed and the staging
inc/lib paths added into the compiler's default search paths in some
other way. The most promising looking approach for this is to use the
sysroot support since that passes from the compiler to the linker and
binutils and would "just work".

I think this step makes sense regardless of whether we choose sysroot or
not though.

Regards,

Richard



