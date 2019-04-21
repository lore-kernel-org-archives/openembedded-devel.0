Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 602CF6079F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Apr 2019 19:37:23 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id t4so8668749ljc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Apr 2019 12:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=dO+qr4SGuM/wgjkmKiUs1FwpByAm6kDM8NKm3Pp1u+M=;
	b=gtjUYCe7MajJO4md8d5aX18RgsiZK5gki2p5pc5gpZCSPSKgrRy46EThYYiylMQlKX
	DA61u32LF7KlX2ublHcUJu1/Q+swxdplyTC6MWbJ+z7Kj+nEoJnDlvgKIxnBe7uQNVGN
	L2x3J90CrsO6DHkzk4oFhyNIgzrV08Aog+MClwe18Hi+RvHdZym7tBLa0rcKtyEO2Fpa
	dSX6Q4dDOATr52RDCx23YS4vJFoWP8ctwrS6eceNj3YAFdDrFQ2aKoFUXHE6ohAw/1//
	3Gj2VlKzoYd/uGW0XJmvAEKuyrt12eCSsvzvC29H+4juUrYoE0OAXXqJ9I2v3Wa4iYjX
	4ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dO+qr4SGuM/wgjkmKiUs1FwpByAm6kDM8NKm3Pp1u+M=;
	b=CElPoZZyktZ/1/k4jJxZHw/88DHuKigjUMDTNGtO77cxAK2oOAzl+JRyljQ4Ilb7Gf
	9kTj7ObXqRNE4YmaSy8KO87YKONgMJBDSs1lU0xrpBsEfzPD8XRINn4Xr+38cnILUlUx
	uvjeUARuTA3Tv9eACRaAlsvCaJYZUqluiAJ9dhwouLitybwE9XCC8eIcy6r6YRPZqJdy
	/qx/SbURxbZ2t9JlPi4wHI9RYTqLc0/6+duHhjdbK9Na2NBVlFbAwcDZWJExV0sI+CcK
	0LtF4Bn23qg8DOIRROI4FwMxOMtpyEVgKb7J9EmNuiXk+mt/2DyLOMIRGlN88Knb7T20
	5G8w==
X-Gm-Message-State: APjAAAVaAAUHPlDT7uRqd+S+CQvMr4TVNCZts22w8uODCqdy/80mR2Uk
	Uf+bfRiT0nGFXDQ9b4KSLmj1afFLm1o=
X-Google-Smtp-Source: APXvYqwDHVX/UM/oBpbtI/FsyrwGtY34SPutN2eA1HYVHl3VzwEjY40UJ07iE0hXcVCTyk0gPxaQXw==
X-Received: by 2002:a2e:884a:: with SMTP id z10mr8550125ljj.21.1555875443435; 
	Sun, 21 Apr 2019 12:37:23 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d3sm2350899ljc.15.2019.04.21.12.37.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Apr 2019 12:37:22 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Apr 2019 21:37:13 +0200
Message-Id: <20190421193713.4794-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] xl2tpd: update to 1.3.14
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
X-List-Received-Date: Sun, 21 Apr 2019 19:37:23 -0000

License checksum changed due to formatting change (see @1611d6f028fe3).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc       | 2 +-
 .../xl2tpd/{xl2tpd_1.3.6.bb => xl2tpd_1.3.14.bb}          | 0
 meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb    | 8 --------
 3 files changed, 1 insertion(+), 9 deletions(-)
 rename meta-networking/recipes-protocols/xl2tpd/{xl2tpd_1.3.6.bb => xl2tpd_1.3.14.bb} (100%)
 delete mode 100644 meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb

diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
index d037c7cfc..b3d466c3b 100644
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
+++ b/meta-networking/recipes-protocols/xl2tpd/xl2tpd.inc
@@ -6,7 +6,7 @@ DEPENDS = "ppp virtual/kernel"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "git://github.com/xelerance/xl2tpd.git \
 "
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
similarity index 100%
rename from meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.6.bb
rename to meta-networking/recipes-protocols/xl2tpd/xl2tpd_1.3.14.bb
diff --git a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb b/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
deleted file mode 100644
index 88ae5d6f8..000000000
--- a/meta-networking/recipes-protocols/xl2tpd/xl2tpd_git.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xl2tpd.inc
-
-# This is v1.3.6 plus some commits.  There is no tag for this commit.
-#
-PV = "1.3.9+git${SRCPV}"
-
-SRCREV = "f114c10ac532051badeca0132b144a2f1596f047"
-
-- 
2.17.1


