Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC73781CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:05:52 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s33so11638260qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mH+c+Ju3EolAWhH8pOVuekGoPNVsKE9J94URNDHTNbg=;
	b=kMM2TuF43S4HqXUMnUfzsn2UElouy5Bce9YWyM4Lv2sTUbwR3LG83rH83r2cW45qEy
	iD/hyHcwNVlRtaoz8Z7D0p7zyKu5XozGkAiSP7dz+QfQrCPNtcv8XsUTw5eulWTSEqFp
	nPGd+bCdlTjTFB2m9NOH8n2jrTi4WWz+7+7jX0qpKWwwxktwceKa1MZ18/bdUfriFwmx
	M22BkcGzOUsDzcO2C1tK28xRw5mnMqifF6IsdxxhrMhnB7j4gjW6gReK43u2D/ChE6o/
	Zqiv6HdzsdJY0MVkrp2l15b9IX2vvyCoOFfQnqPMY6ZWxL6pyNsFZiLnYzVK2eD8eAvf
	gflw==
X-Gm-Message-State: AKS2vOzQdaPHjOVtc3NprLlCA2ZMmZMuSnPDaLPXtd+9vSl/8M07dRPf
	y1AwRgCuV4gXUT7iewA=
X-Received: by 10.233.235.201 with SMTP id b192mr14272901qkg.138.1497632753219;
	Fri, 16 Jun 2017 10:05:53 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	t11sm1999591qtt.47.2017.06.16.10.05.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:05:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:05:45 -0400
Message-Id: <1497632745-10360-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-sqlalchemy: update to version 1.1.10
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
X-List-Received-Date: Fri, 16 Jun 2017 17:05:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc             | 4 ++--
 .../{python-sqlalchemy_1.1.9.bb => python-sqlalchemy_1.1.10.bb}       | 0
 .../{python3-sqlalchemy_1.1.9.bb => python3-sqlalchemy_1.1.10.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.9.bb => python-sqlalchemy_1.1.10.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.9.bb => python3-sqlalchemy_1.1.10.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index 07e70d7..d2a7be5 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "938b1e5ca2372c3ec9a586996a3b5653"
-SRC_URI[sha256sum] = "b65cdc73cd348448ef0164f6c77d45a9f27ca575d3c5d71ccc33adf684bc6ef0"
+SRC_URI[md5sum] = "64b9a3bf34e17944f844cbf460bd14e6"
+SRC_URI[sha256sum] = "dbd92b8af2306d600efa98ed36262d73aad227440a758c8dc3a067ca30096bd3"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.9.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.9.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.10.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.9.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.10.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.9.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.10.bb
-- 
2.7.4


