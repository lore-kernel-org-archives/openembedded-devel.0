Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 149A57F9A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 14:46:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so15227452wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 06:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9cj9BctQTxDA1ijnWT3pOlmIPzNXx2BB/t5dMiQioiY=;
	b=BB9hvSFJThfK3Eyyk5D4/hlNCLiEcfroZAXNSTVO4ZXQc2tCp9dsYZ2tM37nKCu9pr
	FLqoXzJs188bWUxVMyLVe3Zpdl3dWOJmMAqSUSAbi4QrHf+NtXgtnoxfwdGEzvyuZfKv
	Imiefcoo99r5rtACOEUAGbD18CzGOTgSMBh6KFjLs7h0pHseTyKiyKA4JnIVjqRZo9yT
	V1lIEKqH8nJ6xk1rY3kL6hepvG2MQGjM/Q4lshKGpHvynnB4kZO6VRZKy5xYgVh8aPTr
	bXJ+MUDSZZB8O4/QFTx9ZEmojgjJQ/NFUduEqs0HxpgofdyXrogkcLsFsdurKkEfK+SI
	AhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9cj9BctQTxDA1ijnWT3pOlmIPzNXx2BB/t5dMiQioiY=;
	b=Ap8CRF0W6ceP2Hzs0eYdNF+9wU/0lOVs27+ZcopR8vJR8ebISRGsaMxRKABZUebYMf
	92UmOOGXrGJnfExjgg8f7i4WXpQIMDm1NJcWW5xQNhmWkVZMKJ+zeGicBCATgYAe+65C
	RqKt3LiLAC0H0m4baJU9Gdn4jwBvT590wia+VCu5K3q7DiXrkAfWqBwugxtUGC3zzBgV
	CJZbwhYooRHytHHnxMd/ClFpM7DztqR7LNXjbkljqcd6nXxN0ZCPeiv6YVqey0vaiFDC
	BcRoKdNcak3vvmy4fM3gNYYHXR2ij69cj42sF0RBDTryFy4G81KmtRBkHjh+RmyL3Ubp
	hW/A==
X-Gm-Message-State: APjAAAXfYBH5qHfn9gEvfHrPr/2XPQgLg7GyZEqjSGsxQJbRyOn/8lg1
	648HElwQb9UNkCnitZOhTqhoMw==
X-Google-Smtp-Source: APXvYqz0652xuljCkK+gVzNyGbqo0ZmprFwUmqjI6ymX0XQ7OHhYn6glFpiCsmWESUX/Pprdrn9IHg==
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr3955910wma.24.1575902763680; 
	Mon, 09 Dec 2019 06:46:03 -0800 (PST)
Received: from localhost.localdomain (lfbn-1-7161-157.w90-116.abo.wanadoo.fr.
	[90.116.92.157]) by smtp.gmail.com with ESMTPSA id
	y6sm26633782wrl.17.2019.12.09.06.46.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 06:46:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 15:46:01 +0100
Message-Id: <20191209144601.21938-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] librsync: new package
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
X-List-Received-Date: Mon, 09 Dec 2019 14:46:03 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

rdiff is a popular tool for calculating binary delta patches. It's
provided by the librsync package (unrelated to rsync already available
in poky).

This recipe adds new packages for librsync and rdiff.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../recipes-support/librsync/librsync_2.2.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/librsync/librsync_2.2.1.bb

diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
new file mode 100644
index 000000000..9d224767c
--- /dev/null
+++ b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Remote delta-compression library."
+AUTHOR = "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schubert"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+SRC_URI = "git://github.com/librsync/librsync.git"
+SRCREV = "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
+S = "${WORKDIR}/git"
+
+DEPENDS = "popt"
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "rdiff"
+FILES_rdiff = "/usr/bin/rdiff"
-- 
2.23.0


