Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C5BED77E31
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 04:41:17 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u26so11052101pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 21:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gy0549Kx6OvwZOgPQYjUqA0sggGCiM8MniSl2AEjdlo=;
	b=XqZ4H+3A3tNztapm/frupiGX3E0OzZ/sBjAiLy02d7YKTskEew0j9hFGEA/sGlizSP
	7sD5bpgBNKPwdZSjP3t7XkOPAJUHRCHf0ebEX6sy60bTIGznVoSC1ZUzIya/o8qp8Msh
	WDY6eFUwklXXR3yyVtQHC34Rne09nVvFfRYmTx5iU39zm8yFG/zwLpectISo3ezE3czx
	TIXxKfk/z5/vC0BXLS1pvADwf8v9mTJHgpkxVi3VrDAsAxoh0OW+pXRFFhIJecXDSVF1
	Tmq2WbQCPenA6IGEjzay46KPIVvE6bmylSqo41cksZKqd/meO+1BKZcHmyMVLvU//M6/
	g47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gy0549Kx6OvwZOgPQYjUqA0sggGCiM8MniSl2AEjdlo=;
	b=RTEmPVgceUrk7eljChtWhxEUcYfk61UA4hjW2st1lOXrzqQJlzZVEXvyezV971vtuU
	9oCMq8jMw7royNncgIylhjN8oo3+Gvrr/NIzKJvCZFi0rJqonIz5EiBsNQHEBuG/WmhV
	xTphdnbLQEbp2BkCNkwkdU+gRmusqf/kL51IPk/cae502BnLbIMdpy98TA6U11VPDbbX
	HJ/sIotIXO8vO4EKW4/JatbaoqjKUAmSEtwhqLCZFMeWQ4pMgdypGNBWOdRikeOI3m75
	Zp+SIr2FqybWhiYcHT8lrAmBUn2AW1Y05jjsh7jNHFnMp5wpE9j81yGXhEWpYqIwhQGM
	f82A==
X-Gm-Message-State: AODbwcBiUIkko1n2tnKeAlNgGwhbnHQ8SxsMzGGS7iiEJSox3N69S1dX
	iCDslTfAxifaJkyj
X-Received: by 10.98.139.21 with SMTP id j21mr4856596pfe.5.1496378479128;
	Thu, 01 Jun 2017 21:41:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	e20sm38502792pfd.34.2017.06.01.21.41.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 21:41:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 21:41:06 -0700
Message-Id: <20170602044106.9484-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170602044106.9484-1-raj.khem@gmail.com>
References: <20170602044106.9484-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python-cffi: Upgrade to 1.10.0
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
X-List-Received-Date: Fri, 02 Jun 2017 04:41:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-cffi.inc                   | 4 ++--
 .../python/{python-cffi_1.9.1.bb => python-cffi_1.10.0.bb}            | 0
 .../python/{python3-cffi_1.9.1.bb => python3-cffi_1.10.0.bb}          | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cffi_1.9.1.bb => python-cffi_1.10.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.9.1.bb => python3-cffi_1.10.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cffi.inc b/meta-python/recipes-devtools/python/python-cffi.inc
index 21e41c188..0ea154f6d 100644
--- a/meta-python/recipes-devtools/python/python-cffi.inc
+++ b/meta-python/recipes-devtools/python/python-cffi.inc
@@ -3,8 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "b8fa7ccb87790531db3316ab17aa8244"
-SRC_URI[sha256sum] = "563e0bd53fda03c151573217b3a49b3abad8813de9dd0632e10090f6190fdaf8"
+SRC_URI[md5sum] = "2b5fa41182ed0edaf929a789e602a070"
+SRC_URI[sha256sum] = "b3b02911eb1f6ada203b0763ba924234629b51586f72a21faacc638269f4ced5"
 
 RDEPENDS_${PN}_class-target = " \
     ${PYTHON_PN}-io \
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.9.1.bb b/meta-python/recipes-devtools/python/python-cffi_1.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cffi_1.9.1.bb
rename to meta-python/recipes-devtools/python/python-cffi_1.10.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.9.1.bb b/meta-python/recipes-devtools/python/python3-cffi_1.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cffi_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.10.0.bb
-- 
2.13.0


