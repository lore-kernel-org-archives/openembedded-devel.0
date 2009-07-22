Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MTbrG-0006wW-Mw
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 15:27:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 833A251917C;
	Wed, 22 Jul 2009 09:13:37 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12332-04; Wed, 22 Jul 2009 09:13:37 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 5A2AC519178;
	Wed, 22 Jul 2009 09:13:37 -0400 (EDT)
Date: Wed, 22 Jul 2009 09:13:37 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@openembedded.org
In-Reply-To: <1248252799.10252.5.camel@dax.rpnet.com>
Message-ID: <Pine.LNX.4.64.0907220859010.3621@juice.ott.cti.com>
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<1248212992.26475.35.camel@dax.rpnet.com>
	<4A66482B.6010304@cbnco.com> <1248252799.10252.5.camel@dax.rpnet.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
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
X-List-Received-Date: Wed, 22 Jul 2009 13:27:57 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 22 Jul 2009, Richard Purdie wrote:

> On Tue, 2009-07-21 at 18:58 -0400, Michael Smith wrote:

> So task 7 depends on task 9 which depends on task 8 which depends on
> task 7. Its lists what tasks 7, 8 and 9 are.

Ah. Sorry, router exploded, broke brain. The loop message is fairly self 
explanatory, now that I actually read it.

I get a similar problem with micro-image:

Dependency loop #1 found:
  Task 7 (/home/michael/git/toastix/oe/recipes/images/micro-image.bb, 
do_install) (depends: set([9, 6]))
  Task 8 (/home/michael/git/toastix/oe/recipes/images/micro-image.bb, 
do_populate_staging) (depends: set([7]))   
  Task 9 (/home/michael/git/toastix/oe/recipes/images/micro-image.bb, 
do_rootfs) (depends: set([385, 387, 133, 6, 135, 8, 265, 13, [...]

Dependency loop #2 found:
  Task 7 (/home/michael/git/toastix/oe/recipes/images/micro-image.bb, 
do_install) (depends: set([9, 6]))
  Task 11 (/home/michael/git/toastix/oe/recipes/images/micro-image.bb, 
do_package) (depends: set([7]))
  Task 13 (/home/michael/git/toastix/oe/recipes/images/micro-image.bb, 
do_package_write_deb) (depends: set([11]))
  Task 9 (/home/michael/git/toastix/oe/recipes/images/micro-image.bb, 
do_rootfs) (depends: set([385, 387, 133, 6, 135, 8, 265, 13, [...]


Before the patch, I have dependencies for

<image>.do_package -> <image>.do_install -> <image>.do_rootfs

Also, <image>.do_package_write_deb -> <image>.do_package.

At the top of the thread you wrote about extra dependecies being 
introduced (<image>.do_rootfs -> <image>.do_package_write_ipk, or 
write_deb in my case). I think this is what creates the loop.

I can get you instructions for building with the overlay if you like -- 
contact me off list if you're interested.

Mike


