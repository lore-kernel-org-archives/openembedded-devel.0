Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 93C2965C5B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 09:19:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i130so1980346wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 02:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qXxxXQW0KKdBKopokYjF1fq8ykC/c1egaH0v+AvLPDk=;
	b=tV2/IO2Zx8lB/INPfUKEZuM6KElYDItytHL6A1/E7eN2rYJ/exXKXWpKLk46hxjtG1
	ak+AOf6Bp7rHrhYPmNCUxOOPFrya4Td6mqTqb5s8WFUlE8/CzUc4XaNI2Dt8O5bJyKUa
	+pUlSSwNlyibMaM2MByCq9zgDt8EgjLUjFuk9t/UyoG5KsbaGau5GdONXUwuc8qvh7PP
	TAfph2dRaIDZ25dhhY7OFGVBDsKbXPfoHwzooEVUbY7RMEYnUcj10hHYG0wmq/X+4saj
	CbUutsNzN+Bhpckk4wO1gldHtlgKjWY/tDvmKzwhAosBBmGFIKZlqz8+Sc7q9tRUQpNn
	ATjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qXxxXQW0KKdBKopokYjF1fq8ykC/c1egaH0v+AvLPDk=;
	b=VREK/R9aIP2UTMCEjl+TQDpEv7G+olcC6gePtgJG/Lq7KHxvOOg4wsIz/WDFQF/Xwu
	EtqDed9XtjDt6Dp95kzvM5Xpa/tYNFWoSYgycz75/IuGVOenATXJ1cbnFsxWdemrgsHl
	rcdO8mfu6OhHn2gPGLkuCK3P9j4kA6LdzChvc9l4GDtk63zpwzD18gr3tUZMMNen3f0u
	O0kqdQ+vJWhS5nOc/9qnAgcTaZ6JpMoQdGyHvYpjf2zDXtEqbyj8NRfZOPUU2931juQA
	/k8009v4diNAEhjRSTMUTOlijT767zzg7TIlrjS47NJ/fMD0ud1FjR+z0WWQRuVLA176
	rIyg==
X-Gm-Message-State: AA6/9Rl7/myy+PgrJGWDGPdM5TqzTchGvoCX5kj6iqR4OdwLxxuwFeI+3BDFtz7vRGTPRg==
X-Received: by 10.194.155.35 with SMTP id vt3mr1587356wjb.223.1475831975693;
	Fri, 07 Oct 2016 02:19:35 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-95-222-156-64.hsi15.unitymediagroup.de. [95.222.156.64])
	by smtp.googlemail.com with ESMTPSA id
	jn7sm18657184wjb.5.2016.10.07.02.19.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Oct 2016 02:19:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2016 11:19:24 +0200
Message-Id: <1475831964-1993-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] xdg-user-dirs: initial add 0.15
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
X-List-Received-Date: Fri, 07 Oct 2016 09:19:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It lives in meta-qt5-extra for a while and I tested it in my images. It is a
nice helper for desktops so I suggest to move it to more common layer.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xdg-user-dirs/files/xdg-user-dirs.desktop      |  9 +++++++++
 .../xdg-user-dirs/xdg-user-dirs_0.15.bb            | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb

diff --git a/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop b/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
new file mode 100644
index 0000000..a9a22d3
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
@@ -0,0 +1,9 @@
+[Desktop Entry]
+Type=Application
+Name=User folders update
+Exec=xdg-user-dirs-update
+StartupNotify=false
+NoDisplay=true
+X-GNOME-Autostart-Phase=Initialization
+X-KDE-autostart-phase=1
+
diff --git a/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
new file mode 100644
index 0000000..b94e0cc
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "xdg-user-dirs is a tool to help manage user directories like the desktop folder and the music folder"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = " \
+    http://user-dirs.freedesktop.org/releases/${BPN}-${PV}.tar.gz \
+    file://xdg-user-dirs.desktop \
+"
+SRC_URI[md5sum] = "f5aaf5686ad7d8809a664bfb4566a54d"
+SRC_URI[sha256sum] = "20b4a751f41d0554bce3e0ce5e8d934be98cc62d48f0b90a894c3e1916552786"
+
+inherit autotools gettext
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/xdg/autostart
+    install -m 644 ${WORKDIR}/xdg-user-dirs.desktop ${D}${sysconfdir}/xdg/autostart
+}
+
+CONFFILES_${PN} += " \
+    ${sysconfdir}/xdg/user-dirs.conf \
+    ${sysconfdir}/xdg/user-dirs.defaults \
+"
-- 
2.7.4


