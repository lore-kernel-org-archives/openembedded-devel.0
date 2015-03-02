Return-Path: <lpapp@archlinux.us>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6A972130
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 11:38:53 +0000 (UTC)
Received: by wggx12 with SMTP id x12so32796991wgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 03:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ewYRHWWw7BY+Hz8BuYObcnwrlD2/LsBlpl5izlCzHXg=;
	b=cya9CXDCetbMlg1Xv0qngS0nVG2MpTGiW9kzMbQBvrPCvWQwK+pJxkZSgATmdqTMvx
	GkSTpgikAw31e8vGk2NTOR6A8jMT9g33Uy2Qxq1ooUNN2O8Rk0Kmbg0k8wY0Te63CBeg
	Q+ihbD4gU2qJ5fLZzHc8L389245awXi0ikFMVmwxs0xaRGmawY4BsjopHoz5K1pCahof
	iDvYP6qGaaFht8/4czt9je7LOSkJ7m2P5bd3PFszeHDwyv5CJuhbj15luqElw3s78XII
	woetgdk+V9apyyKzomeM7JRD3klwazNt93Pd4OYe1ITuOzdUUlpZWCZkuOBaIZKgu86X
	ae1w==
X-Gm-Message-State: ALoCoQnoomIqh8Qw9wCl0JEM4xNtBDQUJE8PUclPQ/d0bN0rUMtni6vymVUSGeoCktWXZbUJNTt0
X-Received: by 10.194.134.68 with SMTP id pi4mr58310044wjb.101.1425296334794; 
	Mon, 02 Mar 2015 03:38:54 -0800 (PST)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id gi9sm535751wib.21.2015.03.02.03.38.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 03:38:53 -0800 (PST)
Sender: Laszlo Papp <lpapp@archlinux.us>
From: Laszlo Papp <lpapp@kde.org>
X-Google-Original-From: Laszlo Papp <laszlo.papp@polatis.com>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Mon, 02 Mar 2015 11:38:47 +0000
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Mar 2015 11:38:46 +0000
Message-Id: <1425296326-2605-1-git-send-email-laszlo.papp@polatis.com>
X-Mailer: git-send-email 2.3.0
Cc: Laszlo Papp <laszlo.papp@polatis.com>
Subject: [meta-oe][PATCH] Add uthash recipe
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
X-List-Received-Date: Mon, 02 Mar 2015 11:38:54 -0000

Signed-off-by: Laszlo Papp <laszlo.papp@polatis.com>
---
 meta-oe/recipes-support/uthash_1.9.7.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/uthash_1.9.7.bb

diff --git a/meta-oe/recipes-support/uthash_1.9.7.bb b/meta-oe/recipes-support/uthash_1.9.7.bb
new file mode 100644
index 0000000..4504dfe
--- /dev/null
+++ b/meta-oe/recipes-support/uthash_1.9.7.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Hash table for C structures"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=564f9c44927f6247dc810bf557e2b240"
+PR = "r1"
+
+SRC_URI = "http://downloads.sourceforge.net/uthash/${PN}-${PV}.tar.bz2"
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


