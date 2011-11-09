Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RNx4J-0003bA-DV
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 02:35:11 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LUD00L0LDFCUM45@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	08 Nov 2011 19:28:29 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E01D114AF5D; Tue,
	08 Nov 2011 20:28:23 -0500 (EST)
Date: Tue, 08 Nov 2011 20:28:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111109012823.GD15391@denix.org>
References: <loom.20111108T225635-677@post.gmane.org>
	<loom.20111109T001647-942@post.gmane.org>
MIME-version: 1.0
In-reply-to: <loom.20111109T001647-942@post.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Anstrom boot hang with MACHINE=i686-generic	and?DISTRO=anstrom-2010.x
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
X-List-Received-Date: Wed, 09 Nov 2011 01:35:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Nov 08, 2011 at 11:19:45PM +0000, Greg Kogut wrote:
> Greg Kogut <gkogut <at> yahoo.com> writes:
> 
> > 
> > I've tried both console-image and x11-image. 
> 
> 
> Edit:
> 
> I was able to to boot fully after appending "-o rw" to the "root"
> kernel parameter.
> 
> I suspect the issue was that the read-only mount was not allowing
> udev to correctly populate /dev with the tty devices passed to 
> getty, and getty was flummoxed.
> 
> So I'm amending my question:  Help a n00b -what's the standard
> practice with respect to maintaining an embedded-safe read-only
> rootfs while allowing udev to do its thang?   Separate partition
> for /dev? 

Actually, /dev is usually a separate partition already, when managed by devfs, 
udev or mdev. Unless you manage /dev manually with static devnodes, which is 
not the case for you, as you mentioned udev... Check your /etc/fstab or 
mount/mtab to see how /dev is mounted - in most cases should be RAM-based 
tmpfs handled by udev. Also, you may want to disable devcache by editing 
/etc/default/udev and commenting the DEVCACHE variable.

-- 
Denys


