Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C371978710
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:35:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v71so13902093wmv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JEJJzmctWRDSHAxXoiQ6Yd162zpuJqJyoXPMRLXEOJ0=;
	b=ByJl2RzqNnQCRpvk+Eu69aKz9KNRYSNqzbG81BZLtaAWbc6hVhmQ5x/BYhtewYra8I
	VbrueDsRBXyHM3CNGjmR1ifoV2Pd6Nbg+0KZx6N2js5qbmqoifWdkehkZ+rFlXqJa7vN
	tMDuSOW8vRT6RHSf7YHivw6noSZr1NvsB1SXxE/Neo+K3WEfX0vWOjfpxTnCE2r1trcV
	CXm+vDGOft7zkpAcdNQJaB0K5+t39p8aXqsuP3JyX1ADY5dx3iRIE+5+7mPKL3IO0Zrq
	jXLKGfi1wDMOdwDZq4v5L+BUAuJbF4jTyi082g0AlSesiRevFge3XcZnw5WeolBJJ5/d
	k9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JEJJzmctWRDSHAxXoiQ6Yd162zpuJqJyoXPMRLXEOJ0=;
	b=WgQXNvysprgat1FviJ7EuzLyw81w7OF7R4ZZ/o7PqluKa/4M/KCZnMvqW2+dbfWaeY
	PmhX4MjucIbswiAKvhFCiHEjR3lEQo6qoEzjV+dRoTZZQObI+viyFe10T5LPyIXEN0NX
	zbeO4LChqUMKWhaervkxYLViAMDPGCH5vWNv9KJmHGUSOgGQRyPuHH8JFLYMTL28x9a2
	RVbXEdyuh9bWK7lBiyQXOkrYg7NKEzNI9Uvyzyw3DBRyPjjCcFVkl0N5reY0FEeNtLlb
	R0pMbwHk7bDvxquYNq7QdDWWB6xQok+AeMTn/9w8SQhdFYH3u5B56irdQDMLAMrqQzuG
	IqfA==
X-Gm-Message-State: AKwxytdRrIZRx+9VMPu0WfiLkFz30kFMG9x+CYZJo1kWf9vCjRfFpUCh
	De99wuvkFyKi/ImPIk4WQz6WTA==
X-Google-Smtp-Source: ACJfBotqLXE3HdBbu9p9d+o3Kh6gFWlET0c05DXJaF3hAADcjgQhUL9ktemUXEWkVZ7EV7yZ5h9fEw==
X-Received: by 10.28.69.136 with SMTP id l8mr1275024wmi.103.1516178102713;
	Wed, 17 Jan 2018 00:35:02 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.35.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:35:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:19 +0100
Message-Id: <20180117083421.30233-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/14] gtksourceview3: initial add 3.24.6
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
X-List-Received-Date: Wed, 17 Jan 2018 08:35:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gtksourceview/gtksourceview3_3.24.6.bb          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb
new file mode 100644
index 000000000..87e48ed3c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.6.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Portable C library for multiline text editing"
+HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+DEPENDS = "gtk+3 libxml2 intltool-native gnome-common-native glib-2.0-native"
+
+PNAME = "gtksourceview"
+
+S = "${WORKDIR}/${PNAME}-${PV}"
+
+inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
+SRC_URI[md5sum] = "c09ccfc80f78083841f8fe266c1ac52a"
+SRC_URI[sha256sum] = "7aa6bdfebcdc73a763dddeaa42f190c40835e6f8495bb9eb8f78587e2577c188"
+
+FILES_${PN} += " ${datadir}/gtksourceview-3.0"
-- 
2.14.3


