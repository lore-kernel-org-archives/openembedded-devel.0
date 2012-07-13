Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSH-00080Q-HJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:30 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247528bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=VU9cp8Eol3gtZAPdlJn635BR0pCoB4enVYK56uzKu2s=;
	b=RUmUdxgnLFGQeHplL9SQ6NqvB25wg2NFKy/plxkkWNHTUJYKuz0yauXzw7QLF+AIAp
	vbsk0/uJF020xXSiJi6i1aHqBYDCvTmBh+P1Br/i70TTg4yShzsEsb18VlyMx+UKpN+y
	+QUiNasg6X2AHeFZIMcP0uoxiT2ea8DR/J/9ofhPAiIQl0Sy+Lm5vVAqOc2+prJVJRWQ
	R8LpyqW6rrpSk2StcZmbK7joe5rrPbcnnHJxmKKq5FGilXtUBuSwII/fvpazewrQ3BJ5
	pcXqXlapDEFMH6uIayF6NS3XzuneShGsqxoveWOJWNvxF5+upoPrm4vhZeGluroU5M0I
	MSLg==
Received: by 10.204.156.17 with SMTP id u17mr156132bkw.52.1342168277682;
	Fri, 13 Jul 2012 01:31:17 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:15 +0200
Message-Id: <1342168240-7760-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 07/32] task-basic: move systemd support to meta systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/tasks/task-basic.bb           |    7 +++----
 .../meta-oe/recipes-core/tasks/task-basic.bbappend |    6 ++++++
 2 files changed, 9 insertions(+), 4 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend

diff --git a/meta-oe/recipes-core/tasks/task-basic.bb b/meta-oe/recipes-core/tasks/task-basic.bb
index d4a0bd9..47b09de 100644
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
@@ -33,8 +33,7 @@ TASK_BASIC_SSHDAEMON ?= "dropbear-systemd openssh-sftp openssh-sftp-server"
 #
 RDEPENDS_${PN} = "\
 	${TASK_BASIC_SSHDAEMON} \
-	avahi-daemon avahi-utils avahi-systemd \
-	systemd-compat-units \
+	avahi-daemon avahi-utils \
 	"
 
 #
diff --git a/meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend b/meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend
new file mode 100644
index 0000000..358c9cb
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-core/tasks/task-basic.bbappend
@@ -0,0 +1,6 @@
+PRINC := "${@int(PRINC) + 1}"
+
+RDEPENDS_${PN} += "\
+	systemd-compat-units \
+	avahi-systemd \
+"
-- 
1.7.6.5



