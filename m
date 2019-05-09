Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 67DDA7DFCC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 16:03:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450J631c3hz5c
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 18:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557417787;
	bh=ITJS+N8FT+FCzyyjvVpdgNfuM4xyqGIwgcUba4szrYw=;
	h=From:To:Subject:Date:From;
	b=FaWyTUtV2vOiNP6S72dzrYG83Qr4iaNIkf0x/kGUJIaqN6FeIU8/h7odkix27gSgP
	Pd/t5gz1z+W6rxOHRcX8ZUOyfZMJIf8Jk0FKMYl5B+eZpQi27jjd2ECElBbOajt1wA
	KlVdOVWjzxcWG+HH6TO5ozuXycPv/o7n624FP4ntYieR+6rpzdb6lwW4h4vodPjdtm
	pN/vlSoGWi755WgpNBZZcU6kjjDdMPSO8+Kl+E5Ux75sp6cVW4aK5T7wVCOfy83XTf
	on8AREHm1+aVEJmw8Iz3dCIFJX8axsqmL6mp5huUG4bCKH7qg6HF8K6Me+BJ7ev3xH
	0e7BUebsMFRPu6T4ITe17s9W9eHgRUgjhtIY+keyFsyu4cSpe4DlxeRBa+B8OshsKr
	hfgdpu9WE8ObeuvMs9q5bgIBZN1Y3hVLBvdhP9DUhAAmD6PV/3iUBZ5b5P4qxHQBEe
	MtncbiK9Gcm5l4xNPWmJ5oOlZkvy+xnVeopibQSn27WcFerA+7OC1MxwFmtsqyzDZp
	ca3w0M8l7kDmAmTJ9+oCrAcSD1svfC9zd4NE/+yVhoFOiko4NrZCpoeJ5AyT005ON2
	wBzx6haikzJ098nETCsdGrypFjnJ2dhIsKF2zSNW5x2puIbUxNrSV2fcIvkwgf4e27
	dW+iLmk4wK6BQgqLfglejhtk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 May 2019 19:03:03 +0300
Message-Id: <20190509160306.857-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] dnrd: Remove stale files of recipe removed 2 years ago
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2019 16:03:07 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../dnrd/dnrd/dnrd.conf.sample                | 21 -----
 .../recipes-daemons/dnrd/dnrd/dnrd.init       | 94 -------------------
 .../recipes-daemons/dnrd/dnrd/dnrd.service    | 12 ---
 3 files changed, 127 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample
 delete mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init
 delete mode 100644 meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service

diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample
deleted file mode 100644
index ec0584193..000000000
--- a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.conf.sample
+++ /dev/null
@@ -1,21 +0,0 @@
-# options to dnrd
-
-# example: two default dns servers and dns servers for exampledomain.com. The
-# latter are load balanced (-b)
-#
-#
-
-# DNRD_OPTS="
-# -s XXX.XXX.XX.XXX
-# -s XXX.XXX.XX.XXX
-# -b
-# -s XXX.XXX.XX.XXX:exampledomain.com
-# -s XXX.XXX.XX.XXX:exampledomain.com"
-
-# example: dnrd user
-#
-
-# DNRD_USER="user"
-#
-
-
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init
deleted file mode 100644
index 2fe583fcf..000000000
--- a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.init
+++ /dev/null
@@ -1,94 +0,0 @@
-#!/bin/sh
-#
-# Startup script for dnrd
-#
-#       Copyright 2008, Rakesh Pandit <rakesh.pandit@gmail.com>
-#
-#       This source is free software; you can redistribute it and/or modify
-#       it under the terms of the GNU General Public License as published by
-#       the Free Software Foundation; either version 2, or (at your option)
-#       any later version.
-
-#       This source is distributed in the hope that it will be useful,
-#       but WITHOUT ANY WARRANTY; without even the implied warranty of
-#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-#       GNU General Public License for more details.
-
-#       You should have received a copy of the GNU General Public License
-#       along with this program; if not, write to the Free Software
-#       Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-#
-# chkconfig: - 85 15
-# description: dnrd is a proxying nameserver. It forwards DNS queries to the
-# appropriate nameserver, but can also act as the primary nameserver for
-# a subnet behind a firewall. It also has features such as caching DNS
-# requests, support for DNS servers, cache poisoning prevention, TCP
-# support, etc..
-
-# processname: dnrd
-# pidfile: /var/run/dnrd.pid
-# config: /etc/dnrd/dnrd.conf
-
-# Provides:          dnrd
-# Required-Start:
-# Should-Start:
-# Required-Stop:
-# Default-Stop:      0 1 2 6
-# Short-Description: Start dnrd daemon
-# Description:       Domain Name Relay Daemon
-# END INIT INFO
-
-exe=/usr/sbin/dnrd
-pfile=/etc/passwd
-
-# Source function library.
-. /etc/init.d/functions
-
-# Source conf file
-. /etc/dnrd/dnrd.conf
-
-[ -x $exe ] || exit 1
-[ -r "/etc/dnrd/dnrd.conf" ] || exit 1
-if [ $DNRD_USER ]
-then
-         grep "^${LOGIN}:" $pfile >/dev/null 2>&1
-         if [ $? -eq 0 ];then
-                 echo "$DNRD_USER specified in /etc/dnrd/dnrd.conf does not exist!"
-         fi
-else
-        echo "DNRD_USER not set at /etc/dnrd/dnrd.conf!"
-        exit 1
-fi
-
-case "$1" in
-  start)
-        echo -n "Starting  dnrd: "
-        daemon  dnrd $DNRD_OPTS -u $DNRD_USER
-        echo
-        touch /var/lock/subsys/dnrd
-        ;;
-  stop)
-        echo -n "Shutting down dnrd: "
-        killproc dnrd
-        echo
-        rm -f /var/lock/subsys/dnrd
-        rm -f /var/run/dnrd.pid
-        ;;
-  status)
-        status dnrd
-        ;;
-  restart)
-        $0 stop
-        $0 start
-        ;;
-  reload)
-        echo -n "Reloading dnrd: "
-        killproc dnrd -HUP
-        echo
-        ;;
-  *)
-        echo "Usage: $0 {start|stop|restart|reload|status}"
-        exit 1
-esac
-
-exit 0
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service b/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service
deleted file mode 100644
index 9c9fa6639..000000000
--- a/meta-networking/recipes-daemons/dnrd/dnrd/dnrd.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Domain Name Relay Daemon
-After=network.target
-
-[Service]
-Type=forking
-PIDFile=/var/run/dnrd.pid
-EnvironmentFile=/etc/dnrd/dnrd.conf
-ExecStart=/usr/sbin/dnrd $DNRD_OPTS -u $DNRD_USER
-
-[Install]
-WantedBy=multi-user.target
-- 
2.17.1


