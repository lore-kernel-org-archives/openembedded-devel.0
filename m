Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UOxIZ-0003KX-OQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Apr 2013 23:38:53 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 12647EA042
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2013 23:29:21 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 2D5E3A4070A; Sun,  7 Apr 2013 23:21:59 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2013 23:21:49 +0200
Message-Id: <cover.1365368283.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-handheld][PATCH v2 0/1] Pull request 20130407
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
X-List-Received-Date: Sun, 07 Apr 2013 21:38:56 -0000

Hello,

On Friday 05 April 2013, Apelete Seketeli wrote:
> Following the patches I sent to the meta-handheld layer a few days ago
> to add machine support for the Ben Nanonote, I found out that the
> corresponding kernel recipe fails to build on oe-core (builds fine on
> oe-classic).
> A few settings were missing and, more importantly, the version of gcc
> in oe-core seems to enable the -Wunused-but-set-variable switch, which
> makes it error on many variables that were indeed 'unused but
> set'. After trying to solve this issue the easy way, by setting
> 'CFLAGS=-Wno-error=unused-but-set-variable -Wno-error=unused-but-set-parameter'
> to no avail, I chose to annotate the aforementioned variables in the
> kernel code with __attribute__((__unused__)).
>
> The patches that come as a follow-up of this message are what it's all
> about; sorry for the inconvenience in the first place.

I took the time to fix the patch for the GCC 4.6 build issue. Instead
of just fixing the issue on my own, I looked at how it was done in the
mainline kernel and backported the fixes through a new patch named
fix-gcc-4.6.0-build-errors.patch; this approach seems more logical to
me.
While I was at it, also removed "[PATCH 2/2] ben-nanonote: add
DEFAULTTUNE to machine configuration" from the patchset, following
Paul's advice.

Tested by building linux-jlime-ben-nanonote from scratch on top of
master branch.
Please pull into meta-handheld.

The following changes since commit 913735dce388f660dfbbe288ed736e12ed48c8d8:

  linux-yocto-tiny-kexecboot_3.2: removed unused, non-working MTD-RW patch (2013-04-06 00:25:08 +0100)

are available in the git repository at:

  git://seketeli.fr/~apelete/meta-handheld.git fix-nn-kernel-build

Apelete Seketeli (1):
  linux-jlime-ben-nanonote: fix GCC-4.6 build errors

 .../fix-gcc-4.6.0-build-errors.patch               |  114 ++++++++++++++++++++
 .../linux/linux-jlime-ben-nanonote_2.6.36.bb       |    5 +-
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch

-- 
1.7.10.4



