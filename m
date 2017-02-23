Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4169673138
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 22:48:10 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b16so693822qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w5Z/+X4BXe5BZ7z9LbD/KDEk776Pgv9tJRtZ1/N2iuE=;
	b=OfIRwcAs0Ggi/7XGZp7HwLkbxT0KNQVGzxMMDZuugPn9hM9ikFQyTXzccfDGqSESuZ
	thEfDrRv6eClyZuf7htlfJ7O6B2PCiYqlDNQqp+KPxIIQF+ktH9A3nnRqkoaopqo34E3
	I5lkGSBVQ3HGQNjQzQdNM3ON2V2o+MKyD3rTmUUeR0v6fi9sPPvRYs60I3XB3rBqQXKo
	TTt3nJ0rAwCCd/a4Bm5uDWqqH91qoszaQ5viqwgVWb8HL8RYSuYGI3jiKatRqD2y3dX4
	Cf7uYKXWnAsjJw0dUKUYaNHD5cG4r9pem5ueBI8Olan7lZlBp1TijFNZJLx/Y6l5WLkh
	Fy4w==
X-Gm-Message-State: AMke39lPm3aJx9oWr5RMp9D5KeSYIucCl2jv8o7N0N0MNZxWj3IdxRN0srBkpwJK1+qr8g==
X-Received: by 10.200.1.14 with SMTP id e14mr16874972qtg.244.1487890092328;
	Thu, 23 Feb 2017 14:48:12 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	l91sm3568545qte.55.2017.02.23.14.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 14:48:11 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 17:47:59 -0500
Message-Id: <1487890079-30701-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-bcrypt: update to version 3.1.3
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
X-List-Received-Date: Thu, 23 Feb 2017 22:48:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-bcrypt_3.1.2.bb => python-bcrypt_3.1.3.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bcrypt_3.1.2.bb => python-bcrypt_3.1.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.2.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python-bcrypt_3.1.2.bb
rename to meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb
index d7adc0e..c690f0d 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-bcrypt_3.1.3.bb
@@ -4,12 +4,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
 DEPENDS = "python-cffi-native"
 
-SRC_URI[md5sum] = "c5a79004fc4ad589615e96a6fe45b664"
-SRC_URI[sha256sum] = "346e175c820a111c17d4c2def181a96e1826652edb0bb16e565085ed542785aa"
+SRC_URI[md5sum] = "20da8b40790caad99c4086dba533154b"
+SRC_URI[sha256sum] = "6645c8d0ad845308de3eb9be98b6fd22a46ec5412bfc664a423e411cdd8f5488"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-six \
 "
-- 
2.7.4


