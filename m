Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Ni4IG-0001iH-22
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 12:11:43 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id E38E9491287;
	Thu, 18 Feb 2010 12:09:01 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 18 Feb 2010 12:09:24 +0100
Message-ID: <4B7D1FD3.8050703@dresearch.de>
Date: Thu, 18 Feb 2010 12:09:07 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B7A40BD.7070805@dresearch.de>
In-Reply-To: <4B7A40BD.7070805@dresearch.de>
X-OriginalArrivalTime: 18 Feb 2010 11:09:24.0142 (UTC)
	FILETIME=[D3F3B4E0:01CAB08A]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: intltool/autotools problem?
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
X-List-Received-Date: Thu, 18 Feb 2010 11:11:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> ERROR: function do_configure failed
> ERROR: log data follows (/home/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/vala-dbus-binding-tool-0.1.3-r1.0/temp/log.do_configure.18882)
> | automake (GNU automake) 1.10.2
> | Copyright (C) 2008 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.10
> | NOTE: Executing glib-gettextize --force --copy
> | Copying file mkinstalldirs
> | Copying file po/Makefile.in.in
> |
> | Please add the files
> |   codeset.m4 gettext.m4 glibc21.m4 iconv.m4 isc-posix.m4 lcmessage.m4
> |   progtest.m4
> | from the /home/sledz/work/HydraIP/OE/tmp.5/staging/i686-linux/usr/share/aclocal directory to your autoconf macro directory
> | or directly to your aclocal.m4 file.
> | You will also need config.guess and config.sub, which you can get from
> | ftp://ftp.gnu.org/pub/gnu/config/.
> |
> | NOTE: Executing intltoolize --copy --force --automake
> | /home/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/vala-dbus-binding-tool-0.1.3-r1.0/temp/run.do_configure.18882: line 305: intltoolize: command not found
> NOTE: Task failed: /home/sledz/work/HydraIP/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/vala-dbus-binding-tool-0.1.3-r1.0/temp/log.do_configure.18882
> 
> Maybe this is a bug autotools_stage and this dependency should be generated
> automatically like autoconf-native, automake-native, and libtool-native?

Ping!

I think we have a general problem here. It seem's that some other recipes fail on the same cause, e.g. mc (see <http://thread.gmane.org/gmane.comp.handhelds.openembedded/29901>).

Steffen



