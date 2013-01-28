Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TzomG-0003JQ-1r
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2013 14:29:40 +0100
Received: by mail-wi0-f177.google.com with SMTP id hm14so331197wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2013 05:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=N4iT3X5M9wOc/X1eSN5dAreTPkVOLjohRPFDxMfRyd4=;
	b=qirfIXToUCFfFrbtH5mok4lNRYdegYqSzhDaHLe9jyeVdusxsjcS/BvzLeTGy9kPFi
	gSTg0KSd85k5y+GobZyXXeCh/vkEL4D7X42fyw4+BXPRdjJgVIurOGHQG0HXMN74SkOt
	pPRXRFSPR1JOjhjRIF3/Lp0QyqhI0hkDXhG+KY79JH1S4Fu22pTXcwSUb7lB7cw/zKV6
	7q+l3PHTkr6i66M4aDr5hkB/lfbAEzSIcAEwhGZk0W39uVscTOl1GlWRWVbUMoawgec2
	dnSRTE8fTrP/2uFBoskQRWa89fh4lt5XDBr2uQ4ekdsiiGZmY/RiCAVbibL7FgH/XPW9
	bmZA==
X-Received: by 10.194.48.74 with SMTP id j10mr21129283wjn.36.1359378837958;
	Mon, 28 Jan 2013 05:13:57 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id bw9sm12054734wib.5.2013.01.28.05.13.56
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 05:13:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:12:04 +0100
Message-Id: <1359378724-18026-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359378724-18026-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359378724-18026-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd 2/2] systemd-speed-hacks: remove
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
X-List-Received-Date: Mon, 28 Jan 2013 13:29:46 -0000
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



