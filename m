Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QKJL0-0007T8-W1
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 02:01:07 +0200
Received: by pzk36 with SMTP id 36so492957pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 16:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=sKD9ooJKtRxdouylJ5zZlKp+I6VwXNlsqVGTOuL98G4=;
	b=HlqTkxNB3E8aRbnQjFh5vO8N4saXKhaXvGoUo+y7hlrxnH/I8Aw4HD4Y8BGhMz2jye
	jZqA3v4e+l5yJ4d0Jn7OdFH6qScqqH04Zi6n9nNjk9/+BamhcxPAUmAk+FI83NMo62AD
	xaKXEmDdQOm4roH/oiAyxg93B466gzC/V2v4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=W7jeETiurGTUsV+YjhsKtTqI2RQ6EGnaSKan6ti7UcWQ2wr/4ND/33FQLMGgtnzsUd
	YBP5YAd+Uq2pyGOzgsjHxjEsdgOeXHbu8MNJEdcr0LF802L4Hk7U7sKFB2O/JYGd+p+b
	Hsqnq8NUOqwVBB8ni4M1w+kY5YL7mBPe599Po=
MIME-Version: 1.0
Received: by 10.68.15.168 with SMTP id y8mr13739597pbc.337.1305158298591; Wed,
	11 May 2011 16:58:18 -0700 (PDT)
Received: by 10.68.52.232 with HTTP; Wed, 11 May 2011 16:58:18 -0700 (PDT)
Date: Thu, 12 May 2011 01:58:18 +0200
Message-ID: <BANLkTik19x9evsK+6uZ73FXyjyJKB1O-vA@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Another race failure, not sure if this is a hard dependency or an inflight staging which races with another configure??
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
X-List-Received-Date: Thu, 12 May 2011 00:01:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I think I found another build race here (must love multi-core machines).

perl-native is still being staged while file-native tries to run perl
stuff resulting in "| perl: error while loading shared libraries:
libperl.so: cannot open shared object file: No such file or
directory".

Restarting bitbake continues the build (note that perl native sysroot
staging finishes just after file-native failing).

Now, I have been thinking about these races; even though we might not
have a dependency on perl, a configure stage may probe for perl, and
if it exists, starts to run tests against it.
So either perl must be present, or not at all. I.e. atomicly staged in sysroot.

Of course, could be this IS a hard dependency after all.

I'll investigate later, here is a small piece of log for your eyes.

Regards,

Leon.



NOTE: package pax-utils-native-0.1.19-r2: task do_configure: Started
NOTE: package pax-utils-native-0.1.19-r2: task do_configure: Succeeded
NOTE: Running task 491 of 4495 (ID: 726,
virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb,
do_patch)
NOTE: package file-native-5.04-r2.1: task do_patch: Started
NOTE: package file-native-5.04-r2.1: task do_patch: Succeeded
NOTE: Running task 492 of 4495 (ID: 734,
virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb,
do_configure)
NOTE: package file-native-5.04-r2.1: task do_configure: Started
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb
do_configure failed
ERROR: Task 734
(virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb,
do_configure) failed with 256
ERROR: Function do_configure failed
NOTE: Task failed: ('function do_configure failed',
'/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/work/i686-linux/file-native-5.04-r2.1/temp/log.do_configure.17468')
ERROR: Logfile of failure stored in:
/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/work/i686-linux/file-native-5.04-r2.1/temp/log.do_configure.17468
Log data follows:
| automake (GNU automake) 1.11.1
| Copyright (C) 2009 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.11
| NOTE: Executing autoreconf --verbose --install --force
--exclude=autopoint
-I/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/sysroots/i686-linux/usr/share/aclocal-1.11
-I /home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/sysroots/i686-linux/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal -I
/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/sysroots/i686-linux/usr/share/aclocal-1.11
-I /home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/sysroots/i686-linux/usr/share/aclocal
-I /home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/sysroots/i686-linux/usr/share/aclocal-1.11
-I /home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/sysroots/i686-linux/usr/share/aclocal
--force
| perl: error while loading shared libraries: libperl.so: cannot open
shared object file: No such file or directory
| aclocal: /home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/tmp/sysroots/i686-linux/usr/bin/autom4te
failed with exit status: 127
| autoreconf: aclocal failed with exit status: 127
| FATAL: autoreconf execution failed.
| ERROR: Function do_configure failed
NOTE: package file-native-5.04-r2.1: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb
do_configure failed
ERROR: Task 734
(virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb,
do_configure) failed with 256
Waiting for 2 active tasks to finish:
1: perl-native-5.10.1-r8 do_populate_sysroot (pid 11088)
2: python-native-2.6.5-ml12.1 do_populate_sysroot (pid 13764)
Waiting for 1 active tasks to finish:
1: python-native-2.6.5-ml12.1 do_populate_sysroot (pid 13764)
NOTE: package perl-native-5.10.1-r8: task do_populate_sysroot: Succeeded
ERROR: 'virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb'
failed
NOTE: package python-native-2.6.5-ml12.1: task do_populate_sysroot: Succeeded
ERROR: 'virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb'
failed
ERROR: 'virtual:native:/home/leon/sandbox/sidebranch/lancerofbdemo/openembedded/openembedded.git/recipes/file/file_5.04.bb'
failed
make: *** [image] Error 1

-- 
Leon


