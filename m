Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8B37DD20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:38:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id j13so3660923wmh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 05:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IqqayjIbV2U33hD4RO++nWF7LWJMjHRzcuClhuo2rf8=;
	b=EenDCToUmHIssgsEWORCa/eRo4eLp/y2uzd3v2jI04So0sqYJH7MdTyk+F4djFWDpk
	RIFDj0tkQ9BpYICmKdpAAX9rZQSx+XE+M/OhaF9MhjzspTvyghxCYMsBt7ermf9X89ax
	iHS7KxHrAwKFNuC49F26CoXC/NECUIBz7GXVuhgW8JRh56Fi+jwUnzrf3ZoSrf3lkRdQ
	jeUOzrZYAsmdg1jFNePytrEhg19CdHqnWJ1lTUn3Kak2q1zpotMLArcr6tFNVhedjfBH
	CUZHcnzG/ZL04t7LKF20VE8eT0zs+EL9dTHrZKs7Qscw6xukfPMg0lSQsEoDiH3wWA30
	BAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IqqayjIbV2U33hD4RO++nWF7LWJMjHRzcuClhuo2rf8=;
	b=BlM4+l5v04RyCfbpsmiTHKoQC8S8aKdkuTjIY1kIIiT/pX/IGadLMm6o7j82sssGRX
	IxyFKh5gjWIHx6oeFhzyZiZUEEejHpWa3QyyaC5RHf3kMdhixIti9nhQIVKJ5yjcplM4
	c552NQ7fU5A9dA6nmNHv3XFFv3ZWa87KOEdrKS2zt9Ch6LZo3blSc93iOMzXiJpHdREk
	ZsbldnmcuqHKJOB7ThDLnWzRad/v3Txz5vzha90BaBnMYXpbdcZto2pGDQNj6st/dkl3
	Jp7KNSDRzaW/NMROq4sJyslyVNDls1MIwyqQlG57OW5JYwiQ/x/7IlxlTUe4uI1mQrfL
	UqCA==
X-Gm-Message-State: APjAAAXWkAFsBwWuL68g9hbObGCSISZm8dVYF6oTo1uem2dX4ayJ0m8O
	Z4G3p0rpdDKJsDLvLgDA5XGNqvf2
X-Google-Smtp-Source: APXvYqwjmL1dghSA7a8iC7d5WnSSj/bMW98tPyQnJlwuLj9ugZkmzgALVep7B6aTEy/VIxRQasBPLw==
X-Received: by 2002:a1c:4d04:: with SMTP id o4mr3058792wmh.126.1556627913871; 
	Tue, 30 Apr 2019 05:38:33 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n4sm2112019wmk.24.2019.04.30.05.38.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 05:38:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 12:38:40 +0000
Message-Id: <20190430123840.1545-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] opusfile: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 30 Apr 2019 12:38:33 -0000

---
 meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
index 189dc87c49..3f6dbb8e92 100644
--- a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
@@ -7,7 +7,7 @@ DEPENDS = "libogg openssl libopus"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ac22b992dde6a891f8949c3e2da8576"
 
-SRC_URI = "https://downloads.xiph.org/releases/opus/${PN}-${PV}.tar.gz"
+SRC_URI = "https://downloads.xiph.org/releases/opus/${BP}.tar.gz"
 SRC_URI[md5sum] = "ab3f7d15d766f5b36b0951ee435f9ebf"
 SRC_URI[sha256sum] = "48e03526ba87ef9cf5f1c47b5ebe3aa195bd89b912a57060c36184a6cd19412f"
 
-- 
2.17.1


