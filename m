Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A53B0786E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j124so6524813pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v2yn9vznEDiw5MZNFDVXV3eCGFvMVJrh+MJxQ3coph8=;
	b=amjIMrVyZAe2LCR7awazTukvvHic9eQw9XxSGGfCO4qdoqDjOmvjBPJ4TpYOeQcuDs
	5VNxMRDdOshwF7xi+QMmyrtrEjZzbeg6dF0HLe8SvP+l4bsp/K2syIwNkATH1qFi5sLQ
	jqBjMstLmirX8+LWoWH9jyIuNlepUwvYkNmLjEXVycK7UVVFpxEM2JIbBV61UEjL20X8
	GUUkvq0abWjxo1mXiPTcb5RzrRp+vwjfeOxhlZe5VCII//uglC37p/QhRBWvGiVN7aL5
	A+wOfEQKUrHKxI3d+7QzcfVZRsKViALtG3MFQeFC5W6jNeiBi6xV33RXa5tXmOSPRtdn
	WStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v2yn9vznEDiw5MZNFDVXV3eCGFvMVJrh+MJxQ3coph8=;
	b=IZqE/1SAGC4HyHHmQ4pittoeqS44qQV4B8Xq0i//NBD3OR2VljcUnCoCJeVsuWjjBX
	QFUatWt3yuij/2Bms+JM8opIC+iB9eRrHcp8jXI1Zi1icKBZhNA91YjPUWJoNXxW1GL6
	hSidFspA/WmRPtWrBKlNBj8XDtAYQjPY70hzoUk4m8rAgJs83ZxEDvadNZRZjbTQWtc3
	KtaYiJZ6kOoUtdqs/KYi8GNPef3/nniO6nnWjWzvTy7TAvrsm8a62XBxgyO6/xjp4cjZ
	JYXWfAMz1TQ/m8E7p00gF3OXOV4cJ9a2GR4ywByQ9WG00QOdF/sYf+MeFxTOQOkgauWj
	QXLQ==
X-Gm-Message-State: AKGB3mKWwVsz4v3b2fDCGdpA5hVVSP94vXk6qBbSncdv7x7S5n4+qhMJ
	uEO+YeiqBfdV9JDffmfZPBV9MA==
X-Google-Smtp-Source: AGs4zMbAwzq/ju9La5DO/sMXTqH7qXnWIqIVlHstXAB3M/1XBjeK5M9DL5s67ce1ceJ7+PTrvrDJ5g==
X-Received: by 10.99.66.68 with SMTP id p65mr9484384pga.339.1512712173852;
	Thu, 07 Dec 2017 21:49:33 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:33 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:07 -0800
Message-Id: <20171208054911.27014-10-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 09/13] python[3]-speaklater: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:33 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-speaklater.inc     | 9 +++++++++
 meta-python/recipes-devtools/python/python-speaklater_1.3.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-speaklater_1.3.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-speaklater.inc
 create mode 100644 meta-python/recipes-devtools/python/python-speaklater_1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-speaklater_1.3.bb

diff --git a/meta-python/recipes-devtools/python/python-speaklater.inc b/meta-python/recipes-devtools/python/python-speaklater.inc
new file mode 100644
index 0000000..94fa8a6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-speaklater.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Media asset management for Python, with glue code for various frameworks"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b810770075a29bf44b96607440e7c801"
+
+SRC_URI[md5sum] = "e8d5dbe36e53d5a35cff227e795e8bbf"
+SRC_URI[sha256sum] = "59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe65e6bfffdd6a65a9"
+
+PYPI_PACKAGE = "speaklater"
+
diff --git a/meta-python/recipes-devtools/python/python-speaklater_1.3.bb b/meta-python/recipes-devtools/python/python-speaklater_1.3.bb
new file mode 100644
index 0000000..56fd555
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-speaklater_1.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-speaklater.inc
diff --git a/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
new file mode 100644
index 0000000..aa4f699
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-speaklater_1.3.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-speaklater.inc
-- 
2.7.4


