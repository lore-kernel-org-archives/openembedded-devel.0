Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NDpDK-0002oe-54 for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 02:01:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NDpBs-0005iu-1X
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 02:00:04 +0100
Received: from 68-25-27-139.pools.spcsdns.net ([68.25.27.139])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 02:00:04 +0100
Received: from jerm7861 by 68-25-27-139.pools.spcsdns.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 02:00:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Jeremy Williams <jerm7861@yahoo.com>
Date: Fri, 27 Nov 2009 00:51:38 +0000 (UTC)
Message-ID: <loom.20091127T012624-591@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 68.25.27.139 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.0.14) Gecko/2009090216 Ubuntu/9.04 (jaunty) Firefox/3.0.14)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: gcc-cross-4.3.3 build failure - PPC/Sequoia
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
X-List-Received-Date: Fri, 27 Nov 2009 01:01:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Looks like a recent commit applies a patch to libobjc in gcc-4.3.3 that causes
the build of gcc-cross-4.3.3 on PPC to fail (and I'm assuming other non-ARM
machines as well).

gcc 4.3.4: add objective-c patch for eabi and add a package for libobjc
27622153e629cdff24e0f528b4802019d7f87f81 

The issue lies in the failure to remove the old "#define __objc_exception_class"
macro in the (#else (non ARM_EABI_UNWINDER) case.

Koen, since this one is yours can you revert and apply a fix? Might want to
update the headline too, this patch is applied to gcc 4.3.3 not 4.3.4.

Thanks!

-jeremy w



