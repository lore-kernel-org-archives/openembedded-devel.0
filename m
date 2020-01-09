Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0BFCB7FE9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 03:23:25 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id w62so2633103pfw.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jan 2020 19:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ta2iq3julvAej9HyxvArxNYDN/mVYh8oBRAtA+b4UsA=;
	b=qrDkSiXFjHFX/4I8dAflnhQTXwmTnuSbrmzJ3n6AC42QuVYMfkuda/r6JtQRM3y0bZ
	oKMjqPTta9DeEE6hdxXI45kQrJ6kf5rwJH5Qiob/I5KkHQLeU7UEVxMuqk1pHEwIvgVa
	PT06SwrJZEOaJiKbjUShvzob8g8NS3XUzMOITBy99zBap936E+d3oZ1o51b8BegqwYEy
	gbax3ZxjooIzW5Ma5OHnTXFE18T90LDcKObg6cNzAow7e/XEDpEhNZhKUuF/+wm3BLBL
	qhUCKrbbUOxIwdQ5Z9TDLq2XRkdH1ObMy1bT9sw5bv++aj7b3gqKAf2fJC33yq0RsbcA
	4hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ta2iq3julvAej9HyxvArxNYDN/mVYh8oBRAtA+b4UsA=;
	b=bqo3GsBUWDs5477Jl1d3VMZXtbunq9U3JEEpjqBOaZL6f7bwe2Iu87CnQGSVHoZMuX
	Ot0o7oqzZ2gcb92pnNIG7pFY259NCCiLgVrNiOCNoZy5EbBg4bw3O93BNevQGeXwosOP
	CwpBnP8S2gNbs6lmAjnDQGoXbgpR5s8wQTsgl/+Hrkzl92t99B1qFQCfMTUAQK4wyAVa
	R7UA3GMez6kznK7xXcYIAjlwH+gQn7KXkztTXKYO6X5nX7+b2HTwOkvLZ83yAPteRkg9
	xWDbJMU3wSrWUiKmu5xyjdjZ25uZvqz78JUYgKA0a5Pyvtn1/MV8avdQ4D0JPfivahKp
	tgpw==
X-Gm-Message-State: APjAAAU7D5SQujmUckMxvOVhMF/k+qts+axImYiIea1DGqLVkcLp+C96
	YsI22uZwlhHFu9ZWTZpJyo6Vnr9PKGo=
X-Google-Smtp-Source: APXvYqxJZZNzy76vn4EpiIcwU5ZHpzhidsI1VX9Y1YoXjCKFNfnJnrLbxeMITGGp0E+PQ/WJy1HVvw==
X-Received: by 2002:a63:1a08:: with SMTP id a8mr8882126pga.425.1578540206498; 
	Wed, 08 Jan 2020 19:23:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9bd6])
	by smtp.gmail.com with ESMTPSA id
	r30sm5657182pfl.162.2020.01.08.19.23.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 19:23:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jan 2020 19:23:15 -0800
Message-Id: <20200109032319.3645429-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: hmenn <hmen.56@gmail.com>
Subject: [meta-oe][PATCH 1/5] add sqlite-orm v1.5
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
X-List-Received-Date: Thu, 09 Jan 2020 03:23:26 -0000
Content-Transfer-Encoding: 8bit

From: hmenn <hmen.56@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sqlite-orm/sqlite-orm_1.5.bb              | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb

diff --git a/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
new file mode 100644
index 0000000000..4a27e4b2a5
--- /dev/null
+++ b/meta-oe/recipes-devtools/sqlite-orm/sqlite-orm_1.5.bb
@@ -0,0 +1,22 @@
+SUMMARY = "SQLite ORM light header only library for modern C++"
+HOMEPAGE = "https://github.com/fnc12/sqlite_orm"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5bf5ee8bb16d8e19359efe11bdc3f2"
+
+inherit cmake
+
+DEPENDS += "sqlite3"
+
+SRCREV = "e8a9e9416f421303f4b8970caab26dadf8bae98b"
+SRC_URI = "git://github.com/fnc12/sqlite_orm;protocol=https"
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE += "-DSqliteOrm_BuildTests=OFF"
+
+BBCLASSEXTEND = "native nativesdk"
+
+FILES_${PN}-dev += "${libdir}/cmake/${BPN}"
+
+# Header-only library
+RDEPENDS_${PN}-dev = ""
+RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
\ No newline at end of file
-- 
2.24.1


