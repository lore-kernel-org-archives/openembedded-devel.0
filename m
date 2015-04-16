Return-Path: <ticotimo@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3455173D56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 15:18:18 +0000 (UTC)
Received: by yhda23 with SMTP id a23so4521893yhd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=s0IHTxkxNQaPrMYAssgo3F7R4BfBth5xoGz8dlJJyhI=;
	b=XsQ2+sYMGy0qooPJm20yWFTD5W9PCF2IuJN8tqmRSMKkB24dYSjO4tKHscbqbb0Don
	A6ldG7lVgZhotUK+K/GhGJqbVJBV0NnCEuSB5gJA+UTXlpvufiO3ODLPAl9a2Cg3Ea0K
	N5AK4dvXiUsJ6MwtLjBBOa7Q+yrJ7yxqORF1sCjGU7eJYL0mph5Uc4ni+EUyuaQOwE7Z
	v+8ho+cKTStBD7nibMypKTqhTszX3G5k1Taf95YF1JL589Qrt24gNIAmqTvXfcMMs5A8
	05YnkeQpyjdDZYYcTgXYgMNMsmNXB19b9qPNYVFgZv0GMFP/R51p5OMmAZxV8LwyJE8z
	kNqA==
X-Received: by 10.236.229.161 with SMTP id h31mr13075130yhq.139.1429197499474; 
	Thu, 16 Apr 2015 08:18:19 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by mx.google.com with ESMTPSA id f47sm5838584yho.52.2015.04.16.08.18.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 08:18:19 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2015 08:17:40 -0700
Message-Id: <e1a05d94b69863bd0078f19a0471afae31d182a2.1429196681.git.TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
References: <b15c2e1bffe74ad299c7b6f88943313d527bb4fe.1429196681.git.TicoTimo@gmail.com>
In-Reply-To: <cover.1429196681.git.TicoTimo@gmail.com>
References: <cover.1429196681.git.TicoTimo@gmail.com>
Subject: [meta-python][PATCH 2/7] python-py: add 1.4.26
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
X-List-Received-Date: Thu, 16 Apr 2015 15:18:18 -0000

python-py is required by python-pytest
python-pytest is required for ptest of python-cryptography

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/recipes-devtools/python/python-py_1.4.26.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-py_1.4.26.bb

diff --git a/meta-python/recipes-devtools/python/python-py_1.4.26.bb b/meta-python/recipes-devtools/python/python-py_1.4.26.bb
new file mode 100644
index 0000000..e606ed9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-py_1.4.26.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Library with cross-python path, ini-parsing, io, code, log facilities"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
+
+SRC_URI[md5sum] = "30c3fd92a53f1a5ed6f3591c1fe75c0e"
+SRC_URI[sha256sum] = "28dd0b90d29b386afb552efc4e355c889f4639ce93658a7872a2150ece28bb89"
+
+inherit pypi
-- 
2.1.0


