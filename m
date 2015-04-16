Return-Path: <ticotimo@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id C946A73D0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 15:17:44 +0000 (UTC)
Received: by yhcb70 with SMTP id b70so4514817yhc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+G4jBclJVW66dotQTZHN2HJs2MvJz4tZLhWpMYTlL4A=;
	b=HnjLx37nNLC/3UEsSWVI7Vyga6E0dAIxdjM8IPzyuNd+HhBRNJyRVe+rRWvENjmXe1
	WeYerrvifjFsJKXmJvkD4QKTF6M7Vk/NYMwVryLiJlels/peTfWRIVLVHRjhQb9topQV
	Gi7kU18rFfOZn1hsJyRD+kBf2DVEb3fuD8VLwFT2SXMW0C/oa6S/VmVmm4NPjQEsxmbA
	UwD4SQUFEYBsAEUXYDeOZ/UrnyYgnp4mb/0W926H9dhj29vJq5CWE8Tamh1wmODLBza/
	7JKV/2OTU8jploi3Tyh6PtlcnrVmW5juZ8wrNBH9bKkl7ealRmuzREDTcsMOD/mNIepA
	G4CQ==
X-Received: by 10.170.94.2 with SMTP id l2mr18312434yka.45.1429197465548;
	Thu, 16 Apr 2015 08:17:45 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id f68sm5836059yhc.54.2015.04.16.08.17.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 08:17:44 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 08:16:29 -0700
Message-Id: <cover.1429196681.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-python][PATCH 0/7] python-cryptography support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 15:17:44 -0000

Since 0.14, python-pyopenssl requires python-cryptography.
This series of patches provides support for python-cryptography
and ptest for python-cryptography.

Requires fractions module, provided for python 2.7.x by:
http://git.openembedded.org/openembedded-core/commit/?id=ac09a1830fffb6aded499ade55c039e35202867e

python3 patch is in oe-core master-next:
http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=d8482c74d2a7bb68ca9cc1623973e6778d714430

The following changes since commit 415a90c67f296f8816acd4d933298b101f8e830c:

  postfix: add LSB init infos (2015-04-15 22:43:37 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib timo/python-cryptography
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=timo/python-cryptography

Tim Orling (7):
  python-cffi/python-pycparser: enable native build
  python-py: add 1.4.26
  python-pytest: add 2.7.0
  python-iso8601: add 0.1.10
  python-pretend: add 0.8.1
  python-pyasn1: add 0.1.7
  python-cryptography,-vectors: add 0.8.1

 .../recipes-devtools/python/python-cffi_0.9.2.bb   |  2 +
 .../python/python-cryptography-vectors_0.8.1.bb    | 14 +++++++
 .../python/python-cryptography/run-ptest           |  2 +
 .../python/python-cryptography_0.8.1.bb            | 46 ++++++++++++++++++++++
 .../python/python-iso8601_0.1.10.bb                |  8 ++++
 .../python/python-pretend_1.0.8.bb                 |  8 ++++
 .../recipes-devtools/python/python-py_1.4.26.bb    |  8 ++++
 .../recipes-devtools/python/python-pyasn1_0.1.7.bb | 16 ++++++++
 .../python/python-pycparser_2.10.bb                |  2 +
 .../recipes-devtools/python/python-pytest_2.7.0.bb | 10 +++++
 10 files changed, 116 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python-cryptography_0.8.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
 create mode 100644 meta-python/recipes-devtools/python/python-py_1.4.26.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyasn1_0.1.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb

-- 
2.1.0


