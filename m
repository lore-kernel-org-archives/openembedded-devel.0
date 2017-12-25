Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A2C3D60766
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 18:09:01 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d202so17255595qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 10:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6X7FYpbEROqjMqTRUOxqSDtEnkiNhNr7Dy/Lq1RKl1o=;
	b=r0JodqLhZSB91mvVAadmJhqAnxK4PM/sHSVHk0UaXwohNxhGAy2BKaZl9mSd/4lqf0
	yXM61YN1MI0qlrScRa5Fa1ePx2oZ46zbVSyQihWTOMjW38tWtGNfqjFILrrs+H2kgf0c
	cwhgRKjCw2GOor3GZDSs+8e7dWmqnSZ1OsvpXV+PsjEfib6lHHCfcfIa0Pv2rIC9+hn6
	qTKhTAQJ7ZiAb5wxEe6NOkwIo4HDxVe+7t5YXnNShgCU5LC4f4jMOERH9y7/A2p00IB9
	EcZXyEzJxjZbuuVYMJHuG+3R0wHlo6eyDbSaAjjR3pYpg/8LtP8w/yWAc5wF81ssXR/t
	nH1g==
X-Gm-Message-State: AKGB3mJzeTGGZTiEs8gA63usmajpggxEAdjcveRrQ9DEih+XRufSP8sX
	cO9cGHKE0iagK9hCmG78ydM2PFee
X-Google-Smtp-Source: ACJfBouSa9JnATSG4jV13CTvNIWjeyrVU7KS/+iZZhPLHU8fBqRGipZDnLNJDgzM7G/2xjz0uqX7dQ==
X-Received: by 10.55.26.84 with SMTP id a81mr29125074qka.303.1514225342013;
	Mon, 25 Dec 2017 10:09:02 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	t48sm18365484qtc.10.2017.12.25.10.09.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Dec 2017 10:09:01 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Dec 2017 13:08:52 -0500
Message-Id: <1514225332-25796-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisc: update to version 2.4.85
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
X-List-Received-Date: Mon, 25 Dec 2017 18:09:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc                 | 4 ++--
 .../python/{python-pymisp_2.4.84.bb => python-pymisp_2.4.85.bb}       | 0
 .../python/{python3-pymisp_2.4.84.bb => python3-pymisp_2.4.85.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.84.bb => python-pymisp_2.4.85.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.84.bb => python3-pymisp_2.4.85.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 4abaf97..6e248dc 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "0fe33de8e87120a46f917cb6bfa7baee"
-SRC_URI[sha256sum] = "6f228e4050252002bd9093378e687cf5eb963fd8fdf3e561453376eda7bc396a"
+SRC_URI[md5sum] = "5191db549c454af2ff05d82ce789052e"
+SRC_URI[sha256sum] = "571f1c9b0f0a1df8837c1b4f2ce4fadb8ad78e572a91d83cfedc3300753f21b8"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.84.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.85.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.84.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.85.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.84.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.85.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.84.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.85.bb
-- 
2.7.4


