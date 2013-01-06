Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmcS-0004iG-Tj
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:34:18 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so10142326pad.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YeVq3dTalmitnad7tSYxkQ+TX6v2k1Q5KA2dlGDkC8E=;
	b=TmhIApBjK2P6PPATkFij6ZL7tR5aKcfaDnZiNpSlbddw5Sa/WZYgQyH3OxaSKrtyDv
	Qn3wTli12b/WpLNwQOdgi/iVwtuYxIWa2FWHXhZXnJSC5uEHU4B3tYud8fB6FQNmddMD
	x9OKu4DLQ3NrirxNjB5De8R062I3+PogmTwE30wl8cpp8XgdXL8Q46Uk9l8GxrWl9U4N
	g3FVWT00UdJEad3Y19GRajjdTQ0FSo/GdyfwmNbG39Hu12Iz9jK6MriABVnbb0vZCOt6
	aNfeXMNOdczQzeD8gXlDP9k3omZ9jcJMLocKaxKPhdI3f+L/wZuassbEysoGaoKLrkzX
	hZWA==
X-Received: by 10.66.72.225 with SMTP id g1mr168111842pav.79.1357463636088;
	Sun, 06 Jan 2013 01:13:56 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:46 -0800
Message-Id: <1357463568-26241-23-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 23/25] rpcbind: Add systemd service unit file
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
X-List-Received-Date: Sun, 06 Jan 2013 09:34:19 -0000

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



