Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MprYl-00047S-Gq
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 00:40:42 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQC005MSEYLXF89@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	21 Sep 2009 17:39:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8578D14AF5F; Mon,
	21 Sep 2009 18:39:56 -0400 (EDT)
Date: Mon, 21 Sep 2009 18:39:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090921223956.GF3599@denix.org>
References: <1253549226-16186-1-git-send-email-denis@denix.org>
	<1253562306.16477.38.camel@lenovo.internal.reciva.com>
MIME-version: 1.0
In-reply-to: <1253562306.16477.38.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] netbase: don't start udhcpc if kernel	assigned IP statically
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
X-List-Received-Date: Mon, 21 Sep 2009 22:40:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 21, 2009 at 08:45:06PM +0100, Phil Blundell wrote:
> On Mon, 2009-09-21 at 12:07 -0400, Denys Dmytriyenko wrote:
> >  iface eth0 inet dhcp
> > +        pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
> > +
> 
> This is pretty gruesome.  It will introduce an extra two fork+exec's
> worth of overhead to every "ifup eth0" for everybody, and it also fails
> to check that the ip= parameter actually corresponded to eth0 (i.e. it
> would stop eth0 coming up even if the parameter was specifying an
> address for eth1).  

I would agree it's a quick and dirty fix, that's why it's RFC :)

As in my case we only have eth0, I didn't bother touching eth1 or any other 
interface.

Also, while the proper and complete format for the ip= parameter is:
ip=<ipaddr>:<serverip>:<gatewayip>:<netmask>:<hostname>:<iface>:<state>

Many users just specify the IP address on the command line:
ip=<ipaddr>

In this case the IP would be assigned to the first available interface, so it 
is harder to do it from the /etc/network/interfaces file using pre-up...

> It seems like there must be a better way of solving this problem.  How
> about just teaching "ifup -a" to spot interfaces that are already up and
> leave them alone?

Won't work for the case of kernel-acquired DHCP address, i.e. kernel level 
autoconfig, aka IP_PNP, aka ip=dhcp command line.

From ifup perspective the interface is up and IP is assigned, but we need to 
start udhcpc to re-acquire and keep the lease, as kernel can't do this.

Speaking of which, I am working on a fix for udhcpc to also properly handle 
this case - it needs to be started with -r <ip> to request the same IP that 
kernel received, instead of asking for any available... Some DHCP servers are 
stupid and give a different IP, killing NFS/TCP mounted rootfs...


So, the discussion is still open - please send your comments/suggestions. 
Thanks.

-- 
Denys


