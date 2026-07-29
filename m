Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C31CC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3026.1785293066745406423
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=phFANkef;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caed617615so6249755ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293066; x=1785897866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyTsiBNuVBxUat+VwsR0sTZkaSpImtj6Xp0ia3kMpUQ=;
        b=phFANkefY2/UHeg1exKNnpmbkljeg74UQjxFwqinjMaWvySUIbNEA7WeqUi6fQE8QQ
         t2RoIzyCyrd/zcYPIQrWTPXxj6wUMH0Ypji4DUXnDoy/Cjsbg/zIUhPOqOCa9V5AVjjb
         bKgCeniWy0gl23mp74P1AKPGhhlLPF3o5qGGXKeQf/2KPAMPVSlk0q9NlQ2GqirinbPN
         RXHXk8kqMgT0G50TK1CUXn03lYXSCYNbASdPtcurui7AoW2azwvvji06EfDYOneEu//W
         cndmzoW8C+GvqroNkVPV0h/RjYnFVfhIs2NyEdL6+TTQU1BU/esoYbNGKZV3Dr1MobNJ
         G6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293066; x=1785897866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IyTsiBNuVBxUat+VwsR0sTZkaSpImtj6Xp0ia3kMpUQ=;
        b=Ba1CZMzjYvLDlNFF4a2Oc3S9W8sIoEpGXoFQZ10jhy10cYr1Vt+BDNPw9MEUG+v6x7
         RrdLntcVOSVvQMO544g5M1KskWpN0fFLZxcNl6GmyKdsYCm3TKRWVfObVHu8OCYLRhNy
         o6on40FnuhmAXTLsq04bRkhi2nkPYvhjVRYfSUc345eBVmCrnS1Upbx9lpqIuxgWAkeK
         meHA22oUiQXhO0zMfJe5HtbZOghaQwTKwkkAzv7PiwCjHg/G9RuHL6RZvGP9FTvbWxeP
         ymWGzb2JM5VQgFU+zscSdYSWLIPJ1FsOF182TQ/GMfpAzHEN4ohe/hbzavhStClOEuOv
         hIJA==
X-Gm-Message-State: AOJu0YzFDQ0JGRUDMTz98hz1Mh7V4YWiehZImtd21bWn+b0ds1/Cb8RY
	Xas1b0bKfjLrQPJbo78iv2EFXoexEnvBufSCygPl98BJXHdM0qcjzQrbTtwFA60/
X-Gm-Gg: AR+sD12AR3PUtGOcMDDsL81ntPq3DfIyCD8EVGiuNcumkLQgFq6u0IP02ej+R2tnONR
	4H9r/N4DdWGlmVqoo6+ZN/xxJtMrZJrIPM84YHhx0UHWw38gIEblHyjhW7B5N8YBc6aMt/Z1XG1
	RXWoaBIAo3YFEFngasIhNZJOJnEjEX8yufzG03cE1NkTajXg5TgN7Ft3C1blqVNrBPb6+U4v+J1
	3/i/tlh/e4/bgB5KNnQmJHIO8ceXCd7mz3mxBVrUijRsWGFhOTdekVZ3mC3dkmUHjhkYhlqjoV4
	f599TZlMuzhVDU43eaEGiP2xQLTjbOkAVQlhMOCjI3hkXD11/avAxzliRJkzayfmPlEdKOKI12k
	tqhK1iB1arIZHEtZJ6vXeG87QQED9sOcCr4G9K3AXJkuS+B6RKJV9uWk85/vkuOCqaJD+vX5ttj
	cEzsVy7rTlEauGHreMiPYhdk9+aIKI3sqBe3Ly7ViZ3xFerlNKa8drGL4modl12KpltPlsM43vB
	Vcj+cTOb1e6p0/2lFRG3MS+RZy5qTJJlEe1vvmVh0ekKAp0Igw/KGoyWgJVZ7aDFHxrjX1I17Ln
	A+IXbqcApKsT/lpebCER5sq9FdpZxBw7QI++/hPdjN9YFKIFF/mBtspaOgBJUgDbtSeDht06CAu
	ldQ==
X-Received: by 2002:a05:6a20:7291:b0:3c3:a140:939e with SMTP id adf61e73a8af0-3c8ba5f59a7mr5240850637.53.1785293065805;
        Tue, 28 Jul 2026 19:44:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 03/18] lcov: upgrade 2.4 -> 2.5
Date: Tue, 28 Jul 2026 19:44:05 -0700
Message-ID: <20260729024420.2328180-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128519

Changes:
- Add support for the --unreachable-script callback to filter unreachable
  branch and MC/DC expressions.
- Update llvm2lcov to support llvm/22.
- Generate man and HTML documentation from RST sources.
- Various bug fixes and test-coverage improvements.

lcov 2.5's install target now generates its man pages (and HTML)
from RST via sphinx-build instead of shipping pre-built man pages as 2.4 did.

Added DEPENDS += python3-sphinx-native python3-sphinx-rtd-theme-native to
preserve the man-page packaging behavior (the install target hard-codes
"man html" and docs/conf.py uses the sphinx_rtd_theme).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-support/lcov/{lcov_2.4.bb => lcov_2.5.bb}    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcov/{lcov_2.4.bb => lcov_2.5.bb} (83%)

diff --git a/meta-oe/recipes-support/lcov/lcov_2.4.bb b/meta-oe/recipes-support/lcov/lcov_2.5.bb
similarity index 83%
rename from meta-oe/recipes-support/lcov/lcov_2.4.bb
rename to meta-oe/recipes-support/lcov/lcov_2.5.bb
index 4c121b9cf6..2f3e787dbf 100755
--- a/meta-oe/recipes-support/lcov/lcov_2.4.bb
+++ b/meta-oe/recipes-support/lcov/lcov_2.5.bb
@@ -8,6 +8,13 @@ LCOV supports statement, function and branch coverage measurement."
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+# lcov 2.5's "make install" target now depends on a Sphinx-generated doc step
+# (docs/_build/man and docs/_build/html); the pre-built man pages shipped by
+# 2.4 are gone. lcov 2.4 packaged man pages, so preserve that by building them
+# with Sphinx at build time. The html step (install forces "man html") uses the
+# sphinx_rtd_theme, hence the theme dependency too.
+DEPENDS += "python3-sphinx-native python3-sphinx-rtd-theme-native"
+
 RDEPENDS:${PN} += " \
     libjson-perl \
     perl \
@@ -51,7 +58,7 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov-symlinks \
 "
 SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3457825c6b2fe4ef77c782b82a23875c84a3c955243823f05d8f2dec0d455820"
+SRC_URI[sha256sum] = "7e5e5a154bd5f3557659c328cab376764e7abd238bb403c424472c296b175126"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

