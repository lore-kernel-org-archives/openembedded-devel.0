Received: from vms173015pub.verizon.net ([206.46.173.15])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SUQhK-0002HY-HP
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 00:58:45 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4300I5G6039DH1@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	15 May 2012 17:48:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 81792201B8; Tue,
	15 May 2012 18:48:03 -0400 (EDT)
Date: Tue, 15 May 2012 18:48:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20120515224802.GJ14763@denix.org>
References: <CAJfOToUiw6yqaY8ski5XHXja1c_PNeNTO-MDJjVZhZb308WahA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJfOToUiw6yqaY8ski5XHXja1c_PNeNTO-MDJjVZhZb308WahA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: 169.254 subnet
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
X-List-Received-Date: Tue, 15 May 2012 22:58:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 15, 2012 at 03:34:56PM -0700, John Tobias wrote:
> Hello All,
> 
> My board has a eth0 and wireless interfaces. I manually executed the
> following commands to configured my network interfaces:
> 
> 1. ifconfig eth0 192.168.3.139 netmask 255.255.255.0 up
> 2. ifconfig wlan0:1 inet 169.254.6.199 netmask 255.255.0.0 broadcast
> 169.254.255.255 up
> 
> 
> My Routing table:
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use
> Iface
> 192.168.3.0     *               255.255.255.0   U     0      0        0 eth0
> 169.254.0.0     *               255.255.0.0     U     0      0        0 ra0
> 
> 
> My other machine is in 192.168.3.x subnet and I am able to ping the
> 192.168.3.139. But, the problem is I can ping the 169.254.6.199 too.
> 
> Is there any special on 169.254 because by using the said subnet it seems
> the two interfaces has a cross over routing?.

http://en.wikipedia.org/wiki/Link-local_address

-- 
Denys


