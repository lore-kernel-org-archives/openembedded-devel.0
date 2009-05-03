Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M0TZy-0004dh-HS
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 May 2009 06:45:30 +0200
Received: from gandalf.denix.org ([71.251.49.215]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJ10054RWY6ANQB@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	02 May 2009 23:39:48 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 24EF46B804A; Sun,
	03 May 2009 00:39:42 -0400 (EDT)
Date: Sun, 03 May 2009 00:39:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090503043941.GA10690@denix.org>
References: <49FAE94F.2090101@doredevelopment.dk>
MIME-version: 1.0
In-reply-to: <49FAE94F.2090101@doredevelopment.dk>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Pull request from Dor?Development - New: Micro	distro/image
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
X-List-Received-Date: Sun, 03 May 2009 04:45:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 01, 2009 at 02:21:35PM +0200, Martin Lund wrote:
> The "Micro" distribution/image is created because we feel that there is a 
> need for a truly tiny and clean distro and image definition in OE for those 
> users out there that needs a _very_ tiny Linux rootfs with virtually 
> nothing installed except busybox, libc, udev, and a few init scripts. On 
> arm the jffs2 image size is only 1 MB (uclibc based). No bloat allowed.
>
> The micro-image is ideal for users who wants this type of tiny Linux rootfs 
> system with only a few custom applications added.

Hmm, about 7 years ago I was working on a project of a Linux-based DSL router, 
which had a filesystem of about 1 MB in size with all the possible networking 
apps plus some custom management, control and diagnostic apps... It was also 
busybox and uclibc based, but was squash+lzma to squeeze every bit out of it.
And back then busybox didn't have all the networking tools integrated yet, as 
it has these days...

-- 
Denys


