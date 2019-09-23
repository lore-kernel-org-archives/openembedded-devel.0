Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 479F0731B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 13:39:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r17so15031195wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 06:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1HbUuq/I5oJA+VUdJPakcGz2s1pPQCdQFYR2UhlAhGY=;
	b=L7Q8u5bmkUUf92niQkLwZgHYPG+tuyndIiJf5OqiFGocW++WBsQPddO15/86wVe/sh
	AN6l0U5FkCK7Kt4o9bU/waYUIpemj+sKGDGgFd01ORh7M9i4gwc8MLSEWmiuJIanitS8
	bdbBDgiIRC+tqfhni+hEhPyNxYzNsiG5JEMwst6sZqoL1w2qCILtd/4lwxGItNxzHYUN
	r6oYgN+lQFdsIzbD84Dl5ObpE4rKWPf8ivRVfnVB0Z7FUzZnAxDwqFG2JkxDdJIIemMI
	A261Q0uwk8JI+YqmF2oLQu4Eeco6qMHybV1go+hf1LiGTDgFL1XOR+n4C/Glh0zI/cyz
	Jagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1HbUuq/I5oJA+VUdJPakcGz2s1pPQCdQFYR2UhlAhGY=;
	b=Cd7+P02wxr5HrqRMrm49sQpJVV22yDnhDcq67npeRrZiUt3Ja29bh8mqy1cpYJR1du
	gign7p1xP3Ti8IH/gpyYwTJEyHWm/W1CkxScE7UdpLEyguggC3FwIuSMnVXncu43c8z8
	rUfC8xkozJiyCrUNhS1e6lPe0l6TKBDPOcUtL67xcSzHcZjfHXDKxgtZ/ROTFOwuQ5lW
	ObxOvglg4194m/2ARDhT0+locOJG1WI6jGvY2QMCszdHfz9RZSO84HcO8N+/mgae735V
	Ai1zrl8xavHWtUxlCrWyzY427g8V4+THqXG85liWxsMBiRnoLrWSovMA4fK6e0ghbwIO
	GGTw==
X-Gm-Message-State: APjAAAWzjYsrS/ulgk2dzyLnF40gAZ2a4491vsG4FtU96ytCvFtNJDWC
	oJAEpRE7GKjWI4+BVUNDV8tX2g==
X-Google-Smtp-Source: APXvYqyV5AixqqnDd0SJbMG3/7dI/KhHrkkpU4HDxOzIjsNzHSVknCdlVHb53KghMCSMkuE4SUwHLA==
X-Received: by 2002:a05:600c:291c:: with SMTP id
	i28mr13156087wmd.98.1569245994854; 
	Mon, 23 Sep 2019 06:39:54 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id
	q19sm17044405wra.89.2019.09.23.06.39.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 06:39:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 23 Sep 2019 15:39:52 +0200
Message-Id: <20190923133952.2087-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-filesystems][PATCH] sshfs-fuse: upgrade 2.10 -> 3.5.2
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
X-List-Received-Date: Mon, 23 Sep 2019 13:39:54 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Build system has been changed to meson. The webpage has been moved from
sourceforge to github. The package also now depends on fuse3 not fuse2.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../{sshfs-fuse_2.10.bb => sshfs-fuse_3.5.2.bb}     | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_2.10.bb => sshfs-fuse_3.5.2.bb} (51%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.10.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.5.2.bb
similarity index 51%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.10.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.5.2.bb
index 582e21846..b10c5c5ff 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_2.10.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.5.2.bb
@@ -1,16 +1,13 @@
 SUMMARY = "This is a filesystem client based on the SSH File Transfer Protocol using FUSE"
 AUTHOR = "Miklos Szeredi <miklos@szeredi.hu>"
-HOMEPAGE = "http://fuse.sourceforge.net/sshfs.html"
+HOMEPAGE = "https://github.com/libfuse/sshfs"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-DEPENDS = "glib-2.0 fuse"
+DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/libfuse/sshfs;branch=sshfs_2.x \
-"
-SRCREV = "42dfaf9a5bdc1ee429c7718e8788ca37a5763e0d"
+SRC_URI = "git://github.com/libfuse/sshfs"
+SRCREV = "695cd8916f0e78d28009de3ffe112b9d1a1c9e5e"
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
-
-FILES_${PN} += "${libdir}/sshnodelay.so"
+inherit meson
-- 
2.23.0


