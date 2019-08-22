Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 118727F28F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 17:02:53 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i4so8512604qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 10:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C7Su28z+0si1SCPAXVHopJOjq4EVc0BmMapicgKvTqk=;
	b=oKP083bVuv10PvDJIP89W6ahSVFq3DsKGi8lzlbm+GM4MTrx9eBuBM/UoK+49JwWO8
	2d2DPbN6HrEyhxpVeHVYQjWid/ffn4Vqk9cjACJS1GNOA8AzOGLEqbV/WDWncBLbSP/e
	ZuEVlORamIvg0/dfGUfoVgGy/DbYHqwA77rj1j5oJ+OizBEiy4ZowEzDmFiD/luGTnLc
	tSDdfXICWwIouMfBZJ3onQ8lFnnefZjBGe35y4WsRuqmaM147UWGku1sBj6g9FxLTu0F
	0j2ZeKW2JmX0BKQl7gqxKx29y7YVNU3nFtE2qHOY09F3ISWKwC4V3pgF+z+WLnCntgPL
	Hoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C7Su28z+0si1SCPAXVHopJOjq4EVc0BmMapicgKvTqk=;
	b=jWu8hNBXoddlZ++xqTLGO6R59yW2aEVCJLde5il/gaGisckmmZGW+Ja4b5kpjjtQl4
	3uvgM97sBzzXv/XCWE/yJjPAQbYu6UZYJV0V/upPlk8PioGQ8aL+hJ9cqnLcwX5vRttX
	Zr5mHh1xvYw2Tz2gasQuqGhLXv+xVZIwSuRr+KsPjhPXdOl0gZ9PE9pcUI1RKob6NdIG
	lk3Ts6XEUCAdPTqphgwmsu/hUJsTK8fWO4cCbyc1vT/JEbt3CObUcXdYC+IYJ/1OAucA
	HTvzbNLamN9a9QNr3WW5Cqe49OP62oLmGZRj56jrZjywhutqj7TtBxi2oBAbH/lngwc6
	NnOA==
X-Gm-Message-State: APjAAAXpOpQIcZAarakMziLGfU/am5ebHDays3gpd7UT/r0nJmjzEl/8
	GleewurrYZP6LM3FY6N8dlUBNAvCVxPB9Q==
X-Google-Smtp-Source: APXvYqz3rRRASEZwTBNfTh64egZCrK7TWCg7AfP6olnRbgSTw9Yp9fGFBc8ZzYdQUQZrxcimTEx/gA==
X-Received: by 2002:aed:3536:: with SMTP id a51mr619367qte.71.1566493374632;
	Thu, 22 Aug 2019 10:02:54 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id g25sm113925qkk.87.2019.08.22.10.02.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 10:02:54 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 13:02:47 -0400
Message-Id: <20190822170247.13513-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [thud][PATCH] libedit: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 22 Aug 2019 17:02:54 -0000
Content-Transfer-Encoding: 8bit

To keep support of meta-clang support on thud branch.
It depends on libedit native
---
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


