Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1OncWS-000183-M6
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 21:17:59 +0200
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Mon, 23 Aug 2010 15:16:41 -0400
Message-ID: <4C72C920.7080709@tycoelectronics.com>
Date: Mon, 23 Aug 2010 15:16:48 -0400
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: several recipes give a link error: libc.so, needed by libgcc_s.so, not found
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
X-List-Received-Date: Mon, 23 Aug 2010 19:18:59 -0000
X-List-Received-Date: Mon, 23 Aug 2010 19:18:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I am getting the following warning (I assume it is a warning, because 
they all seem to produce working executables) for several recipes 
(rxvt-unicode shown):

./rxvt-unicode-7.9-r1/temp/log.do_compile.9530:44:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/bin/ld: 
warning: libc.so, needed by 
/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/lib/libgcc_s.so, 
not found (try using -rpath or -rpath-link)

The following recipes all exhibit this error:

qt4-x11-free-4.6.3-r19.2
gs-8.64-r2
schroedinger-1.0.9-r0
gtk+-2.20.1-r8.1
libsndfile1-1.0.21-r1
mysql-4.1.22-r6
libmusicbrainz-3.0.2-r1
cups-1.4.3-r2
rxvt-unicode-7.9-r1
gnutls-2.8.6-r10.0

Also, anything I attempt to build with the above mentioned qt4-x11-free 
also produce the same warning.

There is a file, libc.so in the 
/home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib path, 
which IS in an -Wl,rpath= argument being passed to gcc (or g++) (and 
subsequently to the linker).

This problem didn't occur on a git-pull from December 4, 2009, but does 
on a July 29,2010 pull.

Thanks,
Jay



