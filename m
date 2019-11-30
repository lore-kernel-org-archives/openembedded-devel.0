Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5657F8A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l22so3749204pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6tMHtnflNIJ64SReM02xaTLf7MLC5N2XSyvijup6ItA=;
	b=jyjU38oj3a+eeri24rEo7THCY/QVULMTVvqC5tUW4/dARli0/Cao/H8hGIqMW532FC
	TkmBLCFJhRn24LDxhzvK/HIpZl3KhvcRtB31Bh+heKvCO8zN4Ear3RqlVW35+Jmuapfe
	4oNfvjmbPrvT7eCU1+0egED9ksJoHlbPEdsHqyvS3inuDik6uHYGwFTsWkBdl85HXj2H
	k0jx/Rpi2Oh2OHw4iUM+EKcwZjCZZSXtUEbW9GeYVYaLnwjDdCLTovLVSuaLyNJx8CGE
	DZbBxb0hDUEn+q5tsJX5vQUN9K9O1lzq6r/YKPLMa15gtWqgFprppMZY6aUsq4pNK/A6
	ZZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6tMHtnflNIJ64SReM02xaTLf7MLC5N2XSyvijup6ItA=;
	b=O9MSuwBMgXudTinvxCJE8iSQ/zi6xSr5JIFtu2ZjMZdCAKWD0DW+Xn0AQyO+BVrAHk
	hHHvGc/51B0i6z90RuEvVTnnc3D16imWgVW/FJ0UZ1NWoPdOpE7l/ldvjGkcQMjL0xij
	S1oXgcMnk38mHgZa2RwOc5rjQAMZdWJeJC7uPOBi2qyMacIZ1YxrCVRLe+IerBBjmvNn
	KJjbUrBjX/TFuT6siwlM+zc4VfqOZL8emJR5oFComZOX928FCZX/3MDgQJjnrUEl2ZN2
	i7ZYqEbXr3WSWX1IEnQTlVIexZvuGEqBBDpkCUdjCsBLC2DHinIabkNSpb4d18ZeKc98
	oPPg==
X-Gm-Message-State: APjAAAWJgn/jvfbBVyO7K2GnF1Oketdebf8HBC+QPbfiHmIsCLvEqW2D
	k+zNfVvkzyvxgmNN1xY+/D7USh3w
X-Google-Smtp-Source: APXvYqyM/HiRk5GfImqZ4+XCUf/MwuqaUuglA4VAnWhlSTwRTTAs53EPorI30kfZ/ikCGlb/ESd9cA==
X-Received: by 2002:a63:a019:: with SMTP id r25mr1785640pge.400.1575137451165; 
	Sat, 30 Nov 2019 10:10:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:32 -0800
Message-Id: <3ed6541a78cd81fab74532bfbcd50d08d3270492.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 02/15] modemmanager: Upgrade 1.10.6 -> 1.10.8
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:50 -0000

From: Michael Scott <mike@foundries.io>

This is a bugfix release on the 1.10 branch.

Includes: Fix for an issue presenting after 1.10.6 update where modem
would enter status denied state.

See:
https://cgit.freedesktop.org/ModemManager/ModemManager/commit/?h=1.10.8&id=47fd8a1e55cac0b0b45812e1dda826f38c264d1b

Signed-off-by: Michael Scott <mike@foundries.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../modemmanager/{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.10.6.bb => modemmanager_1.10.8.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
index 92d4fe0..3cd21cc 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.6.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.8.bb
@@ -14,8 +14,8 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "7452a94f0d1ca361ae51ff1d287c53f5"
-SRC_URI[sha256sum] = "3c2ca73782215664141042422759899ca9846440fc26d6223c7cf7ea4dd3c996"
+SRC_URI[md5sum] = "c05ac4246c81cc15d617c4a129232988"
+SRC_URI[sha256sum] = "cbe174078dbdf3f746a55f0004353d3c27da2a31da553036d90fc7dc34a0169a"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.7.4


