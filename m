Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Lpseg-0003yU-FN
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 01:18:55 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KHJ00E85SLEDAHV@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	03 Apr 2009 18:15:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5DB056B83B5; Fri,
	03 Apr 2009 19:15:14 -0400 (EDT)
Date: Fri, 03 Apr 2009 19:15:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090403231514.GE12552@denix.org>
References: <20090403221352.GH30840@smtp.west.cox.net>
MIME-version: 1.0
In-reply-to: <20090403221352.GH30840@smtp.west.cox.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=AWL,BAYES_20,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fix relocation of our SDK toolchains
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
X-List-Received-Date: Fri, 03 Apr 2009 23:18:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 03, 2009 at 03:13:52PM -0700, Tom Rini wrote:
> Hey all.  For some time, myself and others have wished that the
> toolchain we install with our SDK target (meta-toolchain*) could be
> relocatible.  I've finally spent some time digging into this and I've
> come up with the following series of patches.  We had two problems.  The
> first is that things like 'as', 'ld', 'cpp', etc that the toolchain
> invokes were absolute links rather than relative links within the SDK.
> The second issue is that we were using --with-gxx-include-dir in
> configuring gcc when really we don't want that, we want to put the C++
> includes where GCC is going to look for them already, not in an absolute
> path.
> 
> I've tested this series of patches with gcc-4.1.2 / 4.2.4 and 4.3.3
> cross-sdk targets on Linux and 4.2.4 on Windows.  For Linux I've
> compiled qtopia-core-4.3.5 as a stand-in for a large complex app.
> 
> At this point the only thing left is to make the environment-setup setup
> based on where it's invoked from.

Thanks! Will you be looking into libtool(-ize)/.la files and pkg-config .pc 
files?

-- 
Denys


