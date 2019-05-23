Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E076C7E43C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e15so4897030wrs.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QQjH9s1U92+NFF16NeCjzmDHEwVy+bQ+srh2xQApQoU=;
	b=ebQACvUsh2Ul5WkoBVnrDWGGrOkG7yW83yMnb/fcmeuwojtnAw23IkhHp4VNAfrA4Q
	+ygEXPKHH22qO2I0M6Iui6Hkh5G7wcOXYqva9ogBCG6bp5qOcNKEPDI8qP8ymDYoFYW9
	y7VuqhuEZeGElz/UQLXvrtMCuBYcijwa1Y0gef8WC/O7jkZwaPPVLHgvEdo0yZ54lEcQ
	xFcCElj5yG0oebCh88jz7pT3otJsRiJIeW8CBdHLRLzUdZpobTKF/PtPJ7hG+Ithu3z8
	/EiJr75gap1P15XoOTTUXWA/dHp+CigcYVe7ykI6SJ3xx67tVR3njYbFk6Fti4sWJjFs
	1b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QQjH9s1U92+NFF16NeCjzmDHEwVy+bQ+srh2xQApQoU=;
	b=VxUQf7sEabL+NJzHVSscf37f01JUp1593U6ahAXT3pwam26rD3NwkZ/cYBYm0oTMRT
	gDBlAEYmoP0lF/MOh7uO+Rgb7CNFkvUfMRNZGnksd1DtguCAadoI7aIuAuPthFn6r33i
	8AShqSXRPc+PCwjkMYY9417nADbHg69GLkcdwr7fxC78WOllumaXMGfpoD+z2SROXiJ7
	UE6wOdMGjsdwUxfJ9ENx1RJ+yTfYbt6WIQi9F/9tUymM3e3MsM6Thgcxw3954u4ENmRG
	NrrwW1M3lUT26YEko2vsV2dUP3h15sbffG/YOtcBEO0s6+F1pwB1LzsjrhwTJivivTH9
	X1+w==
X-Gm-Message-State: APjAAAVQ1nSarpWba3FKUdGa1C9jnzSuojSB8S9cFw/HkCnFonm39/Or
	BE1n2GkrKA0Ca1QrbGEm5gxJJnLjCLk=
X-Google-Smtp-Source: APXvYqxTcaDviLrzn7pbQeC7iA4jLyzfth/hbmlPwhBJeou9WhIz7kTLZrAkaRPI8tu34acvpf+/EA==
X-Received: by 2002:adf:afcd:: with SMTP id y13mr57915498wrd.270.1558594171598;
	Wed, 22 May 2019 23:49:31 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:45 +0200
Message-Id: <20190523064859.24336-28-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 27/41] libgusb: initial add 0.3.0+
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
X-List-Received-Date: Thu, 23 May 2019 06:49:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* It is a dependency for upcoming colord. That is used by GNOME and KDE [1] so
  move it to meta-oe
* 0.3.0 failed build and gobject-introspection was not configurable -> use
  latest master sources

[1] https://www.freedesktop.org/software/colord/intro.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/libgusb/libgusb_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgusb/libgusb_git.bb

diff --git a/meta-oe/recipes-support/libgusb/libgusb_git.bb b/meta-oe/recipes-support/libgusb/libgusb_git.bb
new file mode 100644
index 000000000..fb5b6a31e
--- /dev/null
+++ b/meta-oe/recipes-support/libgusb/libgusb_git.bb
@@ -0,0 +1,12 @@
+SUMMARY = "GUsb is a GObject wrapper for libusb1"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+DEPENDS = "glib-2.0 libusb"
+
+inherit meson gobject-introspection gtk-doc gettext vala
+
+SRC_URI = "git://github.com/hughsie/libgusb.git"
+SRCREV = "f33be86e563217d525e31b501c9eaa52f9db1cc4"
+PV = "0.3.0+git${SRCPV}"
+S = "${WORKDIR}/git"
-- 
2.20.1


