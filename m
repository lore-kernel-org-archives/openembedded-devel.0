Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141E5C5DF6A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:01 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2469.1786762257726266190
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oODWc80J;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cedda2ce6fso11576555ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762257; x=1787367057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R78YrAQx3B8zJxJQR0OyYwKsOLGVBwr9R8jDVy5y8hI=;
        b=oODWc80JzoII62AMaky0a9dH6pL3K7ZeBzWtUbPjlUTM7ja6p7PRaYN9SXzONtcRaN
         IG0VW2O7E2ksvj7b6qDDuTX8ErbYTalfZvZbZlaVquYurLuRnCLLaVyue92t2t7C8/nQ
         ns7XAYwXyWD34u8fyEldJjF9h/bUvYZXu3MFiL2OPy45mjhnYj7n54ip7Y/2WLtcB3LN
         Ptm7QRUTqBeUZiNTB+Xeh0Jc5sGeuw0Dwf8HbSJl/ZShUfHY858S1u8p9xzyZhaKzR2g
         BUzpFrCDxkh4quJELaZaEUDqf4G9OlhDGLh0EAspmr6i/OIqiSX11xoVAWokwUHU+Xdp
         kLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762257; x=1787367057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R78YrAQx3B8zJxJQR0OyYwKsOLGVBwr9R8jDVy5y8hI=;
        b=OD2yPE1YcxTaERL2a5giSDK1Cgm1gCc/nyzajs1iLo0Fm5M8HtjQWNNtfzrRgai12W
         KrQ9YFPhmp71QLY+0aqIiGYfEiqaYUo53+vmlQ6aEPIkybt/yhfQ9AmNMoI+VYXqs0OV
         1BibViL+pcLkbcRvKYBX5sKlckdWPjFsJN03CKzZchkqkTUnXYMq2xjsS4pDSQN1tb3O
         LMLax5Fdy8kgmcUiyvgGZP5Vv5+AOHOJmiJgdlQJwcRF8plmhNyWaWwAsKybDaAxCx8b
         0jZgqAWY8LiPd0s6jI77TyL+tKHH7djIDWyTgMXzG89KFP6/ICSVvsgB+uucWURNtKXo
         oC+Q==
X-Gm-Message-State: AOJu0Yz0QlsUPPdhw7osztZ0FCjwneyaTDo/bhreRF2H39Gybp2GjWh4
	Z4sq6oW75cfjLMDWfag0z8bCMbYYtYDiHepE9TYcPbSt7by9SrZIjc4O5TDGIjuH
X-Gm-Gg: AR+sD10GWPw1Y+2u6VMVvv2IcsGZx/gy+srxeNRgkydrNL3FR4dJ3txIF1Ott3IQTTa
	N03T0wfWja6aNHptYe7+9Mv1Lld+/al5rs1Kj+bpiPmhYJfox8rf7sxOcR3qPSQa4e3bNWhWLpR
	KHt3gvfYYPsEB6XyCwPv3nC08KVOqJJ89/qYnOYvDyhrVQxFP7iwR0wz6kKHbpl4M77ajHWhxzB
	ONtdMtFIog95e1AiUlknd2XfKjGC48KKHkFSA512PUg+jbQVoA7L1KP7yXXVO+jCHTaHCIAOD2S
	m4lxDTUFjx8Zbo810QNB+3ZTuAevS18hlD56MqKhuK6qbTDT+V5hm3KwzDxqocJCJWpOIwdP3vT
	ybRiovsjLnzbMz5z3uWa1sY3hR0fde9njG28LMqb0BQOyd3PR5FVIgTRel0h0zuXWFhj1IPIYDB
	2mzneS5CjlIBnNU8UywfmlXwyXPow/+Ge2wqjAR3un1bNXdm4QxKUCG6+79Y/FAQ/XfxMsd0bpY
	TAVaf/1eHdqyr4vSnLtvB9BkQnVhjEG1e/1UbCkbZKB51mZHBdkl53Brv9GGJ16KJxKkT1eEPvC
	rr1y40DtAB/4BHY9rsFkB86QSExv6jhK5HNMng9yAfmi/sTm42bT8CvOg6a9xBJVvVEkQODM9UN
	63oQAX9ZUMO42V8dDx0psCNk0plFsZceCS8UBDlBYxitlJVdrq5ryDErfSzhxcOVnLcBp
X-Received: by 2002:a05:6a21:a98:b0:3c4:397a:69ba with SMTP id adf61e73a8af0-3cc71d7bd03mr13263488637.28.1786762256838;
        Fri, 14 Aug 2026 19:50:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 107/109] restinio: upgrade 0.6.19 -> 0.7.9.1
