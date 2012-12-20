Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wayne.tams@gmail.com>) id 1TldRO-0005ST-To
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 11:33:28 +0100
Received: by mail-ie0-f172.google.com with SMTP id c13so4318704ieb.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 02:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=qtfIEuiZyZ1zG7QUHLE60ggzGRbeC5wxaCm64enxGIw=;
	b=I3839n/npb16mCT6vsQCco8T3SMWeRCA4egxnZTkPik+EgWRU9TyftP1v4mZuk/2Fz
	EEeAob5ZsuWRKYiaGDnqY+3entBQz/tSiIFg6tRMM6pnvf5j41NpID2FyS5IncE0pzjb
	ziaoXVtd6NtfwWFWmsvwxJBk9QYnlyNHgUh8VjljL/SF9VlG6P54Mt4bsVDAgmv/Cbhg
	9blz6LfBSkOF/b4oUFUwSYu0VTAnRvxoQL3G7gkiW79ZSVR1BDivkEbhTDp/RtDprCQ4
	RyxoTHLJCmg58lbETzguiOVn38rKmX96hpLe89XzSrTHNkzqpUN4/ZOjJ/JmIN+u7O+d
	KR4g==
Received: by 10.50.88.136 with SMTP id bg8mr5006477igb.96.1355998722051; Thu,
	20 Dec 2012 02:18:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.61.68 with HTTP; Thu, 20 Dec 2012 02:18:21 -0800 (PST)
From: Wayne Tams <wayne.tams@gmail.com>
Date: Thu, 20 Dec 2012 10:18:21 +0000
Message-ID: <CAN=k24nXGFCwd=9zyMR_fyB31oSivKSM2w6EWcRcemjF9FpzWQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bazaar error when building gst-rtsp
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
X-List-Received-Date: Thu, 20 Dec 2012 10:33:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Due to project constraints I am stuck using OE classic and many of the
recipes, packages and tools are well out of date. I am having trouble
building gst-rtsp. The error is at the bottom of this mail. I believe this
error is due to a bug with one of dependencies, as pointed out in this post
http://lists.linuxtogo.org/pipermail/openembedded-users/2011-February/001233.html
.

I am having difficulties identifying what the problem was, and where the
patch is that fixes it. My version of OE is sat
at 71d25c65bd4e84487534464a4df8a95bdeca5695 on org.openembedded.dev.

Could anyone point me to the commit ids that would fix my problem.

All the best

Wayne

ERROR: Logfile of failure stored in:
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/work/armv5te-angstrom-linux-gnueabi/gst-rtsp-0.10.7-r1/temp/log.do_configure.32540
Log data follows:
| Creating po/ subdirectory
| Copying file mkinstalldirs
| Copying file po/Makefile.in.in
|
| Please add the files
|   codeset.m4 gettext.m4 glibc21.m4 iconv.m4 isc-posix.m4 lcmessage.m4
|   progtest.m4
| from the
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/i686-linux/usr/share/aclocal
directory to your autoconf macro directory
| or directly to your aclocal.m4 file.
| You will also need config.guess and config.sub, which you can get from
| ftp://ftp.gnu.org/pub/gnu/config/.
|
| automake (GNU automake) 1.11.1
| Copyright (C) 2009 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <
http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.11
| NOTE: Executing autoreconf --verbose --install --force
--exclude=autopoint -I
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/work/armv5te-angstrom-linux-gnueabi/gst-rtsp-0.10.7-r1/gst-rtsp-0.10.7/m4/
-I/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.11
-I
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal -I
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/work/armv5te-angstrom-linux-gnueabi/gst-rtsp-0.10.7-r1/gst-rtsp-0.10.7/m4/
-I
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.11
-I
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
-I
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/work/armv5te-angstrom-linux-gnueabi/gst-rtsp-0.10.7-r1/gst-rtsp-0.10.7/m4/
-I
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.11
-I
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
--force -I common/m4 -I m4
|
/home/wayne/source/o/oe/myproject/tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:
warning: underquoted definition of AC_LBL_C_INIT_BEFORE_CC
|
/home/wayne/source/o/oe/myproject/tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:
  run info '(automake)Extending aclocal'
|
/home/wayne/source/o/oe/myproject/tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:
  or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in `.'.
| libtoolize: copying file `./ltmain.sh'
| libtoolize: putting macros in `common/m4'.
| libtoolize: copying file `common/m4/libtool.m4'
| libtoolize: copying file `common/m4/ltoptions.m4'
| libtoolize: copying file `common/m4/ltsugar.m4'
| libtoolize: copying file `common/m4/ltversion.m4'
| libtoolize: copying file `common/m4/lt~obsolete.m4'
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to configure.acand
| libtoolize: rerunning libtoolize, to keep the correct libtool macros
in-tree.
|
/home/wayne/source/o/oe/myproject/tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:
warning: underquoted definition of AC_LBL_C_INIT_BEFORE_CC
|
/home/wayne/source/o/oe/myproject/tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:
  run info '(automake)Extending aclocal'
|
/home/wayne/source/o/oe/myproject/tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal/libpcap.m4:40:
  or see http://sources.redhat.com/automake/automake.html#Extending-aclocal
| autoreconf: running:
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/i686-linux/usr/bin/autoconf
--include=/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/work/armv5te-angstrom-linux-gnueabi/gst-rtsp-0.10.7-r1/gst-rtsp-0.10.7/m4/
--include=/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal-1.11
--include=/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/aclocal
--force --warnings=cross
| configure.ac:90: error: possibly undefined macro: PKG_CHECK_MODULES
|       If this token and others are legitimate, please use
m4_pattern_allow.
|       See the Autoconf documentation.
| configure.ac:179: error: possibly undefined macro: AM_PATH_CHECK
| autoreconf:
/home/wayne/source/o/oe/myproject//tmp-angstrom_2008_1/sysroots/i686-linux/usr/bin/autoconf
failed with exit status: 1
| FATAL: autoreconf execution failed.
| ERROR: Function do_configure failed
NOTE: package gst-rtsp-0.10.7-r1: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/wayne/source/o/oe/myproject//sa-meon/openembedded/recipes/gstreamer/
gst-rtsp_0.10.7.bb do_configure failed
ERROR: Task 373
(/home/wayne/source/o/oe/myproject//sa-meon/openembedded/recipes/gstreamer/
gst-rtsp_0.10.7.bb, do_configure) failed with exit code 1
ERROR:
'/home/wayne/source/o/oe/myproject//sa-meon/openembedded/recipes/gstreamer/
gst-rtsp_0.10.7.bb' failed
ERROR:
'/home/wayne/source/o/oe/myproject//sa-meon/openembedded/recipes/gstreamer/
gst-rtsp_0.10.7.bb' failed

