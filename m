Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 335C0603FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 23:24:19 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id k197so14561195pga.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 15:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q5Dt5m7BN8LVO9LGuzR5UM1EWM9OdzTqRIpOBlDztHw=;
	b=IDh1N2g5isIxcK93dU+BMddevwlmJAYu1EM/Xffh9y1Qlxazk2XvKFfU2D2TvVjAKt
	2qA/C/qW63mEU8YWj8pQwv6ffGGh9irBgUw7VVSZ1+d9YDBh9iF9H+/++NsBGvF8q+sR
	w67JFc2UUqLWu4o9YEFJ6ud0d5tx+qgmrRUQWgTKIlwaTE4No7fFb+VSkjG/LrcEfJNW
	lWbGTbLe0o885Ssn1nV9Bq880PlpQ52x8X7B6ud9QzAc1gmNQQEvDirTfZ1tZqk+XI3t
	4sDonB5vuWCe3mxOwl5QVVQ07TfWLfUnrW25+hxJXkxi6TtcC2+V8IjktJErJ2GAe4Gk
	vK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=q5Dt5m7BN8LVO9LGuzR5UM1EWM9OdzTqRIpOBlDztHw=;
	b=VkYwQuilfhtJr+SJhfP0rhLZtSWXzsoRphjTTOh/txRO/llem7lObX3a4Te4IuEy7J
	Ip5wibBg5SNH6iVInkD20UhEzmKrDlYOSgvPZcbT6Qh1JJLgli1hiH8AilfTL4X/SfbJ
	+mGWUkz4695a+NzLpc8Tjrxe7Xx3EXVzbwVrgxNRmX6V3J3WivfCWuo0YE46mymJmvsZ
	S0PPxLC3sVU49eLf5TXuI7vAtq6GGBGU7OwQb6telLMeLvGfmRsI4eZ+Zz+IsIKlTCPX
	mrjPiBz1RBbcMUEkQDRkrP5Ra3LGUz17HNmvevy8RDp2UNGIPu3KhZJzwKZ3n2RCO3hr
	e3Mg==
X-Gm-Message-State: APjAAAXDzvafEFRhq/t8PYl7xyV5d0r+gIqky73vFBxpmoMdLWRtM/oB
	15tyEXuM4QUGdVVNUyqk3PHQtuaRD+4=
X-Google-Smtp-Source: APXvYqygl69EkKCbA+5sC7bAw5aWI4ff7QmXiWcbWi3Nc3f2aaS6PpVtGN/Y7YgMI4IS8ZauUNXx0A==
X-Received: by 2002:a63:4a1c:: with SMTP id x28mr56181127pga.7.1579476259896; 
	Sun, 19 Jan 2020 15:24:19 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:f5dc:646c:4755:5ca9])
	by smtp.gmail.com with ESMTPSA id
	y203sm37695421pfb.65.2020.01.19.15.24.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 15:24:19 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 15:24:03 -0800
Message-Id: <20200119232403.12871-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-beautifulsoup4: fix target RDEPENDS
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
X-List-Received-Date: Sun, 19 Jan 2020 23:24:19 -0000
Content-Transfer-Encoding: 8bit

* target has run-time dependencies on:
  - python-html
  - python-logging

Unexpectedly, class-target += override is wiping out
RDEPENDS_${PN}, so explicitly add the rest of the
run-time dependencies (python-html5lib, python-lxml,
python-soupsieve).

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-beautifulsoup4_4.8.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb b/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
index 86482714..8ac9c8c5 100644
--- a/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
+++ b/recipes-devtools/python/python-beautifulsoup4_4.8.1.bb
@@ -19,4 +19,14 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-soupsieve \
 "
 
+# class override, which is not
+# inheriting from above (FIXME?)
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-html \
+    ${PYTHON_PN}-html5lib \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-lxml \
+    ${PYTHON_PN}-soupsieve \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0


