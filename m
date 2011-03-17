Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q0Ijf-00052Z-Pb
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 20:19:51 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI700DAHUXO11F2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	17 Mar 2011 14:17:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1CEB914AF6A; Thu,
	17 Mar 2011 15:17:48 -0400 (EDT)
Date: Thu, 17 Mar 2011 15:17:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110317191748.GO3042@denix.org>
References: <1300325100-29332-1-git-send-email-denis@denix.org>
	<20110317141220.GA16796@rhein.zuhause.netz>
MIME-version: 1.0
In-reply-to: <20110317141220.GA16796@rhein.zuhause.netz>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Thu, 17 Mar 2011 19:19:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 17, 2011 at 03:12:21PM +0100, Henning Heinold wrote:
> Hi,
> 
> I looked deeper into the problem.
> Cairo looks first for:
> 
> return __sync_fetch_and_add
> __sync_val_compare_and_swap
> 
> and defines it as cairo_cv_atomic_primitives="Intel".
> 
> According to http://gcc.gnu.org/wiki/Atomic
> arm and sh3/4 should work too.
> 
> If the configure compile fails
> cairo is looking for libatomic-ops
> support.

Similar to what I observed (if not reversed):

* If libatomic-ops is not available (no atomic_ops.h), it chooses/falls back 
to "Intel" provider (i.e. kernel/gcc), which also works on ARM. It's similar 
to --disable-atomic

* If it finds atomic_ops.h previously staged, it chooses that as a provider, 
but since libatomic-ops was not built with emulated CAS for ARM, it later 
fails with the build error.

> The libatomic-ops in oe is very old and misses diffrent bug fixes and is only
> needed for ppc and mips.
> 
> I will try to clean the stuff up this evening, which proably applies to
> pulse-audio too.

If you are going to update libatomic-ops anyway, I won't bother adding 
AO_REQUIRE_CAS define myself. Thanks for looking into it.

-- 
Denys


