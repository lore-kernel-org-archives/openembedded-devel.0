Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3689.1793212422898042973
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 11:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nkent-net.20260707.gappssmtp.com header.s=20260707 header.b=VW0HgZUJ;
 spf=none, err=SPF record not found (domain: nkent.net, ip: 209.85.208.43, mailfrom: nate@nkent.net)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2230926a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 11:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nkent-net.20260707.gappssmtp.com; s=20260707; t=1793212421; x=1793817221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Br70bHaUCY4dbwx2htlmnSaenlxpxR+UBv3EdmuTCfM=;
        b=VW0HgZUJxist4an5waqtasld7qkoTnMtRqMRLfYKQzsOtk8OK+y69M4bxiCFNPdJuT
         fKxbnRWKRZ7lXu8b5/pY3cgR9YW+szcr8FeiTHA4GyL49o0OyKFeVqjtZGurC2Aslzow
         YubVUQHA8vqpU+47U5f4hpzeImWdf7L9avNMZq/K68CbJmtBK0kslQ8dBHs+sDD6IWSI
         GLArokXlv9RAtMkKfKGcT+mBKvH640cHOukLA2SEo4J0a3f6DFjaYejOGutuRHpugMxj
         sQUjd/59KuWE9hy+w0CLJheYGKZQPlnmoE1iQxxDQhD/6laNvD7nQT36mIxZ2DG/xrcd
         y4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212421; x=1793817221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Br70bHaUCY4dbwx2htlmnSaenlxpxR+UBv3EdmuTCfM=;
        b=wjZSw4qQ1OjrM404tSg+dx/J0Sqr5zmtAK9b5RI8R41JlpCariy56m2iZnqhow2r7U
         0s2i8daSDpmi4+exBcffBU0zz5wSZtddlmI/3FJmpeYOtmXd5GCwNUI0q1OkYmp7N/XX
         fLbaDzP2OZcV3kG3bDtvsRk9dcdYdix3p2kp49501b4aXtlGgamipTF4STjuX7rhtiiP
         BdeOyAq2pYRt5NN99u/HdWwlKQr8mhqyDYwR9YFjffuRSjU/uFomg/0Yal1pYUnq4kf2
         3V/Eqsn050tbuC0XpnkzJSbffz87GCSRIsj/VvAr4v3wrV6e8nutebZWEpV2Xy/VpuXx
         5m2Q==
X-Gm-Message-State: AFq9FYKv0VaK+DNfn+OZRg9CMpI2wYmx9u/fBXziRLFooAoJ4eJPgxR1
	A2HQuVqVhuvHEdW+vEs/wxY1fHUI1/bKpAhXhQM7xJ11R4cPNWE9OAKckFAjMgl/bvmjiq2LFgX
	hsASHkJnthkRU
X-Gm-Gg: AYBFou22GvV3yOplEPo2tl5nn5ofkMzTUdqgfpruJydIbYwm3gEU6UOMacKLBMEXeFc
	0Tqpf4Q2jJ3pEgOcwXoTIDnTZ0bEXy/eAnqhF/N+NA4M0WHpaZnsUPc3Ii6AJdpI0wNbIt6pRfP
	xLK33Zc25iJvx+ljaKmw9PNKdAv8KhlSsEpy+25Y+9a6VTdLeePIvV7MGirkcr+7lhT/c1cOryu
	aov8AQYnNx3wEeAUvzdAAGD5Bxl+XcW6e4nNnBTRHLFzNjUbkhMCI/neRVLsNMSuN1KGftHkd5+
	y10uF5xMRn+/2tk7KRANWS7VpXgw0atFwvoKPA2n2pnFH3cf6ljkTGINZrD6ircY49eW/7dHS1L
	1RMGPO3N/C2GsLIDdvAJQHIio0eEaqfz7CVG3kTzkhY1TrPRBCUotCk6Z72uMap4wBRPK2DrteQ
	h6lchc0Qtz+yu5XEQ2dZVe0xq/RaxxCXAMPVJqGRk2ZkC9k5FqF3J9K5j0+iBwnCDcmJRf+K2Um
	dUmxHzH858g5Gg0pfgdUpYhk/LCnUA3aPlgZZUBDcShHHcXfauXW5pwrlWINBaIgop4ukSjN1EY
	Oz3sqWzNaX0v3Y/e0tc8JEz5rtvoPI7O1UPXzfuyom10yZduPtWg5dXly5sbT7oyBhECwByG4AR
	0Ot9F5ZHO0xKPfngI5phzRUNgsVB699Jpz+8Ol8wfk58KliZZLYPSaxN7dGihjIm6NQ==
