Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MTtY5-0000t7-O7
	for openembedded-devel@openembedded.org; Thu, 23 Jul 2009 10:21:10 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6N85q7a016047 for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 09:05:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ur7x15jFiUpT for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 09:05:52 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n6N85lso016025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 23 Jul 2009 09:05:49 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200907230948.13502.khimov@altell.ru>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<Pine.LNX.4.64.0907220859010.3621@juice.ott.cti.com>
	<1248301473.14790.5.camel@dax.rpnet.com>
	<200907230948.13502.khimov@altell.ru>
Date: Thu, 23 Jul 2009 09:04:51 +0100
Message-Id: <1248336291.14790.19.camel@dax.rpnet.com>
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
X-List-Received-Date: Thu, 23 Jul 2009 08:21:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2009-07-23 at 09:48 +0400, Roman I Khimov wrote:
> If recrdeptask is supposed to apply to the package that wants recrdeps, then 
> it's wrong, sure. How to fix that is the question, we can't do
> 
> do_rootfs[recrdeptask] += "do_rootfs"
> 
> And yet we want to run do_rootfs for image after do_rootfs's for dependencies 
> were made.

Ok, I understand what you're trying to solve.

> It can't or we're talking about different multiimage situations.

It does work and its not really so different. For example:

http://git.pokylinux.org/cgit.cgi/poky/tree/meta/packages/images/poky-image-live.inc

>  I've written 
> already here, suppose you need different images that depend like this (real 
> example, BTW):
> 
>        /-8
>   /-2--+
> 1-+    +-9
>   |    |
>   +-3  \-10
>   |
>   +-4
>   |
>   \-5-6-7
> 
> So when I'm building image number 2, I need to have images 8, 9, 10 to be 
> built to place that images on image number 2. Same with 6-7, 5-6 and 1 to 2, 
> 3, 4, 5. Without that patch bitbake started do_rootfs for image number 2 
> before do_rootfs for 8, 9, 10 was done.
> 
> In order to solve it using standard package deps mechanism that commit was 
> made.

Images 1,2,5 and 6 need to specify they have dependencies on other image
rootfs tasks with something like:

do_rootfs[depends] += "some-other-image-task:do_rootfs"

Is there some reason this doesn't work?

Cheers,

Richard




