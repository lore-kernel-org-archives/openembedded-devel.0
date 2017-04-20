Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id C79FE73124
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 12:26:12 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id w64so102622867wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=dSoaFcpC0/ooJDujZONxo1KForRMkvo3sEQAXpJtf8Q=;
	b=aB8IPPL1TuNviY8pCFFDwew3zg8+YIB60VP92oNYv3aH+sHTSr27poVYKq88eJhfYH
	Ts5xYLM7nReUo156QlTMKmHHhmQsGcpUKLJpkXq3VHRMspq91nxg0MriV1YZ5OPYAkVD
	hIzV4TU96q/ptaVR7/sLC0Pn8hyUncLtgbajU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dSoaFcpC0/ooJDujZONxo1KForRMkvo3sEQAXpJtf8Q=;
	b=GKCQmGA2itMcKFkTbylYf4nMeOk7Yf/7hnRl7fzLXdcgxdzSj12bmij06qwQTDpgTt
	2TwkPE86phhsyQq0+7IqEeO6AlLxs4SiGQ5Xi4K25WObTn2XrsNkmUrNvnFtSHL9011X
	THNg8HWlFPRh5rSauOJhL3mD+BTarQehSO5N8ItF8DGcMX8N8IVbdl5q6ZRuphRmoAgs
	BrhsOr5WKCPT1UElCXfN465J5Qm5sxeSL9EZOISv8Fg+7Zy8nOWiDqz9+gbJZyQN8odn
	C5MHsdwQvTrOaM6W1VpI2ctL3lrJqbBjZeP1TL6gzRhdEWonMYvZ7HR9vg8qw2nSLuI5
	/uqA==
X-Gm-Message-State: AN3rC/7xDUor7EOd9IVkZjPaqFWPAssufLA5mfCVgVYnbIqDtRbcTG/v
	Ga5DJymUbYQn5Qoj
X-Received: by 10.28.154.85 with SMTP id c82mr3007524wme.100.1492691173287;
	Thu, 20 Apr 2017 05:26:13 -0700 (PDT)
Received: from lmenx321.st.com. ([80.215.135.222])
	by smtp.gmail.com with ESMTPSA id
	g81sm1869109wmd.11.2017.04.20.05.26.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Apr 2017 05:26:12 -0700 (PDT)
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
To: openembedded-devel@lists.openembedded.org, joe_macdonald@mentor.com,
	armccurdy@gmail.com, martin.jansa@gmail.com
Date: Thu, 20 Apr 2017 14:25:18 +0200
Message-Id: <1492691118-22985-1-git-send-email-benjamin.gaignard@linaro.org>
X-Mailer: git-send-email 1.9.1
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [meta-networking][PATCH v4] tinyproxy: Add recipe
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
X-List-Received-Date: Thu, 20 Apr 2017 12:26:13 -0000

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
---
 .../tinyproxy/disable-documentation.patch          | 37 +++++++++++++++++++++
 .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
 .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 38 ++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
new file mode 100644
index 0000000..01d0236
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
@@ -0,0 +1,37 @@
+--- a/configure.ac	2016-01-01 17:42:27.000000000 +0100
++++ b/configure.ac	2017-04-20 14:03:37.238254471 +0200
+@@ -284,24 +284,12 @@
+ AC_SUBST(LIBS)
+ AC_SUBST(ADDITIONAL_OBJECTS)
+ 
+-# Check for asciidoc
+-AC_PATH_PROG(A2X, a2x, no)
+-AM_CONDITIONAL(HAVE_A2X, test "x$A2X" != "xno")
+-if test x"$A2X" = x"no"; then
+-  AC_MSG_ERROR([Test for asciidoc failed. See the file 'INSTALL' for help.])
+-fi
+-
+ AC_CONFIG_FILES([
+ Makefile
+ src/Makefile
+ data/Makefile
+ data/templates/Makefile
+ etc/Makefile
+-docs/Makefile
+-docs/man5/Makefile
+-docs/man5/tinyproxy.conf.txt
+-docs/man8/Makefile
+-docs/man8/tinyproxy.txt
+ m4macros/Makefile
+ tests/Makefile
+ tests/scripts/Makefile
+--- a/Makefile.am	2016-01-01 17:42:27.000000000 +0100
++++ b/Makefile.am	2017-04-20 14:03:53.842822997 +0200
+@@ -2,7 +2,6 @@
+ 	src \
+ 	data \
+ 	etc \
+-	docs \
+ 	m4macros \
+ 	tests
+ 
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
index 0000000..e8025c4
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Lightweight http(s) proxy daemon"
+HOMEPAGE = "https://tinyproxy.github.io/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
+		   file://disable-documentation.patch \
+		   file://tinyproxy.service"
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


