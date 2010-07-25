Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <ossy1980@gmx.net>) id 1Od7fv-0003aV-If
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 22:19:56 +0200
Received: (qmail invoked by alias); 25 Jul 2010 20:13:00 -0000
Received: from p4FDD32F7.dip.t-dialin.net (EHLO [192.168.1.104])
	[79.221.50.247]
	by mail.gmx.net (mp051) with SMTP; 25 Jul 2010 22:13:00 +0200
X-Authenticated: #2644563
X-Provags-ID: V01U2FsdGVkX193+AUZG2p3cFKBU7BhvQq6hAevZQj9MJ8MSCOQF0
	scFSanFd75i1xs
Message-ID: <4C4C9AD7.7010603@gmx.net>
Date: Sun, 25 Jul 2010 22:13:11 +0200
From: Ossy <ossy1980@gmx.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; de;
	rv:1.9.1.11) Gecko/20100711 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: ossy1980@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: could not include bb file even though it exists and directory included in BBPATH
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
X-List-Received-Date: Sun, 25 Jul 2010 20:19:56 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Dear oe mailinglist,

I tried to set up oe and the sanity checker hasn't reported any 
anomalies. But when building a simple image, bitbake wasn't able to 
include console-base-image.bb.

But in fact this file is present in oe/recipes/images/* and BBPATH 
includes the path to oe (which hopefully dives into recipes there).

I used kom to setup a new overlay project. Since listing the images 
gives all images in oe, I'm sure that bitbake has access to those 
bb-files. The conf/bbplayers.conf includes BBFILES to oe, too.

Where may I misconfigured the setup?

Thanks for any hint.

Kind regards,
Marcus



ossy@debian-virtual:~/buildroot/kom-dockstar$ ll
insgesamt 0
drwxr-xr-x 4 ossy ossy 27 23. Jul 20:37 build
drwxr-xr-x 4 ossy ossy 53 23. Jul 00:11 conf
drwxr-xr-x 3 ossy ossy 19 23. Jul 00:11 recipes
ossy@debian-virtual:~/buildroot/kom-dockstar$ echo $BBPATH
/home/ossy/kom/openembedded/:/home/ossy/buildroot/kom-dockstar/build:/home/ossy/buildroot/kom-dockstar
ossy@debian-virtual:~/buildroot/kom-dockstar$ ll 
/home/ossy/kom/openembedded/recipes/images/console-*
-rw-r--r-- 1 ossy ossy 416 23. Jul 02:34 
/home/ossy/kom/openembedded/recipes/images/console-base-image.bb
-rw-r--r-- 1 ossy ossy 184 23. Jul 02:34 
/home/ossy/kom/openembedded/recipes/images/console-image.bb
-rw-r--r-- 1 ossy ossy 168 23. Jul 02:34 
/home/ossy/kom/openembedded/recipes/images/console-mipv6-image.bb
ossy@debian-virtual:~/buildroot/kom-dockstar$ kom -L
990     oe      ${oe}/recipes/*/*.bb
1000    PRJDIR  ${PRJDIR}/recipes/*/*.bb
ossy@debian-virtual:~/buildroot/kom-dockstar$ bitbake minimal-image
NOTE: Handling BitBake files: \ (8414/8416) [99 %]ERROR: Could not 
include required file console-base-image.bb while parsing 
/home/ossy/buildroot/kom-dockstar/build/tmp/deploy/glibc/sources/MIT/console-image/console-image.bb
ERROR: Could not include required file console-base-image.bb while 
parsing 
/home/ossy/buildroot/kom-dockstar/build/tmp/deploy/glibc/sources/MIT/console-image/console-image.bb

NOTE: Parsing finished. 7606 cached, 474 parsed, 334 skipped, 176 masked.
ERROR: Parsing errors found, exiting...

ossy@debian-virtual:~/buildroot/kom-dockstar$ cat conf/bblayers.conf | 
grep BBFILE
BBFILES = " \
BBFILE_COLLECTIONS = " oe PRJDIR"
BBFILE_PATTERN_PRJDIR = "${PRJDIR}/recipes"
BBFILE_PRIORITY_PRJDIR = "1000"
BBFILE_PATTERN_oe = "recipes/*/*.bb"
BBFILE_PRIORITY_oe = "990"


