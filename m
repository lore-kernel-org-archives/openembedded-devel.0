Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1Hj2ys-0002R9-6u
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2007 02:46:06 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id C5CD8F3EE2;
	Wed,  2 May 2007 10:36:43 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12125-06; Wed, 2 May 2007 10:36:42 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 2EB6FF4000;
	Wed,  2 May 2007 10:36:42 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 04ED2B70149; Wed,  2 May 2007 10:36:41 +1000 (EST)
Date: Wed, 2 May 2007 10:36:41 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Junqian Gordon Xu <xjqian@gmail.com>
Message-ID: <20070502003641.GA5189@twibble.org>
References: <20070427105722.GA4340@twibble.org> <46359408.9060800@gmail.com>
	<20070430080044.GA15877@twibble.org> <4636CCC0.1010109@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4636CCC0.1010109@gmail.com>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2007 00:46:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 01, 2007 at 12:14:40AM -0500, Junqian Gordon Xu wrote:
> Thanks. I fixed the hostperl problem.
> 
> Don't know why. Even I commented out the DEFAULT_PREFERENCE = "-1", 
> bitbake still try to get perl-5.8.7 compiled first
> 
> NOTE: package perl-5.8.8-r8: task do_unpack: completed
> NOTE: package perl-5.8.8: completed
> NOTE: Running task 285 of 302 (ID: 130, 
> /home/OE/org.openembedded.dev/packages/perl/perl_5.8.7.bb, do_fetch)
> NOTE: package perl-5.8.7: started
> NOTE: package perl-5.8.7-r22: task do_fetch: started

This turns out to be an error on my part in perl 5.8.8 - I didn't
tell bitbake that perl 5.8.8 was providing all the perl modules. So
when something needed perl-modules (because of a DEPEND or RDEPEND)
it found that perl 5.8.8 provided them while 5.8.8 didn't.

If you had perl 5.8.7 already compiled and lying around you didn't
notice this issue. Since I've been building and testing changes for
both version I had 5.8.7 and 5.8.8 always compiled.

Anyway, I just checked in a fix for this so it should be ok now.

> Besides, I noticed another issue:
> I had linux-libc-headers-2.6.15.99 compiled (I think it's determined 
> Machine and Distro) . But perl-5.8.8 wants linux-libc-headers-2.6.20. 
> Will that cause problem?

Perl shouldn't care about linux-libc-headers, I use 2.6.15.99 here at
the moment.

Thanks.

-- 
 Jamie Lenehan <lenehan@twibble.org>


