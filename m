Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAAE77A57
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 18:45:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id p189so22610118pfp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OabSbNa78za5zDBgx7o4gKNNJEwT85/fQlbocAxmjTk=;
	b=o36Y+nBR/c2KrdWSxcecZpcIpBkRSB+XJ91QqL73g03u9IFiZyIqJiBSjGEHqwBCpx
	npseRG1hwjC5Ko1JsByakRndsPcs+u9Zf7WMWPc01iIy2fSwpV6Cr1pWBnhXxAWNPtEF
	3xa+p3hrxYkjpr+dvhzUCAQdO4fvpbdMICKyWkLCAkVJcZprC/Uu4R/qI6U5cSkI9it3
	k9gu0hXVz4bt/W6g8xYNXLyIT8fDTLm0Mm5qNid2Tct/IXeVeA2MWfVoW0yzDE0vdRHp
	fKmxV4DwlSNpu0ArT3NaPp5ukZwyP1pGljAxV4/s7Ror5AxBnpHxsO6mVDH9zTO9qQ7/
	Y9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OabSbNa78za5zDBgx7o4gKNNJEwT85/fQlbocAxmjTk=;
	b=JZL2gwRP8e7rMZB+JSiIItJ1/ZYRqw/hoyL5ql3h4SfskDyvq6jmH2giD6TZ1eVPCl
	BQY86OBhJkYpxojbv0EpHxDDwYBB+/JNAWZj5wOryFMqayA1Ez/4SynZuGXRX7Taotm4
	Xy54tB9zKmaFv35DY6QVtRyv8cKbRIC0+9IUp1z13sx8ilVGxlJSvChk796wxmX5aP5x
	8JJ7LCUp/OSdUxTTwk9UbscDHFeQSXDHh06It1dNVgpdKy6LwT3QZjU3OWSgNXz5TCdu
	a4JiYDKJe6xfWJpajeKhtgNbgEx1UyuF9QkS9qQbyjECGzs7MhpDUu9HHyFrdQ5hRTzM
	vv+g==
X-Gm-Message-State: AFeK/H2/gmUPWJKxDI4Zp5rmlvYcwoPlpnbo3EnMJpHh3WDooY0lnNCd7bIDfnkuOYcdkw==
X-Received: by 10.99.101.199 with SMTP id z190mr44426909pgb.219.1490208347549; 
	Wed, 22 Mar 2017 11:45:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z4sm5404494pge.49.2017.03.22.11.45.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 11:45:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 11:45:27 -0700
Message-Id: <20170322184533.6501-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170322184533.6501-1-raj.khem@gmail.com>
References: <20170322184533.6501-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/10] log4cpp: Upgrade to 1.1.2 rc5
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
X-List-Received-Date: Wed, 22 Mar 2017 18:45:48 -0000

Fixes build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../log4cpp/{log4cpp_1.1.1.bb => log4cpp_1.1.2.bb}               | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/log4cpp/{log4cpp_1.1.1.bb => log4cpp_1.1.2.bb} (68%)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb
similarity index 68%
rename from meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
rename to meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb
index c7bf288fa..dc52c9ff4 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.2.bb
@@ -3,12 +3,12 @@ HOMEPAGE = "http://sourceforge.net/projects/log4cpp/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI[md5sum] = "1e173df8ee97205f412ff84aa93b8fbe"
-SRC_URI[sha256sum] = "35abf332630a6809c969276b1d60b90c81a95daf24c86cfd7866ffef72f9bed0"
-
-SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.gz \
+RC = "rc5"
+SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}${RC}.tar.gz \
            file://fix-pc.patch;striplevel=2 \
           "
+SRC_URI[md5sum] = "58b4591a2f3e7ef3d5e3e7cfb3a81a62"
+SRC_URI[sha256sum] = "a611d99a20af6676c60219762771c0bfac90f4879bbde70038ece75338b588ec"
 
 S = "${WORKDIR}/${BPN}"
 
@@ -19,5 +19,4 @@ EXTRA_OECONF = "\
     --enable-dot=no \
     --enable-html-docs=no \
     --enable-latex-docs=no \
-    LDFLAGS=-pthread \
 "
-- 
2.12.0


