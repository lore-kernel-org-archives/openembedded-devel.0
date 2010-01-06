Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NSL6P-0003uj-GJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 02:54:28 +0100
Received: from gandalf.denix.org ([71.255.235.232]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KVS009PDYJ8ROYV@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Jan 2010 19:52:20 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 14FEC14AF60; Tue,
	05 Jan 2010 20:52:20 -0500 (EST)
Date: Tue, 05 Jan 2010 20:52:20 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100106015220.GD12135@denix.org>
References: <1262678000.5798.9.camel@dejunliu-desktop>
	<1262684483.2553.157.camel@lenovo.internal.reciva.com>
	<1262739710.5798.14.camel@dejunliu-desktop>
MIME-version: 1.0
In-reply-to: <1262739710.5798.14.camel@dejunliu-desktop>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: x11-image can't start up
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
X-List-Received-Date: Wed, 06 Jan 2010 01:54:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 05, 2010 at 10:01:50PM -0300, Dejun.Liu wrote:
> Hi,
> 
> Sorry for the delay in replying,my company's email server is down.
> 
> On Tue, 2010-01-05 at 09:41 +0000, Phil Blundell wrote:
> > On Tue, 2010-01-05 at 04:53 -0300, Dejun.Liu wrote:
> > > Hi,
> > > 
> > > I have build angstrom x11-image and test it with Qemu,
> > > 
> > > But Qemu failed to start up.
> > > 
> > > i dig the reason find that system have no more inodes to use.
> > [...]
> > > so does anyone know how to fix it in OE?
> > 
> > Check your IMAGE_CMD,  You didn't mention what filesystem you are using,
> > but I'm guessing it's probably ext2.  In that case, I think you need to
> > add a suitable -N or -i option to genext2fs.
> -->yes i used the ext2 filesystem,because im not family with the OE
> build system,so i can't find where is genext2fs.it's my first time to
> build OE.would you like to tell me which recipe should i fix?

Add something like this in the image recipe or your local.conf:

EXTRA_IMAGECMD_ext2.gz += "-i 4096"

> ---------------------------------------------------------------------------------------------------
> Confidentiality Notice: The information contained in this e-mail and any accompanying attachment(s) 
> is intended only for the use of the intended recipient and may be confidential and/or privileged of 
> Neusoft Corporation, its subsidiaries and/or its affiliates. If any reader of this communication is 
> not the intended recipient, unauthorized use, forwarding, printing,  storing, disclosure or copying 
> is strictly prohibited, and may be unlawful.If you have received this communication in error,please 
> immediately notify the sender by return e-mail, and delete the original message and all copies from 
> your system. Thank you. 
> ---------------------------------------------------------------------------------------------------

http://goldmark.org/jeff/stupid-disclaimers/

-- 
Denys


