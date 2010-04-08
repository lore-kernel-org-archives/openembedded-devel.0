Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Nzrto-00077V-AI
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 15:36:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 08322A47A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 14:32:38 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Zo1s7j1-+BGv
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 14:32:37 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 1DCDEA452E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Apr 2010 14:32:37 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id BD2F528A57; Thu,  8 Apr 2010 14:33:18 +0100 (BST)
Date: Thu, 8 Apr 2010 14:33:18 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100408133318.GD2262@xora-desktop.xora.org.uk>
References: <l2pfca63bcf1004080544ze5d9af0cw4c3b1ea9ea30e597@mail.gmail.com>
	<20100408125317.GC2262@xora-desktop.xora.org.uk>
	<1270732742.4395.2.camel@becca>
MIME-Version: 1.0
In-Reply-To: <1270732742.4395.2.camel@becca>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] omap3-mkcard.sh: Adding sleep and umounts to fix race cond.
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
X-List-Received-Date: Thu, 08 Apr 2010 13:36:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2010 at 03:19:02PM +0200, Michael Lippautz wrote:
> Am Donnerstag, den 08.04.2010, 13:53 +0100 schrieb Graeme Gregory:
> > Wont those extra umounts make the script exit when I have set my
> > machine not to automount the partitions?
> > 
> > Graeme
> 
> ...
> umount: /dev/mmcblk0p1: not mounted
> mkfs.vfat 3.0.2 (28 Feb 2009)
> ...
> 
> Nope, just adds some output. ($? would indicate failure on the command
> but script continues)
> 
Ok cool

G



