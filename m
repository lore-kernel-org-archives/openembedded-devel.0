Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1O9bBf-00087n-N0
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 11:46:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 30470A43EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 10:42:53 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 8MIOB10rT2vx
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 10:42:52 +0100 (BST)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 73A8CA43E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 10:42:52 +0100 (BST)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id 87A132C75D; Wed,  5 May 2010 10:42:42 +0100 (BST)
Date: Wed, 5 May 2010 10:42:42 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100505094242.GF2444@xora-desktop.xora.org.uk>
References: <4BE13C20.1010902@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4BE13C20.1010902@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux vs. linux-libc-headers?
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
X-List-Received-Date: Wed, 05 May 2010 09:47:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 05, 2010 at 11:36:32AM +0200, Steffen Sledz wrote:
> We're using Angstrom distro at hipox machine.
> 
> For this machine we need to use kernel version 2.6.24 (selected
> by DEFAULT_PREFERENCE_hipox = "1" in linux_2.6.24.bb) because of
> some special machine/driver support.
> 
> Angstrom uses linux-libc-headers version 2.6.31.
> 
> This results in some dirty problems, e.g. the headers report the
> existence of inotify_init1 (introduced with 2.6.27) but it is not
> available in 2.6.24. :(
> 
> It seem's not to be possible to use DEFAULT_PREFERENCE_hipox in the
> linux-libc-headers recipes. So what's the right way to handle this?
> Something like PREFERRED_VERSION_linux-libc-headers_hipox = "2.6.24"
> in angstrom-2008.1.conf?

I thought glibc was supposed to gracefully fall back on missing syscalls?

Graeme



