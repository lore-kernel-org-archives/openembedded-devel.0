Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NGf83-0007vF-Ih for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 21:51:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NGf6U-0000ji-Te
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 21:50:14 +0100
Received: from 167.225.107.17 ([167.225.107.17])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 21:50:14 +0100
Received: from jerm7861 by 167.225.107.17 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 21:50:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Jeremy Williams <jerm7861@yahoo.com>
Date: Fri, 4 Dec 2009 20:49:52 +0000 (UTC)
Message-ID: <loom.20091204T213241-372@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 167.225.107.17 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091105 Fedora/3.5.5-1.fc11 Firefox/3.5.5)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Questions about gcc target packages
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
X-List-Received-Date: Fri, 04 Dec 2009 20:51:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I am seeing some QA errors when building the gcc target package. The two QA
errors are .so symlink in non -dev package (for the gcc package) and GNU_HASH in
objc libraries.

Looking into the first issue reveals something puzzling to me. If you look at
gcc-package-target.inc, the do_install operation creates a .so symlink to
libgcc. Looking at the FILES definition for the gcc package (non -dev), it
appears that this symlink is being sucked into the package by the entry
"${gcclibdir}/${TARGET_SYS}/${BINV}/lib*". Am I confused here?

I'm not sure what is causing the GNU_HASH issue with the objc libraries...

I do have one other question. What is the thought behind the rule that first
looks for the soft-float (nof) version of libgcc and copies that into
base_libdir instead of the hard-float version? This version of libgcc ends up in
the package libgcc1. When building an sdk with meta-toolchain, libgcc1 ends up
getting installed in the target folder and overwrites the hard-float library
that the gcc-cross-sdk package installs. This causes issues with libstdc++ which
is built to expect the hard-float version of libgcc when linking qmul and
friends (hard float is version GCC_4.1, soft float is version GCC_4.2).

thanks!

-jeremy



