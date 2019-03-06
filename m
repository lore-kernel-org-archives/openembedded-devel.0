Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC7C7C7D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:46:02 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id j3so7424510pgm.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZCtB/khMBXmG65XSSR1dIthmQCYXc0lsL7v5iuA01N4=;
	b=JNhg8wkaWImlyHwi/zbH7wuVUv8BHzOfCTfAIY1zfg7Z7WruJdthKJM7R5EOXOtLBV
	M9UDzjyQJzoJQ3joQtq7tjsZa3ED3jM9Jm1uHp+sgmfwh8cnUBez9l3XjKuoiLje7Zqe
	0Hv9/PIf5VFPVZuQVI6tXJL00NQT7EHRZ4EXZIrnc6bTRgLQvAK+/tBmc2iXoj2SCGGO
	GOFPPELrIPPUmQ6QvTYKKiZnmycCEdZRwQhuwtob2S2uS1XxycreraQDAtW2zpkQtygL
	F+YD2S0fS75VfZAhJOEzJVgOoJOrddbIqRgyXRG6byh7N7Tc4rEGIKmVf1/CwXOtjZQ/
	vwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZCtB/khMBXmG65XSSR1dIthmQCYXc0lsL7v5iuA01N4=;
	b=e9AbKweRHproEV8D1M1vYoeNZmjhGZkXbLXyr6HTdHMWCqMeLMbC4vRC0zrnQP9MQ9
	5mzELIVz4X2gha4OsiGcQIzjuTJ77pLFjdNtBTkA/ZZm4ePft+vmeOpX9AXNZbeEo9Ba
	pMG6kdGXKym6CZeanzhZsyV+goKyGYm8fuBIJN2M1HQ1inE9ldipssGz8OJQJ6HwnSra
	PXadzgcbs+OxcZyi6Hl7UfEZl0j1MITWru2R9DIUkGc71gWYoBS0rbXuhyb4c1ewIfPf
	RvCngnftbOnIR8sUKTV7+gCnD3lxgzpsi7X71AxxxNvNRQzFk0n4DkKTMd7d42/8dD9v
	uR/w==
X-Gm-Message-State: APjAAAXgfcwyegLqIM9Il2LksbPdbIQxyNbSJSIh/XIz1GWjkgLZGZQT
	7/WnKo5QdnBdDFQC0/+Ti1ZbiLAV
X-Google-Smtp-Source: APXvYqxKede0neGDMziKNjv7rfqPw3zS+r6hV8JfPqZjHSnVLwMhgMzduygsiLtPFRuD7SPmAO3Asg==
X-Received: by 2002:a63:4e57:: with SMTP id o23mr4501706pgl.368.1551851162734; 
	Tue, 05 Mar 2019 21:46:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.46.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:46:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:46 -0800
Message-Id: <20190306054548.16430-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 10/12] openocd: Fix build for risc-v
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
X-List-Received-Date: Wed, 06 Mar 2019 05:46:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 21a86de390..4377e88e47 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -29,6 +29,8 @@ EXTRA_OECONF = "--enable-ftdi --disable-doxygen-html"
 
 do_configure() {
     ./bootstrap nosubmodule
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/jimtcl/autosetup
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/jimtcl/autosetup
     oe_runconf ${EXTRA_OECONF}
 }
 
-- 
2.21.0


