Return-Path: <scott.branden@broadcom.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB82C61319
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 00:09:58 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p7so347983pli.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=7x9Jrp7mr+MciOc/RCKzZqJVPkqGgpZJey9+8qzI15I=;
	b=M7CpS40BLPXKG1ffmMpRyzyVfyqzya7tX62jT4pKd0ddYe03hFQsb9LlyryJisyHJy
	5IKrXABNvQnnveCRozYKoOlPV1takVik7QMn1n94t7LiuYx63I7RFqnuWZTpV3nz3hgj
	sWsP4ClcuVKGvZI9EKCuQq8AvQYGG3S79xgU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7x9Jrp7mr+MciOc/RCKzZqJVPkqGgpZJey9+8qzI15I=;
	b=oTJ6AI54OtgPR75SyeeTKjeejdDhXlZ04QoicIEOSHDG3erBlevQnp1nfhVcbPfowm
	CjDM28VxFz4SSq9Bjyz1iB+gE9wYW2eUJ5fi/kO9Yx5RebRDDZvydODSny87H3mYg213
	whNnXXaABqStzwmH87QRqJC3QXXTwnzUFklmwf0rWa+sNpeI6wEIEJMGX0sJG0vNUkbQ
	aNrG8yIqBNyLFoB8Ip/2/d6xCQiEqFePk5U0bcl/duuB1Qz057i53XfIK2sZhddFTlEE
	0K/50aqG1DFMdPKdOHR0xQUAxLIH3bSFxw9dMMaXFXVSpiy+1jbF7+og1LqbP55tfvan
	EhmQ==
X-Gm-Message-State: APjAAAUWVST9whnysXnGT+yZu8//kymSoFn5blE6+F6Cu4KsQXuPvChC
	NXMf3pT3eyEQDxRfCujDnAZpvc2PGM0e0uoIWZgjAwD6S2B/14jlyNS3DxKOZLEeGdckWwXEgx3
	zOSrOv9EmdwyAsT3S1FtFAo8wbq9Kh38xjqO/maeX5z4bThMsWJVc5fQlAwZgr9lAsiryLytqED
	vq76Po7YGvL/wkF4NQt0xUbKxNZ85T
X-Google-Smtp-Source: APXvYqyUdYkR0BSE/90C4QXVDOmtGabZ6lcAKtnigT3NoXkURqsFO5zTkpJ5/9O7D4X161tKolpjOQ==
X-Received: by 2002:a17:90a:cb87:: with SMTP id
	a7mr1818978pju.135.1582589399405; 
	Mon, 24 Feb 2020 16:09:59 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	z10sm13517078pgj.73.2020.02.24.16.09.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 16:09:58 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2020 16:09:53 -0800
Message-Id: <20200225000953.17899-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Cc: Mircea Carausu <mircea.carausu@broadcom.com>
Subject: [meta-multimedia][PATCH] fdk-aac: add initial fdk-aac recipe
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
X-List-Received-Date: Tue, 25 Feb 2020 00:09:58 -0000

From: Mircea Carausu <mircea.carausu@broadcom.com>

Add Fraunhofer FDK AAC Codec Library recipe.

Signed-off-by: Mircea Carausu <mircea.carausu@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../fdk-aac/fdk-aac_2.0.1.bb                  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb

diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
new file mode 100644
index 000000000..d7911681c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "FDK-AAC audio codec"
+
+DESCRIPTION = "The Fraunhofer FDK AAC Codec Library for Android \
+(\"FDK AAC Codec\") is software that implements the MPEG \
+Advanced Audio Coding (\"AAC\") encoding and decoding scheme \
+for digital audio."
+
+HOMEPAGE = "https://www.iis.fraunhofer.de/en/ff/amm/impl.html"
+
+LICENSE = "Fraunhofer_FDK_AAC_Codec_Library_for_Android"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"
+
+SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=git;branch=master"
+SRCREV = "d387d3b6ed79ff9a82c60440bdd86e6e5e324bec"
+
+S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "fef453b5d6ee28ff302c600b8cded3e7"
+SRC_URI[sha256sum] = "07c2a64b098eb48b2e9d729d5e778c08f7d22f28adc8da7c3f92c58da1cbbd8e"
+
+inherit autotools
-- 
2.17.1


