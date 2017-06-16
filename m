Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id C894A784CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:59:12 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s33so11592832qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m5BJ6HN2WxXkEjbUxkIeOWLGQID8E11eIn29PIJ5oIU=;
	b=SLFgMZMOcYgpwUhWFnydLpedOTPDrBb8UIp1YgvszTGk0E2naoVCgsWQY9dJ0wVDe2
	dYlWXtIfpK49eWCSBWVzhtvKvalUH1nX/s4HF8bkslVT4vrz4lcTRQAcKM+sns5TfnMy
	1oMuq+Z98i+Jf+2z0RRujgdFhUw+5egMK9id19/8uAg31+N2sF++iEFD6aEXjrroVmd4
	q7xe3FGe9fMAXbVguSn4jMvh98V/sh5sX7lhsE6WB7ohJqyczJjDhb/dC2N029ys0EyF
	ER8Rnta2h1N45M02rHiFK/HqfddeD9iyenao2a2S55BfA4KYzpzaRf5lD484mZvQ6H3x
	z9jA==
X-Gm-Message-State: AKS2vOz/iQq290mBfqvMUi+w3EvVi9taif2o+UX4h9wSbFOyB5Gz9g6r
	89cY266Z0BAVB9Ql2mI=
X-Received: by 10.200.45.132 with SMTP id p4mr13833895qta.208.1497632353965;
	Fri, 16 Jun 2017 09:59:13 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id f85sm2160757qkh.6.2017.06.16.09.59.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 09:59:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:59:06 -0400
Message-Id: <1497632346-2967-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jsonpatch: update to version 1.16
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
X-List-Received-Date: Fri, 16 Jun 2017 16:59:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-jsonpatch_1.15.bb => python-jsonpatch_1.16.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.15.bb => python-jsonpatch_1.16.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.15.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.16.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-jsonpatch_1.15.bb
rename to meta-python/recipes-devtools/python/python-jsonpatch_1.16.bb
index f214bf2..bbc61a4 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.15.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.16.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "818d36e05d68ba90ca2b26597bd82975"
-SRC_URI[sha256sum] = "ae23cd08b2f7246f8f2475363501e740c4ef93f08f2a3b7b9bcfac0cc37fceb1"
+SRC_URI[md5sum] = "8ef1ceb00dcf992c9e43611f698f9279"
+SRC_URI[sha256sum] = "f025c28a08ce747429ee746bb21796c3b6417ec82288f8fe6514db7398f2af8a"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-stringold"
 
-- 
2.7.4


