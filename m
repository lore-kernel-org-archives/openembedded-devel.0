Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6E19573163
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 12:04:38 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n186so26933556wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 04:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Si0Ooe1QXXOTmFJHJKVmQ5Y9kVMGBRFz9bCTJEHEm8E=;
	b=LCqYEaGSgdClEiZBLtO9ynPkv6EV+y6fhmX5ALreyry1jDxJfadj3BWhq51yACj5oJ
	VVNQU0cabeB+l+szb5MliENWgUGQAxSrtYHrnz5F9Th2FAvNN2xubdC7tPe7R0W5kH9R
	6yMk6HhetdeTIu16br1XbFjMTDeKfvmITC6/dSGkj4X6CG8dO/Va069ICNP5+on+WTDw
	DjJ0Kk5a8hf/sigBNVG7zGT9bsjL5Vnvu7cRbq2AYhlI7U3w4ZT5nPaIIEnSEgWf+Kg7
	zHG3TLNg0NYJxF0HcWZiGxkimf37doCa9E78GWmrb/LxmVr+FPetUMl9pz8p8eX9AZ5F
	jT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Si0Ooe1QXXOTmFJHJKVmQ5Y9kVMGBRFz9bCTJEHEm8E=;
	b=GPuRgiARonTllBw/94G59wuwmgbPZv+7uwL5ZbbF8eF0UJn4Q3xuC+vQ3Cj3KkyqN7
	ra9m1Daob0nf72QbN/mOPQ6NZtBKVdfVK/1Cf/RhyHuP1GWjd+7KkYV+SJaGtpHx0Lrj
	eXGR+WYSaP+F/MvP5aR40dGPasnxlDvGiXlEVJkXFr2sgKArtDCnG3x6huGxzgwoBJg+
	cO4g7bbLO8UKzw61P80KuqE6Cl60AevipC6wdoyLbCfZuwsF1UAgVqvrPeEy/rzEDfmF
	Nc9DjBm+RhF9uYhUasnLDo06/c19sFieM5NKYoESCoGatNmXI0QSU+BfWwSdUuxHj2QP
	zhgA==
X-Gm-Message-State: AD7BkJLealMVxL2u6zdupevzs1/6LCOGTvyHa0IkIV+H9M1oRVeo8X+sgUPh/FuAIb5h2Q==
X-Received: by 10.28.214.6 with SMTP id n6mr3495084wmg.49.1457611479146;
	Thu, 10 Mar 2016 04:04:39 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g203sm2614343wmf.23.2016.03.10.04.04.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 04:04:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2016 13:07:33 +0100
Message-Id: <1457611653-26035-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1457611653-26035-1-git-send-email-Martin.Jansa@gmail.com>
References: <1457611653-26035-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/2] synergy: add dependency on openssl
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
X-List-Received-Date: Thu, 10 Mar 2016 12:04:39 -0000

* otherwise fails with:
  /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/synergy/1.7.3+1.7.4-rc8+AUTOINC+588fb4b805-r0/git/src/lib/plugin/ns/SecureSocket.cpp:26:25:
  fatal error: openssl/ssl.h: No such file or directory
  compilation terminated.
  make[2]: *** [src/lib/plugin/ns/CMakeFiles/ns.dir/SecureSocket.cpp.o]
  Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index d008289..e6057f4 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f366945b209c5523e39889f636af00a"
 LICENSE = "GPL-2.0"
 SECTION = "x11/utils"
 
-DEPENDS = "virtual/libx11 libxtst libxinerama unzip-native curl"
+DEPENDS = "virtual/libx11 libxtst libxinerama unzip-native curl openssl"
 
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.7.2


