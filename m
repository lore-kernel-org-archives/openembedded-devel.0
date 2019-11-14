Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECD87F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id l7so8026813wrp.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=a0wpAbUiQoPv0BJ7hTOumiZgx7WRK6LOa9rzOwPZ1GE=;
	b=uIF7YD1szlDp8QVmWjFQR3byfzC0wd36fCA6U4Lmdac6+Q22Y3Y+Z7Wz2gRA4pC6nw
	gPFnHAgQKuEjcO6F5JNQ1YAB2+Lg+SM9aOFLnZrMh2AG7qaSkIBzPOCUv4qV/8TPfVus
	5eZGa1ABlc+FwtBqYXo4Rw6JthqfYNC+glc2t+6Ty0m/aaAvlV5MzS5HzToZS/edU2Bp
	2jOEplhJ5xSZIjAzryvd2g4DTYhisaQjnRM32zQlEH83BahIKrjcnQZ0BuorX/ebOW06
	JThgHFwUQW8uBp5G006uUiTt9OxR+Z3Y9iL+HWxXhhnH1kvYJqaJNWPv7m1yHiXZCKXT
	8qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a0wpAbUiQoPv0BJ7hTOumiZgx7WRK6LOa9rzOwPZ1GE=;
	b=CGW1giLCplk0S+16qyhrRsJ+4NcL7Ab4wx6G1OMb1CfwxI7OyAAa7M+SSRh4O8g40o
	x4FROQve1E9FdwrxFIjzSzZV2b0C1/ENneGWShy5n7bFuKkinRVfCIdXB15PJD2owEu4
	iAkn4dbQ7Fsxeyv1LFpPek8S87EuP5Qb6GoVCv3mwG4yErs057EdyfJGdMU25EjNHxCL
	bZ+lcVBKLlE2t9ybUg9GeTOElJAb1xO7mZbTi4G61bT3/U8IpEmN8Me5NrJtrk/3YuLJ
	eoVse1wTIK5Ks5m1nupmiO8J5AVuEaYhPugHOmGDu3wHx/hInF1A5f5hMWteVYw28lBX
	NrmQ==
X-Gm-Message-State: APjAAAWwWEJNtNrUnelMmc5rpupHs33DfFgRRHqwWqyjVlAV8FYZCqNK
	C0WKeottmsT/LGDp2jSHdxOVlHEO
X-Google-Smtp-Source: APXvYqxGw/vio/RhfMHSAVLwSlV3KncDSNZJUj8+ThBVKdI5hZoDdIvUtzNHJ5m1fkqC6XsvnxcCmw==
X-Received: by 2002:adf:df8b:: with SMTP id z11mr9524330wrl.12.1573760988728; 
	Thu, 14 Nov 2019 11:49:48 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:24 +0100
Message-Id: <20191114194930.2786-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/16] gnome-autoar: inital add 0.2.3
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a dependency for upcoming nautilus 3.34.0

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-autoar/gnome-autoar_0.2.3.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
new file mode 100644
index 000000000..16a9213cb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "GNOME archive library"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = " \
+    gnome-common-native \
+    gtk+3 \
+    libarchive \
+"
+
+inherit gnomebase gobject-introspection gtk-doc vala
+
+SRC_URI[archive.md5sum] = "39b13fb2fc7752fa3b80616244dc4ef8"
+SRC_URI[archive.sha256sum] = "5de9db0db028cd6cab7c2fec46ba90965474ecf9cd68cfd681a6488cf1fb240a"
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
+}
-- 
2.21.0


