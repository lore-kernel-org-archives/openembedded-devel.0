Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1771677F34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 22:45:27 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id i14so5799958qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 15:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0066HsuC4TIQc887LGs9ZwKE9dIJAwz2hfoRD59mKOY=;
	b=iwvvsPwC6erSqLmMgT6T9dnfvqN4fWY/x1A3E9s4Eh3QqmtZJeVCxfkl2q3CkrxQnl
	GzOAWW4koF9Hkp/vHO+2fCJS/kMEtxhWMiSmDbrKQ3R4T5bdvJge1bxJakSYUduP42CH
	qsSwanYMQnIXJtDxm28pmfAWjX0tn11Hdc6qXJ8urlmx9TMlgMfuENc/EF6GVq5fStVL
	ufO20+xwfCHAcr9PombUaRycjf3bHHYFvRHJPBEXOKE62QHhOi2x7iICPziCVJR9cSwp
	qr5N2JFfG51Xb9HfWpLR7YJRr8UwypYx73liWLHqiAOZxUjYVi52/9LZAv8tbDwMUd7Z
	BSMg==
X-Gm-Message-State: AHPjjUh03iZSOWv+sln6YJ+KrocgzPkgrAn0PvGSbRZRZkeoTJIpwDKo
	23+pVvh28gRFtG9JKx9IF7pAT1st
X-Google-Smtp-Source: AOwi7QAkBgbutkPYt4+ZWMBgBKih4Sf9iXZ2/synjp/l2I9U/+pVvDePIZA5rxvWxycnCpGab74JAw==
X-Received: by 10.55.212.132 with SMTP id s4mr12861950qks.82.1506379528802;
	Mon, 25 Sep 2017 15:45:28 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id 16sm5908459qtw.38.2017.09.25.15.45.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 15:45:28 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Sep 2017 18:45:22 -0400
Message-Id: <1506379522-15392-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-parse-type: update to version 0.4.1
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
X-List-Received-Date: Mon, 25 Sep 2017 22:45:28 -0000

Update license checksum for 2017 copyright update

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-parse-type_0.3.4.bb        | 11 -----------
 .../recipes-devtools/python/python-parse-type_0.4.1.bb        | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-parse-type_0.3.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python-parse-type_0.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python-parse-type_0.3.4.bb b/meta-python/recipes-devtools/python/python-parse-type_0.3.4.bb
deleted file mode 100644
index 9dc37cf..0000000
--- a/meta-python/recipes-devtools/python/python-parse-type_0.3.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Simplifies building parse types based on the parse module"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=be38402eb4b6c224e4914fd82e0e1436"
-PYPI_PACKAGE = "parse_type"
-
-SRC_URI[md5sum] = "00ba70bc5ca67624207b0dfced01dc8a"
-SRC_URI[sha256sum] = "3dd0b323bafcb8c25e000ce5589042a1c99cba9c3bec77b9f591e46bc9606147"
-
-RDEPENDS_${PN} += "python-parse"
-
-inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-parse-type_0.4.1.bb b/meta-python/recipes-devtools/python/python-parse-type_0.4.1.bb
new file mode 100644
index 0000000..84a9901
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-parse-type_0.4.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Simplifies building parse types based on the parse module"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d07323820cca0f1d192cbbf8a0516f95"
+PYPI_PACKAGE = "parse_type"
+
+SRC_URI[md5sum] = "3697afc1b29f2857f6c7dc9590f25ce1"
+SRC_URI[sha256sum] = "9a624f3b51604423f5de5321da11b0ae73f368b2a3cb4b383a6cf84ca4e4d495"
+
+RDEPENDS_${PN} += "python-parse"
+
+inherit pypi setuptools
-- 
2.7.4


