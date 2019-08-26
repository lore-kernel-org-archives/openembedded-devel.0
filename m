Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id 711987F64A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 03:30:20 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id 201so13013390qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2019 20:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zEGlhgssCQzhDtld6zBq7gia+BNFguMLkIaN3YmEDJ4=;
	b=T5Di73LrcarznimZglZpg+rL7UbmqeHyKrJamvYaRXoiHZwYVLF2XBzySsbBPmH0Kq
	QUEQeTVyoGWtERw5tCumgckHgunIbuDQM/sUot2kex/9IeNVq/3Y7fgU/rGmLE+qQYc5
	y/BwEfNlRBTE24gu4dDB3Xas5PPsDZBm+Nf5nLVNNeJsU47bK9S1Y8kdh6FywLdF/Cha
	PPmFezzEy6Bb3zK9YouQ/jN0hQ1DxV7XM03Lf2F/B+37NdYl1uziXZfr6YMcPpGBvkL9
	3x+/aeq5sNVhUASIYNS3MJd4j88OxGDcB86lSun5ypmcqD4ZVez+R1iIlrrDuD/z4szn
	SoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zEGlhgssCQzhDtld6zBq7gia+BNFguMLkIaN3YmEDJ4=;
	b=ijyL2oEO97s99I+MfOg80CXn9+XnlL77teyuOA8yPA5Yb4bqNXeNvQqdbCVF6cAeKh
	JLl5pqEnzeNZUPaJP1F+vX5tqc9eg/KTSV3qcM+7my+uO/Y0+FpDuuAxqcH6/5QCBh78
	pa9IpRYOHrWj04WZQOvaShFJaAy8y01DVIsfwgnoknVFZTTGUWsfw669TxqzioUdXdxW
	W5jQzFG20QR7/Ukt5rfMgH/KZBdH8O9+NjWzH1aQp9ZvKuS+0gNHCla1P2MjmWqDUmI1
	rr8ms2b1ezIvRIB76pl4FUPejBzdlzRY5EUJZCwB5vi3FznWpDk3jSFOHS/SHwycqxru
	UR5w==
X-Gm-Message-State: APjAAAUK5Lftco9qgnWG4nh6AxEjo1kJfapEqL/dk46yv8wssE5ZubFF
	QhMxe4vAEHeSqBF/yYZ76KHMDjET5OTM6w==
X-Google-Smtp-Source: APXvYqzUYnXqPEnJZiqQUDkkIC+RwPEBj4Y7wvcs3wO+Oz8tHmEFXgtVvBviIO40WUKF3RnBhj7SOw==
X-Received: by 2002:a37:9303:: with SMTP id v3mr14884966qkd.369.1566790221129; 
	Sun, 25 Aug 2019 20:30:21 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id z22sm5604472qti.1.2019.08.25.20.30.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 25 Aug 2019 20:30:20 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Aug 2019 23:30:16 -0400
Message-Id: <20190826033016.15205-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][thud][PATCH v3] libedit: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Mon, 26 Aug 2019 03:30:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To keep support of meta-clang support on thud branch.
It depends on libedit native

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
Changes in v2:
        - Add missing meta-oe in subject
Changes in v3:
	- Add missing signoff

meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
index 8cc0e959e0..60f4f5a22b 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
@@ -19,3 +19,5 @@ SRC_URI[md5sum] = "97679319742f45d6cdcd6075511b14ac"
 SRC_URI[sha256sum] = "c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116"
 
 S = "${WORKDIR}/${BPN}-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


