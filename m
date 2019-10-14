Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id D5F797F260
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 22:20:56 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m18so18215965wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GNHB7wzFw9O+A24HeNyZV5QsuNP16D4oNuNMZFz5xsM=;
	b=IMWGmRDOHYSdcRIY7IdrPKL1J2YaGCrCQeoLLydP4dMyHdJrY1V5BoDvu4SKH91Yvl
	ft8pToV+PbdI1GrXmRCc2B76NVtTI1ttpOxeIsvKhgyFTrx/cgWgoVHygIZYdlCcK6EE
	hRV2nIlKWfyI+oR5J5iGuIo1DViOBwnNGpa6/L+loJiFxPY+OQvZgca/gAOO8y0znGm1
	zFh0M3KIPNhpD8TgLqd9ubrPDla4h5FrdU2tvha0b16gS40OBFmESKZ0R6OXsCiijbuH
	olk49rRdLxEAcEuGpkqwkCEIye34GonRfyBDBzJA02TwhJUalYsyophoPgS/lzUefM9X
	Bzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GNHB7wzFw9O+A24HeNyZV5QsuNP16D4oNuNMZFz5xsM=;
	b=hFWyH0jyqNipzSMPGVEzh+I/QnSLdb6CwfbiqH24xc0yloOoasv5wI7dwIJsgtwJR4
	vK5MSq8sROOiwVLWiZXdFRvQmnvxG2NCi22Zyf1d/Hr+zXhqqUx3Qt6Qpmq1HNWPt48a
	fR1RbFsYoeVMSqXdks2+CuQKAmpkiv6bezVJejJcRwS/rhYtF8w3Zq6w2dA7mkdFvSzk
	DautW/Tb/kswr8NKNef+w6+tLuLVZBLGiafla5NRgj/Zl/z+fxJcQ7EInYKnzoLLh+78
	i75Q6vO+2dzaxmJg5/4EobpReLUcxeFqhWdxcUjHTjne7pMESUiOM/ZqmkM6ipJIqHrN
	td4Q==
X-Gm-Message-State: APjAAAUMSmU9MvRetN8VAaU1N6fRZconVrsf24YbDdl9QlfAEKtI61x0
	U9GnCwG6eRYEYYrjGqLaRlA7ZiQE
X-Google-Smtp-Source: APXvYqxSrNCcXmcPOG9CQNXCUo+/meGTxeDnbO9WfmtgNCskZBldIZGO5Ln2f/nQb9o8bQFvTcr7hw==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr17644950wmc.34.1571091657215; 
	Mon, 14 Oct 2019 15:20:57 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F135A0825FC0019871DE783.dip0.t-ipconnect.de.
	[2003:f0:7f13:5a08:25fc:19:871d:e783])
	by smtp.gmail.com with ESMTPSA id
	a2sm32920987wrt.45.2019.10.14.15.20.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 15:20:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 00:20:46 +0200
Message-Id: <20191014222047.22306-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] pipewire: initial add 0.2.7
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
X-List-Received-Date: Mon, 14 Oct 2019 22:20:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have 0.2.4 in meta-qt5-extra as dependency for liri-shell. Soon it gets an
optional dependency for mutter so move latest to meta-oe.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../pipewire/pipewire_git.bb                  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/pipewire/pipewire_git.bb

diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
new file mode 100644
index 000000000..9b9b64205
--- /dev/null
+++ b/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Multimedia processing graphs"
+HOMEPAGE = "http://pipewire.org/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=d8153c6e65986f862a0550ca74a3ed73 \
+    file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+
+inherit meson
+
+DEPENDS += " \
+    dbus \
+    glib-2.0 \
+    alsa-lib \
+    v4l-utils \
+    gstreamer1.0 \
+    gstreamer1.0-plugins-base \
+"
+
+SRC_URI = "git://github.com/PipeWire/pipewire.git"
+PV = "0.2.7"
+SRCREV = "14c11c0fe4d366bad4cfecdee97b6652ff9ed63d"
+S = "${WORKDIR}/git"
+
+
+FILES_${PN} += " \
+    ${systemd_user_unitdir} \
+    ${libdir}/pipewire-0.2 \
+    ${libdir}/spa \
+    ${libdir}/gstreamer-1.0 \
+"
+
-- 
2.21.0


