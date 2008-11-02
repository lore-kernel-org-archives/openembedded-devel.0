Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KwXfl-0002bQ-UN
	for openembedded-devel@openembedded.org; Sun, 02 Nov 2008 08:46:57 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KwXeX-0001jl-5f
	for openembedded-devel@openembedded.org; Sun, 02 Nov 2008 07:45:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 02 Nov 2008 07:45:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 02 Nov 2008 07:45:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 02 Nov 2008 08:45:30 +0100
Message-ID: <gejlqq$ivd$1@ger.gmane.org>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>	<20081031233753.43f5f09d.raster@rasterman.com>	<gef9q7$o65$1@ger.gmane.org>	<20081101085334.8afcd730.raster@rasterman.com>	<geh3kt$bp7$1@ger.gmane.org>
	<1225539496.4090.6.camel@utx.utx.cz>
	<1225567242.4235.471.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081025 Shredder/3.0b1pre
In-Reply-To: <1225567242.4235.471.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig on boot when ld.so. conf is present
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
X-List-Received-Date: Sun, 02 Nov 2008 07:46:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-11-2008 20:20, Phil Blundell wrote:

> Just as an aside, there isn't really any need to have complicated
> runtime logic to handle all possible combinations of DISTRO policy.  Any
> single DISTRO would clearly have only one policy (for example, either it
> uses a package manager or it doesn't) and hence it can make these
> determinations at build time.

That's awfully shortsighted and not the direction OE has been going in 
for the past years. A small example:

* kernel
* initramfs/initrd
* rootfs

Only the rootfs has a packagemanager, but the initramfs/initrd doesn't. 
This shows that a single distro can build image both with and without 
packagemanagement.
Saying "distros should only do <foo>" is for the distros to decide.

regards,

Koen



