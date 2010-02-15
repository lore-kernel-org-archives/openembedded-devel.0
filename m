Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Nh2Yh-0004tk-QP
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 16:08:26 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id E6E8F491283
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 16:05:47 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 15 Feb 2010 16:06:01 +0100
Message-ID: <4B7962D2.2060300@dresearch.de>
Date: Mon, 15 Feb 2010 16:05:54 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100213132656.GE5364@jama>	<1266231291-18711-1-git-send-email-sledz@dresearch.de>
	<141020e31002150531s11663cc1q561cb1e7c7c51287@mail.gmail.com>
In-Reply-To: <141020e31002150531s11663cc1q561cb1e7c7c51287@mail.gmail.com>
X-OriginalArrivalTime: 15 Feb 2010 15:06:01.0596 (UTC)
	FILETIME=[630E03C0:01CAAE50]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] vala-dbus-binding-tool: (mostly) new recipe
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
X-List-Received-Date: Mon, 15 Feb 2010 15:08:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
> BTW: I noticed a bit strange DEPENDS, why is there depend on
> intltool-native? and other depends non-native?
> 
> it is expanded like this:
> -native:
> DEPENDS="autoconf-native automake-native libtool-native
> gnu-config-native shasum-native coreutils-native autoconf-native
> automake-native libtool-native gnu-config-native shasum-native
> coreutils-native vala-native libgee-native libxml2-native
> intltool-native"
> 
> non-native:
> DEPENDS="autoconf-native automake-native libtool-native libtool-cross
> gnu-config-native shasum-native coreutils-native
> virtual/arm-oe-linux-gnueabi-gcc virtual/libc  vala libgee libxml2
> intltool-native"
> 
> I'm not saying it's wrong, just curious how bitbake deals with
> changing DEPENDS while parsing BBCLASSEXTENDS = "native".

I'm not sure for myself. But without intltool-native dependency
baking vala-dbus-binding-tool fails with:

ERROR: function do_configure failed
ERROR: log data follows (/home/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/vala-dbus-binding-tool-0.1.3-r1.0/temp/log.do_configure.18882)
| automake (GNU automake) 1.10.2
| Copyright (C) 2008 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.10
| NOTE: Executing glib-gettextize --force --copy
| Copying file mkinstalldirs
| Copying file po/Makefile.in.in
|
| Please add the files
|   codeset.m4 gettext.m4 glibc21.m4 iconv.m4 isc-posix.m4 lcmessage.m4
|   progtest.m4
| from the /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal directory to your autoconf macro directory
| or directly to your aclocal.m4 file.
| You will also need config.guess and config.sub, which you can get from
| ftp://ftp.gnu.org/pub/gnu/config/.
|
| NOTE: Executing intltoolize --copy --force --automake
| /home/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/vala-dbus-binding-tool-0.1.3-r1.0/temp/run.do_configure.18882: line 305: intltoolize: command not found
NOTE: Task failed: /home/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/vala-dbus-binding-tool-0.1.3-r1.0/temp/log.do_configure.18882

Maybe this is a bug autotools_stage and this dependency should be generated
automatically like autoconf-native, automake-native, and libtool-native?

Steffen



