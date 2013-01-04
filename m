Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygk-0001z1-Et
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:26 +0100
Received: by mail-da0-f54.google.com with SMTP id n2so7296504dad.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vTnW7q7Fx8mKD+O3Wo4UNQwB9ZRABXbRwG3l5DAlzDQ=;
	b=VqD2G87UDgfgYVWdxQWq09WFMkiAH9ZOpEoA5KwbwKgzYbrY+2oUClgV1QFZCBswAv
	WxEXloRRTwZFFKbdNP5WLWi4Dk4y7cKyBn4kjKJdCs0ehrj0EI2dcddRaj1X9re7G4d3
	rOT2m3R3W7bdLFi1IFEgB9/9zZuetsDbKh1GoHpgUgr3e8ODLPJVtQ/CZP7zvIZQeih5
	OCuDiSv0PuyxRyCljfdsUd+55GVqECJG58acwzsxmpAPBSuhVcu1dr1VuJNVUAiIlgbm
	kTLT0eUgP0z7u68J7KZqi61KRJMTTCz9MkYHOzBWAuKSSEyJo1gmANV7ve5HAuz31aQm
	FpJw==
X-Received: by 10.66.72.198 with SMTP id f6mr150583541pav.42.1357272017264;
	Thu, 03 Jan 2013 20:00:17 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:26 -0800
Message-Id: <1357271974-3317-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 04/13] dhcp: Add systemd unit file for dhclient
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
 .../dhcp/dhcp/dhclient.service                     |   13 +++++++++++++
 .../dhcp/dhcp_4.2.4-P2.bbappend                    |    7 +++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
new file mode 100644
index 0000000..76d64d5
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Dynamic Host Configuration Protocol (DHCP)
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/dhclient.pid
+EnvironmentFile=-/etc/default/dhcp-client
+ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q $INTERFACES -lf /var/lib/dhcp/dhclient.leases
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
index a18fda8..fde2426 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
@@ -5,9 +5,12 @@ inherit systemd
 
 PRINC := "${@int(PRINC) + 1}"
 
-SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
+SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd dhcp-client-systemd"
 SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
 SYSTEMD_SERVICE_dhcp-relay-systemd = "dhcrelay.service"
+SYSTEMD_SERVICE_dhcp-client-systemd = "dhclient.service"
 
 SRC_URI += "file://dhcpd.service \
-            file://dhcrelay.service"
+            file://dhclient.service \
+            file://dhcrelay.service \
+           "
-- 
1.7.9.5



