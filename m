Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JqZNm-0003SH-Bc
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 21:51:27 +0200
X-ASG-Debug-ID: 1209412251-461c007b0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 8CD8B4EAF8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 14:50:51 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id 3YNZpeKJnVxAEDHt for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 14:50:51 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Mixed up STAGING_INCDIR's in uclibc.inc?
Date: Mon, 28 Apr 2008 14:51:05 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200804281451.05548.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1209412251
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 19:51:27 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi all,

I'm having a brand new issue building uClibc-0.9.29 for the AVR32.  When 
running do_configure for uclibc, it gets a bunch of errors like:

 
gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE -I/home/geoff/lrs/playpaq/tmp/staging/avr32-angstrom-linux-uclibc/usr/include  -lncursesw 
conf.o  zconf.tab.o -o conf
| conf.o: In function `strip':
| conf.c:(.text+0x20): undefined reference to `__ctype_b'
| conf.c:(.text+0x97): undefined reference to `__ctype_b'
| conf.o: In function `conf_sym':
| conf.c:(.text+0x5bf): undefined reference to `__stdout'
...continues on...

I think the problem is the following line in packages/uclibc/uclibc.inc:
EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}' HOSTCFLAGS='-I${STAGING_INCDIR}'"

Seems to me like that should be STAGING_INCDIR_NATIVE instead of 
STAGING_INCDIR.  If I make that change, then everything works again.

Does this seem correct? 

---
Geoffrey


#
# old_revision [b5af291fa9dc074af84727684ddae1efa9c1be0d]
#
# patch "packages/uclibc/uclibc.inc"
#  from [472f8824981d2a69ea009b1b57d42dfed1044151]
#    to [cc6432f05133f71d7aae488e59eb8a4423482666]
#
# patch "packages/uclibc/uclibc_0.9.29.bb"
#  from [e670b8966480e150375aa74c2bd62de6c8e5315b]
#    to [0eac903c662c67108b358b1ad2c6d1d976cc5419]
#
============================================================
--- packages/uclibc/uclibc.inc  472f8824981d2a69ea009b1b57d42dfed1044151
+++ packages/uclibc/uclibc.inc  cc6432f05133f71d7aae488e59eb8a4423482666
@@ -72,7 +72,7 @@ OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${L
 # the CFLAGS (for when building the utils).
 OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}' \
                'LOCALE_DATA_FILENAME=${UCLIBC_LOCALE_FILE}'"
-EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}' HOSTCFLAGS='-I${STAGING_INCDIR}'"
+EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}' HOSTCFLAGS='-I${STAGING_INCDIR_NATIVE}'"
 EXTRA_OEMAKE_task_do_populate_staging = "${OEMAKE_NO_CC}"
 EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"

============================================================
--- packages/uclibc/uclibc_0.9.29.bb    e670b8966480e150375aa74c2bd62de6c8e5315b
+++ packages/uclibc/uclibc_0.9.29.bb    0eac903c662c67108b358b1ad2c6d1d976cc5419
@@ -7,7 +7,7 @@ UCLIBC_BASE ?= "0.9.29"
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.29"
-PR = "r13"
+PR = "r14"

 require uclibc.inc




