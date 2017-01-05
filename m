Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 10C5F71A8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:11:43 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id k184so296749502wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 09:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hqJGaXeVaveHdAg3iqKdUsxfC0znSXrmsrjHBovWLjM=;
	b=q6Z5AeKQYCzagYnAXHDTzxqlYkU9wGj/7F+T/J/44E2avO4FWqR+GfaGMpGYnljHfC
	FRzYlFM5HoeO6SOpdUPTIEjHz6QJSsWogbmR/UcJ1j7nUUAggSryX2XTgRo3z4agVGu5
	M8p560tt2W2tz2ojjpf8C67vTiIKYzL07Bo4+Vx26hZk9LGVg9kzTplzhUDY913YC5Io
	xBVcmI869/GnIhgvqmSHxL3YB5UC8DNx98gzL23CnDHfKLwlJJkRWbCsSnVp8X+yQSQN
	EtoIEBBiOzc0oA6DA2cC7ZuCHEuo8S8juyBc7w0s6STkMyT3QBHlwOCIz7RNMzrDz5CY
	AsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hqJGaXeVaveHdAg3iqKdUsxfC0znSXrmsrjHBovWLjM=;
	b=NjKWYV78OgyvqwJFENew4Hgm7NzOuEtxKGbQhVlvndJMS0Nqep8/EnHCNuZBfig7XL
	ObxVFHL4W1uvmRI4abs7tb8nOPAxjYYulFQHiMEKpdnbus7CaMGCaJPRJiStl+b+JycB
	vAj5PzneH9IGMpV3MaRbZs+cs7960nKNkzqDNtrDJgAXhG13n5mY627aGWP9rXhVgDvj
	IazkXJNLZA+o4K+Ccn8a2fDqp1U+pF2njjzUua/lCgkVXlAPthLoqKpS5n0b3YnurlIu
	EIY45lgj4N8PeSr9M/u6mSOmki8o2XyY7QRZULzStRv5sM39ePMgjx9tjJPmBDvM3NFw
	pOhQ==
X-Gm-Message-State: AIkVDXLLzvVOIYiImJdMqr1QsQyLsMxWhRxrd7wBZR+koP8IEb1o9ZQHi1L3QG71bSRCSA==
X-Received: by 10.28.60.5 with SMTP id j5mr68608835wma.119.1483636303619;
	Thu, 05 Jan 2017 09:11:43 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm101153107wmw.7.2017.01.05.09.11.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:11:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:11:20 +0100
Message-Id: <1483636284-6351-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] cairomm: update 1.11.2 -> 1.12.0
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
X-List-Received-Date: Thu, 05 Jan 2017 17:11:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sources are found at gnome so use gnomebase.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/cairo/cairomm_1.11.2.bb | 16 ----------------
 meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/cairo/cairomm_1.11.2.bb
 create mode 100644 meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.11.2.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.11.2.bb
deleted file mode 100644
index a330458..0000000
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.11.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "C++ bindings for Cairo graphics library"
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
-
-inherit autotools pkgconfig
-
-DEPENDS = "cairo libsigc++-2.0"
-
-SRC_URI = "http://cairographics.org/releases/cairomm-${PV}.tar.gz;name=archive"
-SRC_URI[archive.md5sum] = "732a3ff5b57401eb5dfeef795a2a0c52"
-SRC_URI[archive.sha256sum] = "ccf677098c1e08e189add0bd146f78498109f202575491a82f1815b6bc28008d"
-
-FILES_${PN}-doc += "${datadir}/devhelp"
-FILES_${PN}-dev += "${libdir}/cairomm-*/"
-
diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb
new file mode 100644
index 0000000..d49a509
--- /dev/null
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.12.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "C++ bindings for Cairo graphics library"
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"
+
+inherit gnomebase
+
+DEPENDS = "cairo libsigc++-2.0"
+
+SRC_URI[archive.md5sum] = "c62b476b61bd0abf7e9851f417d73291"
+SRC_URI[archive.sha256sum] = "a54ada8394a86182525c0762e6f50db6b9212a2109280d13ec6a0b29bfd1afe6"
+
+FILES_${PN}-doc += "${datadir}/devhelp"
+FILES_${PN}-dev += "${libdir}/cairomm-*/"
+
-- 
2.5.5


