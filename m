Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NRwUK-0001ut-Df
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 00:37:31 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KVQ004N4XHPKAA4@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	04 Jan 2010 17:34:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0E6DE14AF60; Mon,
	04 Jan 2010 18:34:37 -0500 (EST)
Date: Mon, 04 Jan 2010 18:34:37 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100104233437.GB12135@denix.org>
References: <1262640317.3767.6.camel@gnutoo-desktop>
MIME-version: 1.0
In-reply-to: <1262640317.3767.6.camel@gnutoo-desktop>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: ro/rw boot order
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
X-List-Received-Date: Mon, 04 Jan 2010 23:37:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 04, 2010 at 10:25:17PM +0100, GNUtoo wrote:
> and menu.lst says root=/dev/hda1 ro
> 
> and in angstrom /etc/rcS.d there is:
> S03udev
> S10checkroot
> 
> And when booting it freeze unless you change udev/checkroot order or put
> rw to the kernel command line.
> 
> I bet that some people already started working arround the issue:
> CMDLINE = "root=/dev/sda1 rw init=/sbin/init console=ttyS2,115200n8
> mem=128M nohz=off"
> can be found in the archos5 machine config
> 
> what's the best fix for that?

AFAIK, the only write access udev initscript needs is to create the device 
cache. It is controlled by the DEVCACHE variable in the /etc/default/udev - 
either point it to a read-writeable and mounted partition or disable devcache 
by unsetting the variable (all Zaurus machines do that by default).

I've been meaning for some time now to fix it by moving the devcache handling 
after the checkroot... But since all my machines mount rootfs writeable, it 
hasn't been very critical for me - need to find some spare time actually do it 
properly :)

-- 
Denys


