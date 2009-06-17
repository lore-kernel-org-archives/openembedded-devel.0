Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MGkM0-0003m7-0A
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 03:54:20 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLC006V6Y2O7SF2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	16 Jun 2009 19:44:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 626EB14AF5F; Tue,
	16 Jun 2009 20:44:48 -0400 (EDT)
Date: Tue, 16 Jun 2009 20:44:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090617004448.GA19217@denix.org>
References: <37367b3a0906161523p3bca0c45k69f0415fa5796e85@mail.gmail.com>
	<20090617003646.GA15477@smtp.west.cox.net>
MIME-version: 1.0
In-reply-to: <20090617003646.GA15477@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] Add basic support for i.MX27ADS board
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
X-List-Received-Date: Wed, 17 Jun 2009 01:54:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 16, 2009 at 05:36:47PM -0700, Tom Rini wrote:
> On Tue, Jun 16, 2009 at 07:23:27PM -0300, Alan Carvalho de Assis wrote:
> 
> > This patch adds basic support on OpenEmbedded for i.MX27ADS board.
> > 
> > It uses the mainline kernel instead Freescale one. The mainline doesn't
> > have support for USB, Camera, etc.
> 
> Since this is using mainline kernel, you should start a linux_2.6.30.bb
> (based on 2.6.29) and add DEFAULT_PREFERENCE_mx27ads = "1" to that,
> rather than adding a new kernel recipe.  The machine.conf looks fine
> otherwise, however.

There is linux_2.6.30.bb already:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=492df3085e1a7125d44a592a883032e93e8bc0e9

-- 
Denys


