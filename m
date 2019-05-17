Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id CB1477DF85
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 09:44:39 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t22so3046693pgi.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ca9dSkp5nfyVOdVlf55LYURuzLNzwDJT6/TmugOhKN4=;
	b=N3SpLT5fpP7xv/xVGAamwprfovWQMBv1JdYxXr30Br/gE6jh7wzlw698gJ5sLDRjoy
	NiekayQcrd2Dg8bkbegDsE2GMdo+V7DCn8dQO8y0Qmm65Cpv/c9qX/BP6yJSrAyCDY0s
	YDTHVq0GDsmyVIsNd1cteqJHA8l7ZjR8BY6XU9+W50AMEKrZkqW4fEoqbAp/OrCnILNV
	d+mnY0zqFsjESstST/IyTKPmz4S9kvXcuPWKfMh0PZxgbz6qnyzzeW0wa2mfiweJp708
	8EKlLNsMCmY0/NM0KNdNf/7rYreaZNmw0cQ4EKKfq0e5Tbex/B+yh3Klsxzp2zfWqcOC
	fb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ca9dSkp5nfyVOdVlf55LYURuzLNzwDJT6/TmugOhKN4=;
	b=TA46CWL49DDqAVdQhTpPn5s/gy7Upzpf4J5Jllp8aQ9GJ3ckTaItQoPVd5jTieohy9
	OSzr6WiC0fU2FYlcoJJI87FvqB270XX3i4aeEq7peFmP+VyU2txSWveKTpFQ4xDUPRKP
	3i1G3RsEwY5Y2pUGWWXh25QdxN4qT3EGjQEy8eL7r1BffYvUr41MLCoNdX7L3Hpj6FDJ
	22OJYCxGueCBSWigla0zLbvivRtdLtr3fwM1jCx4Ng3IlKWUB0g8uf84bP6zErg/g0lR
	BbNY3ShF8bT3XaV3aj9J6KtF5hUmPCD+szfKAnKThHPqnLi7cOQtPSD80MBeWq3/62p5
	7HXw==
X-Gm-Message-State: APjAAAVMRDPKOBOPR76LL4W6lTArsGluBK8BxSSv4Vb6emkDPw3nHt8T
	opr9r2yJPnP0kYRS2NOgpgS6r/kb1DY=
X-Google-Smtp-Source: APXvYqxIiyb00AEVXW/wJsVB4AShz06tZUzKjIjPaqVHvgp2dJmfnaRFiJoE4np+TVm452EiB27+Hw==
X-Received: by 2002:a62:6842:: with SMTP id d63mr61212682pfc.9.1558086280842; 
	Fri, 17 May 2019 02:44:40 -0700 (PDT)
Received: from navik-desk.iind.intel.com ([192.55.54.43])
	by smtp.gmail.com with ESMTPSA id n1sm7697511pgv.15.2019.05.17.02.44.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 02:44:40 -0700 (PDT)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 May 2019 15:13:36 +0530
Message-Id: <20190517094336.26232-2-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517094336.26232-1-ankit.tarot@gmail.com>
References: <20190517094336.26232-1-ankit.tarot@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] safec: Initial recipe for safe C library
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
X-List-Received-Date: Fri, 17 May 2019 09:44:39 -0000
Content-Transfer-Encoding: 8bit

Add generic recipe for safe C library.
This library implements the secure C11 Annex K functions on top of most libc
implementations, which are missing from them.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-core/safec/safec_3.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb

diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
new file mode 100644
index 000000000..2048fd418
--- /dev/null
+++ b/meta-oe/recipes-core/safec/safec_3.4.bb
@@ -0,0 +1,13 @@
+SUMMARY  = "Safe C Library"
+
+LICENSE  = "safec"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
+SECTION = "lib"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
+SRC_URI = "git://github.com/rurban/safeclib.git"
+
+RDEPENDS_${PN} = "perl"
-- 
2.20.1


