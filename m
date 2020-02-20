Return-Path: <viktor.rosendahl@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BAB12615FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:00:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id k11so4945991wrd.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DqirtyPR2UH2ANMKbd1jkkL3HGWkmUVhkP83wNAThI8=;
	b=Yx1YAUVB5cjLoRwiFTC5bdpf7TChNLxxUHcWQyb++X2BM1giaEhPhRvUr3ylWeTvr5
	Zjob1x8QW7BLk2cSFCxNIY+aJkeumYMT7erMuv51pEaxxH5ShMO33TD+wYKMsy1/QZ2Q
	cF7X7eGLnQAhzuNiyb/Os0aN9h/3Cs6URCLYZ1CCQaF8dx5p1k5MqVIt5uTucrYGcnFK
	FOichV8vRwvKCY9mELUHvmJNJ0pNYa+BkBPMSv09n0iAGyB+RBx6Id5rG+lsYsXgY6Mc
	Wi2siCU4k0b/wtqgkdrL7mKYZYKF5ayW6F0zYNxuvzzxhyDNqSGkLoFssyReifD0SwLh
	hHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DqirtyPR2UH2ANMKbd1jkkL3HGWkmUVhkP83wNAThI8=;
	b=L6LF4IOi0sKP2Hr7mtdrgNK28yDBwa2nzQHHtWl+sRuH90thiHFKOkgVFR0Xy0Dhnv
	ZCrF5GGdZGTmFGUDY4MBEkJIcD/9jawItIDg+pnneGA3LgPHtCvQgQJ6h55xuJTAFIAn
	utfJAFWmN+tOIQiC+erODSG3q2xvT7/nzAEsb91imqjCUx6ja7GjVx4rES1NARGQFQZV
	O45z7qTA+oPSk1CUMv5EXQk6QkVa99/a5dN5SnJtaRy8ZSrIXsvASFAjz/9D6wApUIts
	2fq5AuqTyAd1d42NW+TigeeqvYKiWxujaSVZfy+0TDile+Q1ks8OVkPR+IpY5dlqDAmQ
	zoMQ==
X-Gm-Message-State: APjAAAV3C5jkc7C60hX3BG6FZtZ3zSWyNe+fwKi/TB4lC9fY9Bv3LTqZ
	DauZ0KUctpCbTgKYUTUcAKMKh8o=
X-Google-Smtp-Source: APXvYqwOGsEmLlXCm5SUAKasbYJ9wGHtBpUYUvL3aNXHripV1Asq1v6BBo5DHhHpIunTnp+U4451Fg==
X-Received: by 2002:adf:e781:: with SMTP id n1mr45602392wrm.56.1582210804260; 
	Thu, 20 Feb 2020 07:00:04 -0800 (PST)
Received: from buster-jangle.bmw-carit.intra ([212.118.206.70])
	by smtp.gmail.com with ESMTPSA id
	e22sm4876308wme.45.2020.02.20.07.00.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 07:00:03 -0800 (PST)
From: Viktor Rosendahl <viktor.rosendahl@gmail.com>
X-Google-Original-From: Viktor Rosendahl <viktor.rosendahl@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2020 15:59:58 +0100
Message-Id: <20200220145958.38718-4-viktor.rosendahl@bmw.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220145958.38718-1-viktor.rosendahl@bmw.de>
References: <20200220145958.38718-1-viktor.rosendahl@bmw.de>
Subject: [zeus][PATCH 3/3] lcov: Add missing missing RDEPEND and enable nativesdk
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
X-List-Received-Date: Thu, 20 Feb 2020 15:00:04 -0000

From: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>

It seems like geninfo is depending on perl-module-digest-md5 and
gcov-symlinks, so they should be added here. Also, lcov is useful in SDKs,
so let's enable the building of native and nativesdk packages.

Signed-off-by: Viktor Rosendahl <Viktor.Rosendahl@bmw.de>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index ac0505829..14718184b 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -10,11 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS_${PN} += " \
     gcov \
+    gcov-symlinks \
     libjson-perl \
     libperlio-gzip-perl \
     perl \
     perl-module-filehandle \
     perl-module-getopt-std \
+    perl-module-digest-md5 \
     perl-module-digest-sha \
     perl-module-constant \
     perl-module-cwd \
@@ -57,3 +59,4 @@ do_install() {
     oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir}
 }
 
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


