Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F00C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:33:03 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3129.1783578778349079176
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A2KJNRJ5;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so13856985ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783578778; x=1784183578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v86OsrIKpoACtfXzpXcVij4CNeyttSoBDeQQ4sZuA6M=;
        b=A2KJNRJ5onhDpKyaj94TXG7LUOgC0etKuZcVVXcP6yCH/k95bNiLpxFiTgdhWXrmIo
         D57+VhPoE4RPnkcMrRVv1Bv3us9lg6f4YlFUmrtVF5Cz9OLdqqEeCuKttu5jmgzs3pfw
         VwvQMe+B23sdSZZOV2Ws3c8RHhITOkzrCm6+IAZXb4s3+u2aNqOtADIT2ScatrJBc/f3
         ydseOxU+8E80TPkVKnfTHszR4W0nWwuW4AwU0qyxcbNBZLw0VY23o2VxJdao9OzOvowu
         fDqSBSbulXB3KibEn/0ShWJNhaviOAWxXzSjiR6tCh5oZXi3Y/k5Ssq69qisdLh4p+LZ
         TD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578778; x=1784183578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v86OsrIKpoACtfXzpXcVij4CNeyttSoBDeQQ4sZuA6M=;
        b=K5h8ZZtmOZwdvsOaeWny050/u77QNkm/uTmR2IT6hUJpqs4wCl1FiEngLAr5pu/bl7
         SyPfcgPeghLgzS1PfnLyTK64rWqMt/dWah1Xsb3N1sWC1y61MqbD1uW4pSWAlGpLMFsC
         j9ZeIi7Tgs7SX5HPWUWGHL9HxkAFqOmmMFzmhsCO+JaRKP50o0TUb6pwO53wAHsTSg3L
         A2zA6GyRWVfS8GmxpDWPaw9xLPVvUlHSZhxIl71kF8BJ4t5Rt+Wmg9rJGMIfeJ9VgEHP
         rwjAgiaLLNwf9XWk1lcncJ27J5BrweQpYcOgTQf2MZhkF+tuBIvR43Eyf0+d+FRVzz3S
         7x9g==
X-Gm-Message-State: AOJu0Yy7eu1D/dVy0vUysiZYdopyIya1k2/uTCIaEIjgXvKX6OcrltLs
	kWvsHW+mhR5eh+/PhnrEk4NhV5jtELCmlkwLZiB1i7yXp0lkSrpkMJVRG3vu5AQyrsc=
X-Gm-Gg: AfdE7cnZ4rl0/1BvqZtCgkFWqpkOLwy6lbRbM2uzUjFQCMzSow8QBtwEYUK6SD56A9e
	+LEdFt9nDr+KC3KJ4l2EyDgpDPVk2abrGD4FhhLzzdIgdaoIgZGAqFtjPt06xqLtUKlc1p45v+r
	/bkmQdx9mGaaME0BM2OMyrU17B3Of7jOgApnn94h9TSi5HK48zuSR/Rg1vEz/MEIMZJ6MjFN9ZA
	Wd2pKJZ+5yfx9VB+7oCmPVjIQhRFd6MIct1a2lcfA2GjAw346qNKBk3lWo9CD8q4oFe8aCLo7kR
	Q161/otwkNGjrPwZ/ZrhpNG1GpTKcRcG2zuPgYF4xYI5t/B5ezE+kVy4RJVyVqN4oXiUsYDF5NJ
	65BJkyIYKiQfS/YM43wcAA8lVNSz8lpAirztaNfECzQQ0ZOGrNjFKSScXE9f7GUCj2ubstig26s
	h3I8/KQDs5JHBN1IOFiakYSIT/Er4Rvudi5s449CAfEqmhbcM7kXl1DSSIKTyNR6QH3TpumNJuH
	w2kaWjiuVGHvLVkW74O5R1wyizQFjumU9Vt/pGT1tYtcT2JE6kw353cEFQladgAuNXotwIrHovT
	qfjZiAhluDBufdL8qe6k5TRnjDWJww==
X-Received: by 2002:a17:902:cf09:b0:2cb:2b53:559f with SMTP id d9443c01a7336-2ccea479f4cmr61773725ad.35.1783578777601;
        Wed, 08 Jul 2026 23:32:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd5bsm38413735ad.72.2026.07.08.23.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:32:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 4/4] python3-pikepdf: Fix cross build with scikit-build-core
Date: Wed,  8 Jul 2026 23:32:51 -0700
Message-ID: <20260709063251.3218170-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709063251.3218170-1-khem.raj@oss.qualcomm.com>
References: <20260709063251.3218170-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128116

do_compile failed to find ninja, and after providing it CMake's C++20
module dependency scanning (clang-scan-deps) failed in the cross
environment with "'cstddef' file not found".

Add ninja-native and python3-scikit-build-core-native to DEPENDS so the
--no-isolation build finds its build tools, and disable C++20 module
scanning via CMAKE_ARGS since pikepdf uses the C++20 language but no
named modules.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-pikepdf_10.9.1.bb      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
index 2482e8913a..a0ab6f275a 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
@@ -9,6 +9,11 @@ SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"

 inherit pypi python_setuptools_build_meta

+# pikepdf uses the C++20 language but no C++20 named modules. CMake's module
+# dependency scanning (clang-scan-deps) does not work in the cross environment,
+# so turn it off.
+export CMAKE_ARGS = "-DCMAKE_CXX_SCAN_FOR_MODULES=OFF"
+
 PYPI_PACKAGE = "pikepdf"

 CVE_PRODUCT = "pikepdf"
@@ -16,6 +21,8 @@ CVE_PRODUCT = "pikepdf"
 DEPENDS += " \
 	python3-pybind11-native \
         python3-nanobind-native \
+	python3-scikit-build-core-native \
+	ninja-native \
 	qpdf \
 "


