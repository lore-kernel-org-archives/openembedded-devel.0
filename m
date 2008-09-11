Received: from [206.46.252.42] (helo=vms042pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KdsGR-0000JP-02
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Sep 2008 21:55:39 +0200
Received: from gandalf.denix.org ([71.255.232.65])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K71006TAR7WQ3J3@vms042.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	11 Sep 2008 14:52:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A0BA46B8008; Thu,
	11 Sep 2008 15:52:43 -0400 (EDT)
Date: Thu, 11 Sep 2008 15:52:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20080911195243.GA16359@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: RFC: SDK/external-toolchain fixes
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
X-List-Received-Date: Thu, 11 Sep 2008 19:55:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

I've been playing with OE's SDK and external-toolchain features lately and
stumbled upon couple of issues. Thanks to Philip Balister for commiting
trivial fixes in, now I have 2 more, which require wider review. Please let
me know of any problems or comments. Thanks.


#1 gcc-cross-sdk 4.3.1 missing include-fixed
http://bugs.openembedded.net/show_bug.cgi?id=4536

gcc 4.3.x has some GCC-provided headers in include-fixed (namely limits.h),
which are missing in the gcc-cross-sdk version, rendering external toolchain
unusable.

Provided patch copies them in the include directory as a temporary solution.
A similar temporary solution is present in gcc-cross_4.3.1, see
do_stage_append()


#2 external-toolchain misses providing runtime libgcc
http://bugs.openembedded.net/show_bug.cgi?id=4542

Since external-toolchain misses specifying libgcc as provided runtime library,
dependency tree picks up either gcc-cross or even gcc-noemu...

Attached patch fixes the problem.


-- 
Denys


