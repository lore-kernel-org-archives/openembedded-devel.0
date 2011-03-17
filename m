Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q0LHW-0006WV-Fm
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 23:02:58 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI800DZX2GVUGY5@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	17 Mar 2011 17:00:44 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1F56F14AF6A; Thu,
	17 Mar 2011 18:00:31 -0400 (EDT)
Date: Thu, 17 Mar 2011 18:00:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20110317220031.GP3042@denix.org>
References: <1300325100-29332-1-git-send-email-denis@denix.org>
	<20110317141220.GA16796@rhein.zuhause.netz>
	<20110317191748.GO3042@denix.org>
	<AANLkTimAMd88wthcF_fqG5+9rE1UjLmayMPFco7xhS2d@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTimAMd88wthcF_fqG5+9rE1UjLmayMPFco7xhS2d@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 17 Mar 2011 22:02:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 17, 2011 at 02:36:48PM -0700, Khem Raj wrote:
> On Thu, Mar 17, 2011 at 12:17 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Thu, Mar 17, 2011 at 03:12:21PM +0100, Henning Heinold wrote:
> >> Hi,
> >>
> >> I looked deeper into the problem.
> >> Cairo looks first for:
> >>
> >> return __sync_fetch_and_add
> >> __sync_val_compare_and_swap
> >>
> >> and defines it as cairo_cv_atomic_primitives="Intel".
> >>
> >> According to http://gcc.gnu.org/wiki/Atomic
> >> arm and sh3/4 should work too.
> >>
> >> If the configure compile fails
> >> cairo is looking for libatomic-ops
> >> support.
> >
> > Similar to what I observed (if not reversed):
> >
> > * If libatomic-ops is not available (no atomic_ops.h), it chooses/falls back
> > to "Intel" provider (i.e. kernel/gcc), which also works on ARM. It's similar
> > to --disable-atomic
> 
> are you sure that --disable-atomic will still prod for atomics in
> gcc/kernel my guess is it
> will disable atomics for good.

Ah, looking deeper into configure script and resulting config.h from both cases 
reveals the actual differences, so you are correct. Unfortunately, there is no 
way to specify --atomic=intel (or any other one) and it does the automatic 
guesswork selecting one or another. And if libatomic-ops is installed, there 
is no way to override it... So, looks like fixing libatomic-ops is the right 
way. I'll wait for Henning to update the recipe for libatomics-ops, otherwise 
I can submit a patch to define AO_REQUIRE_CAS emulation for the temporary 
solution.

-- 
Denys


