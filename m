Return-Path: <lpapp@archlinux.us>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 68EA465DA3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2015 12:04:09 +0000 (UTC)
Received: by wggy19 with SMTP id y19so39489658wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2015 04:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=66wBxzqjz94OP1PuW4NAE0gQIAQFT2EePp4JrPuxD1A=;
	b=Z+xm5tgj8UP2EiidhsuaI6t+LStnVmbN0pdi1lDlv5PEetgqOX6vZPWd9VJWL7TBTA
	vtgkLRKoQcdwVLqd6LmAbwWdUt5ZX0CuIr1Jra2CydpxtEkNY2jsb26Ko3/XoQCrZ4qC
	hcZL9J1haHgBIZF0NnNCHCV00t+b49mRi9cwhrepY/dM/RaY4KDtRpVi4Z3/XxhPLsf8
	IAoAaJAh9UobEeOh1VhuqaK52GKTFVEug0gGx22tuVcvBqvuvkokMcRahsn6nH0kW0Ia
	WKldQuK76aY0Nv2PIHruMFBaI5dJmWKsAInV4I2BOelDYZ78cDpiCJNpTrPTiQ3SVE9P
	OAyw==
X-Gm-Message-State: ALoCoQlcFdYfNycSUGpV61x20xbD5gxzUJyC7zdKb51Aa2MGY7lVaTXAeowmU0V37JxiEhkCO0k3
X-Received: by 10.180.83.69 with SMTP id o5mr43966440wiy.48.1425384249800;
	Tue, 03 Mar 2015 04:04:09 -0800 (PST)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id u16sm1054492wjr.5.2015.03.03.04.04.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 04:04:08 -0800 (PST)
Sender: Laszlo Papp <lpapp@archlinux.us>
From: Laszlo Papp <lpapp@kde.org>
X-Google-Original-From: Laszlo Papp <laszlo.papp@polatis.com>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Tue, 03 Mar 2015 12:04:03 +0000
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Mar 2015 12:04:02 +0000
Message-Id: <1425384242-2662-1-git-send-email-laszlo.papp@polatis.com>
X-Mailer: git-send-email 2.3.0
Subject: [meta-oe][PATCH v2] Add uthash recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2015 12:04:16 -0000

From: Laszlo Papp <lpapp@kde.org>

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta-oe/recipes-support/uthash_1.9.7.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/uthash_1.9.7.bb

diff --git a/meta-oe/recipes-support/uthash_1.9.7.bb b/meta-oe/recipes-support/uthash_1.9.7.bb
new file mode 100644
index 0000000..e5dde1a
--- /dev/null
+++ b/meta-oe/recipes-support/uthash_1.9.7.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Hash table for C structures"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=564f9c44927f6247dc810bf557e2b240"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
+
+SRC_URI[md5sum] = "1f14bbee7ee73ed0ceb3549f8cf378b4"
+SRC_URI[sha256sum] = "956f5c99798349c413275fe4c9ff128d72e280655dadbe4365f8e9fbda91393f"
+
+do_install () {
+    install -dm755 ${D}${includedir}
+    install -m 0644 ${S}/src/*.h ${D}${includedir}
+}
-- 
2.3.0


