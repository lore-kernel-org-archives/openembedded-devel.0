Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8358FEC10F
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 20:40:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7146.1774384841158939327
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 13:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LNTLj7ms;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so41010255e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774384839; x=1774989639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DCOrwT0nrpanqfAOQHG/JvcAtxFG3qMySmZKmGMO1+Y=;
        b=LNTLj7msGCMOCRLYtACogkjVnVyDE0dfTMqfYedjjrta/LL46T5mLWHs3FClFC8J9s
         QAHfm/AlT+4eLeBluakDJpVgkcgScRjZGgXMv5SHqiz4mTYm9774h5Y8xqVi/JhGQYYf
         Eyuywj+4yQfAJDit3SlA221CAASNu3DH7sq5Lz8du92OM7qtbHGLJiZYcGq+PjjCA2X8
         J0chUilZ+E4DpOph1wjCTDbeOduh+ZHHxvk56Zq/GQ37VSnSDE9Uez1d8NGJnyG5rJOp
         oTudgFek7qmIZS43QRUhnYPw8884a++dedUs56qvxWLXfJgSwWBePEmEVBimqnUZPof6
         CLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774384839; x=1774989639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCOrwT0nrpanqfAOQHG/JvcAtxFG3qMySmZKmGMO1+Y=;
        b=MRRvbNTICtg4rD8hZwnr0N2BhS+23T4fVWFVDYr7vlyI6j+WRJmbUvEkd2zTRlfM3L
         +qfI71t8t4z/7T9dyXYELpMY5jx8mc3M8rD/F9gxzA552v12Jw0G+j+dULO7h/7/7+uL
         RP8KYLDk81G5XK0BFMuW8visifXYOGijnXEwkMC5rd28on1Hn6ToVmDQUrx4qRKvcf9K
         5A+yPhKdWXGWBqJe4CBe22yhWXmQR/4xPZbNCGkCn2hXk3b1hob8PfUF2f38CI5+uCby
         lK/XjQ0yZfe/EdB61x4hhvCA7TMSuogvUAKFhAHDKScVp1dv9h0FvxRC6TXbuGcu4MSz
         eqWQ==
X-Gm-Message-State: AOJu0YzM7/C4nh2nYNXCfriD/g7FeFXrft4PUH+w1CJWfDMmAssbTWX1
	g/y+gpXZI3/TpAyinrX6dbqxTi8R42tFRJrTC25gUjH47IDPePsUQktdjFbcTQ==
X-Gm-Gg: ATEYQzylfxF49n62WQPSd5SCFTwivAUKZ2k1K4u6BEj+k5SF14Py6c1bxJ7yy+Fc+m2
	RY/QsfWeh/Pd6T3u1NIacL9ymyZbhLyJgaVheF/Uu/Pyq56/mIjZIJ5Bzm0poQ0iJ820SfXEV2k
	1hP57+CaSrvidjdgX8alhcrBZwPXt2gSQ+0FEuAckQGvjSy+ja3w5ZObM6EWP2TfrmhHTthkCha
	kUorRJxAwR/J4XiO3yzDBLPAA7rpOap3lcIL6cRBJlbEyCsd5nefcfJAbw3mRK9SaaBy7781B9i
	q9X8fcaXPYIS9+40JTjVrIbWPohH2VcOoyfsCEZAZS9mNCF6QjEHlIoSbOgl5gJAiXIc7TVKxKb
	kdutJBfYsIEkkGViGw1Kp4XEGybl5yJAF512QC3+fA3nApOrm9N2hJyP0sw7L2TzG+/Whx9asL2
	Tgun5Nixhprqe/asGdDM/Z
X-Received: by 2002:a05:600c:a112:b0:485:5c6e:8a38 with SMTP id 5b1f17b1804b1-487160429dbmr13425395e9.17.1774384838998;
        Tue, 24 Mar 2026 13:40:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711709b48sm67647085e9.7.2026.03.24.13.40.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:40:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pykickstart: upgrade 3.63 -> 3.69
Date: Tue, 24 Mar 2026 21:40:36 +0100
Message-ID: <20260324204036.3903707-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 20:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125592

Ptests passed successfully:

Testsuite summary
 TOTAL: 506
 PASS: 506
 SKIP: 0
 XFAIL: 0
 FAIL: 0
 XPASS: 0
 ERROR: 0

Changelog:
3.69:
Makefile: Drop coverage-report.log
Add Fedora 45 support
tests: Use pytest-cov to support coverage of parallel tests from pytest-xdist
workflows: Use latest released py3.14 and py3.12
test: Use pytest-xdist to run tests in parallel
tests: Use ThreadingHTTPServer and threads for load and include tests
tests: Mark helper classes as not tests
bootc: Add bootc command to the RHEL10 handler
rdp: Add rdp support to the RHEL10 handler
raid: Update RHEL10 handler to match rhel10-branch
Fix handling filesystem labels with spaces

3.68:
commands: bootc: remove 'experimental' warning
rhsm: Add Flatpak registry option for RHEL10

3.67:
drop python3-build dependency
Add Fedora 44 support
workflows: use py3.14rc1
tests: use pytest module instead of unittest
spec: Add python3-pytest to BuildRequires

3.66:
workflows: Use py3.14 beta.4
pylint: Ignore files in .git
pyproject: Bump setuptools to 77 or later
Makefile: Stop running setup.py directly

3.65:
workflows: Add python 3.14 to the test matrix
Add support for RDP
Deprecate VNC
docs: Fix chapter numbering after adding certificate

3.64:
workflow: Add python 3.13 testing
tests: Remove unused import of constants
realm: Clean up documentation
Add support for new bootc kickstart command
Update documentation for clearpart --initlabel option.
Update the %certificate section documentation

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...{python3-pykickstart_3.63.bb => python3-pykickstart_3.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.63.bb => python3-pykickstart_3.69.bb} (96%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.69.bb
similarity index 96%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.69.bb
index 830e46a63c..c566f5a0e6 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.69.bb
@@ -33,7 +33,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            file://run-ptest \
            "
-SRCREV = "6e0d1238cb4696a9040072a5a28a706e5775c552"
+SRCREV = "601ec2d2f254909f56e2ee961d2056e0d5bc4a97"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 

