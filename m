Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 40AD2605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 22:01:52 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i145so3649787ita.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 14:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vvq+Zp9M/Q8NdlqBFuYkea2sS8Wi+lRhHhL0n5uaa5k=;
	b=QoOLk8T+cyx/OP59YOA/U7H3k+BQCvYbvcw5WoSjkytGcXzfXl6ic59s+4sjMP5DmP
	qQLKYd2rdeY/SFJ+XXWE5c0ktR9qNEQ/IPNk7t7hXRaAjBIkCHoz4Lbvk+WiLt/LlOjJ
	0bhRYmTCofKVJtB59+P4CC16KZqfnaVFImoOYm3Y5gKRgDsBmcCng+uLkgdPSZpo2HjD
	6iVX1m2U+BEA1KK4OD3zqKbyvVdQhUc+EsVtHzhxIyiNIIQvuHw7OL+nzHnBnMuDuOxq
	DBTOmLyZEjPHM50lbUOmAHaek7Id0lL0hYULA5zSU3THw/4Euo4a4jcS8dJ+kyysg+Ec
	AiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vvq+Zp9M/Q8NdlqBFuYkea2sS8Wi+lRhHhL0n5uaa5k=;
	b=hrI/tadO8Epl487a4DluIkKBgjmNw4M/mM3TIHd2+kLiC1vbUN0Ke84Y9PNQxq1CFH
	7Avi7sbmnyz3nUwG+aEdDYBG1KQrwTB8K4aJ/4AS27SwdFdhHYGTbnEfdT7fMQx4gHkf
	O+EG5lwtKcwYxBb0XqEnnUxQIkqDXStw4+h/PhzMKqt5ScbDudupwGjK8TEWLAjgAq0w
	AgeCenn7DU7ES/PWRACuvU4HSxYk3diaeXx3c7x3rEGbE5sQJA61HMTs1gAzBySESSlZ
	19lUo+ZRWYcvgUqWL9wQdQ8sV5cqIioYodvUJrDFPty+zTvB2GDmhAwuX69ThJJ3q/Fh
	lZ+A==
X-Gm-Message-State: AHQUAubG8tMSCC1dJNuS0rkXa6WJ89YpaNxkW5Xj7fgCTbHx4Yur9S+5
	fDlOLmtGHJE2o/4cLZ5LeMtTSc1R
X-Google-Smtp-Source: AHgI3Iad3TmkZbncL1e3R1wqHSa3H3xTm30VQ9STYJcpX3LegJs4EUGK0eHlWYElYcQBLmnhvtxayg==
X-Received: by 2002:a24:64e:: with SMTP id 75mr1024216itv.15.1549317712936;
	Mon, 04 Feb 2019 14:01:52 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id t25sm576353ioj.17.2019.02.04.14.01.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 14:01:52 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 17:01:37 -0500
Message-Id: <20190204220137.26744-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] icedtea7-native: set default x11 PACKAGECONFIG from DISTRO_FEATURES
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
X-List-Received-Date: Mon, 04 Feb 2019 22:01:52 -0000
Content-Transfer-Encoding: 8bit

If x11 is specified in DISTRO_FEATURES, then make it a default
PACKAGECONFIG option when building icedtea7-native; otherwise, the
libx11-native dependency won't be satisfied.

The recipe reads as though icedtea7-native can build completely without
X11, but if the libx11-native headers are not installed on the host
system, compile errors in multiple units because of a missing X11/Xlib.h.

In file included from ../../../src/share/native/sun/awt/../java2d/pipe/Region.h:34:0,
                 from ../../../src/share/native/sun/awt/../java2d/loops/GraphicsPrimitiveMgr.c:31:
../../../src/solaris/native/sun/awt/utility/rect.h:31:22: fatal error: X11/Xlib.h: No such file or directory

In this example, it appears that GraphicsPrimitiveMgr.c is supposed to
be compiled even in headless mode, so the dependency still seems to be
needed.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 69f5d25..62dea78 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -11,7 +11,7 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
 	   unzip-native make-native util-linux-native\
           "
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
 
 OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
-- 
2.20.1


