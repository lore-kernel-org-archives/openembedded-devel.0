Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AE21971B14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jan 2017 07:53:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r144so10014110wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 23:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=m3XC/b5gsP7UWLWBdCpQnGj9f52tqJW2OzXR6hnAxaM=;
	b=DGEp2J8VivCTPt8yJpQ13A5r1pw+bICTz4frlHoTwoYAo5dqDu1YKDjC+Lygmy12f+
	cOXMrlb/0/HVmpx5V80KmXjngjbh3l7URu/NhIGHpeiMVUS97fBoQlRDQXKWELkGRxdo
	iXj3Q7Q0YmzHXmPf58gwHsRtJ/mtVqO2ra+l2ALBetJubdgkByD6ZGm2+Y7pMLM6nEc2
	baf5X/xpYn7oTI4RgjGRZ5xaHeMg4qpaujkk8XuO53qP4+mMeqwXlkV2sNxWXBfAB8s0
	wAKFz0zPREv/eIVgYUJz3Yuqel4u9fjtR53GFFUj5BtrJ26lJz9odqerZdrTIdlSqqlu
	28vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m3XC/b5gsP7UWLWBdCpQnGj9f52tqJW2OzXR6hnAxaM=;
	b=AS92Lb50o3XqjdtE8prhjlKLbCZRlKbc3hQ0/QY6RzyhoJQnq1kCDDXdeEu2NdA8Nr
	dNiM3nXzN3AD5VVdh1YJycdvT4UG2MbL/AjRGi4jktmH/U3wHRaWZvrlMRoAN2jVYiQ/
	7LybhWnv4iGS9g9Z4XAOHicWTt3sgzPORE5ETBpl0ETu8jkk9aZ7MFrMfBZ+7pAwjcLu
	sDGdMvHpaR0mceRX+92EyfADLwaqmtQv0iZC0TP36dsUrQXq9NWz+F56ujDtL1tCzqXr
	TPKxZWf6/TbhX+nu10len5y+7eEl+MQA6wtjeUwm31BRcuseTmAUPOY1/N/MJUqAkazj
	Stxg==
X-Gm-Message-State: AIkVDXKGQgSE5b6OG4Xr596T4B7I2iajLdcZw2wG7JEiRUIZfJz9NZNopIYLrsD3WXP+1Q==
X-Received: by 10.28.206.199 with SMTP id e190mr6162826wmg.98.1484812427770;
	Wed, 18 Jan 2017 23:53:47 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	l67sm11050656wmf.1.2017.01.18.23.53.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 23:53:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jan 2017 08:53:32 +0100
Message-Id: <1484812412-26806-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484812412-26806-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] poppler: update to 0.51.0
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
X-List-Received-Date: Thu, 19 Jan 2017 07:53:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-support/poppler/{poppler_0.50.0.bb => poppler_0.51.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.50.0.bb => poppler_0.51.0.bb} (94%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.50.0.bb b/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
similarity index 94%
rename from meta-oe/recipes-support/poppler/poppler_0.50.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.51.0.bb
index 56425e6..4aa2dba 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.50.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
     file://0002-fix-gcc-6-math-ambiguous-errors.patch \
 "
-SRC_URI[md5sum] = "1a4c0cd873bddd8f266b85ab8d799962"
-SRC_URI[sha256sum] = "c9c93318b789d3933f6e0bad3bc65110280c28eac3f0666284bb9c9a0ab4bc36"
+SRC_URI[md5sum] = "342452b9dfd16f3c9912eb029fe0d4e2"
+SRC_URI[sha256sum] = "e997c9ad81a8372f2dd03a02b00692b8cc479c220340c8881edaca540f402c1f"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.7.4


