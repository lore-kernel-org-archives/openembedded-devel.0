Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 225A060107
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 16:41:29 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id v28so5216472qtv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 09:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vXmZFdQN0H5d6BkurUdAC/JD+Y0zRn1H6cyrgxyB46w=;
	b=X2mFCEJb8730HEB6TsicjAM3rHb2beFle/CNtThdclE6135R1ZVHcyX/AoOBLA0EkK
	kQr0o52IKLACdM20FdDrA5leW82oD4ql1K2OTj78LNwaisGatzQ5AXSze4FnjH0DMmj/
	1kkaAcFrt0cWuqscZuwzNfA5pTOcIFSFAdm0cAmJrvfk+elhqOBnKv6nTRyUAO2qNOJ+
	tgbeJDP17WV42fdlRGkyDTVvPlR9MmGMtjA16q9xYDAo8T9n8+4rZqiK7XGCesjP7Ruo
	6DdYKBwDdgMIIlz0hL2//Y44Qj6+YBBN3uoHJhDzevyCXNOz9ZCA4iB55pf+hyPSaEav
	EuHg==
X-Gm-Message-State: AMCzsaXQyupR1Laog/WQg9R8PCDun+HaqERIGa3sgOU+gqmjBvUS1drn
	z0+VLis2cpM/OsDslWvJPBXf4yAf
X-Google-Smtp-Source: AOwi7QD2bhBXtlyx2C38ZeH8x0QuyPGSzOvep1wgNokNxerniUX45SrVZAy+8hHvjjBr/GBqurSdHA==
X-Received: by 10.200.44.81 with SMTP id e17mr8950962qta.332.1507048890544;
	Tue, 03 Oct 2017 09:41:30 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id p8sm4156149qki.57.2017.10.03.09.41.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 09:41:29 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 12:41:08 -0400
Message-Id: <1507048868-6923-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pylint: update to version 1.7.4
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
X-List-Received-Date: Tue, 03 Oct 2017 16:41:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pylint.inc                 | 4 ++--
 .../python/{python-pylint_1.7.2.bb => python-pylint_1.7.4.bb}         | 0
 .../python/{python3-pylint_1.7.2.bb => python3-pylint_1.7.4.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pylint_1.7.2.bb => python-pylint_1.7.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pylint_1.7.2.bb => python3-pylint_1.7.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pylint.inc b/meta-python/recipes-devtools/python/python-pylint.inc
index 3ce1cae..c55bce6 100644
--- a/meta-python/recipes-devtools/python/python-pylint.inc
+++ b/meta-python/recipes-devtools/python/python-pylint.inc
@@ -3,8 +3,8 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI[md5sum] = "27ee752cdcfacb05bf4940947e6b35c6"
-SRC_URI[sha256sum] = "ea6afb93a9ed810cf52ff3838eb3a15e2bf6a81b80de0eaede1ce442caa5ca69"
+SRC_URI[md5sum] = "98a1ee985a3ebc876a20eb7577dbab68"
+SRC_URI[sha256sum] = "1f65b3815c3bf7524b845711d54c4242e4057dd93826586620239ecdfe591fb1"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pylint_1.7.2.bb b/meta-python/recipes-devtools/python/python-pylint_1.7.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pylint_1.7.2.bb
rename to meta-python/recipes-devtools/python/python-pylint_1.7.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pylint_1.7.2.bb b/meta-python/recipes-devtools/python/python3-pylint_1.7.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pylint_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-pylint_1.7.4.bb
-- 
2.7.4


