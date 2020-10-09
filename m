Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.13555.1602249734528847278
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2020 06:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hUPaf1g4;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id e22so13058861ejr.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2020 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xuiuVDoyOP4AUH2n7aUtbBH9tJ2+5TvviOHpbLda0CY=;
        b=hUPaf1g4uT45EseLtGEr2QgKiuQphVyNCbq3IrQubSTuB3PHTPH+ovRXHBt0N3LARc
         dq26uoXhVD80C2i0MjkpHy2o1cBS3I/F9JlqGewAkHpfIv5xcOpwLrn9N9COi9A/DxiR
         4BQgg1uaH3GMCvQQCaSRA++0aU76FnFx7yYIU5HDN4OrSOnT3kHdNA5w1x9ECbJuP62y
         ZsWZJU/qon1uzKAxKLTtnDracog9gIS3qFLqpLDGO5Xba7bY+0D4LNAcKZzgNRsRmAIc
         Y6t0hIx1gTi/doKcDlIJoQ9AAJ+acP5n9CKDfVJVicHrYPvkMkOHi44Scd8xcEAPALHM
         z1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xuiuVDoyOP4AUH2n7aUtbBH9tJ2+5TvviOHpbLda0CY=;
        b=IiF0nha/8n2nt01+8tLGXVyoKgeBAaAn9PGSfJ9fA+JsJN8EktrXZmg41nLoxPwkXH
         HMHgPjnsilzqge/pkLCYlfXar5kd8txlfOPqGxD/M54xsER2qd4k7wqBQ6Ln0UyAssJy
         OlswaIm/5cXqqM2TCEpN1pXqSRJcpYH6c5a8D2iWYu9A+aw5hlwzh1Rto6CbFIeD/6ba
         gswb6wDURl0FYuaHx/I/driOfzhk3iMRQdiux1Yzn50+bxZ3hJU82e1PwpksVwpw5T3U
         00E65FsWJQFz8bht+yXAknQKuTwW+CWBqz4eDNcO+8bcDTRpZ4R+wVzz7D+IpfFLprvI
         Hieg==
X-Gm-Message-State: AOAM530KEr7MZriSv43cSKAwCFDzjDGIUeaPdGWZQT0mABFLXOV10ZNv
	NiuLp7g2M/KyHnTnklvJQvCUjCvtzuI=
X-Google-Smtp-Source: ABdhPJxJSagmTUlCvQJT9ziEtn/0dtMsBg3a4umQlLq54goe0Pzu0vFS4ywAF4u7AlY5zNZZ+SW76Q==
X-Received: by 2002:a17:906:f205:: with SMTP id gt5mr13991227ejb.48.1602249732596;
        Fri, 09 Oct 2020 06:22:12 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h13sm6828508ejl.77.2020.10.09.06.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 06:22:11 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] utouch-*, ifenslave, iozone3, ttf-honkyfonts, python3-smbus: don't use trailing slash in S
Date: Fri,  9 Oct 2020 15:22:08 +0200
Message-Id: <20201009132208.3037390-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* see oe-core base.bbclass changes from:
  https://lists.openembedded.org/g/openembedded-core/message/143159
  https://lists.openembedded.org/g/openembedded-core/message/143161

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb | 2 +-
 meta-oe/recipes-benchmark/iozone3/iozone3_490.bb            | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb  | 2 +-
 meta-oe/recipes-support/utouch/utouch-evemu_git.bb          | 2 +-
 meta-oe/recipes-support/utouch/utouch-frame_git.bb          | 2 +-
 meta-oe/recipes-support/utouch/utouch-mtview_git.bb         | 2 +-
 meta-python/recipes-devtools/python/python3-smbus_4.1.bb    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
index 72a7eeec58..0db9e8a0a7 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.11.bb
@@ -11,7 +11,7 @@ MAN_PKG = "${PN}"
 SRCREV = "c26e9310f552e69d0d44eb48746e02c9ae4b4f6f"
 SRC_URI = "git://salsa.debian.org/debian/ifenslave.git;protocol=https"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 do_install() {
     install -m 0755 -D ${S}/debian/ifenslave.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/ifenslave
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_490.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_490.bb
index ecf08cb33c..1d2e53a319 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_490.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_490.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "5eadb4235ae2a956911204c50ebf2d8d8d59ddcd4a2841a1baf42f3145
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-S = "${WORKDIR}/${BPN}_${PV}/src/current/"
+S = "${WORKDIR}/${BPN}_${PV}/src/current"
 
 #
 # All other arches can use the default OEMAKE except those
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
index 4df0c3afb5..9c89f97f3f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.1.bb
@@ -8,7 +8,7 @@ PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
 
-S = "${WORKDIR}/hunkyfonts-${PV}/TTF/"
+S = "${WORKDIR}/hunkyfonts-${PV}/TTF"
 
 PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
 FONT_PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
diff --git a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
index 7c5a734394..a5a881d1fe 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-evemu_git.bb
@@ -14,6 +14,6 @@ SRCREV = "9752b50e922572e4cd214ac45ed95e4ee410fe24"
 
 PV = "1.0.6+git${SRCPV}"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 PARALLEL_MAKE = ""
diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
index 1ebebfa9f5..ca74d911f8 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -18,4 +18,4 @@ SRCREV = "95363d5a1f7394d71144bf3b408ef4e6db4350fc"
 
 PV = "1.1.2+git${SRCPV}"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
index 5f07bf28ee..04d1f3fc7f 100644
--- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
@@ -16,4 +16,4 @@ DEPENDS += "mtdev utouch-frame utouch-evemu libx11"
 
 PV = "1.1.7+git${SRCPV}"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb b/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
index 1be77393b2..6b33649434 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
@@ -9,5 +9,5 @@ SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a01
 
 DEPENDS += "i2c-tools"
 
-S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
+S = "${WORKDIR}/i2c-tools-${PV}/py-smbus"
 inherit distutils3
-- 
2.25.1

