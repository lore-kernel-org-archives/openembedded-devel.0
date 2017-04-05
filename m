Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id B660872F56
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:53:33 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id w11so12538787wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 05:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=AL9p1eLVIxnvCwqB0LMT8AaAufFMCYn6Rnst72raUQM=;
	b=D5dRIsjxfKQVPHerODKVtyg3D6+bkszCQbQm7cMtd0alA6uNJJNZlauIjchO979DUy
	uw2m2axfLhSKmzvBew6R0YTo1Z+YQZZ5dfYVAByDYSdiYH54huy7p4wtgJh7glpDcMcF
	fyUrX/oBrbQqhai6CpgPAPkbKGDeR/VCuSYCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AL9p1eLVIxnvCwqB0LMT8AaAufFMCYn6Rnst72raUQM=;
	b=EsUHhQMVWTeNMQ7uG98DT1rHGfE2vyHKkZwyCHaP2lFyEEGOK/kIJU2weiN33jFk3X
	JwNVtxNAwZrqt9qKZVY8kGvwhH/nTecTK7KYJBfv1U1uCPPDPIif0Bm+yzL8Bi/jWI7Q
	mo8oWOfBVq45YxT4JQ30Qf5M0d7JKz1V+pjik9F7Qe7znFZGwjPhpk953fb3lFIdV9+e
	djawptuuVagbzvHD/ngice6f3yOMPYvf8WGBcZOqhvi0tid+wSlaODaYoY0C5VrFvF8N
	w7Dhkjq9qNQ0Rc9Yn4Arb0N62ro6nmk8lvNc+kwYBc7QvKKS+m3nNLKSKkGs7oONBO9A
	qWmQ==
X-Gm-Message-State: AFeK/H1npEhtGtk47UqCkPGpBVEOyQ4KfQ3NJWPZvGArWe8Vgfq8dIR9w0kaRvZFf0a1O0z5
X-Received: by 10.28.68.66 with SMTP id r63mr19492621wma.74.1491396813525;
	Wed, 05 Apr 2017 05:53:33 -0700 (PDT)
Received: from lmenx321.st.com. ([80.214.64.36])
	by smtp.gmail.com with ESMTPSA id
	e23sm17916465wmi.16.2017.04.05.05.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 05:53:32 -0700 (PDT)
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Wed,  5 Apr 2017 14:53:26 +0200
Message-Id: <1491396806-3521-1-git-send-email-benjamin.gaignard@linaro.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] tinyproxy: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Apr 2017 12:53:34 -0000

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++++
 .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 32 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
new file mode 100644
index 0000000..800d2ad
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Tinyproxy, Lightweight http(s) proxy daemon
+RequiresMountsFor=/var
+
+[Service]
+User=root
+ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
+ExecStartPre=/bin/chown -R nobody.adm /var/log/tinyproxy
+ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
+ExecStartPre=/bin/chown -R nobody.adm /var/run/tinyproxy
+ExecStart=/usr/sbin/tinyproxy -d
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
new file mode 100644
index 0000000..76cec63
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Lightweight http(s) proxy daemon"
+HOMEPAGE = "https://tinyproxy.github.io/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "https://github.com/tinyproxy/tinyproxy/releases/download/1.8.4/tinyproxy-${PV}.tar.gz"
+SRC_URI += "file://tinyproxy.service"
+
+SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
+SRC_URI[sha256sum] = "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
+
+EXTRA_OECONF += " \
+	--enable-filter \
+	--enable-transparent \
+	--disable-regexcheck \
+	--enable-reverse \
+	--enable-upstream \
+	--enable-xtinyproxy \
+	"
+
+inherit autotools systemd
+
+SYSTEMD_PACKAGES += "${PN}"
+SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+
+do_install_append() {
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_system_unitdir}
+}
+
+FILES_${PN} =+ "${systemd_system_unitdir}/tinyproxy.service"
-- 
1.9.1


