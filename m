Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1KwCNA-0002GV-Mf
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Nov 2008 10:02:21 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Kw9hd-0000nL-SW
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Nov 2008 01:11:17 -0500
Message-ID: <490BF303.1030701@dls.net>
Date: Sat, 01 Nov 2008 01:11:15 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.17) Gecko/20080914 Thunderbird/2.0.0.17 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: DISTRO_PR, ipkg dependencies, and meta toolchains...
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
X-List-Received-Date: Sat, 01 Nov 2008 09:02:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Consider the control data for openssl-dev (exerpts):

Package: openssl-dev
Version: 0.9.7g-r7.1
...
Depends: openssl (= 0.9.7g-r7), libcrypto0.9.7, libssl0.9.7
Recommends: libc6-dev, libgcc-dev, libcrypto-dev...

Note in particular the openssl-dev version number, which has the
DISTRO_PR appended to make it "-r7.1" instead of just "-r7".

But in the dependencies, it lists the specific version of the
corresponding runtime -- without the DISTRO_PR.  And of course, that
specific version doesn't exist (or rather, if it exists in someone's
environment, it would be a left-over ipkg from before the DISTRO_PR was
added).

One place this bites us is in the SDK assembling (bitbake
meta-toolchain-<whatever>):

| Collected errors:
|  * ERROR: Cannot satisfy the following dependencies for
task-fso-toolchain-target:
|        *  openssl (= 0.9.7g-r7) *

Poking about I can find a place in the appropriate bbclass files to hack
things up so that my specific problem will be resolved -- but I'd prefer
that someone who understands just how much of the rdepends/rrecommends
needs this treatment offer some advice first.  (And of course, I should
warn anyone who cares that I know Perl far better than Python, a fact
that would almost certainly end up reflected in the patch I would write!)

Mike (mwester)


