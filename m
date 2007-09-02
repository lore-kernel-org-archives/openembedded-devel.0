Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IRdUp-000463-0X
	for openembedded-devel@openembedded.org; Sun, 02 Sep 2007 02:39:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l820b6w7024223
	for <openembedded-devel@openembedded.org>;
	Sun, 2 Sep 2007 01:37:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23748-09 for <openembedded-devel@openembedded.org>;
	Sun,  2 Sep 2007 01:37:03 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l820ax1s024217
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 2 Sep 2007 01:36:59 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <46D9A492.5090601@dominion.kabel.utwente.nl>
References: <46D7FBA9.7060104@dominion.kabel.utwente.nl>
	<1188653475.5722.1.camel@localhost.localdomain>
	<46D9A492.5090601@dominion.kabel.utwente.nl>
Date: Sun, 02 Sep 2007 01:36:58 +0100
Message-Id: <1188693418.5722.19.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC][PATCH] Merging classes with poky
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
X-List-Received-Date: Sun, 02 Sep 2007 00:39:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-09-01 at 19:42 +0200, Koen Kooi wrote:
> Richard Purdie schreef:
> > I haven't looked closely at the diff yet but the above should not be
> > merged back in. I removed it from OE.dev since its broken and the same
> > (correct) information can be obtained with "bitbake -e". I will remove
> > it from Poky too in due course.
> 
> Updated diffs at http://dominion.kabel.utwente.nl/koen/OE/poky/
> 
> Changes:
> 
> * remove showdata
> * make rootfs_deb.bbclass work with current .dev

Given the ton of changes involved, I've committed a number of them that
hopefully hasn't actually changed any behaviours in OE but have brought
OEs and Poky's classes much more in sync.

http://www.rpsys.net/openzaurus/temp/behaviour_change.patch is a
(reverse) diff which will change the way OE does certain things. There
are two main ones:

1. pkgmaps moves from ${STAGING_DIR}/pkgdata/ to
${STAGING_DIR}/pkgdata/${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS} in
the multimachine case.

2. Enable the do_package_write_ipk, do_package_write_deb and other
separate tasks instead of running them all within do_package_write. The
big benefit here is you can then enable some new package class at some
point halfway through a build and bitbake will "do the right thing". It
also improves the number of tasks we can run in parallel slightly.

Any thoughts/comments on these or should I check them in along with a
warning about needing to wipe the install stamps at the very least on
existing builds?

Also of note is that I've synced up poky's meta-toolchain changes.
Distros should be able to customise the SDK this generates by changing
TOOLCHAIN_TARGET_TASK. I've added in Poky's TOOLCHAIN_HOST_TASK under a
more generic name since I suspect that will work well for most people.

The other half to this is Poky's external-poky-toolchain.bb which is
basically equivalent to ASSUME_PROVIDEing the standalone toolchain built
above. If distros in OE want to support using pregenerated toolchains
please look at that code but it will need distro support to make it work
properly as the appropriate PREFERRED_PROVIDERS need to be set.

Another quick things I've noticed is the empty /dev directories in some
peoples images were caused because the PR on makedevs hadn't been bumped
meaning some autobuilders hadn't see that change and were not using up
to date code.

Cheers,

Richard




