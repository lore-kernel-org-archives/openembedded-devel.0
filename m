Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TM5NF-0001g2-1m
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 01:07:33 +0200
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBP00AET669LT40@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	10 Oct 2012 16:54:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3F1C1200D7; Wed,
	10 Oct 2012 17:54:08 -0400 (EDT)
Date: Wed, 10 Oct 2012 17:54:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20121010215408.GH16944@denix.org>
References: <1349907519-17119-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1349907519-17119-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 0/1][for-denzil] kernel: cherry-pick header fix
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
X-List-Received-Date: Wed, 10 Oct 2012 23:07:33 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 10, 2012 at 05:18:38PM -0500, Chase Maupin wrote:
> All,
> 
> This patch is a cherry-pick of the change made in meta-openembedded
> master to fix the kernel header staging location.  Without this
> change builds of external modules using the denzil branch will fail
> to find the staged headers because they will be looking in the
> "kernel" directory instead of the "usr/src/kernel" directory.
> 
> The STAGING_KERNEL_DIR set in bitbake.conf of oe-core in the
> denzil branch of the repository has already been updated to use
> ${STAGING_DIR_HOST}/usr/src/kernel
> 
> I hope I got this patch formatted right since I just did a
> cherry-pick into my denzil branch and created the patch.  If this
> is not the correct format please let me know.  The commit I
> cherry-picked was 8c724c4ab8e946763c813e5174dbfd5ac8a5ddda
> 
> Darren Hart (1):
>   kernel: Add kernel headers to kernel-dev package
> 
>  meta-oe/classes/kernel.bbclass |   27 ++++++++++++---------------
>  1 files changed, 12 insertions(+), 15 deletions(-)

FYI, it is already in the queue with other related patches. See my earlier 
email.

-- 
Denys


