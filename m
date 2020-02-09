Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id E121E60E9E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 11:42:41 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t2so4103223wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 03:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jz3KRMxcOTVMfUTjAMUX4vkYi9A9RpA32M9Qpt9hU+8=;
	b=ENjOmhVTa97X89ua4nXb+0mdtwcZJn+fJlKkQcDzK9j29DFFFmU/NCiddpSeTMlTHN
	Or/VTsqx34+/kNPsGIpebuS3Pmq2iYLnpbYvbS/PHlzw9zNgmNUtObw4As22bkFYfucO
	OsZR2szMpadXYwida7L6kbu5c5CrKWwyENb3o8gAh4AvdG+Bvn46UIBZ0DRJKWkJRi01
	mR/va42NUxL5Hl7GxsA5Yv8BO3/OnceHgjJ73+uAlN4xIhdy34mlOT/srqROm4kXHsrI
	xEBYETMh5usNDIk+iAvOlH/U219XE7oZMcYMRhdejwLPGBiLL+9j/5Ng2YQI/GbaOhQl
	cNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jz3KRMxcOTVMfUTjAMUX4vkYi9A9RpA32M9Qpt9hU+8=;
	b=ZWSJLt3BKeBjTujDjHvnElRy5MVj572HDR4FhROde0GGRxZS2jOagfQEXYHKF28EZI
	bYOeivceVN5Vz8ufe6GhxFoFmZ0cKKCxdEiAD7j0kUzIYzqTHIzRY7p07fY/TAO49ELX
	YgYejoXI/ST2lCWe5t4XHGqMpY2l9RyvN7EHuDCOP1ZgaIdTQ/DQ/8M3igJUwOwhp9OI
	YqSWQAq0q1uAKEiV1ecAjSz1PbDDqPcZFS0yCYM/CBwdCl0rajhCb1Z661OY8gp1Zu3B
	VPL6qVHsiX/AAuuGXz4JvmABUCbz7P9mM2phGpJJE/Gq/Bh1HxS14uNPu17pmoD1yz1Q
	RSQQ==
X-Gm-Message-State: APjAAAXE1w791ioSB/rk/iilcrc4EUzljpIbIH9PoYG+Ce9xfWXCE4f/
	LqQO7iBwub1L4t+NSTKK6o2d5flK
X-Google-Smtp-Source: APXvYqwDAtjYRLIrTPB3XLEmGXT/IpKD64LhLr3l8M9qlln6WTD6jVCpHh7UoJxNcyeLRGGDfUsKyw==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr10777817wrn.245.1581248562391; 
	Sun, 09 Feb 2020 03:42:42 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	a13sm11828426wrp.93.2020.02.09.03.42.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 03:42:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 12:42:23 +0100
Message-Id: <20200209114226.2584-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209114226.2584-1-schnitzeltony@gmail.com>
References: <20200209114226.2584-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] libmypaint: initial add 1.4.0
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
X-List-Received-Date: Sun, 09 Feb 2020 11:42:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming gimp 2.10.14

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/mypaint/libmypaint_git.bb    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb

diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
new file mode 100644
index 000000000..2ca80f3e6
--- /dev/null
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "libmypaint is a library for making brushstrokes"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9d13203ab4013e5a14dd62105f75d58b"
+
+DEPENDS = " \
+    glib-2.0-native \
+    intltool-native \
+    glib-2.0 \
+    babl \
+    json-c \
+"
+
+inherit autotools gobject-introspection gettext python3native
+
+SRC_URI = "git://github.com/mypaint/libmypaint.git;protocol=https;branch=libmypaint-v1"
+SRCREV = "477cb94b596035b54a255faaf95d13f6a8ee3619"
+PV = "1.4.0"
+S = "${WORKDIR}/git"
+
+do_configure_append() {
+    # autogen uses python2 so generate headers ourselves
+    cd ${S}
+    python3 generate.py mypaint-brush-settings-gen.h brushsettings-gen.h
+}
-- 
2.21.0


