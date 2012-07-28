Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SvG2u-0002yu-ES
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jul 2012 01:03:40 +0200
Received: by pbbrq2 with SMTP id rq2so6488706pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2012 15:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OmoPpjrzAJCp0X0Bx1m0MK0AVQDI6s79HakvyQRFMhw=;
	b=krHplUKVP69r1o5j+8FBP7FFkoANCzwMzXx0Pmr4BYfmFKqHMeL1OW6lR4ZxnuZDcQ
	zNSjvqrRcVA7nRY9rVAZBwryRnIbhfo+TkLwRArmPm9oeP7iIqD2J+cDEj2diUt48jbZ
	Qki2TAB+tfo/JAoOzxBXUA/VoO/lfRL5m9p+ET/jHQ4RfkooHE/RCpn1X+wqfIOERkGb
	aNUoYCavKk0eDjskrB1y+SPPSj+LWT8cp21xS+UDYPBLHr+79+l2bJKwBJPql5rOe4u+
	MDDSoY0ow9R16KuJ9n9POPJyisGgDMaPovIekABTNAa04RTpFE0ZxRKycZyYQH/UMaUq
	OyCw==
Received: by 10.66.75.133 with SMTP id c5mr14881945paw.24.1343515925952;
	Sat, 28 Jul 2012 15:52:05 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id qa5sm4690108pbb.19.2012.07.28.15.52.04
	(version=SSLv3 cipher=OTHER); Sat, 28 Jul 2012 15:52:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2012 15:51:58 -0700
Message-Id: <1343515918-20671-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343515918-20671-1-git-send-email-raj.khem@gmail.com>
References: <1343515918-20671-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 2/2] busybox: stopping systemd-kmsg-syslogd is not needed
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
X-List-Received-Date: Sat, 28 Jul 2012 23:03:40 -0000

systemd-kmsg-syslogd.service is discontinued in systemd so
there is no need to stop it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/busybox/busybox-syslog.service.in      |    1 -
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
index 27b9831..c6c625e 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
@@ -3,7 +3,6 @@ Description=System Logging Service
 Wants=busybox-klogd.service
 
 [Service]
-ExecStartPre=/bin/systemctl stop systemd-kmsg-syslogd.service
 EnvironmentFile=-/etc/default/busybox-syslog
 ExecStart=@base_sbindir@/syslogd -n $OPTIONS
 Sockets=syslog.socket
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
index a0ae2ce..915a50e 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.5.4



