Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MUSIo-0003ou-QR
	for openembedded-devel@openembedded.org; Fri, 24 Jul 2009 23:27:42 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6OLCEXI008352 for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 22:12:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pYPonk9D9VGw for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 22:12:13 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6OLC6O6008337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Jul 2009 22:12:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4A69F174.3020006@cbnco.com>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<200907232141.13597.khimov@altell.ru>
	<1248386615.14790.43.camel@dax.rpnet.com>
	<200907240900.52746.khimov@altell.ru>
	<1248454154.20755.13.camel@dax.rpnet.com> <4A69F174.3020006@cbnco.com>
Date: Fri, 24 Jul 2009 22:11:22 +0100
Message-Id: <1248469882.20755.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Fri, 24 Jul 2009 21:27:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-07-24 at 13:37 -0400, Michael Smith wrote:
> Richard Purdie wrote:
> 
> > Is there any other feedback on the bitbake patch?
> 
> For me, it makes preparing the runqueue at least twice as fast (from ~2 
> to ~1 second for a small console image, ~14 to ~6 for something with X11).

Great!

> My task dependencies look identical before and after the patch, except 
> for the new harmless <image>.do_rootfs -> 
> <image>.do_package_write_deb,do_populate_staging that you wrote about at 
> the start of the thread.
> 
> Now if only "Resolving any missing task queue dependencies" were a 
> little faster :) That part's running about 40 seconds for me on a large 
> image.

As it happens, try the patch from
http://cgit.openembedded.net/cgit.cgi/bitbake/commit/?id=72bf7476b2492b6524cb8ff87ee5f4e86b28d975

It should apply to bitbake 1.8 just as well as trunk as those files are
the same.

If anyone is interested in profiling things, "bitbake foo -g -P" gives
the numbers on where its spending time.

Cheers,

Richard



