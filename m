Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id E49AA77DFF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:34:32 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id o21so34815818wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=3k1b5pZM8zLr1SoyikCNngvDPB6FS9ga6FF2Hh5sBPs=;
	b=kOBLwY41nVM8VTo+adwS+TXd9y9XM9Mr8Opjg/3/5MjEAkwqPYGHuDQvEr/uGfhTFw
	VDqPMEHk9NCPu7zzB2eAb3ysr00uiA7nfBOtDjR3mPV/GKOPHmIReOnqcC2vlRVSyLSp
	E1SFBVu2Sk3NiNBR8AmaOgXCaYsrTBMTxK1bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3k1b5pZM8zLr1SoyikCNngvDPB6FS9ga6FF2Hh5sBPs=;
	b=E6ITbpJsL2IdfRUmai1dGJYeIVQe148D24+PHzlZoG7iS0hSwbKd5KacwxXK/aTuzd
	j81innwH3Z8HUJ5qOtPlwkaJvE+wbPfVXLb8Je5Sy5zrSiOKvX8LTHDtr/0DG0bCDTxr
	U73J/Wad1wcn2HnzGN3ylAxTVpMQwlNk0plDNQZgJNpphTeLMcKX049QUNdPPKWYBp/p
	K7NiDnoP7gw4FyBOercEexy03E48xZ/BESuwO5UdDme93nfHVMZ6vgmO+GjeMHs5lG4M
	KhN8A3Z020Oaf72eCNm3a9xGX0NxRrn2fZWuomKqj3TLy+XcLLiMEImXq4m8JPw36hHs
	SHRA==
X-Gm-Message-State: AN3rC/7VzUwL5PZPUo7rtEUgVKZpknDwB9W8b3kBaSjlNLyaQKnZS4ay
	h0DDTeO0labTfdqN
X-Received: by 10.223.141.140 with SMTP id o12mr2983726wrb.69.1492086873121;
	Thu, 13 Apr 2017 05:34:33 -0700 (PDT)
Received: from lmenx321.st.com. (lya72-2-88-175-155-153.fbx.proxad.net.
	[88.175.155.153]) by smtp.gmail.com with ESMTPSA id
	u36sm25246274wrc.20.2017.04.13.05.34.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 05:34:32 -0700 (PDT)
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com,
	armccurdy@gmail.com, martin.jansa@gmail.com
Date: Thu, 13 Apr 2017 14:34:27 +0200
Message-Id: <1492086867-15041-1-git-send-email-benjamin.gaignard@linaro.org>
X-Mailer: git-send-email 1.9.1
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [meta-networking][PATCH v3] tinyproxy: Add recipe
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
X-List-Received-Date: Thu, 13 Apr 2017 12:34:33 -0000

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
 .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 39 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
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
index 0000000..f0374b8
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
@@ -0,0 +1,39 @@
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
+DEPENDS = "asciidoc-native libxml2-native libxslt-native"
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
-- 
1.9.1


