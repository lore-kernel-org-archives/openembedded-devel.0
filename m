Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lprgb-0005pk-4h
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 00:16:32 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090403221353.KLZC27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 3 Apr 2009 18:13:53 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id bADs1b00V4dMFYL04ADsjq; Fri, 03 Apr 2009 18:13:53 -0400
X-Authority-Analysis: v=1.0 c=1 a=tfDkyRVKzbYzCstPOL8A:9
	a=EjoeHT0oX6drVNXo6BUA:7 a=Ngd7YHs6daSJJ5OKL-oRuCsV4fsA:4
	a=b8hG5vVbyAkA:10
X-CM-Score: 0.00
Date: Fri, 3 Apr 2009 15:13:52 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20090403221352.GH30840@smtp.west.cox.net>
MIME-Version: 1.0
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 68.230.241.45
X-SA-Exim-Mail-From: trini@kernel.crashing.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_05,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Fix relocation of our SDK toolchains
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
X-List-Received-Date: Fri, 03 Apr 2009 22:16:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all.  For some time, myself and others have wished that the
toolchain we install with our SDK target (meta-toolchain*) could be
relocatible.  I've finally spent some time digging into this and I've
come up with the following series of patches.  We had two problems.  The
first is that things like 'as', 'ld', 'cpp', etc that the toolchain
invokes were absolute links rather than relative links within the SDK.
The second issue is that we were using --with-gxx-include-dir in
configuring gcc when really we don't want that, we want to put the C++
includes where GCC is going to look for them already, not in an absolute
path.

I've tested this series of patches with gcc-4.1.2 / 4.2.4 and 4.3.3
cross-sdk targets on Linux and 4.2.4 on Windows.  For Linux I've
compiled qtopia-core-4.3.5 as a stand-in for a large complex app.

At this point the only thing left is to make the environment-setup setup
based on where it's invoked from.

-- 
Tom Rini


