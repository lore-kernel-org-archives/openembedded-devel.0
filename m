Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Ock5J-00022c-7U
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 21:08:35 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 5705216610CE; Sat, 24 Jul 2010 13:01:40 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id B1CA816610DA;
	Sat, 24 Jul 2010 13:01:19 -0600 (MDT)
Message-ID: <4C4B387F.4040407@mlbassoc.com>
Date: Sat, 24 Jul 2010 13:01:19 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Can't build on Fedora 13
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
X-List-Received-Date: Sat, 24 Jul 2010 19:08:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying to build angstrom-gnome-image for beagleboard, fresh checkout
of org.openembedded.dev:
   commit 244deb462973a2d7a9bfcc3399843202f9d29d51
   Author: Stanislav Brabec <utx@penguin.cz>
   Date:   Sat Jul 24 14:21:03 2010 +0000

On Fedora 13, I get this error:

ERROR: Function do_configure failed
NOTE: Task failed: ('function do_configure failed', '/home/local/Angstrom_BeagleBoard/tmp/work/i686-linux/gawk-native-3.1.4-r3/temp/log.do_configure.10165')
ERROR: Logfile of failure stored in: /home/local/Angstrom_BeagleBoard/tmp/work/i686-linux/gawk-native-3.1.4-r3/temp/log.do_configure.10165
Log data follows:
| automake (GNU automake) 1.11.1
| Copyright (C) 2009 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.11
| NOTE: /home/local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/share/gettext/config.rpath not found. gettext is not installed.
| NOTE: Executing autoreconf --verbose --install --force --exclude=autopoint -I /home/local/Angstrom_BeagleBoard/tmp/work/i686-linux/gawk-native-3.1.4-r3/gawk-3.1.4/m4/ 
-I/home/local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/share/aclocal-1.11 -I /home/local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/share/aclocal
| /usr/bin/autoreconf: unrecognized option `--exclude=autopoint'
| Try `/usr/bin/autoreconf --help' for more information.
| FATAL: autoreconf execution failed.
NOTE: package gawk-native-3.1.4-r3: task do_configure: Failed

The same tree builds on Fedora 12

Any ideas how to work past this?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


