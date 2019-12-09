Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD3C7FB11
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id b11so13549490wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8qes9fXUw7HhB35kTMhPwd9RtzaL3ev9lYn75WJh4TQ=;
	b=PQufG/hGKG8KgXzJom+H9OSRwBs+5bGPl+bsUoOMhjHAPZYLZz1AhcGCWfPzJqMR8s
	EsiTXqgtabMMQmS8BEK8t/89/Cb8wkCKfCnQAXSOthrpdRCmto7N/iPVMczlSnoNy0OE
	oRdOM1/lOUfb0FL03n9KJz4rts5n4cl5Puv8cOrGGIVVYgKwhcFmsdaseHK2xGaj951b
	rtQXAoLNyNPDnGF0NBQT+CQ15qhcqHceZzp67YfumPkcSM80U463IScf9xBpWTQzA9oC
	IQCMX+vNhfwXoPxzBvNIMCBcnTuY50N6kpUowMzk4lPWTZddd3lhKpAByI+dMHZu8NaM
	iSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8qes9fXUw7HhB35kTMhPwd9RtzaL3ev9lYn75WJh4TQ=;
	b=S3l7tM7JV+vqJZzFr+Hl2ftO/41Mu8FElWYwYI5/xdBxI+SRpbFzaTh7JHxrTuUOo+
	GhPFvH3Rvd740hGwE77CkYipYNbQ8y6D0KFPVGscGrGnUZ/57ZS2kPYxX2gqN1NADh0J
	rcStoJp44zUtLFOhmxzEglbn4It4+Lcfz8aVvcDRNPamj5rKTIR3Tmy6sEpc5HTymvfJ
	GfaQtKndXXyTN055tg+ShAjVyCn4/eDWHSKYolyLhcBxFLg2tvS5jhq4aH4J4YE1O/0l
	PR5kdf/w3zSH+AVmrJTyTJ0vkS2X6IL9PZ1cmaYYEIhmzI96Jo4V8fv7T9/iugA2hdzh
	4+Og==
X-Gm-Message-State: APjAAAXjctcPTurafN64TrbLD9mbxrGTTsgo0rKXBIefMumiB+wm7H3m
	tegm4gav3bnfsoUYLlZ6ySRtK+xF
X-Google-Smtp-Source: APXvYqx+aWS9rz+1yjBZz4kcctiWMJ08A/RO1ehROQ7IwDnD4K+ZRddpEWB4Htgi6e4TqaeJfkoXQg==
X-Received: by 2002:a05:600c:2951:: with SMTP id
	n17mr4899196wmd.75.1575851952983; 
	Sun, 08 Dec 2019 16:39:12 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:31 +0100
Message-Id: <20191209003840.3383-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 20/29] gnome-flashback: initial add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:12 -0000
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


