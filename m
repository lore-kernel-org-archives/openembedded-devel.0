Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id A3A2D7F95C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p9so6005987wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8aM9O7piSnU5/flB4yZs0J3aB51sQxU/gxA52WqifzE=;
	b=l3Ekvf84q2s2l6o9RaoF/XOpHJITKI0upuDcL7uW5FO5v/jEodMYGXfrz34CJpmgY7
	HeYcv0vTBq7ZB+jS1b4sOKedm+ZJ7htbDVG+JpvCpsUCKa5PrnKyb3Y0FVXrZcPrnnJM
	rCfTCK11umjbsWiBpGXM8/xMMNZAZLl0+PSlF0HIuoUtz7lsdvrpJ/p6U3kGdQYJ7HwL
	CZgcwZNuXaE3gCaeH7Rp6uxWulfBkJz/MRjxzDmms9Td7Uu33+ClchbZiTv9CDD1LxSH
	TFt3AUy3OI0ecCXtxmqLaFMgbu41I5NJd2KspDSqxRpqMywfNN1MQ9RpbRkkeIFpfxRl
	LuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8aM9O7piSnU5/flB4yZs0J3aB51sQxU/gxA52WqifzE=;
	b=TqQ+N0sZ6hU+PwDUJiqiD/Hm+un2+/+5jLZXcaK37HM13yV+3hzjbIipFQF8jOkmpx
	8CFqQdn2iBaQdsnetSRBdjkmo0ZBFrwixZrP7yTA28ljn0Hr3iVFyTRZUXhLBW+oRN/V
	3XCZQwjP1Kqb4MIUFTqwajgpeP0hOrvfNyheThtY9D9R+TZvRcUpU3tptoEhBAaHjP+l
	Mg8K6epmcPUjxvWXQ/5ycDcGANM7MX4zglT8J0yM1ur2wM/Z6Mcd3P2e7tpLawXctKI6
	w7rucwTjibOK7F85ojLL8VcVu0GT/Sy1Gt60z55Lu2zglVb2PP6Hk33gPUkSQK3aeI1b
	PSbw==
X-Gm-Message-State: APjAAAXQz9sMa5AUtt6S56NhsSm75ssGgU1bj3l8+s5re2Q1fQNW2LQg
	bkWNUkznK3eTojZmnUct8C/CeBYN
X-Google-Smtp-Source: APXvYqwQ9SL/YooqdFHldC4tg3ciw1yiUb16E9l74ucw6yCFYHn4BYAcy15r3BCRoI/S+wAKxFX+Sg==
X-Received: by 2002:a7b:cf0e:: with SMTP id l14mr7995467wmg.23.1575590973170; 
	Thu, 05 Dec 2019 16:09:33 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:00 +0100
Message-Id: <20191206000912.19841-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/21] accountsservice: initial add 0.6.55
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:33 -0000
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


