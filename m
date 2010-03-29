Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nw8vR-0005Sy-03 for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 08:58:18 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nw8sJ-0005cg-VQ for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 08:55:04 +0200
Received: from 211-158-80-80.winetbg.com ([211-158-80-80.winetbg.com])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 08:55:03 +0200
Received: from danail.mechev by 211-158-80-80.winetbg.com with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 08:55:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Danail <danail.mechev@rgb-bg.com>
Date: Mon, 29 Mar 2010 05:43:48 +0000 (UTC)
Message-ID: <loom.20100329T073757-156@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 80.80.158.211 (Mozilla/5.0 (X11; U; Linux x86_64; en-GB;
	rv:1.9.1.5) Gecko/20091109 Ubuntu/9.10 (karmic) Firefox/3.5.5)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Problem building Angstrom (quilt-native_0.46.bb' failed)
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
X-List-Received-Date: Mon, 29 Mar 2010 06:58:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, It`s my first time building Angstrom and for the last 2 weeks I`m 
stacked with the following issue:
************************************************************************
pc@ubuntu:~/stuff/build$ bitbake x11-image -k
NOTE: Handling BitBake files: - (6701/6701) [100 %]
NOTE: Parsing finished. 6398 cached, 0 parsed, 303 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 59 of 5483 (ID: 43, /home/pc/stuff/openembedded/recipes/
quilt/quilt-native_0.46.bb, do_configure)
ERROR: function do_configure failed
ERROR: log data follows (/home/pc/stuff/build/tmp/work/x86_64-linux/
quilt-native-0.46-r2/temp/log.do_configure.1750)
| NOTE: Running /home/pc/stuff/build/tmp/work/x86_64-linux/
quilt-native-0.46-r2/quilt-0.46/configure    --build=x86_64-linux    
--host=x86_64-linux    --target=x86_64-linux    --prefix=/home/pc/stuff/build/
tmp/staging/x86_64-linux/usr    --exec_prefix=/home/pc/stuff/build/tmp/
staging/x86_64-linux/usr    --bindir=/home/pc/stuff/build/tmp/staging/
x86_64-linux/usr/bin    --sbindir=/home/pc/stuff/build/tmp/staging/
x86_64-linux/usr/sbin    --libexecdir=/home/pc/stuff/build/tmp/staging/
x86_64-linux/usr/libexec    --datadir=/home/pc/stuff/build/tmp/staging/
x86_64-linux/usr/share    --sysconfdir=/home/pc/stuff/build/tmp/staging/
x86_64-linux/etc    --sharedstatedir=/home/pc/stuff/build/tmp/staging/
x86_64-linux/usr/com    --localstatedir=/home/pc/stuff/build/tmp/staging/
x86_64-linux/var    --libdir=/home/pc/stuff/build/tmp/staging/x86_64-linux/
usr/lib    --includedir=/home/pc/stuff/build/tmp/staging/x86_64-linux/usr/
include    --oldincludedir=/home/pc/stuff/build/tmp/staging/x86_64-linux/usr/
include    --infodir=/home/pc/stuff/build/tmp/staging/x86_64-linux/usr/share/
info    --mandir=/home/pc/stuff/build/tmp/staging/x86_64-linux/usr/share/man 
--disable-nls    ...
| ./.lineno: fork: Cannot allocate memory
| FATAL: oe_runconf failed
NOTE: Task failed: /home/pc/stuff/build/tmp/work/x86_64-linux/
quilt-native-0.46-r2/temp/log.do_configure.1750
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/pc/stuff/openembedded/recipes/quilt/quilt-native_0.46.bb
 do_configure failed
ERROR: Task 43 (/home/pc/stuff/openembedded/recipes/quilt/quilt-native_0.46.bb,
 do_configure) failed
NOTE: Tasks Summary: Attempted 1249 tasks of which 1249 didn't need to 
be rerun and 1 failed.
ERROR: '/home/pc/stuff/openembedded/recipes/quilt/quilt-native_0.46.bb' failed
******************************************************************************
  I`m using the following configuration:
MACHINE = "at91sam9263ek"
DISTRO = "angstrom-2008.1"
BB_VERSION        = "1.8.18"
  The host system is Ubuntu 9.10 - the Karmic Koala - released in October 2009


Any ideas what is the problem?

Thanks in advance!

Best Regards: Danail



