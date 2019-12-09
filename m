Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3CE7FB11
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:07 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z3so14142777wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ylCbqqV41RXb/WNjRmumFAlymU2zBU/WfsuZA4Eq+UI=;
	b=UAHCIWEdMzrML9FBuol0NWqfDGmwDQQG2FlCy2y3TDtOER3aIWONVbGQvdRLLWzxwR
	uNOpJr3KcCi3XlDsE1bxetSQrd6iJ/dMEdTXwupDktzVfFv+r0VMKXPx64xzG1Cb5BoR
	7CKhrbT7DJX0/Ccg0XXVPrfLElQJZGCv/OcBIRycjbV/uooThW7ws31lbGMAyDPWI73j
	kSkf3QghJ5KkvAYf0pfW1cvFMhiAg3y8NQ10MVaK/jnXWfBMe08jMSPo9apjucjmbxvt
	Jpju7V5Y9AbRdUspUBE2zUV+JnfMmX923K09JZnpEsxZlssSRFUsxfmiPYEqWAeB0CxC
	gS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ylCbqqV41RXb/WNjRmumFAlymU2zBU/WfsuZA4Eq+UI=;
	b=emdd6M9C3px2CRmKZBhNU7p7ObYPXOsMQFgr4Mxy65ssspevdqoWubVN27JWAf6lon
	Nhu+BuYTpPqlA/9AEfueFlAlrj61ylu3GsS/Dwy7SoioCUY99A+HPrZ5SioZDo/lZops
	WZcZtvdA5YAFUE4mPhKRXO8LADdFI8zVN6SJC0fMbrZz8xeA/8FMzfhNmpwMRpWKKPLu
	CcErATMdQJ+qIvLCw+WSEMGy7c6Z/oOxVgC3amoVNUCiqrisUbW5KmxtUUALbO8fBfwl
	E3OiDP+tTBBMY4etJ1zmP8W6N3mhD2wptnYt6ErSnqgd27GaBx+lgeHP47jw57ISZAk+
	bTUQ==
X-Gm-Message-State: APjAAAUnG/t56V9B6DiL36NiHXMEL93DKmx3ba2HIwvunt5eF8ccgpyc
	B3YUTYiGh1a7Lt9OWfal5JHav5gY
X-Google-Smtp-Source: APXvYqyEgciquCS7SZUsveUTrsnUYMBN1CSPmgi9fDUTY4ziId8x+1RNBXvud7UQTKG3fk74S2Ze7w==
X-Received: by 2002:adf:8150:: with SMTP id 74mr28903164wrm.114.1575851947701; 
	Sun, 08 Dec 2019 16:39:07 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:27 +0100
Message-Id: <20191209003840.3383-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/29] gnome-session: inital add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-session/gnome-session_3.34.1.bb     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
new file mode 100644
index 000000000..e1bf16b5c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.1.bb
@@ -0,0 +1,39 @@
+SUMMARY = "GNOME session"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = " \
+    glib-2.0-native \
+    libxslt-native \
+    xmlto-native \
+    xtrans \
+    libice \
+    libsm \
+    virtual/libx11 \
+    gtk+3 \
+    gnome-desktop3 \
+    gsettings-desktop-schemas \
+    json-glib \
+"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gettext gsettings upstream-version-is-even features_check
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
+
+SRC_URI[archive.md5sum] = "1a9c10d5468b3ba8abee94653692fe0d"
+SRC_URI[archive.sha256sum] = "d7801fe2d5a751b19cb58081771316a76aabd5c550cd58d4e4c6a5a4ed356660"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit',d)}"
+
+PACKAGECONFIG[consolekit] = "-Dconsolekit=true, -Dconsolekit=false, consolekit"
+PACKAGECONFIG[systemd] = "-Dsystemd=true -Dsystemd_journal=true, -Dsystemd=false -Dsystemd_journal=false, systemd"
+
+FILES_${PN} += " \
+    ${datadir}/xsessions \
+    ${datadir}/wayland-sessions \
+    ${systemd_user_unitdir} \
+"
+
+RDEPENDS_${PN} += "gnome-shell gnome-settings-daemon gsettings-desktop-schemas"
-- 
2.21.0


