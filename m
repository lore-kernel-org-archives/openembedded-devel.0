Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB087BF88
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2019 00:38:13 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id b11so12511157wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2019 16:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3J16KFlHX1jqhBoXUkZ9Zc0KeA+3Zjhw8/dem1Pos54=;
	b=RBzWRXwLbKoL+JprXNISp9xbDCaQF4IazPn5YiCun0XeYgaYtxij/mEARCC4e8Ulqv
	s4aVfdHFFG2ynK/Vvas1bBxQeLVCAL6QcK7HbkpdDzyPplDsM9sJCHVfO3d7FSu+490j
	gF4PMa4B0wdbGwmWk1/07dx0HEY+9E9+yxm3yAOtgBeCHykCUg/67ZFTbK18iJtW1UYc
	sbyVy4h/jirmrPUiGtjYkWBoKrgN4gFkJOi6jLKPmOi0lhT0fdAbJXpZun/8stU8pqJF
	TMOf9bmfju/BPsh/wW5in1sbIOA4ZPKqKTu8nZggA1wnEz/Ni13DtAvZnvGf7KbaURh0
	DZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3J16KFlHX1jqhBoXUkZ9Zc0KeA+3Zjhw8/dem1Pos54=;
	b=e/5pCGM7Kye9SyfzoosxJiwb9noY48G23XGxRec6jVhOMOr4auHp0fvPpPkHLbeTnH
	qUYaIFCPFH4WzZldVRFElCi+UzzDKW5eiAIuxgEE+8v8myHlT+jWWa417kMobSbtDmlS
	kNL+ieBMs2rlPEHzol6315PXoMd/KxQgpsqizRjV47mUDOC/hTUt+qdU43jMLMH0RGqF
	0pGj+SxBDnSUJ+4KHniHkVrLWHkMe7WQHdwdmf0JjXj5U69G/L1Q7U55INFGV7Pzo2HK
	CKT8bTMHMrfu7Fgsred5+gaEZi03nbbPfVSf9QOHl2TLPf5L6Ra4ClZAZ2Hxhq+qzzH2
	3a2A==
X-Gm-Message-State: AJcUukdNGEUENf7TatjWQf3OHN7FfMppuLRO+dFIWbjy7T+35cejzGwb
	w69jsEYVr6afGWBYGcjwkre6DSby
X-Google-Smtp-Source: ALg8bN7mfYTvRyconrtpr7eYFQlGw5D29KZUtnqLUHgYBg2/h6vnR8YlaznOR2q4MzIzgmVZ9XiOIA==
X-Received: by 2002:a1c:e18a:: with SMTP id y132mr1461207wmg.48.1548117493501; 
	Mon, 21 Jan 2019 16:38:13 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F275D236F96ED284BAEF9F7.dip0.t-ipconnect.de.
	[2003:f0:7f27:5d23:6f96:ed28:4bae:f9f7])
	by smtp.gmail.com with ESMTPSA id
	j8sm134645303wmd.0.2019.01.21.16.38.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 16:38:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2019 01:37:59 +0100
Message-Id: <20190122003802.19373-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190122003802.19373-1-schnitzeltony@gmail.com>
References: <20190122003802.19373-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] python(3)-html5lib: extend to native(sdk)
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
X-List-Received-Date: Tue, 22 Jan 2019 00:38:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-python/recipes-devtools/python/python-html5lib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-html5lib.inc b/meta-python/recipes-devtools/python/python-html5lib.inc
index 0eb8bf321..a8e0fb408 100644
--- a/meta-python/recipes-devtools/python/python-html5lib.inc
+++ b/meta-python/recipes-devtools/python/python-html5lib.inc
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-webencodings \
     ${PYTHON_PN}-xml \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


