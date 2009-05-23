Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1M7yBd-0004PF-Mc; Sat, 23 May 2009 22:51:23 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1M7y43-00045Y-WE; Sat, 23 May 2009 21:43:32 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A185B31.8050003@gremlin.it>
References: <4A185B31.8050003@gremlin.it>
Date: Sat, 23 May 2009 21:43:30 +0100
Message-Id: <1243111410.4226.109.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: trouble with ext2 filesystem
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
X-List-Received-Date: Sat, 23 May 2009 20:51:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-23 at 22:23 +0200, Alessandro GARDICH wrote:
> At now I modify qemux86.conf cause usually EXTRA_IMAGECMD is in the 
> machine config file, but to add hardware specific parameters (flash size 
>   and erase size). I'm not sure if is the right place. Probably in the 
> distro configuration could be better.

The distro config probably is the right place for this.  After all, the
number of inodes you need depends primarily on the number of files that
you're going to ship in the rootfs, and that in turn is primarily
influenced by the DISTRO's policies rather than by any inherent aspect
of the MACHINE.

The other uses of EXTRA_IMAGECMD that I guess you're thinking of are
mostly to do with jffs2 parameters, which are rather different in that
they're determined by the specifics of the hardware in use and hence do
go with the MACHINE rather than the DISTRO.

p.




