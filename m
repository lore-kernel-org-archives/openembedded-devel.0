Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEA37FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 12:44:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so4292955wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 04:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w8l0gHi8l3aSC6McmU3ZyZRgiW/AZS3cxdfctswWhlw=;
	b=Jn7cjATgvBYoiAdm+LXqaBZj1+O9rozyDJLqERdHV/UgOyj3/6SJjsxkCrxsvdTtbi
	bc2Ij73XX505yoVCyKAc/n8mwqP48ml0lspqRH3hGFj0lDUa4SqhARwXEYd9tDEUZR4O
	C9ZgDcSi92fsCFmsAUnH7/eYwUoVvSbiA8AUeCt5F7nqoAZW/05HuVlXPsMy0uhXR2EJ
	FeylvHt0aEi9XpMfU8zJnjCSFGn8OMVYLLiQo1s8ZqX8dxJuk7epbyaNqjIbNLNStlWi
	EgHJrIpJbifQSNKg9KnGTSSweqA1dEXy+MRgjonm1LcoMj6+OWuQq1wfX4eamhhWeZXX
	lNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w8l0gHi8l3aSC6McmU3ZyZRgiW/AZS3cxdfctswWhlw=;
	b=K+qbZuYpepbXDqhvDjSccArymDNBCXz7WWJFbY+rn3XCIdosfdHnRO4Gb+MxMVtwoI
	PKpnzrTs17X7S+hLayAkTOR8uj4vf8xH6keEJkJW7vszgkWjpC//cCLyIdV1DeFC4qvL
	c2hZNGUUYvFt2xRYS5d5sbncEV6ei32/+N1C3D7n30tX6BLB9i9CRDKBxTIxTPumWuZN
	xEysEHJWTfJu5/4+bB0XAuoIoXtNVRa3ZXBsJn0Zvvo/7EWrFuTOyncz0J2VT6PmY9Gf
	Hy6kp+Qyo64TfywFb5pXPCGpI4ez7h2um+HYyI6ryirTEzXjJxaYcSSJ8MWIRcPBXeTG
	W/SA==
X-Gm-Message-State: APjAAAVNliqlzOrpja7zVs+7vLmM9dgEcS3fV2hDywDx5He+VgymSRRz
	eyF+cRBIiH1Vd4Yw8ra4qQ0aYXulOmU=
X-Google-Smtp-Source: APXvYqwzeP0iiEHZLkSCxHr3hPB6RDhqjxhMd3xXq+uk5uxJe+98a2EUPvaHRh8dkM0615BhNUmQwQ==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr8876944wrn.75.1578746646705;
	Sat, 11 Jan 2020 04:44:06 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	g21sm6060920wmh.17.2020.01.11.04.44.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 04:44:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jan 2020 13:44:04 +0100
Message-Id: <20200111124404.3001-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] proj: upgrade to 6.2.0
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
X-List-Received-Date: Sat, 11 Jan 2020 12:44:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../proj/{proj_4.9.3.bb => proj_6.2.0.bb}                 | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_4.9.3.bb => proj_6.2.0.bb} (54%)

diff --git a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb b/meta-oe/recipes-navigation/proj/proj_6.2.0.bb
similarity index 54%
rename from meta-oe/recipes-navigation/proj/proj_4.9.3.bb
rename to meta-oe/recipes-navigation/proj/proj_6.2.0.bb
index f45f8948d5..fa269d01b3 100644
--- a/meta-oe/recipes-navigation/proj/proj_4.9.3.bb
+++ b/meta-oe/recipes-navigation/proj/proj_6.2.0.bb
@@ -5,9 +5,11 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
 
-SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
-SRC_URI[md5sum] = "d598336ca834742735137c5674b214a1"
-SRC_URI[sha256sum] = "6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7"
+SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
+SRC_URI[md5sum] = "5cde556545828beaffbe50b1bb038480"
+SRC_URI[sha256sum] = "b300c0f872f632ad7f8eb60725edbf14f0f8f52db740a3ab23e7b94f1cd22a50"
+
+DEPENDS = "sqlite3 sqlite3-native"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.20.1


