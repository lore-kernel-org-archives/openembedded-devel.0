Return-Path: <parthitce@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECDD7D35F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 12:21:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b10so6992615wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6SJ/dM/bYZaZgpx0KOcJl/OlcfvCZ88GjGXiizLlIUc=;
	b=HiJwKcc/PAMf66acjEcCNAxA4j0Lc7qH2c5dtuurvk8B/S42rbGjjiaY7Jv+64ZFAj
	V99N4v4IcA8y+OZj96zZu3ddRhiE9GMAFexY7uA65qbmzlSOKtUAYO4iKXz0YvD4fGht
	v4AoZuZA939NvAI95P6R4YGv/CIFtpqjEO0Wn9DMqt34PSdzwyds7mpfYUNoWn/MCIqC
	vBByETHKJfwjbJvvhUQs0eN7pi6btLwjd2e4b131VSjYXUMbAp/bAyOHIldNZXm6rJ1V
	ui9pW4Oyp1nQ+TNt2raInk9aHG//QFvfiopY3Chze8MPsQP+MIMye/4E/ttLUHwZ6eBG
	FFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6SJ/dM/bYZaZgpx0KOcJl/OlcfvCZ88GjGXiizLlIUc=;
	b=n+TF0GSxy2cYnwKZy4ZJ4yG0U06wsp3tCFPGiEfva3+3dxal9OnjA3CPw4RFrbAJvk
	mEb94wy6djr4cp2V2xLBnKAcc2Mx165MwDJx1HgeFqX/sMQx47W2uFWLCjJDzhAupeQn
	hWLfp/LHOvu1anfpIreJTfmUX5/yWCdSKNUqjd6MBc91/o9Sd0DrQx3Pj6gJqj/oX7EO
	9fpdR1fD2sWQa+Hx3fhn80VF6JER+gMDjtWOjBFPRRpGB7unvZ6ZZXwKpqBITgnJyQUW
	jqnTVokiqwkZtF5xkUN05ixqDHrpfLUROYebf8wa6lMmpqSrlOQtlrr3NLFKPhC4uGYt
	ARwA==
X-Gm-Message-State: APjAAAU1/wR9RsDIf+IDnUmRczEdCyS9TJdsfU8UqMXoAac3UCnFhcKg
	O/QAhRNOERixChQRCex4k9m8gc6MEQ==
X-Google-Smtp-Source: APXvYqzWmoKykhnZHnuDCRbtEaI/Yn+STweGmNYQ8tpVrcJKHGsWqU4jBwSSdOzLNWcoWRSClBbh+Q==
X-Received: by 2002:a1c:ef08:: with SMTP id n8mr6758859wmh.85.1556713263598;
	Wed, 01 May 2019 05:21:03 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180])
	by smtp.gmail.com with ESMTPSA id s6sm4899619wmh.22.2019.05.01.05.21.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 05:21:03 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 14:20:40 +0200
Message-Id: <20190501122040.2987717-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.17.2
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH] python3-supervisor: add version 4.0.2
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
X-List-Received-Date: Wed, 01 May 2019 12:21:03 -0000

Added python3-supervisor with following missing DEPENDS
- python3-meld3 version 1.0.2

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---
 .../recipes-devtools/python/python-meld3.inc  | 15 +++++++++
 .../python/python-supervisor.inc              | 30 ++++++++++++++++++
 .../python/python3-meld3_1.0.2.bb             |  2 ++
 .../python3-supervisor/supervisor.service     | 15 +++++++++
 .../python3-supervisor/supervisord.conf       | 31 +++++++++++++++++++
 .../python/python3-supervisor_4.0.2.bb        |  2 ++
 6 files changed, 95 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-meld3.inc
 create mode 100644 meta-python/recipes-devtools/python/python-supervisor.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-supervisor/supervisor.service
 create mode 100644 meta-python/recipes-devtools/python/python3-supervisor/supervisord.conf
 create mode 100644 meta-python/recipes-devtools/python/python3-supervisor_4.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-meld3.inc b/meta-python/recipes-devtools/python/python-meld3.inc
