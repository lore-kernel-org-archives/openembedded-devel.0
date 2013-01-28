Received: from mail-we0-f177.google.com ([74.125.82.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzpNT-0008Px-8w
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 15:08:03 +0100
Received: by mail-we0-f177.google.com with SMTP id d7so1518980wer.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 05:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=N4iT3X5M9wOc/X1eSN5dAreTPkVOLjohRPFDxMfRyd4=;
	b=kz6dlAvjxhZ8xJL4dU0xnzw7zFP22bCPyyxmi/Bq8AG2abkD3N/OdXCejWmKVXDOlU
	KmJOIKh+14vmS7T5UfejPsWehDxANbDRIEwgd64xsJW01B5LtTJsaKMH9t1tsMdPKQxR
	2Oo9LmoL0RiyNzzanQ7PEP1uPmXR4JWg4ed4m+rVu6Cao2akyImbZzazlWaK/TnA+ic2
	43pKs2pVoAHgzYU8hI30pBS6Y7W0K1wpcaVOH+MNv+S0HTlM5Flo/1GTX3lMmwasbA3L
	scror6IDtnHkA+cJczqRDerojEWkD0RM3nddXyAvn0JUjZDhH5CgEGibT6QJbUOJz1hm
	QEgA==
X-Received: by 10.194.108.101 with SMTP id hj5mr21525793wjb.6.1359381144909;
	Mon, 28 Jan 2013 05:52:24 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id bz12sm13535324wib.5.2013.01.28.05.52.23
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 05:52:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:50:30 +0100
Message-Id: <1359381032-24881-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359381032-24881-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd/V2 2/4] systemd-speed-hacks: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 14:08:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested: These cause avahi.service to fail starting

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/systemd/systemd-speed-hacks.bb    |   18 ------------------
 1 files changed, 0 insertions(+), 18 deletions(-)
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd-speed-hacks.bb

diff --git a/meta-systemd/recipes-core/systemd/systemd-speed-hacks.bb b/meta-systemd/recipes-core/systemd/systemd-speed-hacks.bb
deleted file mode 100644
index 8cfcc4c..0000000
--- a/meta-systemd/recipes-core/systemd/systemd-speed-hacks.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Collection of hacks to speed up systemd boot"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-
-PR = "r1"
-
-inherit allarch
-
-ALLOW_EMPTY_${PN} = "1"
-
-pkg_postinst_${PN} () {
-#!/bin/sh
-# I can run offline
-rm -f $D/lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup.service
-
-rm -f $D/lib/systemd/system/sysinit.target.wants/sys-fs-fuse-connections.mount
-rm -f $D/lib/systemd/system/sysinit.target.wants/sys-kernel-debug.mount
-}
-- 
1.7.6.5



