Received: from mail-yw0-f50.google.com ([209.85.213.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsHnQ-0001mn-Sl
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 18:47:09 +0100
Received: by mail-yw0-f50.google.com with SMTP id p61so164532yhp.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 09:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Sf01RPx4urcoLBbuYPNq96syQXgFT71GxVHzQwJax20=;
	b=Bpgx8i8nJNw1YRAXw5QcOi3jzRVsVLA05KJNOgLkLm/TyDl3An0aP0h+R2gSor+hmO
	QxX2oSYb1j05ADA61DEFq9kGDnIm8GBqBVKBN+Jei1fxIMU3HSsFlnVTQhHdqovndznq
	Uiyj1rDw7TuQCWM3oVuC5GOEAJ020rmjKEm6o=
Received: by 10.236.110.110 with SMTP id t74mr23755162yhg.121.1328031556539;
	Tue, 31 Jan 2012 09:39:16 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id 6sm43425979anp.14.2012.01.31.09.39.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 09:39:15 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 17:38:58 +0000
Message-Id: <7d834bb680b6483be23bc335ce128ef0771a4c5c.1328031500.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1328031500.git.otavio@ossystems.com.br>
References: <cover.1328031500.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1328031500.git.otavio@ossystems.com.br>
References: <cover.1328031500.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 3/3] busybox: fix busybox-syslog systemd service file
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
X-List-Received-Date: Tue, 31 Jan 2012 17:47:09 -0000

The service file had the 'Wants' in 'Service' group instead of the
'Unit' group.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../busybox/busybox/busybox-syslog.service.in      |    2 +-
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
index db90082..27b9831 100644
--- a/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
+++ b/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
@@ -1,12 +1,12 @@
 [Unit]
 Description=System Logging Service
+Wants=busybox-klogd.service
 
 [Service]
 ExecStartPre=/bin/systemctl stop systemd-kmsg-syslogd.service
 EnvironmentFile=-/etc/default/busybox-syslog
 ExecStart=@base_sbindir@/syslogd -n $OPTIONS
 Sockets=syslog.socket
-Wants=busybox-klogd.service
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
index 46177e3..7e72a43 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.2.5



