Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37938.1795594100933248898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GIeQ5n2d;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so10924661eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594100; x=1796198900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FBj0qscUA/37QWKcvPuQBhShVmnJjw2jNRc4s5J7oI=;
        b=GIeQ5n2dof9GBgxBsAYxokJucJrbTbtzjG933hTgfAlSi4lPT6/XJM2KzOcrJ4KUUd
         VRS7zvSE0IvL6b2zkAz0YDc/cjRb8HZv3SxdUM9nwdoFZdV48UiifhDFNwBflikYDPcL
         5u/xTi6OjqMhekSOs7yJm2kecSrMwLkz1Uve4bHudFjy4E9HkGoRU+qS4qyFYf4AVC5w
         2zlgqFRBQNp8EMAt2WXTBn6+Vr3NMtFWA4TDGgv9WekNh4AOHPR2VtMHlAgm+/nSIA+3
         qUffU+FM450d8vDTzwjWm2lOdEEfK03VUnkX5SU8WCuK8a2YvhNNDRuLCHw+mt4l7N7Z
         plzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594100; x=1796198900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2FBj0qscUA/37QWKcvPuQBhShVmnJjw2jNRc4s5J7oI=;
        b=1yfzL/C6sOLTJAbUd/DlDiM9WDuUn6nVWdFr9zygSJ8kMr5h5vpBFjXgEzAuhF7WPE
         W9T25xak9/i1tJ/AzZox/sskNu2PixUTEUxsDPpiY+n1rHJhTMBeFpssUKpxfODriY0g
         b4wK0LyCfCq0jW77mWb6+0zgiDwkOvZ5Vwv0JR0wgynG5yb8kBswuFb6bdrixMyne/Jq
         J7NYjGhMD7IFSpbrZDoh+zQrT66mRdNCsdTVOjSubR90CNHQaOicjY5DT6dD31s7dSmD
         E3fWHo63rOpDS8Jf2Vw884mr6vRlEdtDhWw5Td0+vRgenIRmCLrebzOfhhMRsXYSgeb8
         qpmQ==
X-Gm-Message-State: APuU4Z8DCvq/DNoocSXb4hDPTeY6vqzxeZmLuKKu8sPrGnFErkwJYbIt
	TTObyyjFfqJHIwcCNIYQ6fgTTxlXYbJ+uEq6DeIyBSIlXOA74b84hu2BKsAh4TeU
X-Gm-Gg: AZFdTZf5E8p5PIRl0tUtX8/rBQOxXED2qRu5sYFIZZ7J+3OfgNx1KqqHGv3O4abmWKZ
	Rjbm54/ESiWKcC5DMerBHmGK1lDyxVmQj7pMKs0AZI9XiSjZxPOllVz+StTYUru97ZHKYkyfq64
	ysEbHoa66cIj++WniiPtt9z2mX/ve237dwFXGEx5OZFv5R4hBBWj7V0bUWbZcoyLwKFu8kkhodt
	73Rph42fLvzCwDYqhEqZMPq4FjgHuQZVTMACCMrA0/0RWVRYDFPpcR0CoY8/EUIcjimBXZ6EK5O
	9UmUKjvZTHL2hREl4KSUh8pTaK7x2bfcMrkgyq68yNvtwMk+JGGoMBb4vf8XD7emjwpqJaZsQcu
	g2ftuUF3hX1+Gi/yrI/eHB/aYy7bshqJkIzZ5FJf0xPLVoJQVW3IPDBo8Qu0Bw2ssCEQpjIPWvo
	SQMxVJGbc3WDJ+iqwtObFXVVoCe321jUt2tuB9mv9ouIA9X16HJh+tlQg0urh5NnAe2IPppjF7m
	Mxs+xcazQVO9M0byoAcFuFSkJSKoCI7Vbhb0+gt1ROCw79AgtCI61kVybSyTxuAuF5NFdPPz5OP
	+3TCHeBD8gqj6Xu6ce2xHFxOWLsKwjyj5o7IJVztvSDFgAuWSmP6CKwvG/e3OdML+r7xtp8he87
	AzTWn/0TjlyR9Ig7Tydc5yAwDuqu/lQQkmFM9RhC9Af4DOSmhUq0JikWINIIRwuNPcO6m66nUVG
	PzA2JEjL7slE9Y+KMLnuId6aldCALpUfrvPwq0gsymcvOTID9xoFXeDVXH+sWnS2BKRU/LC01l2
	HOxC5xu1x38ucOU8F+mqQOWqvQ98iEWAB4W3tAZSdZST36T292HnpkkaP8jT+LS3JBX8Qd05wjR
	S3dF
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr15585867eec.35.1795594100193;
        Wed, 25 Nov 2026 00:08:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 30/55] ceres-solver: Support Eigen 5
