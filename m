Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9D12477CD5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 13:42:45 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id o21so34866525wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=4pJOXeO6X+Yh/iDMZFF5mOvUKwYtlqCqRcicH/NPRzc=;
	b=d1XEoiSIZdx/iFiSezqei3aT3poWoIaJ12U3jkeGX6sc6RwMralyvlZX4/Ru9wZZtv
	WFIHV1NLuK5nFltbFQqw23jLpAlB5crkxA2CSlZ5X7K7gI5CcTTwinnKkwIav4/ztwtb
	nFZQpkmcPJdGRFj5zxVxafGSVCaxepZldvFco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4pJOXeO6X+Yh/iDMZFF5mOvUKwYtlqCqRcicH/NPRzc=;
	b=VLqfrPEVgIZ/TrveLimlt0lb0Wg7ETQMJXk7IdzI6Fx1IJqcaFtnmvGG7V9e+J36r8
	h+eONJGwd2YAIRMVjNyX+xdqilkrL8yb0X0ut260o2b8iML0B9tm9B+sqWa2hGVwyZhk
	NbAQpqKBJoFNSVZCe7/Fmj4+IJqnSG5V76YEEYeZQ5ZooQjcy2V0AhbOT6CX1vyYhEyr
	VqMTRvKoIvgHEoj6IOcYG10A6pJawDaTzXrLHau40xZqjPc+yokUvGP50jEXN8lZwMRP
	2KtAkFNMmMjxwCrKKVTdYTkSqsAlQ7MbHH3G/Unkc6LbpeGXYpi6PzzdfPCOjL2647CL
	Xd5g==
X-Gm-Message-State: AFeK/H2QUD1WKc9L3aou2UPLN3RUz2+3I/g77SMRMEaXDmKBuo8a4ZVL
	QooY0S0czB+bmxEB
X-Received: by 10.28.150.145 with SMTP id y139mr23795717wmd.109.1491486152874; 
	Thu, 06 Apr 2017 06:42:32 -0700 (PDT)
Received: from lmenx321.st.com. ([80.215.110.236])
	by smtp.gmail.com with ESMTPSA id
	l41sm2190748wrl.59.2017.04.06.06.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 06:42:32 -0700 (PDT)
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com,
	martin.jansa@gmail.com, raj.khem@gmail.com
Date: Thu,  6 Apr 2017 15:42:25 +0200
Message-Id: <1491486145-30397-1-git-send-email-benjamin.gaignard@linaro.org>
X-Mailer: git-send-email 1.9.1
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [[meta-networking][PATCH v2] tinyproxy: Add recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 13:42:47 -0000

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
version 2:
- create user and group for tinyproxy
- only install the service if systemd is present in DISTRO_FEATURE
- add dependency on asciidoc-native
 .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
 .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 41 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
new file mode 100644
index 0000000..ea079f9
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Tinyproxy, Lightweight http(s) proxy daemon
+RequiresMountsFor=/var
+
+[Service]
+Group=tinyproxy
+ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
+ExecStartPre=/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
+ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
+ExecStartPre=/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
+ExecStart=/usr/sbin/tinyproxy -d
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
new file mode 100644
index 0000000..ef2a2d8
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Lightweight http(s) proxy daemon"
+HOMEPAGE = "https://tinyproxy.github.io/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
+		   file://tinyproxy.service"
+
+SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
+SRC_URI[sha256sum] = "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
+
+DEPENDS = "asciidoc-native"
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
+inherit autotools systemd useradd
+
+#User specific
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "nobody"
+GROUPADD_PARAM_${PN} = "--system tinyproxy"
+
+SYSTEMD_PACKAGES += "${BPN}"
+SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+
+do_install_append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_system_unitdir}
+	fi
+}
+
+FILES_${PN} =+ "${systemd_system_unitdir}/tinyproxy.service"
-- 
1.9.1


