Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6C68B7FC0D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id c9so15149640wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8aM9O7piSnU5/flB4yZs0J3aB51sQxU/gxA52WqifzE=;
	b=Hlajlxr8N0qtVqSLWpBETrzlP+9NlNNAmX134FK913qixPkP6OMQ1AsfixCbYLcPUW
	0mS2jhyXCb7r84FY2twK8Jp3wTSB9slfEv+im3NXbBJZBcmTgOEa3y0G8cLa44X/ZURi
	DAMw9R6HU8oBPe4/fZRJw3EZLIQLVIwo+y2B8eYeOPYDKq/+gVfROPxETvbmwfoAXHln
	sZsCcOXt6Mx+CPS52Dqyw7LNIeOs0S4xLS9VJ1sCXyoovmtg11/GoeD9eAT7bnwwqvKB
	VRhH4N3CtK5J6Z2fOSketnKmru+DOuNwI0qB+vUXlQWpncFLw655bS9DzdzS5OrP+BAC
	AstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8aM9O7piSnU5/flB4yZs0J3aB51sQxU/gxA52WqifzE=;
	b=SceTQXMTOA0PX2DV4BiYb0+EXvx4PSc/BOnoQFN7by6Bahvd73YxuiZKQU11rgYD9A
	0naBu1aHHKX4OmcKrDG8Tum9hHEfe32Ly6Y9ucW2U6PxIOD4E3TVu7oACU6N8DiaVzf1
	/rmyU02Y1dZ/RXdh3hw8aT+ZYNiFqrLwRgzGg/pO01rD03IsFfYkWzNGS9QkBbuWHC0y
	A+ZyBlDe3FDNks0rvaP/dPt/hwCO3VGiNqhbYwxAn+ivUPQPxE2J2X0+l7shXPEkzLDm
	LZ1Tt7twWoDumeGVYcCIlNKwdXgFCRWGBjdZ293azdQexRtvo7jefWYefKOb6PyqINst
	8VWA==
X-Gm-Message-State: APjAAAWOYv7c+7IMYTpCpbS91L1NFP3l+E8Tw3SEWrfEnV+K6qFmdRDA
	s9JCN0B2BpMmPDXct/Ev9XrFf/2s
X-Google-Smtp-Source: APXvYqz6M6m7SHGEZCa6d1jvi/jgNsQ3x9I4hEaCDMYGFfk/ZXvww6M6Sp+gacPYan4hFSpqUxz/dw==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr659692wri.95.1575880587014;
	Mon, 09 Dec 2019 00:36:27 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:35:57 +0100
Message-Id: <20191209083612.23922-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 05/20] accountsservice: initial add 0.6.55
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:26 -0000
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


