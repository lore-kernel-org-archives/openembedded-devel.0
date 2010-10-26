Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAfev-00062w-7m
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 11:17:33 +0200
Received: by gxk22 with SMTP id 22so25186gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=eGO/Cyxsbnn4VoKGiTdBd7uzdUzOhG9YV3J4c18s3Gc=;
	b=wmvcpLiJK8SyGM4hk+OxDhtO3c7wER0JTN8pthYUlGDSpJKOdc8vn8R0DxKVv1XlPs
	6lGn5zaJ9Puggb5szNQ0/RzD0ScEJ0X0IfOQs8MRXFWt/+y1EK3n58kBMUSZnUUuubZY
	lIvYCbGLjlZuJl6dvvYmGSc8+uVTt5f0KeirU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=lspi6OkA79bqLRfZVmA1News6kousVhfTgQLbN5Zx5x8fCfzbOEX5amdIlbC8D06Pt
	MoWmbHd7MYRib8dbL30JUaH/MhbyTCgki5WidnEDk/aneGM8ttBtP6kvwDWH2yUTAFpI
	FW4G9D2zi4gwE6qQGj+Ods5WlRif2QDG+NARE=
MIME-Version: 1.0
Received: by 10.42.140.136 with SMTP id k8mr277401icu.224.1288084606732; Tue,
	26 Oct 2010 02:16:46 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 26 Oct 2010 02:16:46 -0700 (PDT)
Date: Tue, 26 Oct 2010 11:16:46 +0200
Message-ID: <AANLkTim-_z6a6jX3X9Zh_s-ihE-19SFFmus3U7MXVPfY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libgee introspection problem
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
X-List-Received-Date: Tue, 26 Oct 2010 09:17:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

With the testing branch I get a problem with libgee native in
combination with introspection.
I'm building distro minimal, target neek (but I doubt that the latter matters)

Anyone an idea?

Frans

ERROR: Task 3216
(virtual:native:/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/libgee/libgee_0.6.0.bb,
do_configure) failed with 256
ERROR: Function do_configure failed
NOTE: Task failed: ('function do_configure failed',
'/home/hudson/jobs/FM_TEST/workspace/tmp/work/i686-linux/libgee-native-1_0.6.0-r6.1/temp/log.do_configure.20835')
ERROR: Logfile of failure stored in:
/home/hudson/jobs/FM_TEST/workspace/tmp/work/i686-linux/libgee-native-1_0.6.0-r6.1/temp/log.do_configure.20835
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
-I/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal-1.11
-I /home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal -I
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal-1.11
-I /home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal
-I /home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal-1.11
-I /home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal
--force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
| libtoolize: copying file `m4/libtool.m4'
| libtoolize: copying file `m4/ltoptions.m4'
| libtoolize: copying file `m4/ltsugar.m4'
| libtoolize: copying file `m4/ltversion.m4'
| libtoolize: copying file `m4/lt~obsolete.m4'
| autoreconf: running:
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/bin/autoconf
--include=/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal-1.11
--include=/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal
--force --warnings=cross
| autoreconf: running:
/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/bin/autoheader
--include=/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal-1.11
--include=/home/hudson/jobs/FM_TEST/workspace/tmp/sysroots/i686-linux/usr/share/aclocal
--force --warnings=cross
| autoreconf: running: automake --foreign --add-missing --copy
--force-missing --warnings=cross
| automake: unknown warning category `cross'
| gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
| autoreconf: automake failed with exit status: 1
| FATAL: autoreconf execution failed.
NOTE: package libgee-native-1_0.6.0-r6.1: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
virtual:native:/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/libgee/libgee_0.6.0.bb
do_configure failed
ERROR: Task 3216
(virtual:native:/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/libgee/libgee_0.6.0.bb,
do_configure) failed with 256


