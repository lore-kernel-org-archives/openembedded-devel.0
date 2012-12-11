Received: from m13-70.163.com ([220.181.13.70])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <huanmateme@163.com>) id 1TiKSQ-0003oM-QZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 08:40:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Received:Date:From:To:Cc:Subject:In-Reply-To:
	References:Content-Type:MIME-Version:Message-ID; bh=z2oJgWzJYqpm
	XDd6UwixPIDYnxstemDpIkTJCgWVTc8=; b=TXjca3TL4RYFqD/k79FwOoq5IVpA
	SkcgGxqwrKDtGIV31/T9+5hRB3nMKZCejxzq6FjiUXS/LwxpTZ4NfSZrjiVq5KXY
	tDfM3L+Rn8A+sulFqlUngC/fDLVFneZVzAB0lQA5yTCzrLncSt4bZJ82QK7/K930
	SXhZVkpAJ1rtA3s=
Received: from huanmateme$163.com ( [61.148.56.138] ) by
	ajax-webmail-wmsvr70 (Coremail) ; Tue, 11 Dec 2012 15:26:14 +0800 (CST)
X-Originating-IP: [61.148.56.138]
Date: Tue, 11 Dec 2012 15:26:14 +0800 (CST)
From: aaa  <huanmateme@163.com>
To: aaa <huanmateme@163.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20121210(21001.5125.5051) Copyright (c) 2002-2012 www.mailtech.cn
	163com
In-Reply-To: <790f30d1.9fcc.13b88cef8d7.Coremail.huanmateme@163.com>
References: <790f30d1.9fcc.13b88cef8d7.Coremail.huanmateme@163.com>
MIME-Version: 1.0
Message-ID: <366a097e.a5ec.13b88db577d.Coremail.huanmateme@163.com>
X-CM-TRANSID: RsGowEC5okAW4MZQfv0GAA--.3440W
X-CM-SenderInfo: xkxd0z5dwhzvi6rwjhhfrp/xtbBSQGCgE9otSsvwwABse
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Where does the package name is defined?
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
X-List-Received-Date: Tue, 11 Dec 2012 07:40:55 -0000
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

I got it now. It is under the images directory. 
Please simple ignore my previous email.
Question closed.


Thanks,
Biao

At 2012-12-11 15:12:43,aaa <huanmateme@163.com> wrote:

Hi OE,


I am a newbie to OE, trying to reading the UserManual of the OE.
There are a set of bitbake targets named as PAKAGE-image,which has a "image" suffix,  like helloworld-image, bootstrap-image, but there is only "helloworld" under the ${OEBASE}/openembedded/recipes/, my question is where is the helloworld-image(which has a image suffix) defined?


Thanks in advance!
Biao
From huanmateme@163.com Tue Dec 11 08:42:29 2012
Received: from m13-70.163.com ([220.181.13.70])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <huanmateme@163.com>) id 1TiKU0-0003u3-J6
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 08:42:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Received:Date:From:To:Subject:Content-Type:
	MIME-Version:Message-ID; bh=UBJMvvAwuKUxwUagPxpww6mNFAwIlRzNH8qv
	APr2Ack=; b=TnzbJcvwKjj/k0p8SwGxozv5dHzluEox8wAauzDK3Of5usaH4dJl
	CRzZotq0KKQbpZNXe8a49mUwXFj8YANmNXBFseNI/B+I2DB9ISBxytxc8RanWb12
	KkNiA/NUBFZH/K7PXWtYWWnTbG6AkdT7O48MBXPBk+I6fOTFgXeWGCQ=
Received: from huanmateme$163.com ( [61.148.56.138] ) by
	ajax-webmail-wmsvr70 (Coremail) ; Tue, 11 Dec 2012 15:12:43 +0800 (CST)
X-Originating-IP: [61.148.56.138]
Date: Tue, 11 Dec 2012 15:12:43 +0800 (CST)
From: aaa  <huanmateme@163.com>
To: openembedded-devel@lists.openembedded.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
	20121210(21001.5125.5051) Copyright (c) 2002-2012 www.mailtech.cn
	163com
MIME-Version: 1.0
Message-ID: <790f30d1.9fcc.13b88cef8d7.Coremail.huanmateme@163.com>
X-CM-TRANSID: RsGowEA5f0Ls3MZQD_UGAA--.15836W
X-CM-SenderInfo: xkxd0z5dwhzvi6rwjhhfrp/xtbBSR2CgE9otSr6gAABsV
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe] Where does the package name is defined?
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
X-List-Received-Date: Tue, 11 Dec 2012 07:42:29 -0000

