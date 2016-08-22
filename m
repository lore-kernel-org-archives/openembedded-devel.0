Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id E9BA5738AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:20 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v123so8957183qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=u2qzI9Nb0RPQSbhCXM70IL0RBI1ePz2SIZD7oxrEmJ8=;
	b=FlKf+kJOH83Lt1MAclRN5tGDHlY3EXD+9+iqtwZmfvuKHiiNfqviybsBhYm2KqazPS
	zoeK/TKg2qDmun0aQAmFbNfuVEZZtE/Rj4gOxsEHxNcnE73prG5vN4/dveRiuh/3GoT9
	5ZiGilCIImJGkkaX5+tyYs6DO8bImMZFsmDDFpQDHiTyM9RpMMd5xclKMA0FVAAyDWV4
	3uq5o9FSvGdHtpJQY19xP3p3o4LKBR7ZZWSVVlTf2XY7BlOJm0H0V1rRK1J8I3/DLmzf
	w55P4HKjL4jeLwTfjHvprbK5O9ttY5rTKc6J4+3b3cNbecbPuMNA34XRu1C7njxsffdm
	rL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=u2qzI9Nb0RPQSbhCXM70IL0RBI1ePz2SIZD7oxrEmJ8=;
	b=gnYprJKYYQh9jq5tKyl/CLU+813PudasQ/QUav07j+MlA6Vpt6Tjo9SejwfFAEt/PT
	NBhoKXLCxR5RIuWd1kPR+otJaVj8toaqaJOnXDb5VNLpIMpZjyzICD00Td7ArLo3AzGv
	prmYHCgTb5PBniFLzaBMC7LKmDh4hq9/IntvyarFh6ZPYZKf09l4HR4IiYyadLBqP/LB
	m4hlpzgX0/T23Hzs6MV76cxwIAp9bktmymUzHFoEIh24BwGSzF3+7Dt8asmcbxmLlvOl
	93VUJqvXIiqGp2ObmDkDVLM/lh/mta/YGlu9VRedE8IaOpVa5SlyFjLDeVicVV0nofwy
	8aew==
X-Gm-Message-State: AEkooutT7+mcPlyTgLSEmQfqZA/dMVNe8oS+mV6IjytSrQsPQbFoVzQ0OGbjfUXkBdDqPw==
X-Received: by 10.55.180.2 with SMTP id d2mr25658001qkf.175.1471892599603;
	Mon, 22 Aug 2016 12:03:19 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:18 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:24 -0300
Message-Id: <1471892491-6177-10-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 10/17] python-pretend: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:21 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-pretend.inc       | 8 ++++++++
 meta-python/recipes-devtools/python/python-pretend_1.0.8.bb  | 8 +-------
 meta-python/recipes-devtools/python/python3-pretend_1.0.8.bb | 2 ++
 3 files changed, 11 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pretend.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pretend_1.0.8.bb

diff --git a/meta-python/recipes-devtools/python/python-pretend.inc b/meta-python/recipes-devtools/python/python-pretend.inc
new file mode 100644
index 0000000..2d21cc4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pretend.inc
@@ -0,0 +1,8 @@
+SUMMARY = "A library for stubbing in Python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
+
+SRC_URI[md5sum] = "7147050a95c9f494248557b42b58ad79"
+SRC_URI[sha256sum] = "930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
index ddc7b62..73b8ed4 100644
--- a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
@@ -1,8 +1,2 @@
-SUMMARY = "A library for stubbing in Python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
-
-SRC_URI[md5sum] = "7147050a95c9f494248557b42b58ad79"
-SRC_URI[sha256sum] = "930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964"
-
 inherit pypi setuptools
+require python-pretend.inc
diff --git a/meta-python/recipes-devtools/python/python3-pretend_1.0.8.bb b/meta-python/recipes-devtools/python/python3-pretend_1.0.8.bb
new file mode 100644
index 0000000..9c5d8a8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pretend_1.0.8.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pretend.inc
-- 
2.1.4


