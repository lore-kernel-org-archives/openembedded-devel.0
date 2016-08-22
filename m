Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id DD00A73259
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:00 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r128so8983149qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=5KtI3djBB0DkQkAcD7Mkqdcsi8w2eCG9i5Wbx01rF0w=;
	b=X/Bw/x2eUNfPPgp+IKzpycZR9vxkWcdRCtgshDh2WKS/q4UuHpjpePYIOBlsoneiiC
	TH8IQ0pASbuFog3Gvobg7nWSteHW7rjh+igDKLd0jcYsDOxZofwLwsX7aIxn7YJTPLgg
	nG/rDPNNzANjHcBmOMjDk9csFBoo3aYbmGKTWFEJxTUquPNKNZrdHr+qucL1dJ6zVbeo
	IAxrH8NykZSFqMCqp52yyiEQuRjvCLR/FqwujPMC5TWsGQ6vmsurfwjR9Np1dXZM7Dxv
	Ct2PVHLKaKBxi1eVyUl55wMUGI9RWZyTnm9QroW4sDi/LM1KMtJgOYXU/yFV0tzk41LI
	jr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=5KtI3djBB0DkQkAcD7Mkqdcsi8w2eCG9i5Wbx01rF0w=;
	b=NW3J7SDAfagSPPIHsnPGzvOMY/TVeONW2rET2hFE/kky+FxgMjoQRXxRqo7sb/BdW5
	iZem8pV2LwPkZwvf/5Vsfr4hrINFIdO/zyjEOQVdywPLpzQcs/6HqNzlGwgvNd2p9nQa
	jraEzZGIkMnHsMvO55rWry//pg5+Uk4x5YFaaN/4htuIJohzY0RB2NGc1ztPx0M1hjZr
	bgpxa+/ZC/9JH11mwEIHaRwFbyXfwivUC5M9NjGzJF8JEtCdgvVZPZsI+OQbeF7TLah2
	VBVNnIdXHBMSOCljkUCo10WIRkRJhCtjRPr0nLIFr19GK9o1rHY+2SOnUYUBfNDLGfZK
	CVYw==
X-Gm-Message-State: AEkooutzAZ12NvC4TyCp8yc4CR3592Uk9h2VqJZH7HzcxmtRtMC/obTedtY5+k/+G2+LZQ==
X-Received: by 10.55.99.202 with SMTP id x193mr26285649qkb.74.1471892580853;
	Mon, 22 Aug 2016 12:03:00 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.02.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:02:59 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:19 -0300
Message-Id: <1471892491-6177-5-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 05/17] python-pycparser: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:01 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-pycparser.inc      |  8 ++++++++
 meta-python/recipes-devtools/python/python-pycparser_2.14.bb  | 10 +---------
 meta-python/recipes-devtools/python/python3-pycparser_2.14.bb |  2 ++
 3 files changed, 11 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pycparser.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pycparser_2.14.bb

diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc b/meta-python/recipes-devtools/python/python-pycparser.inc
new file mode 100644
index 0000000..bf3b757
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycparser.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Parser of the C language, written in pure Python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8fb364772b1441821d391591f340c35a"
+
+SRC_URI[md5sum] = "a2bc8d28c923b4fe2b2c3b4b51a4f935"
+SRC_URI[sha256sum] = "7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.14.bb b/meta-python/recipes-devtools/python/python-pycparser_2.14.bb
index 18006ca..adbc1a8 100644
--- a/meta-python/recipes-devtools/python/python-pycparser_2.14.bb
+++ b/meta-python/recipes-devtools/python/python-pycparser_2.14.bb
@@ -1,10 +1,2 @@
-SUMMARY = "Parser of the C language, written in pure Python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8fb364772b1441821d391591f340c35a"
-
-SRC_URI[md5sum] = "a2bc8d28c923b4fe2b2c3b4b51a4f935"
-SRC_URI[sha256sum] = "7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73"
-
 inherit pypi setuptools
-
-BBCLASSEXTEND = "native"
+require python-pycparser.inc
diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb
new file mode 100644
index 0000000..b30db54
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pycparser.inc
-- 
2.1.4


