Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED277BFDB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jan 2019 21:25:22 +0000 (UTC)
Received: from localhost.localdomain (lfbn-1-8921-123.w193-250.abo.wanadoo.fr
	[193.250.63.123])
	by koncepto.io (Postfix) with ESMTPSA id 4FE1760566;
	Tue,  8 Jan 2019 22:25:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1546982722;
	bh=HLsnno9zTSx9pltzJVawXD5Bm2DIVNqIVrgAW/IcZuQ=;
	h=From:To:Cc:Subject:Date:From;
	b=M2srCrBwhp6o3cuPFfA5rvZ3us0X/E2KOZOHWgrnEAef8DKAAgI8DQfrzsVCw14MO
	f+dzYy6yjkviXwPsrs/jOTaKQkRu2CsJRjwF+uEmpnrMzRJFEKOhuhBV/0fXF5phZb
	qTcoPGR0pRXuvU4eN2OR8TqeWxHoQFNa9SX/Xd7/eGe7G0Ru+zpjY0Fo/62/yzD6jN
	UY5vS73+iOnziizBKAm6r1nb5CvN4/lJu7yQapKYhzyQWJ69rIMfoQK/+iab4E8SYH
	wHYu3J+AfoK+xHIGRoqprsjyhv8l5deLEgBR6sh/88xX3iHwAHzW7kEei7P3ryKXlO
	A0d2+L5GRGJ4A==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jan 2019 22:25:19 +0100
Message-Id: <1546982720-31704-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] minicoredumper: Update to 2.0.1
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
X-List-Received-Date: Tue, 08 Jan 2019 21:25:22 -0000

- Drop upstreamed patch
- Update COPYING

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../{minicoredumper_2.0.0.bb => minicoredumper_2.0.1.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.0.bb => minicoredumper_2.0.1.bb} (88%)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
similarity index 88%
rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index bae5cf4..50dab8d 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
 to allow minimal and customized crash dumps"
 LICENSE = " LGPLv2.1 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aa846ae365f71b69e9fa0d21a56391ec \
+LIC_FILES_CHKSUM = "file://COPYING;md5=71827c617ec7b45a0dd23658347cc1e9 \
                     file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
                     file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
                    "
@@ -9,14 +9,13 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-SRCREV = "1c0d5960b0bb4bac7566e6afe8bc9705399cc76b"
+SRCREV = "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
 
 PR .= "+git${SRCPV}"
 
 SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
            file://minicoredumper.service \
            file://minicoredumper.init \
-           file://0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


