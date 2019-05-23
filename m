Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6187E43D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x64so4503511wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eRqxWznp313ZQGqxq8CBu+vUGI5TO77t/NsaAlojU2I=;
	b=Wa2I1Cg7vl2VyjWpnR2B7Y2DkR4L+oDT/6DhV5cAtwv/F55faTu+pdlZ+u6R9utYix
	6qq284/BJPKcc5+7BGLd6FYNRTvRyD3ZZEyZ55szEo4Z5DW0DSgWQzy6N+bEVx6JnGnE
	oIEDj7xtsH+xxFakGVHy6YNrVCK1kdaUrj6sC1QNY74XnZMjODlzinSd9fKX6r31JXsA
	MV1U82umUhglLdNo7KJPas0WVeeqJMWaweGj6z0o/Gog+tWBYCMsmhiqgAlPWKutl+su
	SpoyFu8joaBoNx1nGvAD1eQ/ay2VA9eXmCWi7T9NbQUifwen/nBlAf4grwpFsazGl/uo
	01Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eRqxWznp313ZQGqxq8CBu+vUGI5TO77t/NsaAlojU2I=;
	b=ntNuPQdnaL1Y+tLKGhrsy4k79zl69++bdxusdQk1/padWkG039ZLjo57W9ckPF6URE
	qF2k0+w8z4iD4+nJo3W+ZV3VfyYwb/fdZxRT0UnNhjMmHgxleENTWKfN1NVM5RxL9lAf
	0p0Wd7/5foQNSRvNGNsrBQM6dDhRE3rVSQLwx0/UNmBeE8uHmMz8ndu9u+eCQkGMRfWu
	3YaWa6LAiXT969R7g3R7nOfYYACOsBvYhTo490HZsfvmJc8wMZHvvVrBKupeHVXEkvdt
	4iw7zDTu5TzFn7NhXC2AiJwJK+kMm617uroPAvWrMeaQcFfMxvkpsMdTiKtsZ/cgMmh7
	3VFw==
X-Gm-Message-State: APjAAAX6JDrvfahslIUWnwhHIm32Hj2hAvXUEkuAzgx5PjPKnab+8twQ
	JRRlDvoA5HeOjEEr+avJW2TBDz/U9IE=
X-Google-Smtp-Source: APXvYqz7S4A3YrUCWCNJT7rQeUdG4s7PKx55nzBZOY8j47Cx3pb6BGdZtCVcb45lHJp3eOtdIzF4ig==
X-Received: by 2002:a1c:6586:: with SMTP id z128mr10000538wmb.67.1558594173212;
	Wed, 22 May 2019 23:49:33 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:47 +0200
Message-Id: <20190523064859.24336-30-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 29/41] colord-gtk: initial add 0.1.26
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
X-List-Received-Date: Thu, 23 May 2019 06:49:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it is a dependency for upcoming gnome-control-center

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../colord-gtk/colord-gtk_0.1.26.bb           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-gnome/recipes-support/colord-gtk/colord-gtk_0.1.26.bb

diff --git a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.1.26.bb b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.1.26.bb
new file mode 100644
index 000000000..ce0c539a0
--- /dev/null
+++ b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.1.26.bb
@@ -0,0 +1,19 @@
+SUMMARY = "GTK support library for colord"
+HOMEPAGE = "https://www.freedesktop.org/software/colord/"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+inherit autotools gettext gobject-introspection
+
+DEPENDS = " \
+    intltool-native \
+    libxslt-native \
+    glib-2.0-native \
+    gtk+3 \
+    colord \
+"
+
+SRC_URI = "http://www.freedesktop.org/software/colord/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "bb9d6f3c037152ad791003375aa6c16c"
+SRC_URI[sha256sum] = "28d00b7f157ea3e2ea5315387b2660fde82faba16674861c50465e55d61a3e45"
+
-- 
2.20.1


