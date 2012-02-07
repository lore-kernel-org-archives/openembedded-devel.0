Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RumrA-0001JM-MV
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:21 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181062eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=IsSkCJE8Ne5Do78ZgWfJDWQIoiy1MI1BiJg3YCGHIFU=;
	b=YUMl9gmtSVyVxMQz4wN54+QUJAnrkgibngSpsZq8xZqKl3awOv0umgAW83TdNrBniw
	6JKmUkY6LYkeQQX5zEZUUCHCy6sWsCMDd5vn2gku0GDN68nhd+WbVKupijyLYo+DalsE
	a5AWS19R0R/R/vhVnjk39IALWdc2J5zdszoKU=
Received: by 10.14.149.20 with SMTP id w20mr6373173eej.64.1328627600691;
	Tue, 07 Feb 2012 07:13:20 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:52 +0100
Message-Id: <1328627573-5217-27-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 26/27] task-basic: replace systemd specific packets by common ones / conditionally RDEPENDS avahi(-systemd) systemd-compat-units
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/tasks/task-basic.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/tasks/task-basic.bb b/meta-oe/recipes-core/tasks/task-basic.bb
index d4a0bd9..df03df5 100644
--- a/meta-oe/recipes-core/tasks/task-basic.bb
+++ b/meta-oe/recipes-core/tasks/task-basic.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Basic task to get a device online"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r8"
+PR = "r9"
 
 inherit task
 
@@ -21,7 +21,7 @@ MACHINE_EXTRA_RRECOMMENDS ?= ""
 # Select between dropbear and openssh
 # Set TASK_BASIC_SSHDAEMON = "openssh-sshd openssh-sftp openssh-sftp-server" in your DISTRO config to get openssh(d)
 #
-TASK_BASIC_SSHDAEMON ?= "dropbear-systemd openssh-sftp openssh-sftp-server"
+TASK_BASIC_SSHDAEMON ?= "dropbear openssh-sftp openssh-sftp-server"
 
 #
 # The section below is designed to match with task-boot, but doesn't depend on it to allow for more freedom 
@@ -31,10 +31,12 @@ TASK_BASIC_SSHDAEMON ?= "dropbear-systemd openssh-sftp openssh-sftp-server"
 #
 # Util-linux (u)mount is included because the busybox one can't handle /etc/mtab being symlinked to /proc/mounts
 #
+# avahi is in oe-core but oe-core does not yet have systemd.bbclass so we must decide here which packet we need!!
+# If systemd.bbclass should reach oe-core, we can simply rdepend avahi.
 RDEPENDS_${PN} = "\
 	${TASK_BASIC_SSHDAEMON} \
-	avahi-daemon avahi-utils avahi-systemd \
-	systemd-compat-units \
+	avahi-daemon avahi-utils ${@base_conditional('INIT_MANAGER', 'systemd', 'avahi-systemd', 'avahi', d)} \
+	${@base_conditional('INIT_MANAGER', 'systemd', 'systemd-compat-units', '', d)} \
 	"
 
 #
-- 
1.7.6.4



