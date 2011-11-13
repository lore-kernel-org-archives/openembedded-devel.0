Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RPdqt-0002yN-IF
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Nov 2011 18:28:19 +0100
Received: (qmail invoked by alias); 13 Nov 2011 17:21:58 -0000
Received: from p5B0A37D1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.209]
	by mail.gmx.net (mp023) with SMTP; 13 Nov 2011 18:21:58 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX181MycYjXw1t4sfdGz/5OmrVojYqy0Aa+4VjsUWcy
	R1OmERapQYRwCt
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Nov 2011 18:27:00 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201111131827.00994.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: How to avoid oe complaining for .so symlink
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
X-List-Received-Date: Sun, 13 Nov 2011 17:28:19 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I am preparing a recipe for tumbler (xfce). The package itself installs a 
symlink which seems required on a .so. OE QA complains

| ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: 
tumbler path '/work/armv7a-angstrom-linux-gnueabi/tumbler-0.1.22-r0/packages-
split/tumbler/usr/lib/tumbler-1/plugins/cache/tumbler-cache-plugin.so'

I could workaround by removing symlink on do_install_append and adding it again 
at pkg_postinst but this seems crap. 

The better method seems telling QA not to check for so-symlinks.

In insane.bbclass I find

ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la perms"

so I could set in recipe

ERROR_QA = "debug-deps dev-deps debug-files arch la2 pkgconfig la perms"

but this makes recipe immune to ERROR_QA in insane.bbclass. Is there a way to 
remove 'dev-so' from ERROR_QA?

Andreas


