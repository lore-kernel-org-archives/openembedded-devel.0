Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id D0B377D485
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:38:09 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y2so14345320wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y/o8qUyLjBWtygdOZHUmh/j6x22Qdq4noBPNO1J6jvI=;
	b=iU+Pbfy0RpUTgNDfdEjUT2te5ggrRCVYJsld2Uq/anVpSWOmx5x9Oa8t7gzhcmE9tI
	iHhJ7TuZ954Ug08QoNglMiMU/47bJ9cg7KW2F7DUwnXsx283SEL9cVJBWD03A+V6JyVQ
	8yFunljVSe6zLvjOh1ellAbpGST5ZBqEWZOGtGIssC73SnxmkF04a9WI95snds4M8k9S
	8HU1NArdtWdahaycL844eXmK8VWE1IIOqC7xKcwKNiMfIaZkVotKWF6uK59fllWwDGe2
	OxNp7t1qIRhACxORNN/+wId7rHWI5mI/YNfPBHM4Ch0N/gt3WbgGFcqEnIzaz49M1iM2
	jLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y/o8qUyLjBWtygdOZHUmh/j6x22Qdq4noBPNO1J6jvI=;
	b=GwhQlVnQphi9yH9GdLtuhfpEXHum8zt8G0bOy5xp9BDOG3hLuAPeWpz2z1VBxRwYyQ
	Ky7yTckY8N+zRjdL60k0TknI1NhqQFE6UVTSUI05H5k89S6Pzy6d6O8oo/oj7OoXxR0F
	qqIjOL0LODEsNX8iaCSWDKVa3c4XgAIcZZktzjJ2UibN6QtFbPugmuY5vw/ihC72TQK0
	IM3iER1roy2WUlf3RflQl5fWoPk0VLZ6thWf4aV2O0Y3XSFuC9Q91bLwHFJTKOUTeCA9
	0eXVNQ13vWwe+h3ohWcOD6BW+6WCKRVyk0H7zF3fu0wGjZysVbgCPKwHAa5nPPsp99ed
	EQsg==
X-Gm-Message-State: APjAAAWq6AZPjjc/mca7SKVYfw4kFz87xYYBwtYw7lAL8o9RRUaYjCi2
	esr5yet+TD4+zKs0K7h8vgTtZ0Nk
X-Google-Smtp-Source: APXvYqy0m1OrGWhpRk9ZJn9BiszNC204/NKsn6/kvuoWZn/VrEKqfBy3Or+ViswSfIcZ2ZMbuEcnUA==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr1329028wml.104.1557131890318; 
	Mon, 06 May 2019 01:38:10 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	y197sm9843711wmd.34.2019.05.06.01.38.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:38:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:37:49 +0200
Message-Id: <20190506083750.22786-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] desktop-file-utils: remove - a more recent version is in oe-core
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
X-List-Received-Date: Mon, 06 May 2019 08:38:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../desktop-file-utils_0.18.bb                 | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb

diff --git a/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb b/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb
deleted file mode 100644
index 57a8720f2..000000000
--- a/meta-gnome/recipes-gnome/desktop-file-utils/desktop-file-utils_0.18.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
-DESCRIPTION = "desktop-file-utils contains a few command line utilities for working with desktop entries:"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "glib-2.0"
-
-PR = "r1"
-
-SRC_URI = "http://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "d966b743eb394650f98d5dd56b9aece1"
-SRC_URI[sha256sum] = "d9449956c1c8caa75281a3322b2bb433db42610942f0ceeaa65ccd9636c04231"
-
-inherit autotools pkgconfig
-
-CACHED_CONFIGUREVARS += "ac_cv_prog_EMACS=no"
-
-BBCLASSEXTEND = "native"
-- 
2.20.1


