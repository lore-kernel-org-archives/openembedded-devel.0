Return-Path: <joe@deserted.net>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9CB60119
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 15:36:08 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id s2so3116437iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6QJYeYh9kxrQT4XCrzQUEOI7cwLnSfGDlSNHQ6NuAQw=;
	b=HRJYjTxvnHEXIRH/CyTojtDKs21nzAFnls4vAAJ6Q9JUxLzLDEbtribB+SNOBswFQV
	Ct9iQLl0bM+Si/G9VucjqG3ALnscvSCUR/+RBMHufOuADbRDMASuMxI84Z6BNnn178y4
	nJaawGO/R56BvY4kDkbHC6RGwlF2zBZZBxxt/+o8NWBuKzPLq+xkTQhluVP31hxNd0x0
	9fEhYW6i1S0pbjVm+ELhe2HK+ycUnd9+na2WcsuCFC7IO4U+f2kAbpmXWdQ+ke57PxsZ
	YvkZJecdW3zmEtSaQBjyWiKBmSmLIVbIBYq5YX4HzDvZSh1RZteQ2QwRe5E8pwtKdZ4/
	lWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=6QJYeYh9kxrQT4XCrzQUEOI7cwLnSfGDlSNHQ6NuAQw=;
	b=gZZP8jBTWScl2PbrBzwk1CoPKDCXWf2I6ZpWrIKhZz+LJ1lnaEdyygRmkuoIQpHO0c
	FohLfi039PcNI+hFEhBSYBDuBH4OXoG8holChg58+INwzibWd1XZGanDfeYAP8mhv18b
	A760/4BSo2BPKg9+lu4Am0r6JXyyq3Ri6OnJuNLPzNsjlZWq/AOqN1tXrRU3uvCSReRR
	CubBcGrbbtI7wNG6Dq1GtAmhQdtdZ4DmLOblRXoPRVk2xQvvimzYFI5/Ab1oVMiqSG3o
	75/c+U7g7cncEa7ApISm/Jz1kQc+0bS6BzCfKl3diNAN7vwxcbLWiy+zs7zWRMb94mFp
	eVWQ==
X-Gm-Message-State: AOPr4FVWtK64c8CJ7cMuWfyVRm9w410ttKEhoJjPRGwVK/JT0xoLGOrro0bBWUCZLE88pg==
X-Received: by 10.107.59.75 with SMTP id i72mr4153712ioa.108.1461080169151;
	Tue, 19 Apr 2016 08:36:09 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id q198sm380376iod.6.2016.04.19.08.36.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 08:36:08 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: mark.asselstine@windriver.com
Date: Tue, 19 Apr 2016 11:37:09 -0400
Message-Id: <1461080229-23859-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20160419142059.GB5970@mentor.com>
References: <20160419142059.GB5970@mentor.com>
Cc: anders@chargestorm.se, openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v3] dnsmasq: get systemd only working again
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
X-List-Received-Date: Tue, 19 Apr 2016 15:36:12 -0000

From: Mark Asselstine <mark.asselstine@windriver.com>

The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
[dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
dnsmasq runtime. No sysvinit scripts are included in systemd only
builds (and should not be) and the dnsmasq executable has not moved to
/usr/sbin.

Reverting to the previous version of the systemd service file. If
folks want the local dnsmasq instance to be queried before going to
an external DNS they should add 'nameserver 127.0.0.1' to
/etc/resolv.conf. Or submit a change which will work with systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

The previous one should've been v2, so I've named this one v3 explicitly.
After reading more of the systemd documentation I think this approach in
the service file is the current best option available.  It would certainly
be cleaner to store the pidfile name in an environment variable but it
turns out on further inspection that if you pass a varaible to PIDFile,
you get errors (that you only see when the service is stopped, not while
it is running) indicating essentially that it is falling back to the
"guess the MAINPID value" behaviour.  So this seems to be the way we're
supposed to do this type of thing now.

-J.

 .../recipes-support/dnsmasq/dnsmasq.inc            |  9 ++--
 .../dnsmasq/files/dnsmasq-resolvconf-helper        | 62 ++++++++++++++++++++++
 .../recipes-support/dnsmasq/files/dnsmasq.service  |  9 ++--
 3 files changed, 72 insertions(+), 8 deletions(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 622e630..df58e5c 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -60,11 +60,12 @@ do_install () {
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
     fi
     if [ "${@base_contains('PACKAGECONFIG', 'resolvconf', 'resolvconf', '', d)}" != "" ]; then
-	install -d ${D}${sysconfdir}/resolvconf/update.d/
-	install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
+        install -d ${D}${sysconfdir}/resolvconf/update.d/
+        install -m 0755 ${WORKDIR}/dnsmasq.resolvconf ${D}${sysconfdir}/resolvconf/update.d/dnsmasq
 
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/99_dnsmasq ${D}${sysconfdir}/default/volatiles
+        install -m 0755 ${WORKDIR}/dnsmasq-resolvconf-helper ${D}${bindir}
     fi
 }
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
new file mode 100644
index 0000000..db54d46
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf-helper
@@ -0,0 +1,62 @@
+#!/bin/bash
+#
+# Borrowing heavily from the dnsmasq initscript's version of support for
+# resolvconf, intended for use in systemd-only configurations.
+#
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/sbin/dnsmasq
+NAME=dnsmasq
+
+# Most configuration options in /etc/default/dnsmasq are deprecated
+# but still honoured.
+if [ -r /etc/default/$NAME ]; then
+   . /etc/default/$NAME
+fi
+
+start_resolvconf()
+{
+   # If interface "lo" is explicitly disabled in /etc/default/dnsmasq
+   # Then dnsmasq won't be providing local DNS, so don't add it to
+   # the resolvconf server set.
+   for interface in $DNSMASQ_EXCEPT
+   do
+      [ $interface = lo ] && return
+   done
+
+   if [ -x /sbin/resolvconf ] ; then
+      echo "nameserver 127.0.0.1" |
+      /sbin/resolvconf -a lo.$NAME
+   fi
+   return 0
+}
+
+stop_resolvconf()
+{
+   if [ -x /sbin/resolvconf ] ; then
+      /sbin/resolvconf -d lo.$NAME
+   fi
+   return 0
+}
+
+case "$1" in
+   start)
+      start_resolvconf
+      exit 0
+      ;;
+   stop)
+      stop_resolvconf
+      exit 0
+      ;;
+   restart)
+      stop_resolvconf
+      start_resolvconf
+      exit 0
+      ;;
+   *)
+      echo "Usage: /etc/init.d/$NAME {start|stop|restart}" >&2
+      exit 3
+      ;;
+esac
+
+exit 0
+
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
index c3637e1..68b175c 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
@@ -5,10 +5,11 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/dnsmasq.pid
-ExecStartPre=/usr/sbin/dnsmasq --test
-ExecStart=/etc/init.d/dnsmasq systemd-exec
-ExecStartPost=/etc/init.d/dnsmasq systemd-start-resolvconf
-ExecStopPre=/etc/init.d/dnsmasq systemd-stop-resolvconf
+ExecStartPre=/usr/bin/dnsmasq --test
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid
+ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
+ExecStopPre=/usr/bin/dnsmasq-resolvconf-helper stop
+ExecStop=/bin/kill $MAINPID
 ExecReload=/bin/kill -HUP $MAINPID
 
 [Install]
-- 
1.9.1


