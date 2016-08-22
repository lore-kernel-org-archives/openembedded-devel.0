Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 07FDE73D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:13 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v123so8956980qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=H1hSQZk3wSuy2XEfy20yMbFeiFfXrGrq2AczFxc9KI4=;
	b=LWCKExFFH7duJeIIBHASVKb8oovxshphp2dsZfPZ7a8fIkcF1C6Gzu0c8U1hQlnlrM
	IXmWHnZwEybS81rqsxa3Y25Sj57Dq/ueTZX+Il/438UY/fXbrTTEXr72NbrzPDivON63
	4ERjbH0a7/shpFG9LVrxEwM55q3ABTpBdpxiU1lNxZxVeZAhBoWaOCRhembSNmNLCLUK
	OH0Ui556tm/ZU1Kce76Df/LDCaO25G/gK+5hrsnbrZZKauMMmowS/5kSJpB+iVQAa56O
	b6e5iLWkWfK2qxqs0smPn7TIbEyJRksJYHKlHe30ZVYvxg6RJAUHtXGP3RjDDCZFxY34
	i8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=H1hSQZk3wSuy2XEfy20yMbFeiFfXrGrq2AczFxc9KI4=;
	b=iQutpbXmRggBpUkYAHj6i/iO8v8BeL5II+QaDgRZZZTe+eXieEPS6/+DLXc0uaBWv3
	f1xE0fGnIUzwYX2/G7QCxs0l09ORPB2av7Y+6D+nB3rqKEO9wUsbcRBJmEfmRjYxCmp0
	w7UMG83OBDfWicO+cgla1iwC3GEG03uSRhW0Ndqrh7TlOM3PJYPNXgAychcplCVgcMkn
	hAHUl3sMVG513r6iANOYLGcphPfW8akC0Rub9oykEJUVr6n7v1FiEcfRsqqPBIOjkr1r
	mlRO8eZIP8mUP5ivN7yRkAa7qnBndH7MB/Hv6tRoHZcZbD0O/isXkH852U+KOpVmqCzl
	n+QQ==
X-Gm-Message-State: AE9vXwPu7In15X++G+vY5NpchAqwQ0wnDsQaiEOlhyYmBFKr7I9BPCCl0U6jhH9m+bVZZQ==
X-Received: by 10.55.145.129 with SMTP id t123mr6692919qkd.130.1471892593770; 
	Mon, 22 Aug 2016 12:03:13 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:12 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:22 -0300
Message-Id: <1471892491-6177-8-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 08/17] python-cryptography-vectors: Extend recipe to support Python 3
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:13 -0000

  - Add Python 3 recipe
  - Add native and nativesdk to BBCLASSEXTEND
  - Use pyppi class

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/python-cryptography-vectors.inc               | 15 +++++++++++++++
 .../python/python-cryptography-vectors_1.4.bb            | 16 ++--------------
 .../python/python3-cryptography-vectors_1.4.bb           |  2 ++
 3 files changed, 19 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography-vectors.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-cryptography-vectors_1.4.bb

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
new file mode 100644
index 0000000..62dfbfd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Test vectors for the cryptography package."
+SECTION = "devel/python"
+LICENSE = "Apache-2.0 | BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+
+DEPENDS = " \
+    ${PYTHON_PN}-cryptography \
+"
+
+SRC_URI[md5sum] = "b8555dfadafc4ecab4ee4650430d9cab"
+SRC_URI[sha256sum] = "0728815ef0c53d67fd437aa5220450a9752d41ecb28108f5df628a092ff466ea"
+
+PYPI_PACKAGE = "cryptography_vectors"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb
index 0313c81..4975278 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.4.bb
@@ -1,14 +1,2 @@
-SUMMARY = "Test vectors for the cryptography package."
-SECTION = "devel/python"
-LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
-DEPENDS = "python-cryptography"
-SRCNAME = "cryptography_vectors"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/c/cryptography-vectors/${SRCNAME}-${PV}.tar.gz"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI[md5sum] = "b8555dfadafc4ecab4ee4650430d9cab"
-SRC_URI[sha256sum] = "0728815ef0c53d67fd437aa5220450a9752d41ecb28108f5df628a092ff466ea"
-
-inherit setuptools
+inherit pypi setuptools
+require python-cryptography-vectors.inc
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.4.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.4.bb
new file mode 100644
index 0000000..58994ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.4.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-cryptography-vectors.inc
-- 
2.1.4


