Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvUpX-0006b7-Re
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 13:09:48 +0100
Received: from p5b035482.dip.t-dialin.net ([91.3.84.130] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvUmR-0004hX-9M by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Mar 2010 13:06:21 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvUmQ-0000IZ-Jy
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 13:06:18 +0100
Date: Sat, 27 Mar 2010 13:06:18 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100327120618.GF21542@excalibur.local>
References: <n> <1266857650-5557-1-git-send-email-michael.lippautz@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1266857650-5557-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-setuptools: Version bump to 0.6c11
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
X-List-Received-Date: Sat, 27 Mar 2010 12:09:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2010-02-22 at 17:54, Michael Lippautz wrote:
> * Adds python module 'pkg_resources'.

I was going to apply this, but it fails during patching:

NOTE: Running task 725 of 737 (ID: 1,
/home/stefan/Projekte/OpenEmbedded/build/openmoko/openembedded/recipes/python/python-setuptools_0.6c11.bb,
do_patch)
NOTE: Applying patch 'fix-log-usage-0.6c11.patch'
(openembedded/recipes/python/python-setuptools/fix-log-usage-0.6c11.patch)
ERROR: Error in executing:
/home/stefan/Projekte/OpenEmbedded/build/openmoko/openembedded/recipes/python/python-setuptools_0.6c11.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1
Output:
Applying patch fix-log-usage-0.6c11.patch
patching file setuptools/command/sdist.py
Hunk #2 FAILED at 93.
1 out of 2 hunks FAILED -- rejects in file setuptools/command/sdist.py
Patch fix-log-usage-0.6c11.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/stefan/Projekte/OpenEmbedded/build/openmoko/openembedded/recipes/python/python-setuptools_0.6c11.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1
Output:
Applying patch fix-log-usage-0.6c11.patch
patching file setuptools/command/sdist.py
Hunk #2 FAILED at 93.
1 out of 2 hunks FAILED -- rejects in file setuptools/command/sdist.py
Patch fix-log-usage-0.6c11.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/stefan/Projekte/OpenEmbedded/build/openmoko/openembedded/recipes/python/python-setuptools_0.6c11.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1
Output:
Applying patch fix-log-usage-0.6c11.patch
patching file setuptools/command/sdist.py
Hunk #2 FAILED at 93.
1 out of 2 hunks FAILED -- rejects in file setuptools/command/sdist.py
Patch fix-log-usage-0.6c11.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Build of
/home/stefan/Projekte/OpenEmbedded/build/openmoko/openembedded/recipes/python/python-setuptools_0.6c11.bb
do_patch failed

Would be great if you could fix this and resend. Thanks.

regards
Stefan Schmidt


