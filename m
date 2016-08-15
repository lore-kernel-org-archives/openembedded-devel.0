Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B213C7680A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:20:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so10343690wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X9aCKYQOtMEov3n8Ud9u3TPGmpTH/f8qA4R3IMkqh4M=;
	b=DmmvkrfleyazAkvoqGr32HRHm3zANyehjE6890t8J0UymHVkps+yUefsq0l9eAwZhP
	ildy7QNckbqlso8OHFwX0qVD/0KPfh819Ga7EyTGW7OuAZ0joAdw/gFMLFsOnRqVKo3f
	CzxsiufGE+3rpfLtaAcnKhXTz2/yedJbn3aVB1S9IUEwAR+kiwKrjctw3MBSzBjM7dGR
	/ST7aMvN3EKw5HfwLdvXpko2DH1xLZH+c8pek+8LTkUlGMwTz8rQXo22dSA/sl4jzkub
	GwdzQUo1xyG0E4XJbRKUId1Ce2iWyqXicKA+KGDW73o87c6QWV+6BpfnoMWJnzh7zUvh
	3QgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X9aCKYQOtMEov3n8Ud9u3TPGmpTH/f8qA4R3IMkqh4M=;
	b=DNxHHMt/GdF1SjbJ9XBX3aZSbL9unAWrlTAzvIwqi1ymFdw+x3zdcPKLB2LXpTbfTP
	nX70DsISnF1xMyLK89AxoiB3+Rc2SFXwCgRVOG67IFTG1QFsWpnxOhmRvVpZ8rjdKJ6s
	xUo8i9fOH2dzIY9cBeXpHM1ov6+vRm3SJXe9ieS2gbArb3iDZLnKyWrYRyZipIV140Po
	nxFOj7bSqsGzhnmCT/d9lHNpJ77c2UBes3oCeEP0lB49CPCLgYOsyDy+upVpA3oy81NV
	TZalRNNe5XqmVkeRPOlay2N4nDovHKMM5B2Xz8jOF+xWR/jW7UODj2e/57oDAGrP+qfR
	DPtw==
X-Gm-Message-State: AEkoouvPOJIXo7FuOD4s0pz2vsJlKYLiJjJb4x/HjzSE52io7q9I8T8YfwH/j06R4vqkyw==
X-Received: by 10.28.48.71 with SMTP id w68mr13350256wmw.4.1471256451357;
	Mon, 15 Aug 2016 03:20:51 -0700 (PDT)
Received: from localhost ([89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	q23sm15813296wme.17.2016.08.15.03.20.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:20:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:39 +0200
Message-Id: <20160815102049.3291-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-oe][PATCH 01/11] gnokii: add missing intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:20:51 -0000

* fixes:
  | checking for ar... arm-starfish-linux-gnueabi-ar
  | ../gnokii-0.6.31/configure: line 5688: syntax error near unexpected token `0.35.0'
  | ../gnokii-0.6.31/configure: line 5688: `IT_PROG_INTLTOOL(0.35.0)'
  | WARNING: exit code 1 from a shell command.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index cfd794d..f789dfd 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 intltool-native"
 X11DEPENDS = " libxpm gtk+"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
2.9.2


