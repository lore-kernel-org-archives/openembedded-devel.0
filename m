Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5B4738AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:30 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v123so8957479qkh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ArqasocljDK+XHPrmyjwKbaChpBXn923QqtNarP12MQ=;
	b=umsnwwf5BUZmngiy5FGiYkfbTq3gA9nHB5BmT4ILdGhA3eWCIRhEBEC527udB1CabI
	NjhF3S1LX5UdiPGIxVWmm6oXbBcjIa0EJ3XMMvAOj34Xlqw+e80NaBZXU2fnsbETyhTu
	mgzDChS4lUEL1mM4KYCwJQKuVsEVERL65hjrLNYz4mR9EkFK099Ee26AYaHGPZ4f7Ner
	lcf+LRqyBhWHsxph4gWCO34hDTfLB6ImL1a9Pq7wcnqQZrT8yiqcR64Ld4efI5R4iDTy
	K42ZsJp2qA9JXh0OBexMVC8TteqjNcmH2eLVX5nRyj3oANstza6LUR0mzghkM2AsxEAs
	VDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ArqasocljDK+XHPrmyjwKbaChpBXn923QqtNarP12MQ=;
	b=aZZ6eSvYn/sPVqq1NtajpsOogUh8whTSU9sPEOkbci+DJXnz/rhcudU7PKALiPtNa5
	y1M9pg3iEvJdrSbCdeKc+6IRZTcn9KQM+HL4/0Rj9QX9H8Xg27kVa8GMinCrPlis7wnV
	WjWwPFxNP3ThPB4d7mu5mQlduuikc6I1ecw4Z7WSTR/D8IkVLs5MEVR39zSnEqAld3jG
	paHa7qJKWGUsuoF6ERkHQSSdyiLG8/cX0WFoKWIViGDGRaHiG+4aTu/pZPsgBPUQSfY2
	hhI4wG9Ol2USrTSqABFRQLgTl2F6ydKwaNRDcgvNO5V945ARN1lgDazBR7U59cr1kuLe
	BLWg==
X-Gm-Message-State: AEkoout+fyEZggMOnZeEYmyr1HDzCiyGOkeyEBOHFlYQl0s1ZZBxKoNLqYn+Cs8lYKsrBw==
X-Received: by 10.55.137.67 with SMTP id l64mr24723939qkd.21.1471892611430;
	Mon, 22 Aug 2016 12:03:31 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:30 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:28 -0300
Message-Id: <1471892491-6177-14-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 14/17] python-pysocks, python3-pysocks: Add recipe for version 1.5.7
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:30 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-pysocks.inc       | 11 +++++++++++
 meta-python/recipes-devtools/python/python-pysocks_1.5.7.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pysocks.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pysocks_1.5.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb

diff --git a/meta-python/recipes-devtools/python/python-pysocks.inc b/meta-python/recipes-devtools/python/python-pysocks.inc
new file mode 100644
index 0000000..0697fd7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pysocks.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "A Python SOCKS client module"
+HOMEPAGE = "http://python-requests.org"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
+
+SRC_URI[md5sum] = "68f4ad7a8d4fa725656ae3e9dd142d29"
+SRC_URI[sha256sum] = "e51c7694b10288e6fd9a28e15c0bcce9aca0327e7b32ebcd9af05fcd56f38b88"
+
+PYPI_PACKAGE = "PySocks"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pysocks_1.5.7.bb b/meta-python/recipes-devtools/python/python-pysocks_1.5.7.bb
new file mode 100644
index 0000000..8a24e4c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pysocks_1.5.7.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-pysocks.inc
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb
new file mode 100644
index 0000000..6b09355
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pysocks_1.5.7.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pysocks.inc
-- 
2.1.4


