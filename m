Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SEp1E-0003aL-R2
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2012 23:42:32 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id D5268EA042
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2012 22:34:16 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 92E906017C; Mon,  2 Apr 2012 23:04:35 +0200 (CEST)
Date: Mon, 2 Apr 2012 23:04:35 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120402210435.GA10553@hermes>
MIME-Version: 1.0
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Package build failure
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
X-List-Received-Date: Mon, 02 Apr 2012 21:42:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I'm currently trying to learn how to build OE packages. For that
purpose I set up an OE 'classic' (not oe-core) environment with the
following configuration:

DL_DIR = "${HOME}/devel/bitbake/sources"
BBFILES := "${HOME}/devel/openembedded/master/recipes/*/*.bb"
MACHINE = "ben-nanonote"
DISTRO = "jlime-2010.1"
PARALLEL_MAKE = "-j 2"
BB_NUMBER_THREADS = "2"
BBINCLUDELOGS = "yes"


As a test I issued the 'bitbake nano' command, and after a while the
build fails with the following error:

svn: OPTIONS of 'http://svn.openmoko.org/trunk/src/host/opkg-utils': could not connect to server (http://svn.openmoko.org)
NOTE: package opkg-utils-native-0.1.8+svnr4747-r7: task Fetch failed: Unable to fetch URL svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http from any source.: Failed
ERROR: Function 'Fetch failed: Unable to fetch URL svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http from any source.' failed
ERROR: Task 70 (virtual:native:/home/apelete/devel/openembedded/master/recipes/opkg-utils/opkg-utils_svn.bb, do_fetch) failed with exit code '1'
ERROR: '/home/apelete/devel/openembedded/master/recipes/gcc/gcc-cross_4.5.bb' failed
ERROR: 'virtual:native:/home/apelete/devel/openembedded/master/recipes/opkg-utils/opkg-utils_svn.bb' failed


It seems http://svn.openmoko.org is unreachable.
How can I resolve this issue ?

Thanks.
-- 
        Apelete


