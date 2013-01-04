Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygl-0001z3-9d
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:26 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so7248898dak.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YeVq3dTalmitnad7tSYxkQ+TX6v2k1Q5KA2dlGDkC8E=;
	b=QHR9KZ6ubxZGVPYYvno3z7u2ZhY2ubpj+oeW00sQW44uMeuP4TP1QVIYpfd+ZBiPuN
	/FvvUyTY3Rgyaa8YdkiJN8QFXCnPf13btNTf/Ewg90NFkaRW56+8Dqimw0hUBvQmIupJ
	2VRylSOMinJnBev/22zU4jaJf2dyhHPpSJsJQwpC3osTOC74sITbgqzASWIeZqCJ2axa
	O6FNHxWxyosVbQz6g+Zws1jMXFl3A069y/Lh1Vt96BV/zMBkLktm4saioLz7CKKsQz/K
	p7nOth/hrQcn76Hmuhp1acqvpxMvISAL27ScQ16RzvRLHy8F04OcBS6Q5PfugtEwdOub
	uJkg==
X-Received: by 10.68.223.35 with SMTP id qr3mr159982058pbc.27.1357272018085;
	Thu, 03 Jan 2013 20:00:18 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:27 -0800
Message-Id: <1357271974-3317-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 06/13] rpcbind: Add systemd service unit file
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
X-List-Received-Date: Fri, 04 Jan 2013 04:15:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rpcbind/rpcbind/rpcbind.service                |   13 +++++++++++++
 .../rpcbind/rpcbind_0.2.0.bbappend                 |   12 ++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind/rpcbind.service
 create mode 100644 meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend

diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind/rpcbind.service
new file mode 100644
index 0000000..a028ace
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind/rpcbind.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=RPC Bind
+After=network.target
+Wants=rpcbind.target
+Before=rpcbind.target
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/rpcbind
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
new file mode 100644
index 0000000..0fa7f97
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
@@ -0,0 +1,12 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://rpcbind.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "rpcbind.service"
+
-- 
1.7.9.5



