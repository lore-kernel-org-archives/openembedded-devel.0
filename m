Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A08CD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 08:14:18 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15203.1777535913281799591
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 00:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup rsa2._domainkey.embetrix.com on 127.0.0.53:53: no such host" header.i=@embetrix.com header.s=rsa2 header.b=MbMpiDiG;
 dkim=fail reason="dkim: no key for signature: lookup ed2._domainkey.embetrix.com on 127.0.0.53:53: no such host" header.i=@embetrix.com header.s=ed2 header.b=9IR0Rws2;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1777535911; x=1778140711;
	d=embetrix.com; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=FE6mgqz7ZtcUwla3lA8goxgLk5hqEDp4jKInSqJ52TU=;
	b=MbMpiDiG9jjZb5PV6/dr594gj6XjyehuhTN2JT6/4/MsaqbDRqB2up5uVE4PZREgYBfDYw6tS8NFv
	 1YVhLxIHhdKWxPPLDGnYXhisKTX1ypPvoT+XnZaTVrHraRqEKPEBn2J35T4Q5x4LVKiZz7vkTrunIa
	 qdM/ZcYPNloQwDt90eTCUJO2qtCfO2znfPf6yxWzS1/5tDlSnrz1NJTFVdo7HQMUbWCAQV1Xj34a/l
	 q9/hUr9448NXNhvHrnfv+daN14zuEfIVZYq03Se6jom6jiyuE8uUT+QvczqZsM7FXi+IHcLH1Xt1pp
	 VuHBBem1HPEOeef1lIcnGh248MMTN1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1777535911; x=1778140711;
	d=embetrix.com; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=FE6mgqz7ZtcUwla3lA8goxgLk5hqEDp4jKInSqJ52TU=;
	b=9IR0Rws2OFOKI9sQ0M0hVHLPSG0QSB2exlV+M/1ZMUzzq9r0EVEz3qYrsA2OWYrCD34JuCDkOBeFr
	 6LPzjSPCg==
X-HalOne-ID: 5ff3b6f2-446a-11f1-a3eb-c9fa7b04d629
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-9bb0-8199-2e56-5c1b.310.pool.telefonica.de [2a02:3102:8c10:1ae0:9bb0:8199:2e56:5c1b])
	by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 5ff3b6f2-446a-11f1-a3eb-c9fa7b04d629;
	Thu, 30 Apr 2026 07:58:30 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [meta-networking][PATCH] cloudflared: add initial recipe for 2026.3.0 version
Date: Thu, 30 Apr 2026 09:58:29 +0200
Message-ID: <20260430075829.15293-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 08:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126670

Add initial recipe for Cloudflare Tunnel client (cloudflared).
The upstream source vendors all Go dependencies so no go-mods.inc
is needed.
Includes systemd service with token-based authentication
via /etc/default/cloudflared.

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 .../cloudflared/cloudflared_2026.3.0.bb       | 36 +++++++++++++++++++
 .../cloudflared/files/cloudflared.service     | 15 ++++++++
 .../cloudflared/files/default                 |  2 ++
 3 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.3.0.bb
 create mode 100644 meta-networking/recipes-connectivity/cloudflared/files/cloudflared.service
 create mode 100644 meta-networking/recipes-connectivity/cloudflared/files/default

diff --git a/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.3.0.bb b/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.3.0.bb
new file mode 100644
index 0000000000..f0b8530a69
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cloudflared/cloudflared_2026.3.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Cloudflare Tunnel client"
+DESCRIPTION = "cloudflared is the command-line client for Cloudflare Tunnel, \
+a tunneling daemon that proxies traffic from the Cloudflare network to your origins."
+HOMEPAGE = "https://github.com/cloudflare/cloudflared"
+SECTION = "networking"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
+
+SRC_URI = "git://github.com/cloudflare/cloudflared.git;protocol=https;branch=master;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+           file://cloudflared.service \
+           file://default \
+           "
+SRCREV = "d2a87e9b93456ad7f82417400f4209d513668487"
+
+GO_IMPORT = "github.com/cloudflare/cloudflared"
+GO_INSTALL = "${GO_IMPORT}/cmd/cloudflared"
+GO_LINKSHARED = ""
+SRCREV_SHORT = "${@d.getVar('SRCREV')[:8]}"
+GO_EXTRA_LDFLAGS = "-X main.Version=${PV}-${SRCREV_SHORT}"
+
+inherit go-mod systemd
+
+SYSTEMD_SERVICE:${PN} = "cloudflared.service"
+
+do_install:append() {
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${UNPACKDIR}/cloudflared.service ${D}${systemd_system_unitdir}/cloudflared.service
+    install -d ${D}${sysconfdir}/default
+    install -m 0644 ${UNPACKDIR}/default ${D}${sysconfdir}/default/cloudflared
+}
+
+FILES:${PN}-src += "${libdir}/go/src"
+
+# Fix shebang and QA Issue with scripts with /bin/bash and /usr/bin/python3
+INSANE_SKIP:${PN}-dev = "file-rdeps"
diff --git a/meta-networking/recipes-connectivity/cloudflared/files/cloudflared.service b/meta-networking/recipes-connectivity/cloudflared/files/cloudflared.service
new file mode 100644
index 0000000000..decaf0e329
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cloudflared/files/cloudflared.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=cloudflared
+After=network-online.target
+Wants=network-online.target
+
+[Service]
+Type=notify
+DynamicUser=yes
+EnvironmentFile=/etc/default/cloudflared
+ExecStart=/usr/bin/cloudflared --no-autoupdate tunnel run --token ${TUNNEL_TOKEN}
+Restart=on-failure
+RestartSec=5s
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/cloudflared/files/default b/meta-networking/recipes-connectivity/cloudflared/files/default
new file mode 100644
index 0000000000..1e00173af6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/cloudflared/files/default
@@ -0,0 +1,2 @@
+# Cloudflare Tunnel token from the dashboard
+TUNNEL_TOKEN=
-- 
2.43.0


