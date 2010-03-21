Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NtJO6-0000gc-UH
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 12:32:15 +0100
Received: from p5b037fe3.dip.t-dialin.net ([91.3.127.227] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NtJKx-00033C-N1 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Mar 2010 12:29:06 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NtJKw-00055U-Ao
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 12:28:54 +0100
Date: Sun, 21 Mar 2010 12:28:54 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100321112854.GB7325@excalibur.local>
References: <openembedded-devel@lists.openembedded.org>
	<1269019049-25807-1-git-send-email-aalonso00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1269019049-25807-1-git-send-email-aalonso00@gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] u-boot_git.bb: add xilinx-ml507 support
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
X-List-Received-Date: Sun, 21 Mar 2010 11:32:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

The first part, PR and SRCREV, is obviously fine. The second part raises a
question here. If it is preferred to have the xparameters header file from the
BSP would it make more sense to have it in OE? Be it a package or just the file.

The patch also has the problem that it does not work if XILINX_BSP_PATH is not
set. Your test in deploy if the directory exists triggers this here:

NOTE: Running task 1042 of 1048 (ID: 11,
/home/stefan/Projekte/OpenEmbedded/build/openmoko/openembedded/recipes/u-boot/u-boot_git.bb,
do_deploy)
ERROR: function do_deploy failed
ERROR: log data follows
(/home/stefan/Projekte/OpenEmbedded/build/openmoko/tmp/work/xilinx-ml507-angstrom-linux/u-boot-git-r43/temp/log.do_deploy.19446)
| NOTE: Installing u-boot elf image in bsp path
| install: cannot create regular file `/u-boot': Permission denied

The variable is empty and test thinks that is fine and wants to install the
u-boot into / as no other path is set. Please fix, resend and I'll apply it.

regards
Stefan Schmidt


