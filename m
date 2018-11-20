Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 649A06C496
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:38:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id z23so2002720plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GXIVmEyy+tUbMi1tQCoHTaJKZ4nrPAVPOK+ZUtdfLw4=;
	b=FzThiHeR/7xFnDnIeMvRXcmUPNQY85H2mjEatg4TDa9HxX4hP4i8PZE4CQMr48UHnO
	1hZwVMBF9Wc+L8hABsvI9X1HSaI2iL7pLn9uFZLzgWggL9iV3mCn25IrLe/TL0ckyjlW
	i/1Bz5QTfaLDv2AlelTo2kPBexR4Fv8yDhb/DxxJN0En9TJHJ6n2H4lVUNq3snovCv6o
	8ZzfXBVzfVmY7fad0OFlFA0YKblZ1w1JYEzQfKoPgeM5fqPtKRxEM/BHn+2GRe2K1ZfQ
	+P5URoaj7v3SAwadsujQ7M0AZBBELG1UEVNLTGhnvgxDDn4A8YXkaYUDRnMlP6PhuDSq
	Cvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GXIVmEyy+tUbMi1tQCoHTaJKZ4nrPAVPOK+ZUtdfLw4=;
	b=tMqi97BZA88j+sodrA3AL9B1/8LlVTfnh6du4F/BGIrUnO6mulC7ifBlFxSkG8fYNG
	tHGwwQIZxp18tl0Xj9IXaYSqNGkQbfXnhTUCNqcmVcaXT2TxytGEHBnrU/6iCMov1B/m
	pPsVzH5eOz1z7YQDOn/dNP+NDnRzjirgxKITIhfJNz+xBQqk6JrrYIylZVrq938KAsho
	bQSCcZYgEAq+pBeFLlV/dISnpTk1e4jgyZL6YvgvQkgI8Y/VJa0/x94PcBjPnyMP9Hgl
	qKIAPKZ7wDh1GIa6JRKkHgaUkRnNx/TN0ZyvuToT1n/CeM84yU1aqRND1UaHsg3y8V2G
	JnJg==
X-Gm-Message-State: AA+aEWba2/6F0ylAVHonX/pPjxT8BOwvSG1kSr+2Mh1S40nLRz7NTdWa
	E0UShn/GeKY794G7xEmcPxgQhtnjkhU=
X-Google-Smtp-Source: AFSGD/XjinflmOdeN213IUZsibfKmFgzxWiP+7wvR6gj1t7DoD3O4KftS520dzkXKrjC7UhIRjwbsw==
X-Received: by 2002:a17:902:82cb:: with SMTP id
	u11mr3655457plz.174.1542746308099; 
	Tue, 20 Nov 2018 12:38:28 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	x26sm24325479pfn.50.2018.11.20.12.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:38:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:38:09 -0800
Message-Id: <20181120203814.11500-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120203814.11500-1-raj.khem@gmail.com>
References: <20181120203814.11500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Maxime Borges <maxime.borges@strataggem.com>
Subject: [meta-python][PATCH 05/10] Fix python-idna egg-info permissions
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
X-List-Received-Date: Tue, 20 Nov 2018 20:38:27 -0000
Content-Transfer-Encoding: 8bit

From: Maxime Borges <maxime.borges@strataggem.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python-idna.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index 519812ddc6..436b58606a 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -16,3 +16,7 @@ do_compile_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_append() {
+    chmod 664 -R ${D}${PYTHON_SITEPACKAGES_DIR}/*.egg-info/
+}
\ No newline at end of file
-- 
2.19.1


