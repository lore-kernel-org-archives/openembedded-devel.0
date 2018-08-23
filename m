Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3C45B79548
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 12:27:39 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id p6-v6so4009003ljc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OwFMeWcbBi18399YBXIVwDJDqFbhqexNTlXahpEhWns=;
	b=wqmj3rQ6pXivAJ2J0aXrCh3jadovnqpvsItCoBUfEL+UdzlS5LyOcWYKZVYfdpNHHn
	Oa6P4tK0pN7L06yYNhFaTe81fs7XGG/QdASk4sfEF5QpDAjV0xhovKtZ/4xEziYWxE2K
	mwiiPhQGSRgc+0nXxpBo48BMgGGv1ZIUXVdCQLG0RiCLkZz5746NGGbVpwYaEWRv/Miw
	FP7Er+A++YL8E3MEg2JcbZvBEfrQq2ghL5xaQ54+1ign1eNXsn2T0egufpeGsCv21vEm
	7WnnyitzayyUZ/EXFJCx7FqEsYDUgGWUd1ULkTvt7BDKG1/ymz6SI460p4puCNdXrq53
	VoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OwFMeWcbBi18399YBXIVwDJDqFbhqexNTlXahpEhWns=;
	b=FQgPjIEk7pFm91ELYKwDASa0Fuh3fReib8s0TWYUqbo2Om3h4vpPPCcJ04IHWEPpzn
	tEj1KVmjLsUIhO3OP+lzup9mxfFlU5HrKK1jyM4din7bt1b13ADaeolq9+gNrKBbthmI
	rHBSRiPpd7VKOeDWoJjQfl4OZ/oorSwVt4D0dUc5LkevAjPv237aYRfDNt3ia9uEPtuI
	gSTbFaeDGVCybD4xaUJp9hBrfKxnCEbHTBpjp2Kk+cMq40GYRoPBOwR+NmDcNfQfAUfD
	dZWBns1gJTNu4rSf0536o/24CPt06RjMMxGk+vktbKGjeau5RX30FjgU1rq60XfRGMR5
	DJPA==
X-Gm-Message-State: APzg51BBsJuSbnE72Czp0+kSBRTj+506mWm/n8xKVvm4DcARx2MMG6gd
	C6xlClO6W5FbGX+oF8qPEoIwABP0vMc=
X-Google-Smtp-Source: ANB0VdY2p/OZJ3h1P8ZjR9t25iALW+s/g1cwsJ/xZzkRM3zPqIX0Ms44z3lzDJld7Ljx3scRhBx6tg==
X-Received: by 2002:a2e:9057:: with SMTP id n23-v6mr46181ljg.44.1535027260317; 
	Thu, 23 Aug 2018 05:27:40 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	101-v6sm822573lfs.44.2018.08.23.05.27.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 05:27:39 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 14:27:31 +0200
Message-Id: <20180823122731.27991-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][rocko] libsodium: update to 1.0.16
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
X-List-Received-Date: Thu, 23 Aug 2018 12:27:40 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Added link to bug tracker and updated md5sum of LICENSE, which has been
updated with the copyright year.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/libsodium/libsodium_1.0.11.bb   | 12 ------------
 .../recipes-support/libsodium/libsodium_1.0.16.bb   | 13 +++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
 create mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb

diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
deleted file mode 100644
index cbcbe96cd..000000000
--- a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "The Sodium crypto library"
-HOMEPAGE = "http://libsodium.org/"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c9f00492f01f5610253fde01c3d2e866"
-
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
-SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765"
-
-inherit autotools
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
new file mode 100644
index 000000000..57f38fec2
--- /dev/null
+++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.16.bb
@@ -0,0 +1,13 @@
+SUMMARY = "The Sodium crypto library"
+HOMEPAGE = "http://libsodium.org/"
+BUGTRACKER = "https://github.com/jedisct1/libsodium/issues"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f5ecba1fa793fc1f3c8f32d6cb5a37b"
+
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "37b18839e57e7a62834231395c8e962b"
+SRC_URI[sha256sum] = "eeadc7e1e1bcef09680fb4837d448fbdf57224978f865ac1c16745868fbd0533"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


