Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1BE7315A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 04:30:59 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r90so1532122qki.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 20:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o/UfG4saYwqbgr5emz60P/RAbHVdPrrURKAH8U+t9yw=;
	b=Y7p+J9GvH7wwgWRjWugfd8jbgpxIE0uzaICYy5L3lP4x1ldEiCtOX61BACXitDhgbN
	MYAfPrXDcLRXLIPnSMf/YZryq0IZLn3CSC0ID/VqteSCLkZoRNA6xs2C2YJf7BQtQuQ0
	o40RfjVrtHfBb0RSOeLY+FvS12nZ8oByXgF5jFeHI7FCrpjmNLsflxoXc6kGvK/peYkd
	7RrxTxDGhJyyxeZuGOzmRyNjHtHPpdZ4l7XO62F9Ivrg50IC0OUo9OkZxagpqOnzILhG
	nJPmTy7GtnZ5v0yF4cSzuFdrNNhoTKL8eOaKdyeuFjyIAPMpULSKlKD2fdi1OTuQtbsT
	amCg==
X-Gm-Message-State: AMke39mX7Snhwk08n5PWeoHkN6eq/pUUNfAfGxKE1g3L+xKYfR/1feJ1sRUyyBjrVb+Eug==
X-Received: by 10.55.10.135 with SMTP id 129mr645805qkk.207.1487910660275;
	Thu, 23 Feb 2017 20:31:00 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	h124sm4131541qke.8.2017.02.23.20.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 20:30:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 23:30:53 -0500
Message-Id: <1487910653-28294-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] Update UPSTREAM_CHECK variables to allow for version checking
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
X-List-Received-Date: Fri, 24 Feb 2017 04:30:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc | 2 ++
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc      | 2 ++
 meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb     | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index aa35f74..122528b 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -13,3 +13,5 @@ SRC_URI[sha256sum] = "4be4eee8a11deee5c2f00e389b49de8ce2642130282d1cd0adffb2f7db
 PYPI_PACKAGE = "cryptography_vectors"
 
 BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = ""
diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index 1b77a3b..3c6253f 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -14,3 +14,5 @@ DEPENDS += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = ""
diff --git a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
index c8f7b5f..f63457e 100644
--- a/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python-prettytable_0.7.2.bb
@@ -20,3 +20,6 @@ do_install_append() {
         chmod 644 "${f}"
     done
 }
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/PrettyTable/"
+UPSTREAM_CHECK_REGEX = "/PrettyTable/(?P<pver>(\d+[\.\-_]*)+)"
-- 
2.7.4


