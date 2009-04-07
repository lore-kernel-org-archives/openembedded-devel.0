Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LrF9K-0006VR-VZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 19:32:01 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHQ001G1R7QKNTC@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Apr 2009 12:28:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3AC846B83A8; Tue,
	07 Apr 2009 13:28:38 -0400 (EDT)
Date: Tue, 07 Apr 2009 13:28:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090407172838.GC11203@denix.org>
References: <20090407170655.GG2195@smtp.west.cox.net>
MIME-version: 1.0
In-reply-to: <20090407170655.GG2195@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_40,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gcc: Fix 4.1.[012], 4.2.[1234] and	4.3.[123] SRC_URI to use ${GNU_MIRROR}
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
X-List-Received-Date: Tue, 07 Apr 2009 17:32:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 07, 2009 at 10:06:55AM -0700, Tom Rini wrote:
> gcc: Fix 4.1.[012], 4.2.[1234] and 4.3.[123] SRC_URI to use ${GNU_MIRROR} and update checksums.ini
>  This fixes a big problem with 4.3.3 as it wasn't using ftp.gnu.org but
>  an alternate mirror that's gone away.  Since I had to fix one I noticed
>  others not calling ${GNU_MIRROR} but ftp.gnu.org.  Also a few weren't
>  using ${PV}, so use that too.
> 
> ---
>  conf/checksums.ini        |   20 ++++++++++----------
>  recipes/gcc/gcc-4.1.0.inc |    2 +-
>  recipes/gcc/gcc-4.1.1.inc |    2 +-
>  recipes/gcc/gcc-4.1.2.inc |    2 +-
>  recipes/gcc/gcc-4.2.1.inc |    2 +-
>  recipes/gcc/gcc-4.2.2.inc |    2 +-
>  recipes/gcc/gcc-4.2.3.inc |    2 +-
>  recipes/gcc/gcc-4.2.4.inc |    2 +-
>  recipes/gcc/gcc-4.3.1.inc |    2 +-
>  recipes/gcc/gcc-4.3.2.inc |    2 +-
>  recipes/gcc/gcc-4.3.3.inc |    2 +-
>  11 files changed, 20 insertions(+), 20 deletions(-)

Acked-by: Denys Dmytriyenko <denis@denix.org>

I haven't tried this patch on the stable branch yet, but it works fine in .dev

-- 
Denys


