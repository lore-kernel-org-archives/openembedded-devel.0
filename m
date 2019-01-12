Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id EF1247C113
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 21:31:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id g189so7800814pgc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jan 2019 13:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=huyWeKsQMkLm6m3WYP0z4D8th79yGIbCrpgVbVxL+Qo=;
	b=oxgjClaq1NedAvOaHnHf3fwUtFdU31HzOR8xLqI0LsY/jaXkg/HW5t40BnI4ILqtR1
	qcdIVRRxy8EYxJ1W8qjOzfNWu3mgQDLYJIGhmz4Ot88qy33oNH9yO/KRfSES9wkOBLbr
	rPEx/Svd5K1a44iS2gjUegKYYXcNeVYrwLzT3p6WOlZG1JrvDBvjxqDvWZUPZdcXUr40
	Xjq+SOrYAmLmEvlMx2R4NL+lPK4Edc/6pNu0kkYu57paQjXbDOLJzhxkNFnNtRiLWox5
	cQMjloRliS5rpCzKpOWo44T25grZUtHBDiFEgTBRk77nGv1QoO4A6SpXE0QBhwAJBD3X
	lTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=huyWeKsQMkLm6m3WYP0z4D8th79yGIbCrpgVbVxL+Qo=;
	b=SRsCi/X7Hsc0gliVpFIj9r9+hqb4sJBKcvblu7YixeJGdZOnd5WDyo4MNZy8J7o17K
	DGCB2z7ibj1ve+rXbgQpDneNl8eizZYx5VnwDtnQwuKVGYkOhJQmLOu6DI7ELdNhIzfw
	O3A1JNigWApftMNdqqYgftwmtEJHg4W5K9sbJl3LKcCmcRRjwY6SgoUKHvbDj9E1vMEA
	R9Tl4l/1ydYRCmDZ6x6D+U8i3PQao7iYWFOcj+mbaZnC0nZdAQ7svVKN2YyqdyBVkCl+
	qMTLuflK+UP+sSzlhB6bV96erUPuPz4h03bD2HPzyjqWesR18/0rksxKiM8lmuffsLPf
	73Aw==
X-Gm-Message-State: AJcUukdhXMocBT8F8xR/7itLnR8V7I/9EcbsHCCyPCIalJMfA1qTKQM2
	PTZb9+BCIu/w3vNs6g3ShLvRCSjh
X-Google-Smtp-Source: ALg8bN41ubxl8pU0xD+smiEZNjVaGcIoUjbeJ0Ow6kk63frrwpM162NSQbnZTfJ5tbqKb0t/5k95EQ==
X-Received: by 2002:a63:1408:: with SMTP id u8mr18062972pgl.271.1547328697034; 
	Sat, 12 Jan 2019 13:31:37 -0800 (PST)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	4sm134935166pfq.10.2019.01.12.13.31.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 13:31:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Jan 2019 13:31:27 -0800
Message-Id: <20190112213132.2501-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190112213132.2501-1-akuster808@gmail.com>
References: <20190112213132.2501-1-akuster808@gmail.com>
Subject: [PATCH 4/9] meta-filesystems: add pkg groups and test image
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
X-List-Received-Date: Sat, 12 Jan 2019 21:31:36 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../images/meta-filesystems-image-base.bb     |  7 ++++
 .../images/meta-filesystems-image.bb          |  3 ++
 .../packagegroup-meta-filesystems.bb          | 35 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb
 create mode 100644 meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb
 create mode 100644 meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb

diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb
new file mode 100644
index 0000000000..c89b1e1362
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb
@@ -0,0 +1,7 @@
+SUMMARY = "meta-filesystems build test image"
+
+IMAGE_INSTALL = "packagegroup-core-boot"
+
+LICENSE = "MIT"
+
+inherit core-image
diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb
new file mode 100644
index 0000000000..ca21d2a0ed
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb
@@ -0,0 +1,3 @@
+require  meta-filesystems-image-base.bb
+
+IMAGE_INSTALL += "packagegroup-meta-filesystems"
diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
new file mode 100644
index 0000000000..86b1c9b36f
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Meta-filesystem packagegroups"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = ' \
+    packagegroup-meta-filesystems \
+    packagegroup-meta-filesystems-support \
+    packagegroup-meta-filesystems-utls \
+'
+
+RDEPENDS_packagegroup-meta-filesystems = "\
+    packagegroup-meta-filesystems \
+    packagegroup-meta-filesystems-support \
+    packagegroup-meta-filesystems-utls \
+"
+
+RDEPENDS_packagegroup-meta-filesystems = "\
+    ntfs-3g-ntfsprogs ifuse sshfs-fuse \
+    logfsprogs owfs simple-mtpfs \
+    unionfs-fuse fuse-exfat yaffs2-utils \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "smbnetfs", "", d)} \
+    "
+
+RDEPENDS_packagegroup-meta-filesystems-support = "\
+    physfs fuse \
+    "
+
+RDEPENDS_packagegroup-meta-filesystems-utils = "\
+    xorriso aufs-util xfsprogs \
+    f2fs-tools exfat-utils udevil \
+    xfsdump \
+    "
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.17.1


