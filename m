Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sxkmx-0006Ge-4z
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:17:31 +0200
Received: by pbbrq2 with SMTP id rq2so2960917pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OmoPpjrzAJCp0X0Bx1m0MK0AVQDI6s79HakvyQRFMhw=;
	b=w+ROCJVhOyzbyQfo2xnSXZPw7eH117mGCO3AktO0DnYpw3l2YzUIE2mYWWVmt1jH+f
	qJpz8B3WVbMdGfwuSoRHswq58cA0GXTlM/HTZ91OBJshPmSyVRwED216q6qvUv56lVTR
	9t9p7tJl4peO3NKU8e6svliKcVx7xZk/Y2VBflljGwmAGbz4tDPUUhcmYvCMJhr60f41
	mAlUADsw0TIAE/WvenVzCW99tS6OQtIkMN54BaxAuL83BtN1VqYTjnXTuEoNuPkwU6z3
	27YMdyEg3pArDtlZBIOax/fNfxXO8PNy0zXM/sZsHB91hwLNg+32nRU+7VriBZuH7f5a
	tzgA==
Received: by 10.68.135.36 with SMTP id pp4mr7203738pbb.19.1344110748008;
	Sat, 04 Aug 2012 13:05:48 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ro7sm427008pbc.8.2012.08.04.13.05.46
	(version=SSLv3 cipher=OTHER); Sat, 04 Aug 2012 13:05:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Aug 2012 13:05:31 -0700
Message-Id: <1344110736-6999-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
References: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V4 3/8] busybox: stopping systemd-kmsg-syslogd is not needed
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
X-List-Received-Date: Sat, 04 Aug 2012 20:17:31 -0000

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



