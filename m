Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C8BAB6C154
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:15:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r7so15998060wrr.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IbH0SzyxWYO9jFbdJ00SzrXyKJqyH6fzDrGpoFSzLyE=;
	b=g0ieak5kG2eaiRNowfeSvPTkUkOI5we9tUDD2KTt0q0+48leGkcyRFtYC016VtDcXb
	QFmdBzxoRZJjXE1nx+aMNudtz49D/FbYldRhmC6eDl6ZBaFsxxnrKy2HfaYszVyOcM1l
	cTl7hZDbQi0sVtYaOVmVzbpUr1Cjn3s7aS9jnnk2T8heLluJ03RfJzlxJwN90iYbKr36
	aiqA5iEwtzqTzhdS/OOUeqlnzFPB4uMNHEJQklhdFyDuay5S0jMYrylyrTmJQFiEKjvU
	DiUUVKBM05PXC6bEtdyqetq0ke/surPqsqGVDQEt7PoMSdl0bg0d6zuq/Sgn/d62yjhu
	yXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IbH0SzyxWYO9jFbdJ00SzrXyKJqyH6fzDrGpoFSzLyE=;
	b=WNSLCdkOpq2Tt3pN1krCaYLP+JdbQqGSWZ36V/v7bEc970DOABl3o4r3aPH4yoniUV
	Gz4cY9h8LwY6myJNgIBlsIWp+6ona+gGgOTt9uAQWrUy1eoBrCAt8mDzPgVGKly1R7gR
	3n8/YRJA65DBcEsMJilUNdZv7fKm0fVHWKwGZ/Azj7a6Fzx2OqiuF01OK2UFj2zl28jL
	QhUyPSDzk1k0gD0ea5XEoKukzGBASMGZo1CoFRA07s0DQ0p+uJyEJiVtK5Zy75HpbPKI
	N61WG+Wsm1HSfW25AipOCl/xAlJWxh8/zqnKeeAcDmsrneJ1YjzlVA5ebqVEOAuvqkJD
	RD3g==
X-Gm-Message-State: APjAAAWYKDeFoQQ/Qc0sGOXw4QpMcVvSytibWzMQBeNZ6tkufrUZS1yx
	9/gDGvNO1hHspr1kTVJxuUFqOohj
X-Google-Smtp-Source: APXvYqzOQQGa1dUOQF6umCaer6xQ9r9gai0L8BdPzKcrGzQzvaB3tKDiO0bOZUDaYlSZpEZ54AbPuA==
X-Received: by 2002:a05:6000:ca:: with SMTP id
	q10mr9338560wrx.148.1557130559267; 
	Mon, 06 May 2019 01:15:59 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id o8sm7012512wrx.50.2019.05.06.01.15.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:15:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:15:44 +0200
Message-Id: <20190506081545.21460-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506081545.21460-1-schnitzeltony@gmail.com>
References: <20190506081545.21460-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-meta-networking: replace DISTRO_FEATURE by DISTRO_FEATURES
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
X-List-Received-Date: Mon, 06 May 2019 08:15:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../packagegroups/packagegroup-meta-networking.bb   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 63ad34cb8..64eabe462 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -38,8 +38,9 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
     inetutils wolfssl lftp miniupnpd networkmanager \
     networkmanager-openvpn rdist nanomsg python-networkmanager \
     wireless-regdb \
-    ${@bb.utils.contains("DISTRO_FEATURE", "bluez5 x11", "blueman", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "samba", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluez5 x11", "blueman", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-networking-daemons = "\
@@ -47,7 +48,7 @@ RDEPENDS_packagegroup-meta-networking-daemons = "\
     ptpd igmpproxy opensaf squid \
     atftp postfix iscsi-initiator-utils vsftpd cyrus-sasl \
     pure-ftpd vblade tftp-hpa ncftp \
-    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "networkd-dispatcher", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "networkd-dispatcher", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-networking-devtools = "\
@@ -56,7 +57,7 @@ RDEPENDS_packagegroup-meta-networking-devtools = "\
 
 RDEPENDS_packagegroup-meta-networking-extended = "\
     corosync \
-    ${@bb.utils.contains("DISTRO_FEATURE", "systemd", "dlm", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "dlm", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-networking-filter = "\
@@ -85,7 +86,7 @@ RDEPENDS_packagegroup-meta-networking-protocols = "\
     tsocks freediameter xl2tpd babeld mdns net-snmp \
     quagga pptp-linux zeroconf nopoll openflow rp-pppoe \
     radiusclient-ng openl2tp usrsctp \
-    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "dante", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "dante", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-networking-support = "\
@@ -104,7 +105,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
     arptables macchanger nghttp2 strongswan fping \
     dnssec-conf libesmtp cifs-utils open-isns \
-    ${@bb.utils.contains("DISTRO_FEATURE", "pam", "libldb", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "libldb", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "non-commercial", "netperf", "", d)} \
     ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "spice", "", d)} \
     "
-- 
2.20.1


