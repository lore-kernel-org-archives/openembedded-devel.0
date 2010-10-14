Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1P6Gkc-0003w9-8j
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 07:53:17 +0200
Received: (qmail invoked by alias); 14 Oct 2010 05:52:45 -0000
Received: from p50882BC6.dip.t-dialin.net (EHLO localhost.localdomain)
	[80.136.43.198]
	by mail.gmx.net (mp039) with SMTP; 14 Oct 2010 07:52:45 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18vHO06MJAvBMeqJ8GWE3D8M+WH7xaX8hIiGnzsuy
	1iW2tEbEXAvkUN
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 07:51:22 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
MIME-Version: 1.0
Message-Id: <201010140751.22834.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: omap3-sgx-modules fail on patch
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
X-List-Received-Date: Thu, 14 Oct 2010 05:53:18 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Good morning,

last night I had a fresh build on commit 9ac50f2494f029df76176117cb77a21491194855 / Wed Oct 13 21:36:53 2010 +0200. It failed patching omap3-sgx-modules:

ERROR: Error in executing python function in: /home/Superandi/data/OpenEmbedded/gumstix-oe/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error: exit status: 1  Output:
Applying patch 0002-Compile-fixes-for-recent-kernels.patch
patching file services4/system/omap3630/sysutils_linux.c
Hunk #1 FAILED at 32.
Hunk #2 FAILED at 49.
2 out of 2 hunks FAILED -- rejects in file services4/system/omap3630/sysutils_linux.c
Patch 0002-Compile-fixes-for-recent-kernels.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Function patch_do_patch failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/Superandi/data/OpenEmbedded/gumstix-oe/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb do_patch failed

I know there was some change on this not long ago - but I haven't got the time to check further. Can someone take care?

Andreas


