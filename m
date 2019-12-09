Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1688C7FC23
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:33 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p9so14491644wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8qes9fXUw7HhB35kTMhPwd9RtzaL3ev9lYn75WJh4TQ=;
	b=d5B2U6V6ZS1ovVYfW4LrNRDLmcYhkx3cm49r3kTrwnNRHfm+yfs5NvkTukLOGZEt2m
	3PugqJMPm5BZAUN0eVMI3ZcpXu9okmTW4CN+bZAcAdXh9ZS3Y5PHL+gCWiEkA8kSVpgu
	Ro62Y/IiNJQ2hjPoGfxOZxEsvf/m4WQYp0bGeaRAgZcw+C8R6uSGYotBnBYnz+e9d3kY
	F0yr/MTFQb1dUiHyA1TYPpv7TUvJgSXK4kSifJE4QunzWO+Wp15XVoDKqcAws0FyhNz4
	M/PsH2GODrdoUxroJ61eM5X1KCkF1IAHJAbhBN0KViw2fb/kvMru1jHB9z2YrWWiz6a2
	ibdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8qes9fXUw7HhB35kTMhPwd9RtzaL3ev9lYn75WJh4TQ=;
	b=k+PsuaRVuTmJRMSJt/VOMpqKIMxZnibiithqfQo0QmS04lU9frPStRnQmb1xc9DKB1
	u33Kivu10wLd2kQSe/KysI90gW0BG/ia9tTjGj6xNsSxiq4IgGrwXEib8cckPedHXGVq
	6xirAk3M2LFbIbtzc/5UbBsIGzzCq3F9iCkytLP5Ri1NFw6ZoOG1ltUB0a3mU+slv9va
	o48yHgi6ca+TFrddwWnYNWHmuGh37HpVn8OtLBloS4RFf4bLNuLZMr7TacHq1EuhDLED
	L9Bjh0QLbHm0/cNbL/Ukb8GmqAd4lI5SYT9yPsH5KIPm7id5UUSSXVdcNavjMnBLlJfM
	8ttA==
X-Gm-Message-State: APjAAAUON3+fL/WCtjcdtVnlGK5tTqzZ/b9c6i/pIgoXkDXAABqBQ5vb
	3VphhAaswhGDcUfzsf/gJGtlqlvs
X-Google-Smtp-Source: APXvYqzP/AZbCXXlO8tRPsRzKWGFVRczRuthTrEWVimASKVIRZIvkmpZKg5qaLgfcnSw+zDBY0NXfQ==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr22908766wmg.147.1575880593592; 
	Mon, 09 Dec 2019 00:36:33 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:03 +0100
Message-Id: <20191209083612.23922-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 11/20] gnome-flashback: initial add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For all those wanting GNOME 2 e.g on targets without graphics acceleration

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-flashback/gnome-flashback_3.34.1.bb | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
new file mode 100644
index 000000000..637f83715
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.1.bb
@@ -0,0 +1,34 @@
+SUMMARY = "GNOME Flashback (GNOME 2) session"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit gnomebase gsettings gtk-icon-cache gettext upstream-version-is-even features_check
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam"
+
+DEPENDS += " \
+    upower \
+    ibus \
+    libxkbfile \
+    polkit \
+    metacity \
+    gnome-desktop3 \
+    gnome-bluetooth \
+"
+
+SRC_URI[archive.md5sum] = "e328a51b69d97e291709458dfd8c0a1a"
+SRC_URI[archive.sha256sum] = "ddba0c9661ad93b58ccbde267f6ecbc02da2c15f9d38d87d5504f4670c2fbc77"
+
+do_install_append() {
+    # no oe-layer has compiz -> remove dead session
+    rm -f ${D}${datadir}/xsessions/gnome-flashback-compiz.desktop
+}
+
+FILES_${PN} += " \
+    ${datadir}/xsessions \
+    ${datadir}/desktop-directories \
+    ${datadir}/gnome-session \
+    ${systemd_user_unitdir} \
+"
+
+RDEPENDS_${PN} += "metacity gnome-panel"
-- 
2.21.0