X-Received: by 2002:a05:6000:4a09:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-48e5d5bf158mr8531600f8f.25.1793211972943;
        Wed, 28 Oct 2026 11:26:12 -0700 (PDT)
Return-Path: <nate@nkent.net>
Received: from akatosh.telenet.be (2a02-1811-e507-d800-9ae4-d494-8afd-3e84.ip6.access.telenet.be. [2a02:1811:e507:d800:9ae4:d494:8afd:3e84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm30243029f8f.38.2026.10.28.11.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:26:12 -0700 (PDT)
From: Nate Kent <nate@nkent.net>
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>
Subject: [meta-networking][PATCH 1/2] nngpp: remove recipe
Date: Wed, 28 Oct 2026 19:24:51 +0100
Message-ID: <20261028182452.3594321-2-nate@nkent.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028182452.3594321-1-nate@nkent.net>
References: <20261028182452.3594321-1-nate@nkent.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 18:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131628
Content-Type: text/plain; charset="utf-8"

nngpp has not had any activity in the last six years and is not
compatible with NNG v2.

Signed-off-by: Nate Kent <nate@nkent.net>
---
 ...1-cmake-Bump-minimum-version-to-3.10.patch | 25 -------------------
 .../recipes-connectivity/nanomsg/nngpp_git.bb | 13 ----------
 .../packagegroup-meta-networking.bb           |  1 -
 3 files changed, 39 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch
 delete mode 100644 meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb

diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch b/meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch
deleted file mode 100644
index 170d799502..0000000000
--- a/meta-networking/recipes-connectivity/nanomsg/nngpp/0001-cmake-Bump-minimum-version-to-3.10.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c5004770784dc5ff80b88487de38c22275a7960a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 12 Jul 2025 16:04:38 -0700
-Subject: [PATCH] cmake: Bump minimum version to 3.10
-
-Cmake4+ has dropped support for cmake < 3.5 [1]
-
-[1] https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
-
-Upstream-Status: Submitted [https://github.com/cwzx/nngpp/pull/38]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index caa7145..45a5ad5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required (VERSION 3.1)
-+cmake_minimum_required (VERSION 3.10)
- project(nngpp CXX)
- 
- include(GNUInstallDirs)
diff --git a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb b/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
deleted file mode 100644
index 81a85a7e27..0000000000
--- a/meta-networking/recipes-connectivity/nanomsg/nngpp_git.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "C++ wrapper around the nanomsg NNG API"
-HOMEPAGE = "https://github.com/cwzx/nngpp"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://license.txt;md5=6d17d78c3597e0d4452fb1c63bf7c58e"
-DEPENDS = "nng"
-
-SRCREV = "8da8c026bd551b7685a8a140909ff96cfe91bf90"
-PV = "1.3.0+git"
-SRC_URI = "git://github.com/cwzx/nngpp;branch=master;protocol=https \
-           file://0001-cmake-Bump-minimum-version-to-3.10.patch \
-          "
-
-inherit cmake
diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 085aebd455..0d3760ded8 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -249,5 +249,4 @@ RDEPENDS:packagegroup-meta-networking-support:remove:libc-musl = "ypbind-mt"
 
 EXCLUDE_FROM_WORLD = "1"
 # Empty packages, only devel headers and libs
-# nngpp
 # Use ntp and not chrony or ntimed
-- 
2.55.0

