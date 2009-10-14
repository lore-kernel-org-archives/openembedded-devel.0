Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1My36I-0008M3-4M
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 14:37:10 +0200
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1My351-0007nc-Ez for openembedded-devel@lists.openembedded.org;
	Wed, 14 Oct 2009 08:35:47 -0400
Date: Wed, 14 Oct 2009 08:35:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0910140835180.28726@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: failed build, permission denied for glibc_2.9 packaging
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
X-List-Received-Date: Wed, 14 Oct 2009 12:37:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  as a followup to an earlier post of mine, i'm trying to build a
"base-iamge" of angstrom for my beagleboard from the dev branch, and
the build was making nice progress until:

... snip ...
NOTE: Running task 1719 of 3361 (ID: 210,
/home/rpjday/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_install)
NOTE: Running task 1720 of 3361 (ID: 211,
/home/rpjday/oe/openembedded/recipes/glibc/glibc_2.9.bb,
do_populate_staging)
NOTE: Running task 1721 of 3361 (ID: 214,
/home/rpjday/oe/openembedded/recipes/glibc/glibc_2.9.bb, do_package)
mmap: Permission denied
NOTE: preparing tree for binary locale generation
NOTE: generating locale es_NI (UTF-8)
NOTE: Task failed: localedef returned an error (command was
PATH="/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/sbin:/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/usr/bin:/home/rpjday/oe/angstrom-dev/cross/armv7a/bin:/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/sbin:/home/rpjday/oe/angstrom-dev/staging/x86_64-linux/bin:/home/rpjday/oe/openembedded/bitbake/bin:/home/rpjday/nuxeo/dl/nuxeo-dm-5.2.0/bin:/usr/lib64/qt-3.3/bin:/usr/kerberos/bin:/usr/lib64/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/rpjday/bin:/home/rpjday/bitbake-1.8.12/bin:/home/rpjday/eldk/usr/bin"
I18NPATH="/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/glibc-2.9-r35.2/locale-tree//usr/share/i18n"
qemu-arm  -s 1048576 -r 2.6.24 -L
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/glibc-2.9-r35.2/locale-tree
-E
LD_LIBRARY_PATH=/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/glibc-2.9-r35.2/locale-tree/lib
-cpu cortex-a8
/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/glibc-2.9-r35.2/locale-tree/bin/localedef
--force --old-style --no-archive
--prefix=/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/glibc-2.9-r35.2/locale-tree
--inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/rpjday/oe/openembedded/recipes/glibc/glibc_2.9.bb do_package
failed

  i'm open to suggestions.  did i do something obviously silly?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