Hi OE,


I am a newbie to OE, trying to reading the UserManual of the OE.
There are a set of bitbake targets named as PAKAGE-image,which has a "image" suffix,  like helloworld-image, bootstrap-image, but there is only "helloworld" under the ${OEBASE}/openembedded/recipes/, my question is where is the helloworld-image(which has a image suffix) defined?


Thanks in advance!
Biao
From koen@dominion.thruhere.net Tue Dec 11 09:27:07 2012
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TiLBD-00054p-Bs
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 09:27:07 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1485990wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 00:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=1oW6ifbj2RzfbYud7UJLHjw/gz7+SXmLtfdKAYamuqM=;
	b=CgPQBP81k7oX/ENfeiYzWQyflp5aOfp7oNG1WOKN2csfAqNuAdv9QTuVcdkAp9Dx2i
	u1kNzwL5tncChBQhX65YoxOByM0yUHtq4q1md6FLKKiYp6zyqrw2GIOBt4LOrCRF8hvC
	cibmU457bXSSIJtw10EGrTlwKB2jCmdJ7cdFcvJCe4BoCn3eZ+vdjUWjM8RemK/srEae
	WcAHzx3GIQ+6LRugP6w8otOFSHfAqCuu3vAZ8QxvWEpzafwV3xNG7mKtC+9NRa9CE/rr
	A+IS3XDs4zIEPrmh4nqcc7+Meq7TT+ayfj7ZpeXxtGy2QAkWr6HKaMKL5zaoWApeRYbf
	PyUQ==
Received: by 10.180.88.138 with SMTP id bg10mr15225454wib.13.1355213555488;
	Tue, 11 Dec 2012 00:12:35 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id t17sm15204146wiv.6.2012.12.11.00.12.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 00:12:34 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 09:12:23 +0100
Message-Id: <1355213543-3535-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQkKvAesJK2TLcfVQlY5u1xpwCnylwi4MGlb32/FcLwTMSUL2xpuWekQwLUNmUOUucUtDZyl
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [oe] [meta-oe][meta-systemd][PATCH] systemd: update to v196
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
X-List-Received-Date: Tue, 11 Dec 2012 08:27:07 -0000

Systemd-analyze has 2 reverts to keep it working with the python currently present in OE-core

The LGPLv2.1 was update to the latest text from gnu.org, so match checksum to that.

Runtime tested on beaglebone/angstrom and soekris-net6501/angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 +++++++++++++++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 +++++++++++++++++
 .../systemd/systemd/use-rootlibdir.patch           |  107 --------------------
 meta-systemd/recipes-core/systemd/systemd_git.bb   |   12 ++-
 4 files changed, 201 insertions(+), 112 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch b/meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
