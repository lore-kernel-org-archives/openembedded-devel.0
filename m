Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OBWNY-0001Yj-3h
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 19:03:11 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L2700FH8R569PD5@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	10 May 2010 11:58:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7816F14AF60; Mon,
	10 May 2010 12:58:17 -0400 (EDT)
Date: Mon, 10 May 2010 12:58:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100510165817.GB2845@denix.org>
References: <AANLkTikMZbhHtXqXqfLBSO0GY6Z6Tt8QuJPUMMBucAS_@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTikMZbhHtXqXqfLBSO0GY6Z6Tt8QuJPUMMBucAS_@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem using meta-toolchain.bb and	external-toolchain-generic.bb
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
X-List-Received-Date: Mon, 10 May 2010 17:03:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, May 10, 2010 at 11:14:14AM +0200, David MOUSSAUD wrote:
> Hi all,
> 
> I'm trying to use an external toolchain with OE.
> So I've build one using the recipe meta-toolchain.bb with an angstrom
> distribution. I'm on the org.openembedded.dev branch (updated
> recently).
> I've extracted the 2 tar.gz provided in my root directory. So I have a
> nice /usr/local/angstrom layout with my pre-built toochain.
> 
> Then I have changed my distro.conf file setting that 2 parameter:
> 
> # Set the toolchain type (internal, external) and brand (generic, csl etc.)
> TOOLCHAIN_TYPE ?= "external"
> TOOLCHAIN_BRAND ?= "generic"
> 
> I've cleaned my build/tmp directory.
> 
> Finally I've tried to build a minimalist image. Everything goes fine,
> the toolchain is found by OE but it fails when it tries to create the
> filesystem.
> Here is the following log file : http://pastebin.com/YZmuzmtx
> 
> I can not understand what to do to tell OE how it could find the glibc !?
> 
> Thanks in advance for your tips and suggestions,

You are missing the IPKs from the second -extras.tar.gz file, which should go 
into /usr/local/angstrom/ipk and get copied to the deploy directory by 
external toolchain recipe. Check that you extracted it properly or that the 
-extras.tar.gz tarball actually contain those IPKs...

-- 
Denys


