Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Phil.Black@hillcrestlabs.com>) id 1LjfeV-000063-CG
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 21:12:46 +0100
X-AuditID: 0a1e000a-b7b75ae0000056bf-81-49c004097cc1
From: Philip Black <phil.black@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Mar 2009 16:11:53 -0400
Message-Id: <1237320713.1422.7.camel@pblack-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Phil.Black@hillcrestlabs.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_40,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Kernel/module dependencies?
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
X-List-Received-Date: Tue, 17 Mar 2009 20:12:47 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Maybe something is messed up in my configuration, I have a problem with
modules built outside the kernel.  If I update the kernel (including
bumping the recipe revision), other kernel modules do not get rebuilt.
I have a couple of modules whose recipes are set up with lines like:

RDEPENDS += "kernel (${KERNEL_VERSION)"
DEPENDS += "virtual/kernel"

but when the kernel gets updated, the modules do not rebuild.  Is this
just how bitbake works? or is there a way to get modules to rebuild
whenever the kernel updates.  My problem is that when the kernel is
changed, I can no longer load modules built against the previous
revision.  To get things working again, I need to force the rebuild of
anything that depends on the kernel, which is less than ideal.

Thanks in advance,
phil


