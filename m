Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDt7b-0007ON-3I
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 06:39:39 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MDsyJ-0000cl-1s
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 04:30:03 +0000
Received: from ip70-187-140-240.oc.oc.cox.net ([70.187.140.240])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 09 Jun 2009 04:30:03 +0000
Received: from microvis by ip70-187-140-240.oc.oc.cox.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 09 Jun 2009 04:30:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Nikolas <microvis@cox.net>
Date: Tue, 9 Jun 2009 04:01:44 +0000 (UTC)
Message-ID: <loom.20090609T035246-124@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 70.187.140.240 (Mozilla/5.0 (Windows; U; Windows NT 5.1;
	en-US) AppleWebKit/525.19 (KHTML, like Gecko) Chrome/1.0.154.65
	Safari/525.19)
Sender: news <news@ger.gmane.org>
Subject: BitBake error: "python-native_2.6.1.bb failed"
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
X-List-Received-Date: Tue, 09 Jun 2009 04:39:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello all, 

Just started with OE, trying to build first Angstrom distro. After 470 tasks 
completed, bitbake fails as follows:

Compiling /home/nicolae/overo-oe/tmp/work/i686-linux/python-native-2.6.1-
ml3.1/temp-staging/home/nicolae/overo-oe/tmp/staging/i686-
linux//usr/lib/python2.6/zipfile.py ...
| make: *** [libinstall] Error 1
| FATAL: oe_runmake failed
NOTE: Task
failed: /home/nicolae/overo-oe/tmp/work/i686-linux/python-native-2.6.1-
ml3.1/temp/log.do_stage.7641
ERROR: TaskFailed event exception, aborting
ERROR: Build
of /home/nicolae/overo-oe/org.openembedded.dev/recipes/python/python-
native_2.6.1.bb do_populate_staging failed
ERROR: Task 1438 (/home/nicolae/overo-
oe/org.openembedded.dev/recipes/python/python-native_2.6.1.bb, 
do_populate_staging) failed
NOTE: Tasks Summary: Attempted 470 tasks of which 470 didn't need to be rerun 
and 1 failed.
ERROR: '/home/nicolae/overo-oe/org.openembedded.dev/recipes/python/python-
native_2.6.1.bb' failed

Last lines of the log file are:

Compiling /home/nicolae/overo-oe/tmp/work/i686-linux/python-native-2.6.1-
ml3.1/temp-staging/home/nicolae/overo-oe/tmp/staging/i686-
linux//usr/lib/python2.6/zipfile.py ...
make: *** [libinstall] Error 1
FATAL: oe_runmake failed

Can anybody help, please. 