Date: Wed, 25 Nov 2026 00:06:46 -0800
Message-ID: <20261125080732.2419614-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133033
Content-Type: text/plain; charset="utf-8"

Eigen 5.0 uses strict version matching in Eigen3ConfigVersion.cmake,
so find_package(Eigen3 3.3) rejects 5.0.x and configure fails. Its
runtime thin/full SVD options are also deprecated in favour of
compile-time options.

Backport the upstream fix, which searches for the version range
3.3...5 first and falls back to the old lookup for Eigen 3.x configs,
and uses compile-time SVD options with Eigen >= 5. The CMake hunk is
adjusted for 2.2.0, whose minimum is Eigen 3.3 instead of 3.3.4.

Add UPSTREAM_CHECK_GITTAGREGEX matching release tags only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Support-Eigen3-5.0.0.patch           | 91 +++++++++++++++++++
 .../ceres-solver/ceres-solver_2.2.0.bb        |  5 +-
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/ceres-solver/ceres-solver/0001-Support-Eigen3-5.0.0.patch

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver/0001-Support-Eigen3-5.0.0.patch b/meta-oe/recipes-support/ceres-solver/ceres-solver/0001-Support-Eigen3-5.0.0.patch
new file mode 100644
index 0000000000..2873e4d995
--- /dev/null
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver/0001-Support-Eigen3-5.0.0.patch
@@ -0,0 +1,91 @@
+From f9b7b6651b108136a16df44d91fb31735645f5a7 Mon Sep 17 00:00:00 2001
+From: Sergiu Deitsch <sergiu.deitsch@gmail.com>
+Date: Sun, 28 Sep 2025 08:35:06 +0200
+Subject: [PATCH] Support Eigen3 5.0.0
+
+Change-Id: I5cf476a6d8c090861f4ea4a254a35d39e36a6d68
+
+Adjusted for 2.2.0, which still requires Eigen 3.3 instead of 3.3.4.
+
+Upstream-Status: Backport [https://github.com/ceres-solver/ceres-solver/commit/f9b7b6651b108136a16df44d91fb31735645f5a7]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt                     | 27 ++++++++++++++++++++++++++-
+ internal/ceres/covariance_impl.cc  |  5 +++++
+ internal/ceres/invert_psd_matrix.h |  4 ++++
+ 3 files changed, 35 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8e49c19..a186e99 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -180,9 +180,34 @@ endif (IOS)
+ 
+ unset(CERES_COMPILE_OPTIONS)
+ 
++# We call find_package multiple time with different versioning scheme to support
++# both Eigen3 3.x and 5.x. If the first invocation fails and Eigen3_DIR was set
++# to a possible location, e.g., during cross-compilation, failure to locate the
++# package will unset the variable. To avoid losing the path hint, we save it and
++# reuse it in the second find_package call.
++set (_Ceres_Eigen3_DIR)
++
++if (Eigen3_DIR)
++  set (_Ceres_Eigen3_DIR "${Eigen3_DIR}")
++endif (Eigen3_DIR)
++
+ # Eigen.
+ # Eigen delivers Eigen3Config.cmake since v3.3.3
+-find_package(Eigen3 3.3 REQUIRED)
++find_package(Eigen3 3.3...5 NO_MODULE)
++
++if (NOT Eigen3_FOUND)
++  if (_Ceres_Eigen3_DIR)
++    set (Eigen3_DIR "${_Ceres_Eigen3_DIR}")
++  endif (_Ceres_Eigen3_DIR)
++  # Eigen3's CMake package config prior to 5.0.0 does not support version ranges
++  # with different major version components. To ensure backward compatibility,
++  # we locate the package using the previous version scheme as a fallback
++  # mechanism.
++  find_package(Eigen3 3.3 REQUIRED)
++endif (NOT Eigen3_FOUND)
++
++unset (_Ceres_Eigen3_DIR)
++
+ if (Eigen3_FOUND)
+   message("-- Found Eigen version ${Eigen3_VERSION}: ${Eigen3_DIR}")
+   if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64.*|AARCH64.*)" AND
+diff --git a/internal/ceres/covariance_impl.cc b/internal/ceres/covariance_impl.cc
+index 6e8362d..deb0ce1 100644
+--- a/internal/ceres/covariance_impl.cc
++++ b/internal/ceres/covariance_impl.cc
+@@ -723,8 +723,13 @@ bool CovarianceImpl::ComputeCovarianceValuesUsingDenseSVD() {
+   }
+   event_logger.AddEvent("ConvertToDenseMatrix");
+ 
++#if EIGEN_VERSION_AT_LEAST(5, 0, 0)
++  Eigen::BDCSVD<Matrix, Eigen::ComputeThinU | Eigen::ComputeThinV> svd(
++      dense_jacobian);
++#else   // !EIGEN_VERSION_AT_LEAST(5, 0, 0)
+   Eigen::BDCSVD<Matrix> svd(dense_jacobian,
+                             Eigen::ComputeThinU | Eigen::ComputeThinV);
++#endif  // EIGEN_VERSION_AT_LEAST(5, 0, 0)
+ 
+   event_logger.AddEvent("SingularValueDecomposition");
+ 
+diff --git a/internal/ceres/invert_psd_matrix.h b/internal/ceres/invert_psd_matrix.h
+index bc74900..34a4698 100644
+--- a/internal/ceres/invert_psd_matrix.h
++++ b/internal/ceres/invert_psd_matrix.h
+@@ -68,7 +68,11 @@ typename EigenTypes<kSize, kSize>::Matrix InvertPSDMatrix(
+ 
+   // For a thin SVD the number of columns of the matrix need to be dynamic.
+   using SVDMType = typename EigenTypes<kSize, Eigen::Dynamic>::Matrix;
++#if EIGEN_VERSION_AT_LEAST(5, 0, 0)
++  Eigen::JacobiSVD<SVDMType, Eigen::ComputeThinU | Eigen::ComputeThinV> svd(m);
++#else   // !EIGEN_VERSION_AT_LEAST(5, 0, 0)
+   Eigen::JacobiSVD<SVDMType> svd(m, Eigen::ComputeThinU | Eigen::ComputeThinV);
++#endif  // EIGEN_VERSION_AT_LEAST(5, 0, 0)
+   return svd.solve(MType::Identity(size, size));
+ }
+ 
diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
index 5368bdeeb4..5c6eaf4395 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
@@ -5,8 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3585a26c9cd9ec0cb36a7d65542878ca"
 
 DEPENDS = "libeigen"
 
-SRC_URI = "git://github.com/ceres-solver/ceres-solver.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/ceres-solver/ceres-solver.git;branch=master;protocol=https \
+           file://0001-Support-Eigen3-5.0.0.patch \
+           "
 SRCREV = "85331393dc0dff09f6fb9903ab0c4bfa3e134b01"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake
 
