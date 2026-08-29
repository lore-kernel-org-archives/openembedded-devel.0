Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A11FC61DD3
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:22 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.275.1787962273714671086
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JSSYz7p5;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1174856a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962273; x=1788567073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqRA7eKblN2xsNxOCCoXnpcsgnCNDKOc8OnO8uFtteQ=;
        b=JSSYz7p5tDj2PE/Ac4wQbkD+8l6BMfzt6JjmAlGQn5BgMiPjpihWbKhmrUL6dDBfP5
         dggi9yp2SR2eDbQgzKNyCU3vcPH8OGDSElQ7DHL0E7TT2UqOr8yAVlFOs+YeD06FtVx6
         hkEYMTxCKY2gpr3i3/sJ6vrcutd4EKRyIRrxU6kcCuBMHDV3SVM4zjRLkIQOK2/JLW6f
         I/UH+kT3ynJHguMIYEfqLMknNAMORtlNHDz5hjBzM1woHqy3/TE8G4rVc97trxIz6Zub
         VSwADY1fivL5I+2yWbzpqelBXCCO6ek0z+ykGLQq7DH416c71MIHkL5Ye/XS7dMUY1kR
         JR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962273; x=1788567073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqRA7eKblN2xsNxOCCoXnpcsgnCNDKOc8OnO8uFtteQ=;
        b=G6KletjGkbcc1XU7znFZOlDtyqqqq1qaKn+aPgRl8xiJj1ZMxaUK1rhw5Sf4CloJSV
         D6O+rE3e2/fZgG9zhLhHfYVXsRZxR0FoSmuqI1tfVV8mMed1+tmnqtrGWUVb4hZ+QS7o
         XdwY5/aIo7kcqvPF0OVNYuW9pjO+BHRCxyXXP5XBR1Fbf1C+pBDIQ+7upge9EMyTC+lj
         a7fqUygrvvF+PLLOR4AuMvVHqDmO6Sps2hseVm/V43/EIvSUVhEJwPDzz9vQbzvchVFo
         ocdnxAlpVeR6KRz9W6KCyxPZAN2uXk2pqx3dDOZDzAGnOEL90GCJYzfGKfkkSbB/2PcF
         PiFQ==
X-Gm-Message-State: AFuF++n5iTrWFgg5Yyzl0pIE7W3QawTx4X1sPGHBlP6U14x0BXR79EsD
	CRHCpqf592ME8QXEU5z0AijWP3coFncXo86oTdzS8qbughh5EX2HASU1ik1EJrrH
X-Gm-Gg: AYBFou1hRMQ4bMUMya9mr0NB3Ak5Dx5Ew3cqJrP2mR9dxtfL5yQWSs/P1EatAcD++lR
	KJepubClCd931h4zgBOGfyY3OvsG9+e2RfYt/15Sg1UTkkTztYK2pmGLhqISmVrzmYhigWoL9Pm
	nwaHrgrJxq63vBCS+0/4v3nxOtW4exIX4KEedhPlgtUtVVbrI3KlFAuM8tlo8oQUyqalj1DfiU0
	4yonIMTM9F+uE9NG1BONYsaIPC96kljFeDbAnZRtR3UhfKZXP2y2PgiAluz2DGGcX2bGvYJjMym
	ln8Y9q7u2x3wM1hOdv8etPKbucRxv1qkvbgJl0X3JMIc/XAi/r+MGv6UQzMFjzjlLjECSYLayJn
	e88MczLTcXvFQgIHmxhc8InJT1bhV/qZrvE5CrCeThj9Xx8g0eGlehmMISGP5Y/CzGx95qL08YQ
	+CzIem2903jdQ0gahgKmvqrARGy4gsVnN1y7aYTO0XTbm5YC1grO/jyt5gtmjqO30FbUgY1EVdl
	6f1G1Yjc+0M2ouF+JqyeMgfU2bYAmzl7poqLVMjMVXF3lve2Ey1TwY0TeqBcPQrsW/175iNnA9Z
	R2Q6fzNelI1kKBwCCAJ78sZ2Ead82PDvpiYK1SrezKLs7nOK6rBmq6UL+SCpgn3Roj7puYK4hHN
	3doYqPlcKw9ocFrPrqAzZfw7nyB0d3snuuDJjOmv9+2aPqq4=
X-Received: by 2002:a17:90b:5108:b0:398:9c00:29ea with SMTP id 98e67ed59e1d1-3989c003c23mr4705933a91.18.1787962272768;
        Fri, 28 Aug 2026 17:11:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 01/16] python3-bleak: fetch git tag with tests/ for ptest instead of PyPI sdist
Date: Fri, 28 Aug 2026 17:10:52 -0700
Message-ID: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129560

From: Khem Raj <raj.khem@gmail.com>

The PyPI sdist ships no tests/ directory at all, so ptest had nothing
to run from it (pytest exits 5, "no tests collected"). Fetch the
matching git tag instead, which does include tests/, mirroring
python3-pydantic's fetch pattern.

Also set asyncio_mode=auto via a ptest-local pytest.ini:
tests/test_adapter_deprecation.py has plain "async def" tests with no
@pytest.mark.asyncio marker; they rely on upstream's pyproject.toml
setting asyncio_mode=auto, which isn't shipped into the ptest package.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-bleak_3.0.2.bb             | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb b/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
index 022582e0e9..4d1e0b1666 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_3.0.2.bb
@@ -3,14 +3,17 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRC_URI:append = " \
+# The PyPI sdist ships no tests/ directory at all, so ptest has nothing to
+# run from it (pytest exits 5, "no tests collected"). Fetch the matching
+# git tag instead, which does include tests/, mirroring python3-pydantic.
+SRCREV = "bb49377d38afb3a9fac9022aaf2c8f59d4ef7cfe"
+PV .= "+git"
+SRC_URI = "git://github.com/hbldh/bleak;protocol=https;branch=develop \
 	file://run-ptest \
 	file://0001-bleak-Support-newer-uv_build-versions.patch \
 "
 
-inherit pypi python_uv_build ptest-python-pytest
-
-SRC_URI[sha256sum] = "c2229cb8238d5876b4bd05c74bf7a1aea1f88da39d2e51ac9dfd5cc319d5265f"
+inherit python_uv_build ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
 	python3-asyncio \
@@ -24,3 +27,13 @@ RDEPENDS:${PN} += " \
 	python3-dbus-fast \
 	python3-xml \
 "
+
+do_install_ptest:append() {
+	# tests/test_adapter_deprecation.py has plain "async def" tests with no
+	# @pytest.mark.asyncio marker; they rely on upstream's pyproject.toml
+	# setting asyncio_mode=auto, which isn't shipped into the ptest package.
+	cat > ${D}${PTEST_PATH}/pytest.ini <<EOF
+[pytest]
+asyncio_mode = auto
+EOF
+}

