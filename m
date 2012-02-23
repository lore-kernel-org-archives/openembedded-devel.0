Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdx-0004lJ-Kn
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:29 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506551eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:10 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.104.140 as permitted sender)
	client-ip=10.213.104.140; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.104.140 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.104.140])
	by 10.213.104.140 with SMTP id p12mr343905ebo.111.1329999070679
	(num_hops = 1); Thu, 23 Feb 2012 04:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ZEbmkiWToY6aaA6CG7YIHeXnXCvKvMlNpv6m8HgWdzw=;
	b=iBuu57eLKfgAFPxzCyiJD8VOBUzs1RV+M3aJvcDjZbErLiwrHoo1Z2gjnEXqQ3b7m2
	w18u58eMi+34CpUny2AgdynDsfKmBmldi099FEtgvNkAWc0Ux4fszgU0z4ypwp76hXNv
	mLaAdl73CccYSAZ3RdxII4L0yEHV3v/vdBFog=
Received: by 10.213.104.140 with SMTP id p12mr270352ebo.111.1329999070582;
	Thu, 23 Feb 2012 04:11:10 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:54 +0100
Message-Id: <1329999054-23112-24-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 23/23] dhcp: add native systemd support for dhcp-relay
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
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
1.7.6.4



