Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id EF27A6058C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 12:39:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t2so7073915wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 04:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lOm8k6/H9eA7pBUM3bTVvMIOw3vzG/PaS33F11KSIK0=;
	b=Gmalfm+AOYa7kED81Nqgpol4dtj6mWh+50bEet87MzoWTgeJemn5z68jtIoDbKq3M7
	2pNm2ioskR9T3JsiLdP6n+jvYOHVMzY38+4wsIRE8lDj8jCQsHw8q/h3m/L4O1IU6/3A
	U99HLIgq4vp8z14mzf3EgTQqMabxaR735OKAD/XMR9TkPDl9+3AEgdGafV58vv9ch6Xy
	e3HoAk9G3BTwrGa5s1ykezp7h7PUp/D7ZCkuc7o14LY/7EGi2WAzJi8mpQPqrb8cO7eb
	RbikWfV4p/kdcrrGN/kWHkhfkOWHx47FXZMMQHDXe2gQwaOUd3BO0fOWbeVvilsQR3Lj
	yVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lOm8k6/H9eA7pBUM3bTVvMIOw3vzG/PaS33F11KSIK0=;
	b=b8IvX2zJq5IIrAMzThqpu9UqKKQgIBWPWFG/SRaZlN8o8bHuAEaPJyNbPfLgplgc2U
	d6mjQ9hCooIuNzuitnwc2uP9tTi6/qEskGgHBTzRS8jfHHQCuCEqCS5m1MoNEqixqKdI
	HOcci6gqy/l8/NNib2vI12/G7dcFi2mTykF5SL+texXTjZs8iNXJHOqJnC5PDXpTEE7k
	+LMunOhLo+fnCrzKS0zECKSZe/bCq/1m77qF0QeUpesA7uF19JtYxNmIoC4EcArV7Iv2
	jKLDhjVHtA4ePFQgtF/EiepexHu1CQMalmS0udGIebYCVTuqTyA89d5ZVICmtTqtOPpO
	de3A==
X-Gm-Message-State: APjAAAWvk5WnZI+Iit6ucsZPW3AmsTPSJ1Au8rGpmBAQgr+2Ovjm1X4n
	4qI9imjvCxi5nX+UrxNtn3snLWqJ
X-Google-Smtp-Source: APXvYqwA+nTXXDT93VNmovty81op96mduvzw7zsGr9FYWu1hGOqi9/xIv2V7psd1vwYW7Kl8lHMdug==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr28946102wrw.391.1576499946416;
	Mon, 16 Dec 2019 04:39:06 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F06A30403E1B31F51E88EBB.dip0.t-ipconnect.de.
	[2003:f0:7f06:a304:3e1:b31f:51e8:8ebb])
	by smtp.gmail.com with ESMTPSA id c5sm12545301wmb.9.2019.12.16.04.39.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Dec 2019 04:39:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 13:38:58 +0100
Message-Id: <20191216123858.30402-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] libhandy: initial add 0.0.12
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
X-List-Received-Date: Mon, 16 Dec 2019 12:39:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libhandy is required by upcoming gnome-tweaks

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Add protocol=https to SRC_URI
 .../recipes-support/libhandy/libhandy_git.bb  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libhandy/libhandy_git.bb

diff --git a/meta-gnome/recipes-support/libhandy/libhandy_git.bb b/meta-gnome/recipes-support/libhandy/libhandy_git.bb
new file mode 100644
index 000000000..8c6159f99
--- /dev/null
+++ b/meta-gnome/recipes-support/libhandy/libhandy_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A library full of GTK+ widgets for mobile phones"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://source.puri.sm/Librem5/${BPN}.git;protocol=https"
+SRCREV = "ef7c4bf75ae239495141ada83d2fbaf034315563"
+S = "${WORKDIR}/git"
+PV = "0.0.12"
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+inherit meson gobject-introspection vala gettext gtk-doc features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+DEPENDS += "gtk+3"
+
+PACKAGES =+ "${PN}-examples"
+FILES_${PN}-examples = "${bindir}"
-- 
2.21.0