new file mode 100644
index 0000000..7de2705
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
@@ -0,0 +1,103 @@
+From 2003e63f48cee2f497de7b90b66284f98c1c9919 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 10 Dec 2012 12:24:32 +0100
+Subject: [PATCH 1/2] Revert "systemd-analyze: use argparse instead of getopt"
+
+This reverts commit 0c0271841ab45595f71528c50bcf1904d4b841d5.
+
+Argparse is broken in current OE python
+---
+ src/analyze/systemd-analyze |   60 ++++++++++++++++++++++++++++---------------
+ 1 files changed, 39 insertions(+), 21 deletions(-)
+
+diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
+index 88699d6..87a83dd 100755
+--- a/src/analyze/systemd-analyze
++++ b/src/analyze/systemd-analyze
+@@ -1,7 +1,6 @@
+ #!/usr/bin/python
+ 
+-import sys, os
+-import argparse
++import getopt, sys, os
+ from gi.repository import Gio
+ try:
+         import cairo
+@@ -76,6 +75,20 @@ def draw_text(context, x, y, text, size = 12, r = 0, g = 0, b = 0, vcenter = 0.5
+ 
+         context.restore()
+ 
++def usage():
++        sys.stdout.write("""systemd-analyze [--user] time
++systemd-analyze [--user] blame
++systemd-analyze [--user] plot
++
++Process systemd profiling information
++
++  -h --help         Show this help
++""")
++
++def help():
++        usage()
++        sys.exit()
++
+ def time():
+ 
+         initrd_time, start_time, finish_time = acquire_start_time()
+@@ -266,29 +279,34 @@ def plot():
+ 
+         surface.finish()
+ 
+-parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
+-                                 description='Process systemd profiling information',
+-                                 epilog='''\
+-time - print time spent in the kernel before reaching userspace
+-blame - print list of running units ordered by time to init
+-plot - output SVG graphic showing service initialization
+-''')
+-
+-parser.add_argument('action', choices=('time', 'blame', 'plot'),
+-                    default='time', nargs='?',
+-                    help='action to perform (default: time)')
+-parser.add_argument('--user', action='store_true',
+-                    help='use the session bus')
++def unknown_verb():
++        sys.stderr.write("Unknown verb '%s'.\n" % args[0])
++        usage()
++        sys.exit(1)
+ 
+-args = parser.parse_args()
++bus = Gio.BusType.SYSTEM
+ 
+-if args.user:
+-        bus = Gio.BusType.SESSION
+-else:
+-        bus = Gio.BusType.SYSTEM
++try:
++        opts, args = getopt.gnu_getopt(sys.argv[1:], "h", ["help", "user"])
++except getopt.GetoptError as err:
++        sys.stdout.write(str(err) + "\n")
++        usage()
++        sys.exit(2)
++for o, a in opts:
++        if o in ("-h", "--help"):
++                help()
++        elif o == '--user':
++                bus = Gio.BusType.SESSION
++        else:
++                assert False, "unhandled option"
+ 
+ verb = {'time' : time,
+ 	'blame': blame,
+ 	'plot' : plot,
++	'help' : help,
+ 	}
+-verb.get(args.action)()
++
++if len(args) == 0:
++        time()
++else:
++        verb.get(args[0], unknown_verb)()
+-- 
+1.7.7.6
+
diff --git a/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch b/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
new file mode 100644
index 0000000..e5e8d7d
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
@@ -0,0 +1,91 @@
+From 8079db861b8ffdce69fa10a9ab9ef4740045187f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 10 Dec 2012 12:25:00 +0100
+Subject: [PATCH 2/2] Revert "analyze: use GDBus instead of dbus-python"
+
+This reverts commit 4940c64240541e91411620b7dc0963e012aa6b91.
+
+Python-gobject is too old in current OE
+---
+ src/analyze/systemd-analyze |   31 ++++++++++++++-----------------
+ 1 files changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/src/analyze/systemd-analyze b/src/analyze/systemd-analyze
+index 87a83dd..636fd74 100755
+--- a/src/analyze/systemd-analyze
++++ b/src/analyze/systemd-analyze
+@@ -1,15 +1,14 @@
+ #!/usr/bin/python
+ 
+-import getopt, sys, os
+-from gi.repository import Gio
++import getopt, dbus, sys, os
+ try:
+         import cairo
+ except ImportError:
+         cairo = None
+ 
+ def acquire_time_data():
+-        manager = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.systemd1.Manager', None)
++
++        manager = dbus.Interface(bus.get_object('org.freedesktop.systemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.systemd1.Manager')
+         units = manager.ListUnits()
+ 
+         l = []
+@@ -18,25 +17,23 @@ def acquire_time_data():
+                 if i[5] != "":
+                         continue
+ 
+-                properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                        None, 'org.freedesktop.systemd1', i[6], 'org.freedesktop.DBus.Properties', None)
++                properties = dbus.Interface(bus.get_object('org.freedesktop.systemd1', i[6]), 'org.freedesktop.DBus.Properties')
+ 
+-                ixt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic')
+-                aet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic')
+-                axt = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic')
+-                iet = properties.Get('(ss)', 'org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic')
++                ixt = int(properties.Get('org.freedesktop.systemd1.Unit', 'InactiveExitTimestampMonotonic'))
++                aet = int(properties.Get('org.freedesktop.systemd1.Unit', 'ActiveEnterTimestampMonotonic'))
++                axt = int(properties.Get('org.freedesktop.systemd1.Unit', 'ActiveExitTimestampMonotonic'))
++                iet = int(properties.Get('org.freedesktop.systemd1.Unit', 'InactiveEnterTimestampMonotonic'))
+ 
+                 l.append((str(i[0]), ixt, aet, axt, iet))
+ 
+         return l
+ 
+ def acquire_start_time():
+-        properties = Gio.DBusProxy.new_for_bus_sync(bus, Gio.DBusProxyFlags.NONE,
+-                None, 'org.freedesktop.systemd1', '/org/freedesktop/systemd1', 'org.freedesktop.DBus.Properties', None)
++        properties = dbus.Interface(bus.get_object('org.freedesktop.systemd1', '/org/freedesktop/systemd1'), 'org.freedesktop.DBus.Properties')
+ 
+-        initrd_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic')
+-        userspace_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic')
+-        finish_time = properties.Get('(ss)', 'org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic')
++        initrd_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'InitRDTimestampMonotonic'))
++        userspace_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'UserspaceTimestampMonotonic'))
++        finish_time = int(properties.Get('org.freedesktop.systemd1.Manager', 'FinishTimestampMonotonic'))
+ 
+         if finish_time == 0:
+                 sys.stderr.write("Bootup is not yet finished. Please try again later.\n")
+@@ -284,7 +281,7 @@ def unknown_verb():
+         usage()
+         sys.exit(1)
+ 
+-bus = Gio.BusType.SYSTEM
++bus = dbus.SystemBus()
+ 
+ try:
+         opts, args = getopt.gnu_getopt(sys.argv[1:], "h", ["help", "user"])
+@@ -296,7 +293,7 @@ for o, a in opts:
+         if o in ("-h", "--help"):
+                 help()
+         elif o == '--user':
+-                bus = Gio.BusType.SESSION
++                bus = dbus.SessionBus()
+         else:
+                 assert False, "unhandled option"
+ 
+-- 
+1.7.7.6
+
diff --git a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
deleted file mode 100644
index 4c471b6..0000000
--- a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-Upstream-Status: Undecided
-
-This patch removes some of hardcoded references to /lib
-and /usr/lib since on some architectures it should be
-/lib64 and /usr/lib64 atleast in OE
-
-I am not sure about the intention of hardcoded values
-thats why status is undecided
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am	2012-09-22 11:07:58.811981199 -0700
-+++ git/Makefile.am	2012-09-22 11:09:11.267983956 -0700
-@@ -64,25 +64,25 @@
- 
- # Our own, non-special dirs
- pkgsysconfdir=$(sysconfdir)/systemd
--userunitdir=$(prefix)/lib/systemd/user
--userpresetdir=$(prefix)/lib/systemd/user-preset
--tmpfilesdir=$(prefix)/lib/tmpfiles.d
--sysctldir=$(prefix)/lib/sysctl.d
--usergeneratordir=$(prefix)/lib/systemd/user-generators
-+userunitdir=$(prefix)/$(rootlibdir)/systemd/user
-+userpresetdir=$(prefix)/$(rootlibdir)/systemd/user-preset
-+tmpfilesdir=$(prefix)/$(rootlibdir)/tmpfiles.d
-+sysctldir=$(prefix)/$(rootlibdir)/sysctl.d
-+usergeneratordir=$(prefix)/$(rootlibdir)/systemd/user-generators
- pkgincludedir=$(includedir)/systemd
- systemgeneratordir=$(rootlibexecdir)/system-generators
- systemshutdowndir=$(rootlibexecdir)/system-shutdown
- systemsleepdir=$(rootlibexecdir)/system-sleep
--systemunitdir=$(rootprefix)/lib/systemd/system
--systempresetdir=$(rootprefix)/lib/systemd/system-preset
--udevlibexecdir=$(rootprefix)/lib/udev
-+systemunitdir=$(rootprefix)/$(rootlibdir)/systemd/system
-+systempresetdir=$(rootprefix)/$(rootlibdir)/systemd/system-preset
-+udevlibexecdir=$(rootprefix)/$(rootlibdir)/udev
- udevhomedir = $(udevlibexecdir)
- udevrulesdir = $(udevlibexecdir)/rules.d
- 
- # And these are the special ones for /
- rootprefix=@rootprefix@
- rootbindir=$(rootprefix)/bin
--rootlibexecdir=$(rootprefix)/lib/systemd
-+rootlibexecdir=$(rootprefix)/$(rootlibdir)/systemd
- 
- CLEANFILES = $(BUILT_SOURCES)
- EXTRA_DIST =
-@@ -132,7 +132,7 @@
- 	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=\"$(bindir)/systemd-stdio-bridge\" \
- 	-DROOTPREFIX=\"$(rootprefix)\" \
- 	-DRUNTIME_DIR=\"/run\" \
--	-DRANDOM_SEED=\"$(localstatedir)/lib/random-seed\" \
-+	-DRANDOM_SEED=\"$(localstatedir)/$(rootlibdir)/random-seed\" \
- 	-DSYSTEMD_CRYPTSETUP_PATH=\"$(rootlibexecdir)/systemd-cryptsetup\" \
- 	-DSYSTEM_GENERATOR_PATH=\"$(systemgeneratordir)\" \
- 	-DUSER_GENERATOR_PATH=\"$(usergeneratordir)\" \
-@@ -2692,7 +2692,7 @@
- 
- binfmt-install-data-hook:
- 	$(MKDIR_P) -m 0755 \
--		$(DESTDIR)$(prefix)/lib/binfmt.d \
-+		$(DESTDIR)$(prefix)/$(rootlibdir)/binfmt.d \
- 		$(DESTDIR)$(sysconfdir)/binfmt.d \
- 		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
- 	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
-@@ -3107,7 +3107,7 @@
- 
- timedated-install-data-hook:
- 	$(MKDIR_P) -m 0755 \
--		$(DESTDIR)$(prefix)/lib/systemd/ntp-units.d \
-+		$(DESTDIR)$(prefix)/$(rootlibdir)/systemd/ntp-units.d \
- 		$(DESTDIR)$(sysconfdir)/systemd/ntp-units.d
- 	( cd $(DESTDIR)$(systemunitdir) && \
- 		rm -f dbus-org.freedesktop.timedate1.service  && \
-@@ -3337,7 +3337,7 @@
- logind-install-data-hook:
- 	$(MKDIR_P) -m 0755 \
- 		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
--		$(DESTDIR)$(localstatedir)/lib/systemd
-+		$(DESTDIR)$(localstatedir)/$(rootlibdir)/systemd
- 	( cd $(DESTDIR)$(systemunitdir) && \
- 		rm -f dbus-org.freedesktop.login1.service && \
- 		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
-@@ -3494,7 +3494,7 @@
- 		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
- 		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
- 		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
--		-e 's,@RANDOM_SEED\@,$(localstatedir)/lib/random-seed,g' \
-+		-e 's,@RANDOM_SEED\@,$(localstatedir)/$(rootlibdir)/random-seed,g' \
- 		-e 's,@prefix\@,$(prefix),g' \
- 		-e 's,@exec_prefix\@,$(exec_prefix),g' \
- 		-e 's,@libdir\@,$(libdir),g' \
-@@ -3619,9 +3619,9 @@
- 	$(MKDIR_P) -m 0755 \
- 		$(DESTDIR)$(tmpfilesdir) \
- 		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
--		$(DESTDIR)$(prefix)/lib/modules-load.d \
-+		$(DESTDIR)$(prefix)/$(rootlibdir)/modules-load.d \
- 		$(DESTDIR)$(sysconfdir)/modules-load.d \
--		$(DESTDIR)$(prefix)/lib/sysctl.d \
-+		$(DESTDIR)$(prefix)/$(rootlibdir)/sysctl.d \
- 		$(DESTDIR)$(sysconfdir)/sysctl.d \
- 		$(DESTDIR)$(systemshutdowndir) \
- 		$(DESTDIR)$(systemsleepdir) \
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index bfd1b30..cfee2a3 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 
 LICENSE = "GPLv2 & LGPLv2.1 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
-                    file://LICENSE.LGPL2.1;md5=fb919cc88dbe06ec0b0bd50e001ccf1f \
+                    file://LICENSE.LGPL2.1;md5=f0df8fd67dfa1db3cc0bd431837f0b89 \
                     file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
 PROVIDES = "udev"
@@ -19,13 +19,14 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r10"
+PR = "r11"
 
 inherit useradd pkgconfig autotools perlnative
 
-SRCREV = "4d92e078e9d7e9a9d346065ea5e4afbafbdadb48"
+SRCREV = "decd634e801bee2c554edb35383cc9d43417a850"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-           file://use-rootlibdir.patch \
+           file://0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch \
+           file://0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
@@ -112,7 +113,7 @@ USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-RDEPENDS_${PN}-analyze = "python-dbus"
+RDEPENDS_${PN}-analyze = "python-dbus python-argparse python-textutils"
 RRECOMMENDS_${PN}-analyze = "python-pycairo"
 
 FILES_${PN}-initramfs = "/init"
@@ -216,6 +217,7 @@ FILES_udev += "${base_libdir}/udev/udevd \
                ${base_libdir}/udev/rules.d/78*.rules \
                ${base_libdir}/udev/rules.d/8*.rules \
                ${base_libdir}/udev/rules.d/95*.rules \
+               ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
               "
 
-- 
1.7.7.6



