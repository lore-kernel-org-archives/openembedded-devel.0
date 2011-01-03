Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <zach.frey@gmail.com>) id 1PZlec-0006pP-Gr
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 15:44:59 +0100
Received: by pvd12 with SMTP id 12so2572329pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 06:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=1O1pYmufWnOAtT4Mo/prJt/YXDGonjHrQy+lhF/a7+Y=;
	b=ihamc/YLBOiajVA7zwGvRJZgbZHfCEZseRvVOMl8LyLy5cNQ5S4Ts6DkOdIiUzvLIY
	AotYbHjY2WqmP37oLWywEKqzSFsOwR5jz7NlpcVD0S7gXtJpCDzY00Pw+bH0qM7sU9kF
	fxY/qO7ErABqsDa14BSrfqEondXZ5Oo7x0Hhc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=ejlJceaghcky4H4OVkKUoTK0xg+D9+vHinzkyczeSayLM+1ttYsSHk3Hg0MfmGxF8U
	ZCDMkW+RWHwtV7OjxTwkalBK7618NDxCivjvhFeEq2jSBAD+9zQQijufzoj/+JRUUBOp
	KleB0FqdS64sgAra20uB6JLBMcpRoEWHi/l6E=
MIME-Version: 1.0
Received: by 10.142.128.18 with SMTP id a18mr16851827wfd.267.1294065870846;
	Mon, 03 Jan 2011 06:44:30 -0800 (PST)
Sender: zach.frey@gmail.com
Received: by 10.143.156.8 with HTTP; Mon, 3 Jan 2011 06:44:30 -0800 (PST)
Date: Mon, 3 Jan 2011 09:44:30 -0500
X-Google-Sender-Auth: pd4Fg8xy-Fe-U0tyIpOJ_nZlr2k
Message-ID: <AANLkTimuCp0zKZFJfeycuwCTCRXf3Spn2-2ozKx_ouWH@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Continued build failure with system-tools-backends
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
X-List-Received-Date: Mon, 03 Jan 2011 14:44:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi everyone,

I'm still seeing this build failure with  system-tools-backends.   I had
thought previously that the issue was due to building on Hardy (8.04), which
ships automake-1.7; however, I am still seeing the problem now that I have
my build host update to Lucid (10.04) with automake 1.11.1.

Thoughts?

By the way, please let me know if this is really the right list for this
type of report or if is more appropriate for openembedded-users.


Thanks,
Zach

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "master"
METADATA_REVISION = "ae60020"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "omapzoom2"
DISTRO            = "angstrom"
DISTRO_VERSION    = "next"
TARGET_FPU        = "hard"

NOTE: package system-tools-backends-2.10.1-r1: task do_setscene: Succeeded
NOTE: Running task 1610 of 2510 (ID: 8,
/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_fetch)
130.239.18.173, 130.239.18.163, 2001:6b0:e:2018::163, ...
Connecting to ftp.gnome.org|130.239.18.173|:80... connected.
HTTP request sent, awaiting response... NOTE: package
system-tools-backends-2.10.1-r1: task do_fetch: Started
NOTE: fetch
http://ftp.gnome.org/pub/GNOME/sources/system-tools-backends/2.10/system-tools-backends-2.10.1.tar.bz2
200 OK
Length: 461966 (451K) [application/x-bzip2]
Saving to:
`/home/PHOENIX/frey/OE/build/tmp/downloads/system-tools-backends-2.10.1.tar.bz2'

     0K .......... .......... .......... .......... .......... 11% 76.6K 5s
    50K .......... .......... .......... .......... .......... 22%  301K 3s
   100K .......... .......... .......... .......... .......... 33%  319K 2s
   150K .......... .......... .......... .......... .......... 44%  353K 1s
   200K .......... .......... .......... .......... .......... 55% 1.76M 1s
   250K .......... .......... .......... .......... .......... 66%  413K 1s
   300K .......... .......... .......... .......... .......... 77% 1.10M 0s
   350K .......... .......... .......... .......... .......... 88%  273K 0s
   400K .......... .......... .......... .......... .......... 99%  294M 0s
   450K .                                                     100%
2172G=1.5s

2011-01-03 09:25:18 (302 KB/s) -
`/home/PHOENIX/frey/OE/build/tmp/downloads/system-tools-backends-2.10.1.tar.bz2'
saved [461966/461966]

