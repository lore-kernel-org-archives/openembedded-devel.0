Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id BBE407F95C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n9so5463972wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=h909LFPf/jZ4ftxLnI5Zu+UIJUWnSFdRaAB6XPhXhFU=;
	b=KuwzxoV7RCDXgScuKbi4XKLBa/bLxjP3P7s5rXtP0aZyEhw6mV5nlJqFoFBo9Vm1Oc
	oEyBFgZpifDn6679wdwQ/FqHJdVMTrMZBXRsKzHDU0pcig69fKIMciaxrC7KgcLNwoGV
	5CXJ5poMxKQFy00/H0u/N+4zWpYXoM3GLfAyHVSy51c2sBderAs6ahTV8b+LuIfPSf+K
	ZTM8ZxdvrYH/RPsXJFuVrx39htOBt+eFEKn0g4fz3qrOyzNf3IVq3EMtUgD9qE74ZBcf
	yx0vMpZJpUtz7e+hOAjuz3iC1J1ANecQHl5gTIbeLtHUmWuMkQREOyyO17x956MPAbEq
	gMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h909LFPf/jZ4ftxLnI5Zu+UIJUWnSFdRaAB6XPhXhFU=;
	b=Q+0O4DpwKgYaUrg4/rkB8Bo2M6HgIkRYOI7c45TWcnckwDVpZKWRwW7WFq94SfOzto
	cfBi4uoZBRwv+bFSoBn/zxsJH337h2omSpEdWUNYI3Pk9gwKFh6zmaKFuvbEZTyZwKSg
	RNCndE20j052ZVze5YsDxwlAxXhcA6VCqjlJFbijmsV5IchKxM3xDQ+wHe9RDMR9dgRS
	5vBfCcyGKOcNIASf+O3YpquWflhTAKClrlL0URsP8bFTnnCmbH1vcw/HHrpn1xkzdCwB
	qFHbWUOOF5KU9SFmdmdQZbCwVAP9SdjXlrzZqwGYzHqd1WEg2EAaey48FYftKXabn7C9
	EYTA==
X-Gm-Message-State: APjAAAVVALwkXb6yoL3VYpsMx5mFFVfLyDzCWw7J93/9TSFk2zhN+G1x
	BGUgEWGjHiYIC9Y0v3FCoHSkXRgi
X-Google-Smtp-Source: APXvYqy0RhWtJOnseO0XnxpR3EEld25Ojdi8eA8K7fXvd0/QFrTflLrGf3Ux2suiMF5BOiO6GfZNng==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr5815937wml.71.1575590977285; 
	Thu, 05 Dec 2019 16:09:37 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:04 +0100
Message-Id: <20191206000912.19841-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/21] grilo: initial add 0.3.10
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is an unconditional dependency for upcoming gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/grilo/grilo_0.3.10.bb       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
new file mode 100644
index 000000000..e3fd67172
--- /dev/null
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.10.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Grilo is a framework forsearching media content from various sources"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+DEPENDS = " \
+    libxml2 \
+    glib-2.0 \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection gtk-doc gettext vala
+
+SRC_URI[archive.md5sum] = "f02bf585d1a48dc65be8b90ae3b08330"
+SRC_URI[archive.sha256sum] = "7e44b2e74c31ed24eb97e43265a9e41effe8660287b02295111805c7bda7f1e8"
+
+GIR_MESON_OPTION = "enable-introspection"
+GTKDOC_MESON_OPTION = "enable-gtk-doc"
+
+# Note: removing 'net' from PACKAGECONFIG causes
+# | bindings/vala/meson.build:15:0: ERROR: Unknown variable "grlnet_gir".
+PACKAGECONFIG ??= "net"
+
+PACKAGECONFIG[net] = "-Denable-grl-net=true, -Denable-grl-net=false, libsoup-2.4"
+PACKAGECONFIG[test-ui] = "-Denable-test-ui=true, -Denable-test-ui=false, gtk+3 liboauth"
+
+# Once we have a recipe for 'totem-plparser' this can turn into a PACKAGECONFIG
+EXTRA_OEMESON = "-Denable-grl-pls=false"
+
-- 
2.21.0


