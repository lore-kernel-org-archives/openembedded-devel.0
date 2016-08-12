Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id EED2A731DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:08:22 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x67so2264601qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QR/QbRamyoHb5zFnfbDJfdZh7zFyVvC/tRw7qRMjXxU=;
	b=hE0QUKGHh24aWy2qAdmLtnhsHJonCHlyqdGnlJvEuJFILOhYGuPxGyyatvH1GpcWFP
	Q8hvUcbkEUQDbmL1Rw6x1PqhEwD7KlrLbGb2okBLLjr5OvfilpfRpbDsiq/sEcONgnUD
	dIX/Nm3GVR2T9RxP74TypmoDFx5Xi2OPw6Z8TDKLa60lVAZSH2zS3qx8fJI2bJlsm5D6
	8Kp3IDmcGFBSrvPg93QTlTLqTFtBJvkz1v2PrzPwAKDUDRWLthuSo2iej/YG6ambmUQ5
	6qKlHzmALa201WehMpWE9Rh8v9a4LvZG44ZuBkWZOYoF2OY1ZxCX7shks+XnNdwOsBVk
	r2Cw==
X-Gm-Message-State: AEkoous4tpqt11qYDgP+Jc+y9sy9lghFMGFK7p3CLLwPQsLeW1V3yi5MI4qevexI2aAdag==
X-Received: by 10.55.165.138 with SMTP id o132mr18024281qke.90.1471018103260; 
	Fri, 12 Aug 2016 09:08:23 -0700 (PDT)
Received: from argos.minotaurinc.com (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id r5sm3478038qkf.34.2016.08.12.09.08.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Aug 2016 09:08:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:07:24 -0400
Message-Id: <1471018044-21564-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-cython: update to version 0.24.1
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
X-List-Received-Date: Fri, 12 Aug 2016 16:08:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc            | 9 ++++-----
 .../python/{python-cython_0.24.bb => python-cython_0.24.1.bb}    | 0
 .../python/{python3-cython_0.24.bb => python3-cython_0.24.1.bb}  | 0
 3 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.24.bb => python-cython_0.24.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.24.bb => python3-cython_0.24.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index f5945b5..de8a1a9 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -4,14 +4,13 @@ and the messy, low-level world of C."
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
-SRCNAME = "Cython"
+PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+SRC_URI[md5sum] = "890b494a12951f1d6228c416a5789554"
+SRC_URI[sha256sum] = "84808fda00508757928e1feadcf41c9f78e9a9b7167b6649ab0933b76f75e7b9"
 
-SRC_URI[md5sum] = "14fbc970f4a856845e633cbc09e61048"
-SRC_URI[sha256sum] = "6de44d8c482128efc12334641347a9c3e5098d807dd3c69e867fa8f84ec2a3f1"
+inherit pypi
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-netserver \
diff --git a/meta-python/recipes-devtools/python/python-cython_0.24.bb b/meta-python/recipes-devtools/python/python-cython_0.24.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.24.bb
rename to meta-python/recipes-devtools/python/python-cython_0.24.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.24.bb b/meta-python/recipes-devtools/python/python3-cython_0.24.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.24.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.24.1.bb
-- 
1.9.1


