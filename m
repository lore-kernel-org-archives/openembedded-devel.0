Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890D4C44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14740.1782634340696669964
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fn6WmxXm;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30eac9abd79so819105eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634340; x=1783239140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTaRq1LmP3Na/IoUDoFo9+PzsBah+1N6eFjfWiyekS4=;
        b=Fn6WmxXm4D29IVEfFSDFQ4mYxVh9gjSA3OTjvaYSKCZAZjImVzVS6J9cdqCdc08xdO
         m76j3b8/OBdTebkgKsFJRe1WGxCHGGZxpKYY4PA0R3F37d93cXIr15D1xlspshRVcG0+
         TjlhkolMfFkdT9O58EHrfV0ffXV9FCRRcWV5ZlhK1swGYwkf2I0E2vd5P4IidF0LMpBL
         1qcROHsZfO0qxYA3Ts0ms4Tl2yHJzm5KaLwTbF+efmF2+rIvLvvZrP4trBN7vRZlXNFZ
         edyllDhQgTSn93wovIUdevmvhooToIm3a6UNTVfxmua86/25ZErs0goMRFNYhu5m8hTY
         llHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634340; x=1783239140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sTaRq1LmP3Na/IoUDoFo9+PzsBah+1N6eFjfWiyekS4=;
        b=pmgwmSPTSs6CavQfSBmwKozLyH1KYwxRNyDHj58yjlvfGqcIkYiWZ549H+vv9KseYB
         Gk5i/yLPDwF3qsGgeV5GWRXdFC7PuUHG8gE37dh+rEAiP7s8ci5Wtq3dplaZ2bWmahz6
         uk3zhNe/mhtSsgG7JDKsoIO09us4XtUshpiJtQziRxbiOGZyyQq0u+Al6mgG48xiDo4j
         sFpYPxQoG80rHfbabr9E8eRtTNuY93GnmREs6Xaoy7nHi/WMcoJWJuBeTRUi5mNcVdyB
         DSM/pdqIetNbjAUJki7N62T02wPb4iRZ+E+jEqP5jIzRH7+K22X7PEOfYU4uEA+EzYi+
         vOqQ==
X-Gm-Message-State: AOJu0YzCqTlWYMeC5CqkvltGMKr+TNJa8Iwpyoj1IGZ2VZ++0RxG+3D3
	1wo+8LBM51LSNrAKFSl74kYg1gf/daDPOsBypfZLOXJSfzG79tRhB+gdLXhFgpx+uID2uA==
X-Gm-Gg: AfdE7clK/fv0rmj4qZ2dgEb/SzNzknE9BuHTDkvjzZ9iGyw7v0WdpqQgWYLEoaIXjwo
	uLUgfRawPbl/Pnrn6eenjClKSmOS2m7QVJUY6exaI/QzcsmdNq1rPEyZ9Zrtgt0D3u8MOTfplHu
	60gp5anxaY2FMJBy5WNPBIu7cQ8YtMFxq7YY8cgCiJrl2YS0ccZQnv8+FLN8W/QfMQaKub8NAbX
	KcDQfis9vGoTqPRD1zDAOkAR+9kDzszfXh5vswzT9Fg7+n6opxNWSx8Mry+FKVb2Z6cFKwAd6gf
	6IgwbHHqhSchOfpsezzZHqn1QARdOJoXQ6EjJXdvAWjogVdKlXzeE4S2K6hffkkre313RpMU1vM
	3ANghJxRxYjUA6dw6WmLjue6Xt2Sf/2HUuiAVlhP/46iF9Z0Jxw7FfC7Xc+47A6NiazwXFu0Gbc
	TzbQWKhW9Sf+Mq+JgCcIQQT6EXHTcZ/e4wFLmc3oKyOAtc5ANmizLgEEXtJI1ztRWDTJS9mDjCE
	2hatgY1KkA21IUbVUea5HMbjSaBXJtXHv0b49ArK9QSOSJcvnaBjbOoM10j8v8/41YfqcZgZJKw
	bmCPkjIezAfygcQNSfCUkpZlAMPdog==
X-Received: by 2002:a05:7300:768c:b0:30c:7ab6:7ff7 with SMTP id 5a478bee46e88-30cab09accfmr6940638eec.15.1782634340076;
        Sun, 28 Jun 2026 01:12:20 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 060/128] lcov: upgrade 1.16 -> 2.4
Date: Sun, 28 Jun 2026 01:10:11 -0700
Message-ID: <20260628081122.178348-60-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127870

Do not package the upstream test suite: the tests under datadir/lcov/tests
are not needed at runtime and pull fatal file-rdeps on /bin/bash,
/usr/bin/bash and /bin/env, so remove them in do_install.

Pass DESTDIR separately to fix buildpaths QA. The recipe ran
'oe_runmake install PREFIX=${D}${prefix}', folding the destdir into PREFIX;
lcov's Makefile bakes the runtime --bindir/--libdir into the installed perl
modules and manpages, so the build path leaked into the package:

  do_package_qa: QA Issue: File /usr/lib/lcov/lcovutil.pm ... contains
  reference to TMPDIR / the build host HOME directory [buildpaths]

Use PREFIX=${prefix} DESTDIR=${D} (and CFG_DIR=${sysconfdir}) so the baked
paths are the runtime ones.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lcov/{lcov_1.16.bb => lcov_2.4.bb}              | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lcov/{lcov_1.16.bb => lcov_2.4.bb} (71%)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_2.4.bb
similarity index 71%
rename from meta-oe/recipes-support/lcov/lcov_1.16.bb
rename to meta-oe/recipes-support/lcov/lcov_2.4.bb
index a889b3fa82..4c121b9cf6 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_2.4.bb
@@ -51,13 +51,22 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov-symlinks \
 "
 SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
-SRC_URI[sha256sum] = "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba5224995668e3240b"
+SRC_URI[sha256sum] = "3457825c6b2fe4ef77c782b82a23875c84a3c955243823f05d8f2dec0d455820"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 do_install() {
-    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl"
+    # Pass the runtime PREFIX and the staging DESTDIR separately. lcov's
+    # Makefile bakes the runtime --bindir/--libdir ($(PREFIX)/...) into the
+    # installed perl modules and manpages, so folding ${D} into PREFIX would
+    # embed the build path and trip the buildpaths QA check.
+    oe_runmake install PREFIX=${prefix} DESTDIR=${D} CFG_DIR=${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl"
+
+    # The upstream test suite is shipped under ${datadir}/lcov/tests and is
+    # not needed at runtime. Its shell scripts pull in unwanted file-rdeps on
+    # /bin/bash, /usr/bin/bash and /bin/env, so drop it from the package.
+    rm -rf ${D}${datadir}/lcov/tests
 }
 
 BBCLASSEXTEND = "native nativesdk"

