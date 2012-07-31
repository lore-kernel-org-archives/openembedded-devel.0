Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwHnZ-0001C8-U9
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:08:06 +0200
Received: by yhjj56 with SMTP id j56so5807959yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OmoPpjrzAJCp0X0Bx1m0MK0AVQDI6s79HakvyQRFMhw=;
	b=xKBb7kpT/yRAWCvqctore1PJcA0s+z9BsRy7/bNkclTY7HZrUG9EzTTj5FqdLICKEq
	WPUuy38UUt6fqtyH1QlhCkO5KmDHshTq8fWzWkiNV5L5zBY5jFcx8OMrOX0tcfoFyawo
	8y90XBcLwcvIr3BCC98y7bZgWQESZGhCl/+hmf6ug/FkYqht3twxAcQn5zH2+k2/Zwm6
	nzG31iDeKzB8RoEDECRIJCVtxOZ9oHRYDbvJsiZ0wwI71Wu5lHRXNf2TTi16ciQCAnrb
	IzhSFa6PLt8q9zblNaI+ICycJrQpbb2YfMjxou4aeFgZ8k7q2MDyFPz8xdWs6ibsOnsN
	3oyQ==
Received: by 10.66.75.133 with SMTP id c5mr34745497paw.24.1343760987802;
	Tue, 31 Jul 2012 11:56:27 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hw6sm798801pbc.73.2012.07.31.11.56.26
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 11:56:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:56:12 -0700
Message-Id: <1343760977-3290-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 2/7] busybox: stopping systemd-kmsg-syslogd is not needed
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
X-List-Received-Date: Tue, 31 Jul 2012 19:08:06 -0000

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



