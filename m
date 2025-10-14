Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EFCCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:56 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.380.1760475291808585613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P8JMpjFh;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27d3540a43fso57138285ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475291; x=1761080091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAbitykDe3OYlEZED5XRHUY1tK1YN7YxFN4UyIXXC0s=;
        b=P8JMpjFh816HuhF01dT/5wJYHR5ZObGWygs1zBMdo116fhmOZv6Xe2NB2lp/mFCrkj
         4VonL7TnRUTclYXe1F6v147jFxtiF+SVC2wCGDLmI6vdhr5jxk9grRFWlnM+ANOkmdhp
         TvTaEWZ14voJcVinuBLKUy0mutYu/98iXrvdTLcThLbwCkXalPtwY32PUZ35MucPbLfz
         MfoEzdpxCAQJ838VbJrcC74iJ1JjLs8g0Koktm4cIfx1d6wRkialj3J9ZWyvhYQ00DHw
         Fq6syiuVy4881UI3tq8ibX6nkQ2JxnsPbnF9xM0YxIKC8BLmJYyADlw0i6ZG9jHXRjBv
         FOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475291; x=1761080091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAbitykDe3OYlEZED5XRHUY1tK1YN7YxFN4UyIXXC0s=;
        b=dYGSLB3ofaSXG425spuhUFTl1l17GjaNLX+cr63QEH4B8s6ERrMIKYuQCBnXRNx2Au
         ZLl3YfRbish0ELpqD9NYi7+Jdjrr0tHpkY44VYLmUphCsiRidRCKhD6n3JygZjTeDOKW
         6/BK4Hu15GNGA1qx/8HyR7w7TCP9/l5zUombCafVrAAIjvPbdHHXPyge0QOW59RuCS+u
         W0ejhvR49OW+a6bEemqE/ZxgmSiTWQER0H6Vnd2Oqm4gOcgZ6e/MxFS/tvooe4k6iOQJ
         oiPWK6La408oH5kymmxCkTyTSSOQvowNJyHSWAB2WI4Tgq0eiGPLzfFE6HXLUwFujoL7
         iPFg==
X-Gm-Message-State: AOJu0YwQekDk+dYHLJyY5CvqXi0NBo/lcfgMFmT0vavIroA2+ZTVf4v0
	Bp7SrSgzE0orXXZP4U/SwntvtlNKfiDWIhWmMJi/29q4N7UdOFY/xWkkan/3PQ==
X-Gm-Gg: ASbGncvoP7QuxPR8PPplH4xgNdAalEep82JYR6CtYLqHoKdp11RErKzzB0NDdETVW9e
	qirup+LuZArzPzbM1bCsj3eQMQW/8zj3mSV97Se1tw22Ll8tnnm19tuM0buwTIRWaveQIAYpvap
	zzcqKo4VJotLQs0h+DXBafnswT4Qli7GpCCogvMIGjW4JRzdYaq2tiim4gxtRYFTEZmJMdWYd8m
	XTdhgq2YWaGzni1UScn97Q2UYEIey/F89ODDH28fIDadgl6XFRtfqDddEGVfVYNP4Q+xvWxWWgy
	ZCDelT+qXQoWmcKF2V6eJD968qvkH/oFKvmosCSAwDl6cAxzJ4098xU++TvkpHwnLXuL+DR14q2
	PAe78DpOc996mHPEP3pCZ9RLm2pJ2o3476GQl/1j+5Ofoa8muSNEidaY=
X-Google-Smtp-Source: AGHT+IEkD1E/HN6ulVpsbC4pWllA/2r14eb4tpeK5vO8w5INMmyzRPMGdwVK81Mcvzy1H/3M/ymcLw==
X-Received: by 2002:a17:903:b0e:b0:273:240a:9b6f with SMTP id d9443c01a7336-290272c31b3mr324975815ad.39.1760475291059;
        Tue, 14 Oct 2025 13:54:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:50 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 18/18] jasper: upgrade to 4.1.2 release
Date: Wed, 15 Oct 2025 09:54:01 +1300
Message-ID: <20251014205402.1487867-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120651

Bugfixes including CVE-2023-51257
https://github.com/jasper-software/jasper/compare/version-4.1.1...version-4.1.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-graphics/jasper/jasper_4.1.1.bb   |  2 +-
 .../recipes-graphics/jasper/jasper_4.1.2.bb   | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
index 5281980ecb..d6d5b5de32 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
-SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
+SRCREV = "ff633699cb785967a2cb0084d89d56e53c46e416"
 
 CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
new file mode 100644
index 0000000000..d4dae1f22a
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Jpeg 2000 implementation"
+HOMEPAGE = "https://jasper-software.github.io/jasper/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
+
+SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
+SRCREV = "ff633699cb785967a2cb0084d89d56e53c46e416"
+
+CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2023-51257] = "fixed-version: patch is already included in sources"
+
+S = "${WORKDIR}/git"
+
+inherit cmake multilib_header
+
+do_configure:prepend() {
+	JAS_STDC_VERSION="$(echo __STDC_VERSION__ | ${CPP} -E -P -)"
+}
+
+EXTRA_OECMAKE:append = " -DJAS_STDC_VERSION=${JAS_STDC_VERSION}"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl', '', d)} \
+		   jpeg"
+
+PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=ON,-DJAS_ENABLE_LIBJPEG=OFF,jpeg,"
+PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=ON,-DJAS_ENABLE_OPENGL=OFF,freeglut,"
+
+do_install:append() {
+    chrpath -d ${D}${bindir}/jasper
+    chrpath -d ${D}${bindir}/imginfo
+    chrpath -d ${D}${bindir}/imgcmp
+    chrpath -d ${D}${libdir}/libjasper.so.*
+    oe_multilib_header jasper/jas_config.h
+}
+

