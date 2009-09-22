Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Mq5Qk-0003sA-6C
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 15:29:21 +0200
Received: from nrcc-l3-gateway.nrcc.noklab.com ([4.53.58.22]
	helo=[10.200.200.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mq5Q6-0006Wa-Bx
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 14:28:39 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090921223956.GF3599@denix.org>
References: <1253549226-16186-1-git-send-email-denis@denix.org>
	<1253562306.16477.38.camel@lenovo.internal.reciva.com>
	<20090921223956.GF3599@denix.org>
Date: Tue, 22 Sep 2009 14:28:32 +0100
Message-Id: <1253626112.16477.58.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] netbase: don't start udhcpc if kernel assigned IP statically
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
X-List-Received-Date: Tue, 22 Sep 2009 13:29:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-21 at 18:39 -0400, Denys Dmytriyenko wrote:
> On Mon, Sep 21, 2009 at 08:45:06PM +0100, Phil Blundell wrote:
> > It seems like there must be a better way of solving this problem.  How
> > about just teaching "ifup -a" to spot interfaces that are already up and
> > leave them alone?
> 
> Won't work for the case of kernel-acquired DHCP address, i.e. kernel level 
> autoconfig, aka IP_PNP, aka ip=dhcp command line.

True, but your original patch won't help with this situation either
(since "ip=dhcp" won't match the regex).  I think this is a different
problem and probably requires a different solution: the ideal thing
would be for the kernel to set a flag on the interface to say that it
needs to be taken over by a DHCP client, or alternatively to invoke the
DHCP client itself via the hotplug mechanism.  Failing that you could
arrange for the startup scripts to poke around at /proc/cmdline and try
to second-guess what the kernel has done, although that would be rather
less satisfactory.

p.




