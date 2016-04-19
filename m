Return-Path: <joe@deserted.net>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3C8606A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 03:29:07 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id u185so826175iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=A5ZwfG9PyRdvhGDAzNPMMSC4V240QaIz552yWrLVhOA=;
	b=HcQ1vQ3iAf/7u9KBf7oNf3MsGmqi7s7ZjPKUJvFxmLMwfNyEpheOiPulllCGP39AyU
	j3zAHxQ4o+HQfiGuUiyAB0sAsfEKctTRprGj+Y27gtAeZoatz5rudzvTD6j1JXvbEGpX
	Wzf7wKsPjQ+OVxIfyb14GVJJeo2hKtHkOlf3naLgKPUrY9QpmwhtVCKzRAgbdCnvu5vl
	Jq+Ae4hciLOth32aDkd4cAytOeWYo3pl1GqtVXgJ83XlYdQwPWLSjKdtC/7WK7+szYW8
	HTWl8a6sBnJuYg3D84kxfWK/yDiZ9EV25pkv2d0mpGJNVJ6504Ud63CzqAQbWi19NMJc
	oBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=A5ZwfG9PyRdvhGDAzNPMMSC4V240QaIz552yWrLVhOA=;
	b=MRbe70zC5VGebOjvkYRQI0Rbj72KIITPP/L+Vpgmn4BDPjbJ4SEadbG4KtgvioTxPW
	e3Y9jblN9wiufwRtBLQI4jbBCJrzwH1kL7XLdMRqnLDo/bbBtJjfx/3kkd91aGtVUucp
	bzbtC3uUsL+BKVxY8PUx19wSuFdShDUeBtYkJOtqKgUrHO8EA6Y1MQ3Kbu779nfdUI1W
	8YNTbLkoLi5zc6aIGbHPe8Gjq0LAUFnDIN5UcyPAVDhb6oYD+utoYxKUxCym9SMh71SR
	up8VPo5aH2DZkzNbZ/ridrEnH+YDABhONj8rMasdHAIs4Tl/4cNLV9kw8UXKCZvbdx2a
	XaIg==
X-Gm-Message-State: AOPr4FXHN4zCJERamoHBQlgLhqdWgyo+LLHBUEnM44UjUwbePXhiV06q064qZAorGQiYQw==
X-Received: by 10.107.159.137 with SMTP id i131mr1062923ioe.29.1461036547704; 
	Mon, 18 Apr 2016 20:29:07 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	s71sm14680340ioe.34.2016.04.18.20.29.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 20:29:06 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: mark.asselstine@windriver.com
Date: Mon, 18 Apr 2016 23:30:07 -0400
Message-Id: <1461036607-24650-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Cc: anders@chargestorm.se, openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dnsmasq: get systemd only working again
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
X-List-Received-Date: Tue, 19 Apr 2016 03:29:10 -0000

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

Mark,

Thanks for the patch.  In the interests of not causing any more hassle
than I already have, I'm proposing this as an alternative to what you sent
earlier today.  This hopefully preserves the resolvconf/start-stop
functionality while not relying on any sysvinit-ness.  What do you think
about this as a middle-ground?

Anders,

I trust that nothing Mark and I are discussing here changes the issue you
noted about dnsmasq just falling over after a few minutes.  I propose we
dig into that separately, since it looks like a different problem probably
related to the uprev.  If it turns out that once we merge something to
support systemd-only builds that resolves the 'dnsmasq vandalizes itself'
issue, even better.

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
index c3637e1..5824b62 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.service
@@ -5,10 +5,10 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/dnsmasq.pid
-ExecStartPre=/usr/sbin/dnsmasq --test
-ExecStart=/etc/init.d/dnsmasq systemd-exec
-ExecStartPost=/etc/init.d/dnsmasq systemd-start-resolvconf
-ExecStopPre=/etc/init.d/dnsmasq systemd-stop-resolvconf
+ExecStartPre=/usr/bin/dnsmasq --test
+ExecStart=/usr/bin/dnsmasq -x $MAINPID
+ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
+ExecStop=/usr/bin/dnsmasq-resolvconf-helper stop
 ExecReload=/bin/kill -HUP $MAINPID
 
 [Install]
-- 
1.9.1


