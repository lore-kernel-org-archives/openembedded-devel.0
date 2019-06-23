Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1580A6C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 22:36:03 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m23so10643007lje.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rxs/g1pu0FtzvRhou2q+VuLLH/v7PirsYNVHL1RtauI=;
	b=dw0p4EZ9T02bWUk9sUfSyYF/0yYBauVW87OR9MibUk4V0CO4PH2lQMxQ5nc/kGG8kN
	XnPfSgPajoP709TIsh0owXz17s/7E9T0avY95oE6Ytbfy34SJAd0fXYa9fDU7M91573l
	AYZQCeJjtfDxr05CXu1rQqva7r+mTqRYVjMo8EmbR8FSVUK2RuGgUbtrhMv1DlSCi52U
	GztD5ZBNxvMOZI0i8pEESpa6uK/BGO+mF21+OJrkdcNMW4nD6jz5n5fU9GmweyaZtucP
	SPt7fMp9TG8Cqx8eq9Qjar8I3/+atx7eE8p4OtkxBmtopETSLEFPMGvNa3ay4K0pZg5M
	n6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rxs/g1pu0FtzvRhou2q+VuLLH/v7PirsYNVHL1RtauI=;
	b=NP3oopHQsDUKesmzFFp8FY5aiqUhu+ocFwobqphuq9va2vpzsmWRGJ9smFN3jqq39x
	fyimJIpN6lsticK2NvK3cmDhc0MSfxTIPKvRCvkYnSvohoxHuVICbSpVe3ubdh9SeWpz
	+6sDMH+PilDDNL+HNaRKIVlc6mJUK/sUCEsP6hoiKhS/Mkvfq/3V5L06l2v9Wl5fxYQR
	CmM9kaS/OGsufyL1olXtA+uOLMlo8A/7obOySicaB1t8zS1UFgp28bP0x+Gefv/7AnIh
	KZ99BPZV+yCULhgF9HKHrfdXaBlx6g25VWYW953G01Kid6FxBjCBo8nPjcsfciEDKnZY
	3lAA==
X-Gm-Message-State: APjAAAVEl7jDK32P56SGNj57NbyXnVEUnkTGgqre4OYSPZXQOX0+rzRn
	FcK4JXC/OyLkLyRZi7JG2mqNW17MLw8=
X-Google-Smtp-Source: APXvYqz7xj5sDx+iqLcwnQOAVMrl8NJ6VbIwLzRLmHFRe0jGAN9+cwIB9211UVifGXT1oa0fjlrGYA==
X-Received: by 2002:a2e:824f:: with SMTP id j15mr21914146ljh.117.1561329364166;
	Sun, 23 Jun 2019 15:36:04 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id t3sm1295841lfk.59.2019.06.23.15.36.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 23 Jun 2019 15:36:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jun 2019 00:35:54 +0200
Message-Id: <20190623223554.13989-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nuttcp: add systemd unit file
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
X-List-Received-Date: Sun, 23 Jun 2019 22:36:04 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/nuttcp/nuttcp/nuttcp.socket      |  9 +++++++++
 .../recipes-support/nuttcp/nuttcp/nuttcp@.service    |  8 ++++++++
 .../recipes-support/nuttcp/nuttcp_8.2.2.bb           | 12 +++++++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
 create mode 100644 meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
new file mode 100644
index 000000000..a8ae74fb8
--- /dev/null
+++ b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp.socket
@@ -0,0 +1,9 @@
+[Unit]
+Description=Network Performance Testing Server Activation Socket
+
+[Socket]
+ListenStream=5000
+Accept=true
+
+[Install]
+WantedBy=sockets.target
diff --git a/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
new file mode 100644
index 000000000..b778e8552
--- /dev/null
+++ b/meta-networking/recipes-support/nuttcp/nuttcp/nuttcp@.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Network Performance Testing Server
+After=local-fs.target
+
+[Service]
+User=nobody
+ExecStart=/usr/bin/nuttcp -S
+StandardInput=socket
diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
index 2fd563123..193caf3cf 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.2.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=496a7c0bb83c07ff52
 
 UPSTREAM_CHECK_URI = "https://www.nuttcp.net/nuttcp/beta/"
 
-SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c"
+SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c \
+           file://nuttcp@.service \
+           file://nuttcp.socket"
 SRC_URI[md5sum] = "d3c92c4d2f261221193c3726c1b9a42f"
 SRC_URI[sha256sum] = "8c5595bcd27c2fd66831be74c390df078cfb1870aa427f2511ac2586d236c8a1"
 
@@ -24,5 +26,13 @@ do_compile () {
 
 do_install () {
     install -d ${D}${bindir}
+    install -d ${D}${systemd_system_unitdir}
     install -m 0755 nuttcp ${D}${bindir}
+    install -m 0644 ${WORKDIR}/nuttcp@.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/nuttcp.socket ${D}${systemd_system_unitdir}
 }
+
+FILES_${PN} += " \
+    ${bindir} \
+    ${systemd_system_unitdir} \
+"
-- 
2.17.1


