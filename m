Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 064F560111
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:36 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id j2so3332800pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XrOABJFA1xQe5XQNBYrSyibf/229tYTIPCPN4272Px4=;
	b=HRM/HSw/cvDC8BdVY6BUZA5MRLWTAudQYc013LjnhSF1r5X/9ukOx3bOxGSPxKJbRj
	ImLTptd6RTWiEaf3mdHzQ2pzONQiWllIXJZ5N3+rCcOFDpxa6s4/4rREwXElCW13V+OX
	lXvvPrkaMqg7yM6LTewMeR+C9IVGSgEE/dpFWPiUHPLEKeu0AVQW3zOS8rQGZh/poZ7r
	3NptxK5A4IFnuBymMtNDimm5J9NDIVG1FQqhZSoplgj+NS9Jf2tLdFoIS0jaHIlxrWfZ
	cCZrUm3pZGps5aNOZO949kTegclbmPZRY3RTUprblIURUrv+hQ/aj20Vcd68pXqv4cw6
	FJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XrOABJFA1xQe5XQNBYrSyibf/229tYTIPCPN4272Px4=;
	b=D00nFttVBPocduNr2m5v/q6okIX98PXMaTVqFC55RyzYJk0biyvHbZPDv2mYrYiwBY
	8ELwKA7B9D0BB2QIcpBF3DixdrqVLTJIWgp78EVxLnLx7zn46ALYBWE310NTwfw+XqZ7
	XNqwNgDFWwr0p2wyrTWNEn2Jc8JkY+yinpKDrrb3N9grsHlmkvnNfYaswPMDEIE5ohs3
	m2BRnaFTzgUA1lkGraErVZXLZCf/8gnL3+NE2fwkrEgSPbr5hyxHU69PrEjds0+qJCzM
	f8E78G3VUtfP/ILcvIsNfuxN01p3iSC4WH9m16xKbyQpxRWmVQVJUZYenCqhE6t4X5MI
	tN6g==
X-Gm-Message-State: APjAAAWoCEOoa9i9IRTB3oCLGUEYG9VJXUX/YOKl01OjlpJQohcQAz5r
	ohFYv6goWVbRL46rrrprPHqCusw0
X-Google-Smtp-Source: APXvYqzwmNrBsE41QY2NSEIZzHWjYOhA0svMh21C+9CX3VgS+mJ76dc7DzfjOCkthU3irxnw4ELV7g==
X-Received: by 2002:a17:90a:ac11:: with SMTP id
	o17mr17633028pjq.134.1560621457858; 
	Sat, 15 Jun 2019 10:57:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:10 -0700
Message-Id: <95ab6fa926bd29112e7f80899d91575054037b61.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 06/23] triggerhappy: fix issues
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:37 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* using PN instead of BPN in S causes all tasks to fail:
  make: *** No targets specified and no makefile found.  Stop.
* using github archives is bad, because they are regenerated from time to time
  with different checksums
* set PV, because this isn't exactly 0.5.0, because of the debian changes
  mostly the systemd support
* fix indentation

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{triggerhappy_0.5.0.bb => triggerhappy_git.bb} | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-extended/triggerhappy/{triggerhappy_0.5.0.bb => triggerhappy_git.bb} (73%)

diff --git a/meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
similarity index 73%
rename from meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb
rename to meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
index 037ce06..24df750 100644
--- a/meta-oe/recipes-extended/triggerhappy/triggerhappy_0.5.0.bb
+++ b/meta-oe/recipes-extended/triggerhappy/triggerhappy_git.bb
@@ -4,12 +4,12 @@ HOMEPAGE = "https://github.com/wertarbyte/triggerhappy"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://github.com/wertarbyte/triggerhappy/archive/debian/0.5.0-1.tar.gz"
+# matches debian/0.5.0-1 tag
+SRCREV = "44a173195986d0d853316cb02a58785ded66c12b"
+PV = "0.5.0+git${SRCPV}"
+SRC_URI = "git://github.com/wertarbyte/${BPN}.git;branch=debian"
 
-SRC_URI[md5sum] = "77f90a18c775e47c4c5e9e08987ca32f"
-SRC_URI[sha256sum] = "9150bafbf7f2de7d57e6cc154676c33da98dc11ac6442e1ca57e5dce82bd4292"
-
-S = "${WORKDIR}/${PN}-debian-${PV}-1"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd
 
@@ -21,12 +21,12 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_SERVICE_${PN} = "triggerhappy.service triggerhappy.socket"
 
 FILES_${PN} = "\
-${sbindir}/thd \
-${sbindir}/th-cmd \
-${sysconfdir}/triggerhappy/triggers.d \
-${nonarch_base_libdir}/udev/rules.d/80-triggerhappy.rules \
-${sysconfdir}/init.d/triggerhappy \
-${systemd_unitdir}/system \
+    ${sbindir}/thd \
+    ${sbindir}/th-cmd \
+    ${sysconfdir}/triggerhappy/triggers.d \
+    ${nonarch_base_libdir}/udev/rules.d/80-triggerhappy.rules \
+    ${sysconfdir}/init.d/triggerhappy \
+    ${systemd_unitdir}/system \
 "
 CONFFILES_${PN} = "${sysconfdir}/udev/rules.d/80-triggerhappy.rules"
 
-- 
2.7.4