NOTE: package system-tools-backends-2.10.1-r1: task do_fetch: Succeeded
NOTE: Running task 1611 of 2510 (ID: 0,
/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_unpack)
NOTE: package system-tools-backends-2.10.1-r1: task do_unpack: Started
NOTE: Unpacking tmp/downloads/system-tools-backends-2.10.1.tar.bz2 to
tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/
NOTE: Unpacking
../openembedded/recipes/gnome/system-tools-backends-2.10.1/system-tools-backends
to tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/
NOTE: package system-tools-backends-2.10.1-r1: task do_unpack: Succeeded
NOTE: Running task 1645 of 2510 (ID: 1,
/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_patch)
NOTE: package system-tools-backends-2.10.1-r1: task do_patch: Started
NOTE: Applying patch 'add-angstrom-distro.patch'
(../openembedded/recipes/gnome/system-tools-backends-2.10.1/add-angstrom-distro.patch)
NOTE: package system-tools-backends-2.10.1-r1: task do_patch: Succeeded
NOTE: Running task 1646 of 2510 (ID: 11,
/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_configure)
NOTE: package system-tools-backends-2.10.1-r1: task do_configure: Started
NOTE: package system-tools-backends-2.10.1-r1: task do_configure: Succeeded
NOTE: Running task 1676 of 2510 (ID: 438,
/home/PHOENIX/frey/OE/openembedded/recipes/shadow/shadow_4.1.4.2.bb,
do_patch)
NOTE: package shadow-4.1.4.2-r18.2: task do_patch: Started
NOTE: Applying patch 'shadow.automake-1.11.patch'
(../openembedded/recipes/shadow/files/shadow.automake-1.11.patch)
NOTE: Applying patch 'shadow-4.1.3-dots-in-usernames.patch'
(../openembedded/recipes/shadow/files/shadow-4.1.3-dots-in-usernames.patch)
NOTE: Applying patch 'shadow-4.1.4.2-env-reset-keep-locale.patch'
(../openembedded/recipes/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch)
NOTE: Applying patch 'shadow-4.1.4.2-groupmod-pam-check.patch'
(../openembedded/recipes/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch)
NOTE: Applying patch 'shadow-4.1.4.2-su_no_sanitize_env.patch'
(../openembedded/recipes/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch)
NOTE: package shadow-4.1.4.2-r18.2: task do_patch: Succeeded
NOTE: Running task 1677 of 2510 (ID: 446,
/home/PHOENIX/frey/OE/openembedded/recipes/shadow/shadow_4.1.4.2.bb,
do_configure)
NOTE: package shadow-4.1.4.2-r18.2: task do_configure: Started
NOTE: package shadow-4.1.4.2-r18.2: task do_configure: Succeeded
NOTE: Running task 1691 of 2510 (ID: 12,
/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_qa_configure)
NOTE: package system-tools-backends-2.10.1-r1: task do_qa_configure: Started
NOTE: package system-tools-backends-2.10.1-r1: task do_qa_configure:
Succeeded
NOTE: Running task 1692 of 2510 (ID: 13,
/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_compile)
NOTE: package system-tools-backends-2.10.1-r1: task do_compile: Started
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb do_compile failed
ERROR: Task 13 (/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_compile) failed with 256
ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb' failed
ERROR: Function do_compile failed
NOTE: Task failed: ('function do_compile failed',
'/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/temp/log.do_compile.26677')
ERROR: Logfile of failure stored in:
/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/temp/log.do_compile.26677
Log data follows:
| NOTE: make
| cd . && \
|       /bin/sh
/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r1/system-tools-backends-2.10.1/missing
--run automake-1.7 --gnu  Makefile
| configure.in:8: version mismatch.  This is Automake 1.7.9,
| configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
| configure.in:8: comes from Automake 1.11.1.  You should recreate
| configure.in:8: aclocal.m4 with aclocal and run automake again.
| make: *** [Makefile.in] Error 1
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package system-tools-backends-2.10.1-r1: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb do_compile failed
ERROR: Task 13 (/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_compile) failed with 256
ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb' failed
ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb' failed
frey@AA-BUILDER7:~/OE/build$

$ automake --version
automake (GNU automake) 1.11.1

