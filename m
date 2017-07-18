Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8011D77E88
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:35 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id v190so1059005pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YuVJSkjymcQ2UArvQ4MYPSrlePelBzsEK1KyMi8GrQg=;
	b=HvvlVQjby4TCqb9V/grko5AjU+iL+BMJkE/SMdL4rBFfnrxp3nkKGPb/8eFjE3D8Hs
	B+GeMZLw+ab1+OySd7QhWRcLwlx3oGXT2FLT7V2srSBKgndeUcGNRqWRIA6WDmCEe1oX
	e4WGGMKzSvbZWS+nva7ej+bkB2+eIQCtni318TnQi3gw0enF0pOQp3EIege8IBKJA2K0
	jxllrtB9ukwtAh0eBNmXp1TRmFTOwhhyydne1EI7yDM7G+Q4orleZwoLRt/xFQWD2OCw
	XcTJNkpqRrHGPXfwYHalW5S9vmTaE+Cr4wrkK8cWk3MCqT8gWCEAOf/rnnDPMDmBVSwI
	L/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YuVJSkjymcQ2UArvQ4MYPSrlePelBzsEK1KyMi8GrQg=;
	b=m44Kq5ySGp3DriUcT9K1UJfv+xdZLgTl+YYJEcMwYMEGFhrvJXQ3+iOx6Nqxfoh5xg
	9znp2GZ3iDo9Z1/1TDUjQIrA2p85GOzhmj/HudK/WKw9DPcb/fGSqt4//8f2WjTE0WAL
	qYodrGk4dzQi6HJPBlpat7sjRDouh0LgL7pX/ACT+xq3h4E2n1MFqH9NvxPJxZn0RfPR
	rioXqvYSy7H1HD34HIbGrMOdp4wM7a/3Cx7CjZTZQf7HkSjXStu7Z+PNuF/vOkyQrBWX
	++VPJLL2jamDtAWKEVdbg8k5258m8N4qLAJgyx0eXuwB3VwPsNpmyNwy999O6HJv2x5Y
	vFCg==
X-Gm-Message-State: AIVw110dcvYQ+P4CmH/UloxXuhZ4SdkRfqyPhcaDF2rEmW0YPWKK/wcl
	X1ferjkBCVt/BTKP
X-Received: by 10.84.133.11 with SMTP id 11mr841626plf.77.1500347436624;
	Mon, 17 Jul 2017 20:10:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:05 -0700
Message-Id: <20170718031013.44536-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/17] numactl: Update to latest from github
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:35 -0000

There are patches to compile it on musl upstream
therefore switch the SRC_URI to fetch from github

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../numactl/{numactl_2.0.11.bb => numactl_git.bb}                | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/numactl/{numactl_2.0.11.bb => numactl_git.bb} (88%)

diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.11.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
similarity index 88%
rename from meta-oe/recipes-support/numactl/numactl_2.0.11.bb
rename to meta-oe/recipes-support/numactl/numactl_git.bb
index dd159a3b1..f2d9a1760 100644
--- a/meta-oe/recipes-support/numactl/numactl_2.0.11.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -10,15 +10,18 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe198bd9"
 
-SRC_URI = "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
+SRCREV = "ea3a70681c2f523fe58e1d44527f478ca76db74e"
+PV = "2.0.11+git${SRCPV}"
+
+SRC_URI = "git://github.com/numactl/numactl \
     file://fix-null-pointer.patch \
     file://Fix-the-test-output-format.patch \
     file://Makefile \
     file://run-ptest \
     file://0001-define-run-test-target.patch \
 "
-SRC_URI[md5sum] = "d3bc88b7ddb9f06d60898f4816ae9127"
-SRC_URI[sha256sum] = "450c091235f891ee874a8651b179c30f57a1391ca5c4673354740ba65e527861"
+
+S = "${WORKDIR}/git"
 
 # ARM does not currently support NUMA
 COMPATIBLE_HOST = "^((?!arm).*)$"
-- 
2.13.3


