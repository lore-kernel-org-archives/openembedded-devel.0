Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MH5Ji-0000B7-59
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 02:17:23 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLE009NVQYUR1F1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	17 Jun 2009 19:06:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3B01E14AF5F; Wed,
	17 Jun 2009 20:06:30 -0400 (EDT)
Date: Wed, 17 Jun 2009 20:06:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090618000630.GD21132@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Suppress kernel image from the filesystem image
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
X-List-Received-Date: Thu, 18 Jun 2009 00:17:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

When discussing the issue of suppressing the kernel image from the filesystem 
image, it was suggested it is still an open question:

<Crofton|work> the kernel image getting installed in the image has been a long 
standing headache

Several ways were mentioned, like fiddling with FILES variable and using 
BAD_RECOMMENDATIONS. But the correct method is supposed to be overriding the 
RDEPENDS_kernel-base from kernel.bbclass:

<pb___> denix0: these lines seem to suggest what the intended behaviour was:
<pb___> # Allow machines to override this dependency if kernel image files are
<pb___> # not wanted in images as standard
<pb___> RDEPENDS_kernel-base ?= "kernel-image"
<pb___> but, for reasons that are not entirely clear to me at the moment, my 
efforts to override RDEPENDS_kernel-base did not meet with success.

I played with it for some time and realized that in order for it to work, the 
kernel needs to be rebuilt before the new dependencies take place. So, I 
added this to the local.conf:

RDEPENDS_kernel-base = ""

And after rebuilding the kernel and the filesystem I no longer see kernel 
image in the filesystem!

The only problem I see with this approach is it builds the kernel packages 
differently (USE-flags, anyone?) and if I use a public feed, I may end up 
installing kernel image into the system again...

-- 
Denys


