Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygj-0001yx-06
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:26 +0100
Received: by mail-da0-f53.google.com with SMTP id x6so7279131dac.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=7G3hpL0Vgci4w0OkLoI1zrpp/1IIUolUsi87/2IdXQs=;
	b=nyM7zN6CotUbNgmA4ahY+ErPcSPSEWRw+Me102pOMQVnkh9LeUtm7F4Pu41x5Ho7BW
	FC/S7s+S+pvli3Mi6MMFg6KGF5BFx7q5Ufl1T3uO0UMqpLmflgqfyh4UxyHINmrfpL0v
	LxGy+ErEbphAYYSSHvc4Co67V+1fWHzG7POsOwnenysC5uXEZbRWdhrbwseXv/ur0rLR
	i9I0wNDrBkUi1vLvp83Fw2YX4iQBngymnu1DsMPWTGH4fxXtY9TZrWOE9+XI2YJo5IPY
	ZyM99CzVMud7jKuWEmsVrX5ECJbTUhAw5nOv1fe08NXprto+IXQ+oLWoyLLNAFq6wp5l
	fLag==
X-Received: by 10.68.191.5 with SMTP id gu5mr159115638pbc.145.1357272015325;
	Thu, 03 Jan 2013 20:00:15 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:24 -0800
Message-Id: <1357271974-3317-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 02/13] meta-systemd: Add systemd unit file for atftp
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
X-List-Received-Date: Fri, 04 Jan 2013 04:15:41 -0000
X-List-Received-Date: Fri, 04 Jan 2013 04:15:41 -0000
X-List-Received-Date: Fri, 04 Jan 2013 04:15:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/atftp/atftp/atftpd.service    |   10 ++++++++++
 .../recipes-extended/atftp/atftp_git.bbappend      |   10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-systemd/meta-junos/recipes-extended/atftp/atftp/atftpd.service
 create mode 100644 meta-systemd/meta-junos/recipes-extended/atftp/atftp_git.bbappend

diff --git a/meta-systemd/meta-junos/recipes-extended/atftp/atftp/atftpd.service b/meta-systemd/meta-junos/recipes-extended/atftp/atftp/atftpd.service
new file mode 100644
index 0000000..480bc70
--- /dev/null
+++ b/meta-systemd/meta-junos/recipes-extended/atftp/atftp/atftpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Advanced TFTP Server
+After=syslog.target network.target
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/atftpd --daemon --port 69
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-junos/recipes-extended/atftp/atftp_git.bbappend b/meta-systemd/meta-junos/recipes-extended/atftp/atftp_git.bbappend
new file mode 100644
index 0000000..3706d9f
--- /dev/null
+++ b/meta-systemd/meta-junos/recipes-extended/atftp/atftp_git.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://atftpd.service"
+
+SYSTEMD_PACKAGES = "atftpd-systemd"
+SYSTEMD_SERVICE_atftpd-systemd = "atftpd.service"
-- 
1.7.9.5