new file mode 100644
index 000000000..d4e274e60
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-meld3.inc
@@ -0,0 +1,15 @@
+SUMMARY = "meld3 templating system used by Supervisor"
+DESCRIPTION = "\
+meld3 is an HTML/XML templating system for Python which keeps \
+template markup and dynamic rendering logic separate from one \
+another.  See http://www.entrian.com/PyMeld for a treatise on the \
+benefits of this pattern."
+HOMEPAGE = "https://github.com/supervisor/meld3"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf"
+
+SRC_URI[md5sum] = "3ccc78cd79cffd63a751ad7684c02c91"
+SRC_URI[sha256sum] = "f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558"
+
+PYPI_PACKAGE = "meld3"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-supervisor.inc b/meta-python/recipes-devtools/python/python-supervisor.inc
new file mode 100644
index 000000000..beab49739
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-supervisor.inc
@@ -0,0 +1,30 @@
+SUMMARY = "Supervisor: A Process Control System"
+DESCRIPTION = "\
+Supervisor is a client/server system that allows its users \
+to monitorand control a number of processes on UNIX-like \
+operating systems."
+HOMEPAGE = "https://github.com/Supervisor/supervisor"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
+
+SRC_URI[md5sum] = "ac70dadd051dcaf1d03c467d51a3aac1"
+SRC_URI[sha256sum] = "5604457da4fb89d850e78c128205fe4938c9277f87301885b33c94c60361e575"
+
+PYPI_PACKAGE = "supervisor"
+inherit pypi systemd
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-meld3 \
+"
+
+SRC_URI += "file://supervisord.conf \
+	    file://supervisor.service \
+	"
+SYSTEMD_SERVICE_${PN} = "supervisor.service"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/supervisor
+	install -d ${D}${systemd_system_unitdir}
+
+	install -m 0644 ${WORKDIR}/supervisord.conf ${D}${sysconfdir}/supervisor
+	install -m 0644 ${WORKDIR}/supervisor.service ${D}${systemd_system_unitdir}
+}
diff --git a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb b/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
new file mode 100644
index 000000000..f69591629
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-meld3.inc
diff --git a/meta-python/recipes-devtools/python/python3-supervisor/supervisor.service b/meta-python/recipes-devtools/python/python3-supervisor/supervisor.service
new file mode 100644
index 000000000..e9d3f706b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-supervisor/supervisor.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Supervisor process control system for UNIX
+Documentation=http://supervisord.org
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
+ExecStop=/usr/bin/supervisorctl $OPTIONS shutdown
+ExecReload=/usr/bin/supervisorctl -c /etc/supervisor/supervisord.conf $OPTIONS reload
+KillMode=process
+Restart=on-failure
+RestartSec=50s
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-python/recipes-devtools/python/python3-supervisor/supervisord.conf b/meta-python/recipes-devtools/python/python3-supervisor/supervisord.conf
new file mode 100644
index 000000000..3fb9b492d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-supervisor/supervisord.conf
@@ -0,0 +1,31 @@
+; supervisor config file
+
+[unix_http_server]
+file=/var/run/supervisor.sock   ; (the path to the socket file)
+chmod=0700                       ; sockef file mode (default 0700)
+
+[supervisord]
+logfile=/var/log/supervisord.log ; (main log file;default $CWD/supervisord.log)
+pidfile=/var/run/supervisord.pid ; (supervisord pidfile;default supervisord.pid)
+childlogdir=/var/log/            ; ('AUTO' child log dir, default $TEMP)
+
+; the below section must remain in the config file for RPC
+; (supervisorctl/web interface) to work, additional interfaces may be
+; added by defining them in separate rpcinterface: sections
+[rpcinterface:supervisor]
+supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface
+
+[supervisorctl]
+serverurl=unix:///var/run/supervisor.sock ; use a unix:// URL  for a unix socket
+
+; The [include] section can just contain the "files" setting.  This
+; setting can list multiple files (separated by whitespace or
+; newlines).  It can also contain wildcards.  The filenames are
+; interpreted as relative to this file.  Included files *cannot*
+; include files themselves.
+
+[include]
+files = /etc/supervisor/conf.d/*.conf
+
+;[inet_http_server]
+;port=127.0.0.1:9001
diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.0.2.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.0.2.bb
new file mode 100644
index 000000000..d29e1d6b6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.0.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-supervisor.inc
-- 
2.17.2


