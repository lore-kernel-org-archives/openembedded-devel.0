Received: from [209.85.221.105] (helo=mail-qy0-f105.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1MBU8u-00052g-2I
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 15:35:04 +0200
Received: by qyk3 with SMTP id 3so11427702qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jun 2009 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=CCJNy2T7dm8wLb5MXDBH3Tms+Jpcu5pNbu8wxvVWNRI=;
	b=URShqY8LbZRy2lZ6WaFkWGo4CMs9T806iQsmiGwRh7gTxcMcKFzVGFxz0HWDl1Rn4v
	i8YWMrq8MWjXNNMbfcPhPVTfv03w1lVOkynknrqm1Tb2KWcE4GmqGQk6cjEhftL36CXk
	/MPxOEWgft5nyCM8VfD9s2orKaBCr8usLkT6k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=F0RZm41OXN9peCALrq7Ppx58upd2vc553MvjpS7zSlbz+LwvYX2bdBKqven3y6+Yw1
	GXecK05fJZ4O91f21X9jOuug0Zme/8rpzyEhwsJ9qS7D8SI0XrZbqDg7DA4Q3SmKYcw7
	VF+K7L7Gdt0SkmDiUslOv84KwsDjSckWqit2U=
MIME-Version: 1.0
Received: by 10.229.70.139 with SMTP id d11mr1981695qcj.51.1243949171291; Tue, 
	02 Jun 2009 06:26:11 -0700 (PDT)
Date: Tue, 2 Jun 2009 06:26:11 -0700
Message-ID: <5e088bd90906020626m6f180330w61f7ab77391737da@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: guile-native (as well as a few others) failing after pull last night
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
X-List-Received-Date: Tue, 02 Jun 2009 13:35:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The failures are all in do_configure and seem quite similar (see log below).

I tried wiping tmp, same failure.

I'm an autotools idiot :-(  Any suggestions?

Steve

ERROR: function do_configure failed
ERROR: log data follows
(/home/sakoman/source/omap3-oe/tmp/work/i686-linux/guile-native-1.8.5-r1/temp/log.do_configure.23118)
| automake (GNU automake) 1.10.2
| Copyright (C) 2008 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.10
| NOTE: Executing autoreconf --verbose --install --force
--exclude=autopoint -I
/home/sakoman/source/omap3-oe/tmp/work/i686-linux/guile-native-1.8.5-r1/guile-1.8.5/guile-config/
-I/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal-1.10
-I /home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.in: not using Gettext
| autoreconf: running: aclocal -I
/home/sakoman/source/omap3-oe/tmp/work/i686-linux/guile-native-1.8.5-r1/guile-1.8.5/guile-config/
-I /home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal-1.10
-I /home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal
--force -I guile-config
| configure.in:772: warning: macro `AM_GNU_GETTEXT' not found in library
| autoreconf: configure.in: tracing
| configure.in:1000: warning: AC_RUN_IFELSE called without default to
allow cross compiling
| ../../lib/autoconf/general.m4:2463: AC_RUN_IFELSE is expanded from...
| ../../lib/m4sugar/m4sh.m4:516: AS_IF is expanded from...
| ../../lib/autoconf/general.m4:1899: AC_CACHE_VAL is expanded from...
| ../../lib/autoconf/general.m4:1912: AC_CACHE_CHECK is expanded from...
| ../../lib/autoconf/specific.m4:249: AC_SYS_RESTARTABLE_SYSCALLS is
expanded from...
| configure.in:1000: the top level
| configure.in:1268: warning: AC_RUN_IFELSE called without default to
allow cross compiling
| ../../lib/autoconf/general.m4:2479: AC_TRY_RUN is expanded from...
| configure.in:1268: the top level
| autoreconf: configure.in: adding subdirectory guile-readline to autoreconf
| autoreconf: Entering directory `guile-readline'
| autoreconf: running: aclocal -I
/home/sakoman/source/omap3-oe/tmp/work/i686-linux/guile-native-1.8.5-r1/guile-1.8.5/guile-config/
-I /home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal-1.10
-I /home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal
--force
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
| libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
| libtoolize: Consider adding `-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: running:
/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/bin/autoconf
--include=/home/sakoman/source/omap3-oe/tmp/work/i686-linux/guile-native-1.8.5-r1/guile-1.8.5/guile-config/
--include=/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal-1.10
--include=/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal
--force --warnings=cross
| autoreconf: running:
/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/bin/autoheader
--include=/home/sakoman/source/omap3-oe/tmp/work/i686-linux/guile-native-1.8.5-r1/guile-1.8.5/guile-config/
--include=/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal-1.10
--include=/home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/share/aclocal
--force --warnings=cross
| autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=cross
| automake: unknown warning category `cross'
| configure.in:20: installing `./config.guess'
| configure.in:20: installing `./config.sub'
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `guile-readline'
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `build-aux'.
| libtoolize: copying file `build-aux/ltmain.sh'
| libtoolize: putting macros in `guile-config'.
| libtoolize: copying file `guile-config/libtool.m4'
| libtoolize: copying file `guile-config/ltoptions.m4'
| libtoolize: copying file `guile-config/ltsugar.m4'
| libtoolize: copying file `guile-config/ltversion.m4'
| libtoolize: copying file `guile-config/lt~obsolete.m4'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.in and
| libtoolize: rerunning libtoolize, to keep the correct libtool macros in-tree.
| configure.in:772: warning: macro `AM_GNU_GETTEXT' not found in library
| configure.in:1000: warning: AC_RUN_IFELSE called without default to
allow cross compiling
| ../../lib/autoconf/general.m4:2463: AC_RUN_IFELSE is expanded from...
| ../../lib/m4sugar/m4sh.m4:516: AS_IF is expanded from...
| ../../lib/autoconf/general.m4:1899: AC_CACHE_VAL is expanded from...
| ../../lib/autoconf/general.m4:1912: AC_CACHE_CHECK is expanded from...
| ../../lib/autoconf/specific.m4:249: AC_SYS_RESTARTABLE_SYSCALLS is
expanded from...
| configure.in:1000: the top level
| configure.in:1268: warning: AC_RUN_IFELSE called without default to
allow cross compiling
| ../../lib/autoconf/general.m4:2479: AC_TRY_RUN is expanded from...
| configure.in:1268: the top level
| configure.in:795: error: possibly undefined macro: AM_GNU_GETTEXT
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| autoreconf: /home/sakoman/source/omap3-oe/tmp/staging/i686-linux/usr/bin/autoconf
failed with exit status: 1
| FATAL: autoreconf execution failed.
NOTE: Task failed:
/home/sakoman/source/omap3-oe/tmp/work/i686-linux/guile-native-1.8.5-r1/temp/log.do_configure.23118


