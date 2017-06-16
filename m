Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 100817850C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:51:54 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id w1so11870077qtg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PjNj58yMqpowQwoJAx78bVH2/u6yTzPyc3O/j+48R9w=;
	b=D/IP9ohxcW4zLrRUdX+qOiWB/Lx4Lus9gqpzVg7M+OxkwnVRYkyRrYJC9GIGEscJeK
	NT5UEJbSIv1tTOpP7ekfGX+Hb3GP8D6OL1g2IqH3D2oaM+YWc9Fm3bccA3lSxWTK4eD+
	29vnZWVOuTdzSz1CBO0/yIeAM2F+u4RaV94tukMkVHDVjTyT0xf5HZnoPSrkCAQJ8ggb
	UlJ8PRUmIauWzWxEPS6pJKB8oI+4T9ebTUQBF52zANqyPLX0Iq4BQJBTdQZsR7JBDFbk
	Bn//HHHEjulF+JsvUtiV+5aRZVHTapHUsDfZDLHLqxc1UNgSIq+UyQ/RfMCNs3Gy/0UL
	YXSQ==
X-Gm-Message-State: AKS2vOxhg+MyDz/BQgQ2Y4ASA0HNgKQd9CHn2R+i5I3gnko4h9joufZD
	G81fDSodQ4YyRjtRmcg=
X-Received: by 10.55.99.76 with SMTP id x73mr13709610qkb.219.1497635515916;
	Fri, 16 Jun 2017 10:51:55 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	r30sm2051819qtc.63.2017.06.16.10.51.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:51:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:51:48 -0400
Message-Id: <1497635508-8276-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-urllib3: update to version 1.21.1
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
X-List-Received-Date: Fri, 16 Jun 2017 17:51:55 -0000

Verify license terms remain the same and update checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-urllib3.inc              | 6 +++---
 .../python/{python-urllib3_1.2.bb => python-urllib3_1.21.1.bb}      | 0
 .../python/{python3-urllib3_1.2.bb => python3-urllib3_1.21.1.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.2.bb => python-urllib3_1.21.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.2.bb => python3-urllib3_1.21.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 485f57f..8f31c27 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
 HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=06dfcbb88fb0787a2039e26af11276f5"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
 
-SRC_URI[md5sum] = "e62d42006807308fea9556c17af8e250"
-SRC_URI[sha256sum] = "cc49b66adcb45e19c6944cff35eedb60ee2228f0afba51f4da29c47e7a398f15"
+SRC_URI[md5sum] = "ef6c72c79b9c6bcd68c204f9b92abc86"
+SRC_URI[sha256sum] = "b14486978518ca0901a76ba973d7821047409d7f726f22156b24e83fd71382a5"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.2.bb b/meta-python/recipes-devtools/python/python-urllib3_1.21.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.2.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.21.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.2.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.21.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.2.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.21.1.bb
-- 
2.7.4


