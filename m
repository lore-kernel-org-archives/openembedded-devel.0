Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm8-00063p-FP
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:48 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479837eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=w4Y6QzY8540700QgC+bW7fpoAJioGGo5qvcTkDt/PQ8=;
	b=tJr8ivO+8Sj9WgqKq1eOXWRZlXFqxxRUfU3+EaD7r8ePus9QUTORzm57cUF1afTyjS
	10VU9NyNb331mGD5egy4XXD1aJ7DY3xDzPxNQvniWpK1Mma9vF14Q0wNkP+BukBnCVr7
	SD6CZ5NojfG9s5SPMP4h0S6sghoqTKdQolDec=
Received: by 10.14.94.134 with SMTP id n6mr336601eef.63.1329357638326;
	Wed, 15 Feb 2012 18:00:38 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:15 +0100
Message-Id: <1329357796-27398-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 21/22] dhcp: add native systemd support for dhcp-relay
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |    8 +++++---
 .../dhcp/files/dhcrelay.service                    |   10 ++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service

diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
index 829ad3c..6d1e3df 100644
--- a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
+++ b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
@@ -3,9 +3,11 @@ FILESEXTRAPATHS := "${THISDIR}/files"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
-SYSTEMD_PACKAGES = "dhcp-server-systemd"
+SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
 SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
+SYSTEMD_SERVICE_dhcp-relay-systemd = "dhcrelay.service"
 
-SRC_URI += "file://dhcpd.service"
+SRC_URI += "file://dhcpd.service \
+            file://dhcrelay.service"
diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
new file mode 100644
index 0000000..f68f468
--- /dev/null
+++ b/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=DHCP Relay Agent Daemon
+After=syslog.target network.target
+
+[Service]
+EnvironmentFile=/etc/default/dhcp-relay
+ExecStart=/usr/sbin/dhcrelay -d $DHCRELAYARGS
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.4.4



