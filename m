Return-Path: <scott.branden@broadcom.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFB361089
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:54:09 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i6so5694494pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Zr7fx7X9wFsHY/T4YKsdYsvbOE30W2aLOpoUDBh5DcY=;
	b=HINKCgEs2OjvKker11BDoh96prTbmGTyGk5zwF8oo2AgOnx3oZTXnXU31/DK7sDhlF
	Y76Gyo1fUuPbp6pt66+TeN3THE/MIltX5/tI8yv5iJCXEGkaxtPDzb0Ma+7CVS6ZJjy6
	FZG9dpnhfyS2NtgWv2YCPnFcuRE+BQmkGdJl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zr7fx7X9wFsHY/T4YKsdYsvbOE30W2aLOpoUDBh5DcY=;
	b=KH6OdR0IjtRmlQvMCMsFZFn8ie2P7K+o8inZT/KWq+fHo7Tw9LiUJxbsepBncEJgmZ
	/uIzvP3DNiMuqK7usojj8otu8a+RpEZsTyjyrKLUAmsXKZBn9NScI+q70kXgGNc+zb4M
	6MeZLC9ydtpErRQuurhvClHorlg3c9IiHqATFuPf+7qvRe3lQzWDtpDXbHUG7S+Wm4y1
	S2qX2QAhMuIrwBQ6jAGPDDayLlrqczBSQfcqLhOWJz7Xe0XcHasdyEL9a1h+GmGUqhCL
	59KfGEizQzt22PDConqHMiTjLSsj5hOTA7Cs+apqVIH9z46aL+jSBqb5nRVQ2gYVfxHu
	l05A==
X-Gm-Message-State: APjAAAVse7E9y0hM02kicLqnpsA7IObFuDti9GdFaA3uOYW53eXicR7d
	LRvjCqUOrcSYqzK4O3vxYahA+cx58jvSqKel2aqGoxZ8g+n7ZSrBuDCtwxyUdjEufaJAe9gJi5d
	uCQj+QPVZyAkWhkGWjXP+kWDTXtZKwpIQctbIft4iGSMxMLYMNQXV/Zte6ytFW11L/+kZ82Ytbv
	rg84tHs2nym3MLj6YUOHn3SbjC2nrF
X-Google-Smtp-Source: APXvYqwopwPdzAE0QS3+nNgQKcyqrhWvZMhOUhP6e96fpg7K4hBkrpBqJToSgrMyFdh/ZzxWML7nGA==
X-Received: by 2002:a63:9856:: with SMTP id l22mr3344441pgo.344.1581728049489; 
	Fri, 14 Feb 2020 16:54:09 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id y3sm8550032pff.52.2020.02.14.16.54.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 16:54:08 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 16:54:02 -0800
Message-Id: <20200215005402.18661-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH v2] x265: add x265 recipe
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
X-List-Received-Date: Sat, 15 Feb 2020 00:54:09 -0000

Add x265 recipe for latest tag of Release_3.2 branch (3.2.1).

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../recipes-multimedia/x265/x265_3.2.1.bb     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb

diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
new file mode 100644
index 0000000000..21ae596e05
--- /dev/null
+++ b/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "H.265/HEVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
+HOMEPAGE = "http://www.videolan.org/developers/x265.html"
+
+LICENSE = "GPLv2"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
+
+DEPENDS = "nasm-native gnutls zlib libpcre"
+
+SRC_URI = "http://ftp.videolan.org/pub/videolan/x265/x265_${PV}.tar.gz"
+
+S = "${WORKDIR}/x265_${PV}/source"
+
+SRC_URI[md5sum] = "94808045a34d88a857e5eaf3f68f4bca"
+SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b58cbbcc"
+
+inherit lib_package pkgconfig cmake
+
+AS[unexport] = "1"
+
+COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.17.1


