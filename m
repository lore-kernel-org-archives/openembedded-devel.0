Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Q4oj6-0001pM-N9
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 08:17:56 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 29D7A1D360AA; Wed, 30 Mar 2011 08:15:55 +0200 (CEST)
Date: Wed, 30 Mar 2011 08:15:55 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110330061555.GC2681@ibawizard.net>
References: <1301435199-30068-1-git-send-email-v2g.udel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1301435199-30068-1-git-send-email-v2g.udel@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Sachin Kamboj <skamboj@udel.edu>
Subject: Re: [PATCH] Add support for the Technologic Systems TS7500	ARM SBCs
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
X-List-Received-Date: Wed, 30 Mar 2011 06:17:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

UDel V2G Team <v2g.udel@gmail.com> [2011-03-29 17:46:39]:

> From: Sachin Kamboj <skamboj@udel.edu>
> 
> * Includes conf/machine/ts75xx.conf and conf/machine/include/tune-fa526.inc
>   files needed for building OE packages w/ EABI and *NO* thumb support
> * Adds recipes for building TS75xx userspace utilities:
>   canctl, dioctl, dmxctl, jed2vme, sdctl, ts7500ctl,  spiflashctl and xuartctl
> * Adds a custom kernel with all the patches for the Cavium FA 526 core
> * Added a busybox defconfig for building a version of busybox that will be
>   very similar to the shipped version
> * Added two images - one for building the initrd image and the other for
>   building the rootfs image.

Hi,

first of all thank you for your contribution. Please can you split your huge
patchset to the logical parts and send it as the patch series? ie. one patch
which adds ts75xx machine, one which adds kernel etc. It should be easy with
git rebase. It's really hard to make any comments and/or read it.  Thanks.

-- ynezz


