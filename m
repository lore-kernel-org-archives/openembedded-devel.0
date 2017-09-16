Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id CE612783AE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 22:38:44 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q8so3631527qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 15:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LXZvz9jDnXVk4Ppj8kmjthtO9/lQ+9KLUrmflL99Rd0=;
	b=gKcA/5ioRaHF8y3+VBYGbjBDURSJQq6nVfJ1XqUhvAdOT+B41Qqq9+E6/5P06807Ie
	rB8DyZ6sfFDrbHpHGPBuvnyd7dqXywR7eL1TeKuYEJWsfF8ncXjnvFZsz4qGJjCBjSk/
	RSBllMPak/rPJkD/QMSu+5KfcS7EJsXi7Kh9YT3Fxt86aIcgU2WfJlQy6PsD17pgPIfy
	KtbfQTmVtQpi92kp9RXbx/p0+VeNoZHSDFvezU8Y7tqtpcaCXp5dbuVexWEPWaJEwTt+
	jSSy16G8YLLobNh0kcMTD2zRCMkJUc2BJNGslx8d8PuX3nh4BI5ei607H/zUPxNm6kwD
	gIHw==
X-Gm-Message-State: AHPjjUgx+CKZ2HVVo5htd1J4xqIo5kgLjEqvubvtXBuxMFnY5BXcvjLh
	iNcJyJsaJuT090NAhcc=
X-Google-Smtp-Source: AOwi7QCUmFv/0R2oX6HUfJvBWA043EI5DHXkpqE4q247AgdEs1bJL2vlBn3sBRKIzWCUH5g7Nx/Vqw==
X-Received: by 10.200.46.124 with SMTP id s57mr28360656qta.182.1505601525375; 
	Sat, 16 Sep 2017 15:38:45 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	v11sm2749536qti.95.2017.09.16.15.38.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Sep 2017 15:38:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Sep 2017 18:38:34 -0400
Message-Id: <1505601514-13800-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pybind11: update to version 2.2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Sep 2017 22:38:45 -0000

Update license checksum and verify license terms

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pybind11.inc             | 6 +++---
 .../python/{python-pybind11_2.1.1.bb => python-pybind11_2.2.1.bb}   | 0
 .../python/{python3-pybind11_2.1.1.bb => python3-pybind11_2.2.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pybind11_2.1.1.bb => python-pybind11_2.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.1.1.bb => python3-pybind11_2.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
index adaf289..e273a8d 100644
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
+++ b/meta-python/recipes-devtools/python/python-pybind11.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Seamless operability between C++11 and Python"
 HOMEPAGE = "https://github.com/wjakob/pybind11"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ee5f0682c5afe930bd8ae42c96fe7bd3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9b27fac7e937323e3de9ca3a7db38e37"
 
-SRC_URI[md5sum] = "67752f9da3ce822b5bd6c55b41b89d3e"
-SRC_URI[sha256sum] = "c169a384ea046a1672ac83e9aed30660133e9bad3afd82fa99b794df7b416f6d"
+SRC_URI[md5sum] = "f454d8991f47befe56d4126df861fc96"
+SRC_URI[sha256sum] = "a96a924fae6e2721efbf24f47561284fd1ea0b655619a8621c4423036183b824"
diff --git a/meta-python/recipes-devtools/python/python-pybind11_2.1.1.bb b/meta-python/recipes-devtools/python/python-pybind11_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pybind11_2.1.1.bb
rename to meta-python/recipes-devtools/python/python-pybind11_2.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.1.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.2.1.bb
-- 
2.7.4


