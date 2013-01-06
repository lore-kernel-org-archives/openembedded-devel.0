Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Trmf9-000525-AW
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:37:06 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so10003035pbb.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=vTnW7q7Fx8mKD+O3Wo4UNQwB9ZRABXbRwG3l5DAlzDQ=;
	b=n70mYZjyR9y5FZKoq0MdrwoX5/q7msXssFPy5TJEh4YT0q5e4CImb5sux50evYoYX+
	+zeOH2N6+MV9tb8/C2KS6wAu8fp8JJIzQg7127gJrzGHVWQWdT18P5A90eIVzeQaYpq1
	vRxEsbYADrmQbrwGyTub9LIOhKSagLKQom6/7ZnH0Yi0sdlWKDRXy6uKNr+BWfMm2Hgt
	B9iBOKQUqaGL9UddqrcVADui9z+8VKNnEqtTgOhGm+gJ1IITUbcP4snm7nmgizllU3WD
	GXPY2y9LK0WLBXa55IUj9VKw1HdWIDQAhzoi/rWk7bFzLMOztc1M1b2bmuSt1Ph8GX2C
	vxdQ==
X-Received: by 10.68.232.200 with SMTP id tq8mr176592273pbc.52.1357463634149; 
	Sun, 06 Jan 2013 01:13:54 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:44 -0800
Message-Id: <1357463568-26241-21-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 21/25] dhcp: Add systemd unit file for dhclient
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
X-List-Received-Date: Sun, 06 Jan 2013 09:37:11 -0000

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



