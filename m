Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.991.1589316744138402109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 13:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=AgAWViA1;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M93V2Tx5zCY
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 22:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589316742;
	bh=uoDN5vyrBhQZf+DxxOG+iAphFNrQUiraZnMd2PT5FJ8=;
	h=From:To:Subject:Date:From;
	b=AgAWViA1DsfKiql+d2dcHulDstyEa6qv0fZDlv94Y+3Uxj2qxMMdUOn8qgkXO3LBu
	 JV3Jsfmn4VbKKPdDjUy06/jcq1F8x/UDx97X6YS8nZlajrGTXnPqR5YlZbIAOYWvh7
	 OgWUkaJyE4AGiOmQKykDpxEEzvOBBXLXGopxvBlI620gzdwfXX/aMCDnPG1OQSNVhn
	 tXeT2C6MlEnMbm3y1YbS9TeelZC/7xctBnt99NZJYN/Ifc9J/vi96iUkh+KJfyOPpd
	 CpC3ckiBH8ksuzV5cIlYXohLlYJbm+VfAfnxuKIVJQsp/gOvL+Ef4idmTycNTRzWnL
	 QWxvCQYMn5YqgP2+YwAUUnVenZD9duZ4QZaTKEaozd47I8UpTT0+uZ+u+NYK2OAQH1
	 o8LgRr3mP0K3ZLTW1sthrk1J21xvmOxaNT6NL/0Q6U77NhNunp4qG0HPpkTmjhvw9P
	 0s9TUdmzQ0SwgY+P8Ul0cdpbBVodZCxpEGf9UXCVVjZDK6yHdRwJvia1z0QOrQo6gv
	 P2mg0Qp/wB7hCqBrjgGtya6DhODHqqclDf2XNAez5yMD8oLe/oxJ0gpaRlTlFQAO8I
	 nIG0mE0EAqUmJ5llE5jj0no+YuF9Kk/bzBCaPequk28ttiNLwAYTx28x5Ybn+E3JiM
	 rDPG4ZFSHYqCOW5koTEAIeeE=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] protobuf-c: Remove workarounds for gcc < 6
Date: Tue, 12 May 2020 23:52:19 +0300
Message-Id: <20200512205219.21168-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
index 94c389357..bb8aecded 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
@@ -20,10 +20,6 @@ SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
 
 S = "${WORKDIR}/git"
 
-#make sure c++11 is used
-CXXFLAGS += "-std=c++11"
-BUILD_CXXFLAGS += "-std=c++11"
-
 inherit autotools pkgconfig
 
 PACKAGE_BEFORE_PN = "${PN}-compiler"
-- 
2.17.1

