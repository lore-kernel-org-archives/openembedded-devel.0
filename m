Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2F36172F18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:32:22 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r137so11755358pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3vejCcAKT0GrRyHv8iC1JdltdcJoh9vxvN/QJoM8AR8=;
	b=qw0vgmkBgZVMwstG8qACQWa1i4Ad6qba6D6oJB0zH81qRI5taVYlDK1fylG3qhQppe
	sUC7zR7bE7KInJqcAB/ugzZihOLp2S+RTbI9qPodLKFFp4Q/u+vUGiO3TyZ5/jMKa3DG
	C04l8UrQfCZlrg+YGotwAZI+wgFWKhVzKN2rIkHEjJMAFticBf6uc6x7ePB1zBrtTv61
	g+PQKaN4vT1zAaIXZOjpOjG4rWwa11Cf2JcLXAm59k+Q5YPkn6cG01I3miQ3T3ZcVKgq
	M9WR1ISd3gXhujIaQZNBtJoj/iQKbHA+NyX8Ir1DebqGmtt7aNlzpmz10ptXXjkIubxn
	tcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3vejCcAKT0GrRyHv8iC1JdltdcJoh9vxvN/QJoM8AR8=;
	b=oG+jqHTimjZSBxO/BSXlVjt4DHHTKEJ0w8er5Bb0wDJglrotL+i2mopG/znu6oYylq
	dUCVa6flVdUQuCIG1KZc+vBC/858VuTJqOAJNcvQp37/eNmFFs8ssHDuoXUx+qFSuR4l
	6LlzVL7/sEHEa+YXdtwri9bfIe27Oes9mlVnI1cDcNVxVFalmnQ+b4Dc0N9cJchwMtpF
	04dp9QIywNd8y5Y/FUgQPg1j2hEco90MTHLYO8jZ5U4eFo1BQkl/wv1QSrLJcvvmkOgk
	YkwJwnJEzUKoM8gLOLilFmK9zu7dOkW0aGbaeidBjgRevVRz+R3Sz6/xXI7PHKQ28Zcb
	E6ow==
X-Gm-Message-State: AFeK/H13P1bQkdh77P66cu1uhBpbguQBp3/HeLWrXYMl5k5tbTQhKaV9vAUknhEvQ4N68A==
X-Received: by 10.98.105.134 with SMTP id e128mr29903773pfc.19.1489987943881; 
	Sun, 19 Mar 2017 22:32:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	o189sm30203934pga.12.2017.03.19.22.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Mar 2017 22:32:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Mar 2017 22:31:49 -0700
Message-Id: <20170320053152.29352-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170320053152.29352-1-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/16] samsung-soc-utils: Remove -static
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
X-List-Received-Date: Mon, 20 Mar 2017 05:32:23 -0000

It does not build with all combinations e.g. with -fPIE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb | 2 +-
 meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
index 082dc005f..255754d5d 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/gpio"
 CLEANBROKEN = "1"
 
 do_compile() {
-    ${CC} ${CFLAGS} ${LDFLAGS} -static -o ${PN} gpio.c
+    ${CC} ${CFLAGS} ${LDFLAGS} -o ${PN} gpio.c
 }
 
 do_install() {
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
index bed0555c2..976a4f15e 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/gpio"
 CLEANBROKEN = "1"
 
 do_compile() {
-    ${CC} ${CFLAGS} ${LDFLAGS} -static -o ${PN} gpio-s3c6410.c
+    ${CC} ${CFLAGS} ${LDFLAGS} -o ${PN} gpio-s3c6410.c
 }
 
 do_install() {
-- 
2.12.0


