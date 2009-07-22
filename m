Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MTXpR-0002n3-4d
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 11:09:37 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6M8sQKc013407; Wed, 22 Jul 2009 09:54:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5J8H+u3i18Dw; Wed, 22 Jul 2009 09:54:26 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6M8sL2P013394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 22 Jul 2009 09:54:25 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4A66482B.6010304@cbnco.com>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<1248212992.26475.35.camel@dax.rpnet.com> <4A66482B.6010304@cbnco.com>
Date: Wed, 22 Jul 2009 09:53:19 +0100
Message-Id: <1248252799.10252.5.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
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
X-List-Received-Date: Wed, 22 Jul 2009 09:09:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-07-21 at 18:58 -0400, Michael Smith wrote:
> I've been playing around with this and it seems to be creating some 
> problems, unless it's just finding problems in my overlay that the old 
> code didn't see.
> 
> With the latest fix, it finds dependency loops, but I'm not sure how to 
> track them down as the dependencies are identified only by numbers:

Thanks for testing. It is actually telling you the problem and decoding
the information:

> Dependency loop #1 found:
>    Task 7 
> (/home/michael/startitup/public/recipes/images/toastix-image.bb, 
> do_install) (depends: set([9, 6]))
>    Task 8 
> (/home/michael/startitup/public/recipes/images/toastix-image.bb, 
> do_populate_staging) (depends: set([7]))
>    Task 9 
> (/home/michael/startitup/public/recipes/images/toastix-image.bb, 
> do_rootfs) (depends: set([1024, 6, 2049, 8, 2057, 2059, 13, 791, 2067, 
> 21, 23, 2077, 31, 33, 2087, 41, 43, 2097, 51, 53, 2107,

So task 7 depends on task 9 which depends on task 8 which depends on
task 7. Its lists what tasks 7, 8 and 9 are.

Is it just this image recipe thats causing problems or are there others?
Can you point me at a copy of the recipe?

> Before the fix from 502bd2e, it was dropping some do_package_write_deb 
> dependencies that are needed to ensure .debs are built for packages that 
> are not listed in IMAGE_INSTALL, but are required by other packages. My 
> task-depends.dot was missing about 1000 entries. So was my depends.dot.

Yes, without the fix it would do that.

> BTW, is there any chance of getting Bitbake officially moved to a Git 
> repo? I think a few people are working out of git-svn trees, or subdirs 
> inside larger git trees, but it takes some gymnastics to merge between 
> them as Git doesn't know they're related.

As Chris replied, he's looking at this. I admit I'd like to see bitbake
moved to git.

Cheers,

Richard

-- 
Richard Purdie
Intel Open Source Technology Centre



