Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MpopU-0007MS-Lq
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 21:45:47 +0200
Received: from guest-wireless.nrcc.noklab.com ([4.53.58.19]
	helo=[192.168.0.199])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mpoov-0006UL-2r
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 20:45:09 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1253549226-16186-1-git-send-email-denis@denix.org>
References: <1253549226-16186-1-git-send-email-denis@denix.org>
Date: Mon, 21 Sep 2009 20:45:06 +0100
Message-Id: <1253562306.16477.38.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Mon, 21 Sep 2009 19:45:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-21 at 12:07 -0400, Denys Dmytriyenko wrote:
>  iface eth0 inet dhcp
> +        pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
> +

This is pretty gruesome.  It will introduce an extra two fork+exec's
worth of overhead to every "ifup eth0" for everybody, and it also fails
to check that the ip= parameter actually corresponded to eth0 (i.e. it
would stop eth0 coming up even if the parameter was specifying an
address for eth1).  

It seems like there must be a better way of solving this problem.  How
about just teaching "ifup -a" to spot interfaces that are already up and
leave them alone?

p.




