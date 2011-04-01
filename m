Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q5WxF-0006OA-PG
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 07:31:29 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LIY008AXKKYG9A0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	01 Apr 2011 00:29:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id ADDA314AF6C; Fri,
	01 Apr 2011 01:29:22 -0400 (EDT)
Date: Fri, 01 Apr 2011 01:29:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110401052922.GH23178@denix.org>
References: <AANLkTikZZcRSnzJqEFgwoiYp+1KuF9ukZ4YJ+ZNJzZBx@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTikZZcRSnzJqEFgwoiYp+1KuF9ukZ4YJ+ZNJzZBx@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: How to exclude a package from a rootfs?
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
X-List-Received-Date: Fri, 01 Apr 2011 05:31:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 01, 2011 at 03:37:48PM +1300, Charles Manning wrote:
> I'm building a customised rootfs somewhat similar to omap3-console-image.
> 
> Various dependencies cause the inclusion of /boot/uImage* which is not
> required in the rootfs, so I want to exclude it.
> 
> I tried using BAD_RECOMMENDATIONS = "kernel-image-" but that did not work.
> The log shows that it identified the right package suring the
> BAD_RECOMMENDATIONS processing in rootfs-ipk.bbclass but the file is
> still in the output rootfs.
> 
> 
> Any other hints?

RDEPENDS_kernel-base = ""

-- 
Denys


