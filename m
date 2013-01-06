Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Trme2-0004uP-EB
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:36:00 +0100
Received: by mail-da0-f41.google.com with SMTP id e20so8216703dak.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=GvXZBE+e98/xhpWrRp6fegrB5vkE95UMnlt99b1PnyI=;
	b=Vp9r2234OZ0d6GCPvZhHOYF5CLMFVjf9ONEe5LJRgTQ1L2+zpXBX4/lDrRrBk1wez0
	skkcRdlpdjzH/Xyr8RXfKFqVXAjKJrFcHvLP9kjle8PyHJRLfHLzz8FqF5JigA8EnXAK
	WLifl5YlefTlqJPaPybYLECP5I9XewfS19t7ML+2TkxnNs0PaEYKRW8foCwk1NFkFLbl
	SAA8HzNGqVG+wx4DlL4EqiqUo9CyWqaMCSoi972wfByMHi9R+JK21krSbHsFtIXpArwf
	eTaPrIXWsvLuRTGDx7h+uc1jCKlQ8NVf9xM92FW5/l5KMghc8fLsomFzrqE8hTKyP0D9
	NAnA==
X-Received: by 10.66.73.138 with SMTP id l10mr168461830pav.44.1357463635252;
	Sun, 06 Jan 2013 01:13:55 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:45 -0800
Message-Id: <1357463568-26241-22-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 22/25] nis: Add support for systemd launch of NIS services
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
X-List-Received-Date: Sun, 06 Jan 2013 09:36:19 -0000
X-List-Received-Date: Sun, 06 Jan 2013 09:36:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/nis/files/domainname.service   |   12 ++++++++++++
 .../recipes-support/nis/files/ypbind.service       |   14 ++++++++++++++
 .../recipes-support/nis/yp-tools_2.12.bbappend     |   12 ++++++++++++
 .../recipes-support/nis/ypbind-mt_1.36.bbappend    |   12 ++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 meta-systemd/meta-networking/recipes-support/nis/files/domainname.service
 create mode 100644 meta-systemd/meta-networking/recipes-support/nis/files/ypbind.service
 create mode 100644 meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
 create mode 100644 meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend

diff --git a/meta-systemd/meta-networking/recipes-support/nis/files/domainname.service b/meta-systemd/meta-networking/recipes-support/nis/files/domainname.service
new file mode 100644
index 0000000..21aa92c
--- /dev/null
+++ b/meta-systemd/meta-networking/recipes-support/nis/files/domainname.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=NIS Domainname
+
+[Service]
+Type=oneshot
+EnvironmentFile=/etc/nisdomainname
+ExecStart=/usr/bin/domainname $NISDOMAINNAME
+RemainAfterExit=true
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-systemd/meta-networking/recipes-support/nis/files/ypbind.service b/meta-systemd/meta-networking/recipes-support/nis/files/ypbind.service
new file mode 100644
index 0000000..1f8df42
--- /dev/null
+++ b/meta-systemd/meta-networking/recipes-support/nis/files/ypbind.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=YP Bind
+Requires=domainname.service
+After=domainname.service network.target
+Before=systemd-user-sessions.service
+
+[Service]
+Type=forking
+PIDFile=/var/run/ypbind.pid
+ExecStart=/usr/sbin/ypbind
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
new file mode 100644
index 0000000..041ca83
--- /dev/null
+++ b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
@@ -0,0 +1,12 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://domainname.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "domainname.service"
+
diff --git a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
new file mode 100644
index 0000000..14dbaac
--- /dev/null
+++ b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
@@ -0,0 +1,12 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://ypbind.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "ypbind.service"
+
-- 
1.7.9.5



