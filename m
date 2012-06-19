Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sh6TC-0006hA-1V
	for openembedded-devel@openembedded.org; Wed, 20 Jun 2012 00:00:18 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id A40E4EA042;
	Tue, 19 Jun 2012 23:57:16 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 9606B604DE; Tue, 19 Jun 2012 23:49:33 +0200 (CEST)
Date: Tue, 19 Jun 2012 23:49:33 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120619214933.GG4845@hermes>
References: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
	<1340062930-19293-2-git-send-email-apelete@seketeli.net>
	<20120619052932.GN3178@jama.jama.net>
	<20120619060703.GA4845@hermes>
	<20120619063448.GO3178@jama.jama.net>
	<20120619195610.GC4845@hermes>
MIME-Version: 1.0
In-Reply-To: <20120619195610.GC4845@hermes>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][gtk+][PATCH v2 0/2] gtk+: fix build issue by not building demo programs
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
X-List-Received-Date: Tue, 19 Jun 2012 22:00:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Here is another attempt to fix the following build issue:

| Making all in demos
| make[2]: Entering directory `/home/apelete/devel/bitbake/build/tmp/work/mipsel-oe-linux/gtk+-2.20.1-r10.4/gtk+-2.20.1/demos'
| /usr/bin/gdk-pixbuf-csource --raw --build-list		\
| 	        apple_red  ./apple-red.png	\
|                 gnome_foot ./gnome-foot.png	\
|         > test-inline-pixbufs.h				\
| 	|| (rm -f test-inline-pixbufs.h && false)
| failed to load "./apple-red.png": Couldn't recognize the image file format for file './apple-red.png'
| make[2]: *** [test-inline-pixbufs.h] Error 1
| make[2]: Leaving directory `/home/apelete/devel/bitbake/build/tmp/work/mipsel-oe-linux/gtk+-2.20.1-r10.4/gtk+-2.20.1/demos'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/apelete/devel/bitbake/build/tmp/work/mipsel-oe-linux/gtk+-2.20.1-r10.4/gtk+-2.20.1'
| make: *** [all] Error 2

As a solution, I chose to discard the build of all the demo programs
by removing the corresponding build instructions in demos/Makefile.am
in the source package.
Do we really need those demo programs when building for an embedded
target ?

I also jumped on the occasion to rebase the no-demos.patch that was
applied to gtk+-native only (patch which intentionally disable the
demo prgrams for gtk+-native, but not for target).

The two patches that come as a follow-up of this message are what it's
all about.

Apelete Seketeli (2):
  gtk+: Rebase gtk+-2.20.1/no-demos.patch
  gtk+: Add no-test-inline-pixbufs.patch to gtk+-2.20.1

 recipes/gtk+/gtk+-2.20.1/no-demos.patch            |    7 ++++---
 .../gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch  |   22 ++++++++++++++++++++
 recipes/gtk+/gtk+_2.20.1.bb                        |    1 +
 3 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch

-- 
1.7.10


-- 
        Apelete


