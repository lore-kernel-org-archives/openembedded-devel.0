Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MTOW1-0004F8-B4
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 01:12:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 10CD65153FD;
	Tue, 21 Jul 2009 18:58:52 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18979-07; Tue, 21 Jul 2009 18:58:52 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DC7C64B649D;
	Tue, 21 Jul 2009 18:58:51 -0400 (EDT)
Message-ID: <4A66482B.6010304@cbnco.com>
Date: Tue, 21 Jul 2009 18:58:51 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: bitbake-dev <bitbake-dev@lists.berlios.de>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<1248212992.26475.35.camel@dax.rpnet.com>
In-Reply-To: <1248212992.26475.35.camel@dax.rpnet.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Cc: openembedded-devel <openembedded-devel@openembedded.org>
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
X-List-Received-Date: Tue, 21 Jul 2009 23:12:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Tue, 2009-07-21 at 19:32 +0100, Richard Purdie wrote:
>> The attached patch rewrites the problematic function entirely with the
>> following benefits:
> 
> Of course one of my last minute cosmetic cleanups broke it :(.
> 
> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=502bd2ef92f6cddf74ac85279dab621372791dc0 is the key fix with a couple of other things I noticed too.

Hi Richard,

I've been playing around with this and it seems to be creating some 
problems, unless it's just finding problems in my overlay that the old 
code didn't see.

With the latest fix, it finds dependency loops, but I'm not sure how to 
track them down as the dependencies are identified only by numbers:

NOTE: Preparing runqueue
ERROR: Unbuildable tasks were found.
These are usually caused by circular dependencies and any circular 
dependency chains found will be printed below. Increase the debug level 
to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
   Task 7 
(/home/michael/startitup/public/recipes/images/toastix-image.bb, 
do_install) (depends: set([9, 6]))
   Task 8 
(/home/michael/startitup/public/recipes/images/toastix-image.bb, 
do_populate_staging) (depends: set([7]))
   Task 9 
(/home/michael/startitup/public/recipes/images/toastix-image.bb, 
do_rootfs) (depends: set([1024, 6, 2049, 8, 2057, 2059, 13, 791, 2067, 
21, 23, 2077, 31, 33, 2087, 41, 43, 2097, 51, 53, 2107,

[snip a few hundred numbers]

Before the fix from 502bd2e, it was dropping some do_package_write_deb 
dependencies that are needed to ensure .debs are built for packages that 
are not listed in IMAGE_INSTALL, but are required by other packages. My 
task-depends.dot was missing about 1000 entries. So was my depends.dot.

For example, I've got openssh in my IMAGE_INSTALL and it DEPENDS on zlib 
(and has a run-time dependency via shlibs). If I removed my zlib debs 
and tmp/stamps/blah/zlib-1.2.3-r5.do_package*, building my image should 
have built the zlib debs (and did before applying your patches), but it 
didn't so the rootfs failed.


BTW, is there any chance of getting Bitbake officially moved to a Git 
repo? I think a few people are working out of git-svn trees, or subdirs 
inside larger git trees, but it takes some gymnastics to merge between 
them as Git doesn't know they're related.

Thanks,
Mike