Date: Fri, 14 Aug 2026 19:50:41 -0700
Message-ID: <20260815025044.437694-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129172

restinio 0.7.x is a major architectural change from 0.6.x: the release
tarball no longer bundles any of its third-party dependencies
(http_parser, expected-lite, fmt, catch2, sobjectizer). They must now
be supplied externally and resolved through find_package()/system
linkage. This requires two new supporting recipes added in prior
commits: llhttp (replacement for the now-dropped http_parser) and
expected-lite (nonstd::expected backport, now required unconditionally
instead of restinio's old embedded fallback). asio, fmt and catch2
dependencies are already satisfied by existing recipes in the tree.

Recipe changes:
- Release tag format changed from "v.X.Y.Z" to "vX.Y.Z"; update
  SRC_URI and SRC_URI[sha256sum] accordingly.
- LIC_FILES_CHKSUM md5 updated for the new tarball's root LICENSE file.
- DEPENDS: drop http-parser, add llhttp and expected-lite.
- EXTRA_OECMAKE: RESTINIO_FIND_DEPS and RESTINIO_USE_EXTERNAL_HTTP_PARSER
  were removed upstream. RESTINIO_BENCH renamed to RESTINIO_BENCHMARK,
  RESTINIO_ALLOW_SOBJECTIZER renamed to RESTINIO_WITH_SOBJECTIZER (kept
  disabled). Added RESTINIO_DEP_STANDALONE_ASIO=find,
  RESTINIO_DEP_FMT=find and RESTINIO_DEP_EXPECTED_LITE=find so restinio's
  CMakeLists.txt resolves these via find_package() instead of trying to
  add_subdirectory() vendored sources that no longer exist in the
  tarball. RESTINIO_DEP_LLHTTP=system is used instead of "find" because
  llhttp's own CMakeLists.txt only exports an "llhttp::llhttp_shared"
  imported target (llhttp::llhttp is just a build-tree ALIAS, never
  installed/exported), which restinio's dependency-resolution logic
  does not recognize as a valid find_package() target name.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...restinio_0.6.19.bb => restinio_0.7.9.1.bb} | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-connectivity/restinio/{restinio_0.6.19.bb => restinio_0.7.9.1.bb} (38%)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.19.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb
similarity index 38%
rename from meta-networking/recipes-connectivity/restinio/restinio_0.6.19.bb
rename to meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb
index 22dd4ada13..193e9de81a 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.19.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb
@@ -5,23 +5,34 @@ DESCRIPTION = "Cross-platform, efficient, customizable, and robust \
 HOMEPAGE = "https://stiffstream.com/en/products/restinio.html"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=bfe2747443b7875eaaaa94b55b611f49"
-DEPENDS = "asio fmt http-parser"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=d9ef67870895758240c3889695ad2558"
+DEPENDS = "asio fmt llhttp expected-lite"
 
-SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "7f21eebeb966e170d6ab54e9b198ac927d439090121739e037c0fa3bb367b240"
+SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v${PV}/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "4a0429e2ea4ece200228226f0c628ecf9ac111cb6a6b12ad857de84c0576bf80"
 
 S = "${UNPACKDIR}/${BP}/dev"
 
 inherit cmake
 
+# restinio 0.7.x no longer bundles its third-party dependencies in the
+# release tarball (unlike 0.6.x). fmt and expected-lite are resolved via
+# find_package() against externally-provided packages. llhttp's upstream
+# CMakeLists.txt only exports an "llhttp::llhttp_shared" imported target
+# (llhttp::llhttp is merely a build-tree ALIAS, never installed/exported),
+# which restinio's dev/restinio/CMakeLists.txt does not recognize as a
+# valid find_package() target name, so llhttp is consumed in "system"
+# mode instead (plain -lllhttp against the sysroot). The optional
+# sobjectizer integration is disabled since we don't need it.
 EXTRA_OECMAKE += "\
                   -DRESTINIO_TEST=OFF \
                   -DRESTINIO_SAMPLE=OFF \
-                  -DRESTINIO_BENCH=OFF \
-                  -DRESTINIO_FIND_DEPS=ON \
-                  -DRESTINIO_ALLOW_SOBJECTIZER=OFF \
-                  -DRESTINIO_USE_EXTERNAL_HTTP_PARSER=ON \
+                  -DRESTINIO_BENCHMARK=OFF \
+                  -DRESTINIO_WITH_SOBJECTIZER=OFF \
+                  -DRESTINIO_DEP_STANDALONE_ASIO=find \
+                  -DRESTINIO_DEP_LLHTTP=system \
+                  -DRESTINIO_DEP_FMT=find \
+                  -DRESTINIO_DEP_EXPECTED_LITE=find \
                   "
 
 # Header-only library

