Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6A63B7FA42
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:59 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y17so14125413wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8aM9O7piSnU5/flB4yZs0J3aB51sQxU/gxA52WqifzE=;
	b=JwWJDmQUSqvePx36LLEqlfr55TOMuR4cwOa88yoiimixf7zpmrvTvuRE4wQhy5Iu6S
	UuN7Z3n785PRczUA2psbKLVk1V9oVTFWYxyNEXM7GRnbvOGF2pDAOCLSDrfleKQQ7bXS
	VaWzgYcKRd6+BOsufbl9EJibQ49p9/lzbbiv8xfn4zNtaQTjipZGmNlfz4bKTOPCCqtY
	Li6/u3ajiM5/NF2GgIDUfbAZ9i7RIvo91fFW7H/TPf2yl79cOs0he75XoA8GBam6SM1C
	yeE42eQt6dGBrHIlJYAQBHHQa3Eed6BfU6X6fWnYiChu94cdih/j0wgf/GcC7Tz1NtkC
	+PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8aM9O7piSnU5/flB4yZs0J3aB51sQxU/gxA52WqifzE=;
	b=JbJbuNiPjFZzJlE+XHLvuvoLMGiZFqZTNAhY+AXTQNFLuw63RTmxFbGViY7/kNLYU3
	+qAwakGh6Q7G6b0jys53Kfp7ghnDF23Tt4XQdnivZx5QhyRFI1tTiCQT/Fjtrwl4fULy
	Qr4PDm45ESzXKSUznUWBXbNSlkciivmIDYxklMLk4mKMi+M7EISoZoj5XwfSS/2sHA9J
	pPKmb0u9trQRvsslIQblF9TQkXMo4sPw5wYsysecLjyyBwY1CRZU4TLgyVigEi89a0v8
	y/iDWtgfrogF4AhbidXvT6ue34j0BX0pAdkkE1tIoQndAeb3kkgnkAW1dvQ4jS7s393q
	0dhA==
X-Gm-Message-State: APjAAAX0YtoB+AHeNzABTMrWKuYi9csWB/kANEaPgl3nsJAaQDJ6AQKH
	Tgl53ruf0fUvCwbAOkZiVsM6ogQs
X-Google-Smtp-Source: APXvYqwx6AK4qqQwn/V2iyb5GdW9/Krvo9iWO3/nxi9UOv0dHBv0qU+WOwED5qEfszd3OS3JJlkUfg==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr28853685wrp.314.1575851939905;
	Sun, 08 Dec 2019 16:38:59 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:20 +0100
Message-Id: <20191209003840.3383-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/29] accountsservice: initial add 0.6.55
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../accountsservice/accountsservice_0.6.55.bb | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
new file mode 100644
index 000000000..bf603b3bc
--- /dev/null
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "D-Bus interfaces for querying and manipulating user account information"
+HOMEPAGE = "https://www.freedesktop.org/wiki/Software/AccountsService/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = " \
+    dbus \
+    polkit \
+"
+
+inherit meson gobject-introspection gtk-doc features_check systemd
+
+REQUIRED_DISTRO_FEATURES = "polkit"
+
+SRC_URI = "https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "6e4c6fbd490260cfe17de2e76f5d803a"
+SRC_URI[sha256sum] = "ff2b2419a7e06bd9cb335ffe391c7409b49a0f0130b890bd54692a3986699c9b"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
+
+SYSTEMD_SERVICE_${PN} = "accounts-daemon.service"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/polkit-1 \
+"
-- 
2.21.0


