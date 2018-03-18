Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 27C0678678
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:32:39 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id a23so15547003qtn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 07:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pS9OePYtaEpllkmUKrcngiCE/Gj3YRdG82GAH9wlaW8=;
	b=F+b0h9CyC9FOvY3eTMNeP/NIgGIb+/T+uq33/2YArPymTgn1FFA8YLs+9FZPb3IHfw
	fA+kmJG4zYamMC9FsNJCZV/4+ttYsrL4W9LXCC9xHAt9nSCADlZhv5eCJpO9FV4JDPSA
	sl5HDaub4od9zJD7tkBBVieQSfn0Eoy2Fz3aYOto99bXJk2cVpI4MJ+vZbyAQmY2PIAn
	SPg1m3WDaxYwD8anR+YTWDoqxd2ebJGrNxwUXPgX9Z2mn2s+PVabviJDT902fUaTfujc
	AW8JVZAftEpDU2fpiHox5Hd0YVShbXCTIOkyyKGNihea0TNpz9sAjJputv0S0FgxP1aN
	IKBw==
X-Gm-Message-State: AElRT7FH0bGKsQ5CHaB0qC/h0G1+9usvkK2vMRNtuhBOA5y8skmvhXcm
	VTMD90sseCFL8tmXnYLbQP7YKoag
X-Google-Smtp-Source: AG47ELuq7GXAGiXgurYQvJkU88xOCGZ1zC2C7W95FBS2p9J1lE8WWlftX0O2osEzD/16E7JjyYCpMA==
X-Received: by 10.237.53.231 with SMTP id d36mr12692545qte.276.1521383560797; 
	Sun, 18 Mar 2018 07:32:40 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id s3sm8955091qte.95.2018.03.18.07.32.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Mar 2018 07:32:39 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 10:32:34 -0400
Message-Id: <1521383554-17626-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-cython: update to version 0.28
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
X-List-Received-Date: Sun, 18 Mar 2018 14:32:40 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.27.3.bb => python-cython_0.28.bb}         | 0
 .../python/{python3-cython_0.27.3.bb => python3-cython_0.28.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.27.3.bb => python-cython_0.28.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.27.3.bb => python3-cython_0.28.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index dee647e..550d9a3 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "6149238287d662bd5d5e572482252493"
-SRC_URI[sha256sum] = "6a00512de1f2e3ce66ba35c5420babaef1fe2d9c43a8faab4080b0dbcc26bc64"
+SRC_URI[md5sum] = "459a7980c508e61fc37b3245612969ac"
+SRC_URI[sha256sum] = "518f7e22da54109661e483a91a63045203caf9fd78da4a69185a7622f759965f"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-cython_0.27.3.bb b/meta-python/recipes-devtools/python/python-cython_0.28.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.27.3.bb
rename to meta-python/recipes-devtools/python/python-cython_0.28.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.27.3.bb b/meta-python/recipes-devtools/python/python3-cython_0.28.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.27.3.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.28.bb
-- 
2.7.4


