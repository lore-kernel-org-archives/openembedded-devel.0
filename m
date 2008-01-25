Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JIEBC-000162-UY
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2008 03:20:31 +0100
Received: from PROMETHEUS (e180134175.adsl.alicedsl.de [85.180.134.175])
	by drlauer-research.com (Postfix) with ESMTP id 52B38584BBE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2008 03:23:53 +0100 (CET)
Date: Fri, 25 Jan 2008 03:20:34 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1006359817.20080125032034@vanille-media.de>
CC: openembedded-devel@lists.openembedded.org
In-Reply-To: <005601c85ef5$ff21c1e0$e10b10ac@nagarwaldt>
References: <1071844182.20080125025043@vanille-media.de>
	<005601c85ef5$ff21c1e0$e10b10ac@nagarwaldt>
MIME-Version: 1.0
Subject: Re: task-base image issue!
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
X-List-Received-Date: Fri, 25 Jan 2008 02:20:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

(Note: Please keep the discussion on-list)

> There are couple of "bb" files in that
> /org.openembedded.dev/packages/images
> so which how do I know which one I need?

First, the name may give an indication (console, x11, ...), then just
check which tasks they actually depend on to get an idea which
packgages a certain image may drag in.

> Also how can these images created be used by the client so that it becomes
> independent? how do we boot here?

I don't know, this is board specific. I never used a diskless client

> I was trying to change my distro to angstrom 2008.1 but I get the below
> error:

angstrom 2008.1 contains a lot of bleeding edge stuff. I wouldn't use
it. Perhaps someone could extract the most things from angstrom 2007
configuration (which now is in a branch) and bring the generic distro
back to live.

> | (.text+0xafe63): undefined reference to `__sync_val_compare_and_swap_4'
> |
> /home/nagarwal/OE/build/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6.
> 1-r1/build-i686-angstrom-linux/libc_pic.os: In function
> `__GI___libc_freeres':
> | (__libc_freeres_fn+0x5d7): undefined reference to
> `__sync_bool_compare_and_swap_4'
> | collect2: ld returned 1 exit status
> | make[1]: ***
> [/home/nagarwal/OE/build/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6
> .1-r1/build-i686-angstrom-linux/libc.so] Error 1
> | make[1]: Leaving directory
> `/home/nagarwal/OE/build/tmp/work/i686-angstrom-linux/glibc-intermediate-2.6
> .1-r1/glibc-2.6.1'

Try building an older glibc. You can do this by setting
PREFERRED_VERSION.

Regards,

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



