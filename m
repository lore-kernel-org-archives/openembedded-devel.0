Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6032F74B3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:20 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id c19-v6so3593737pls.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+hCU9+dA2n94pynYptwEx800h6u0rjzI544f3l75788=;
	b=G9BmkH0mkioHSCApHpU9f2NE5w2ONnkaz0AysEBhOHd2+oTmrduuRSMP49HokVVESv
	2e8G9MTv1xulYz8QPLhFbeGHiwfl1IieGb+4EPyinFQjZecJh/bdjrq98Gpr0KfZl14N
	UBu4GuybpiO+KvveDgfv5POMJU87r3zA5pC/L5OIKVWuVIc4DPyHrs5AoPojVvD8VZXk
	FBf1qyi3CKRk4sy9hRrxZFRL9O1Bt3y+jlWmH7UAYklwbCc8hdFUwgH4CqEtJ39lenJt
	7ML7rVK9QRJkxYVS0hcIZ2sSb7lMvM7sQ4Pyk4UowPFSPBJOpwY+I+gkrW0HuC3I5btF
	HcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+hCU9+dA2n94pynYptwEx800h6u0rjzI544f3l75788=;
	b=uH1dbuRx7qghaELeP+7hjGWBmSmMASPeL85EdAhD0j61aWD4yukG6OWtaDC1fgydt8
	qepUlPX8La4+CLxIRvfxwY4Gm0hbmA6WuKFvxnNTezvqlozHanQbV83glbTqB4NDpNzG
	PKNwceaIcpXDNwVVneGnWcS8wVbh/uTsm6kM9cq0KiD003KS1b/aBoQofRLPp6367Xsr
	gHeEXM0OWvmIrPiAW+T1AVmnSuHiLxMY+Qr4kIa5+5XJFOgv9AbNccnuSady01+U7NuC
	2Ie+AShHFiTInWp7q+IZqT/gkEXo6iA1+oWjlMM1vbmmlNtLaSv5ulqN92P50LvftMOf
	Xnyw==
X-Gm-Message-State: ALKqPwcO9KoDFcjSO9kVbPI8bEJ56sf5lVfr2g8gTRyN8g6OPP3cbvUI
	q5Ot/Dp5NqPfOwF1wLk+HGTajg==
X-Google-Smtp-Source: AB8JxZpmRpeqh1g+3LP2gRfEuO8SbnhbfyA0xfCISBRrngV2UMdPSeope7uvYwR9waZz/PqG3OXsiQ==
X-Received: by 2002:a17:902:28a7:: with SMTP id
	f36-v6mr7419262plb.155.1526607081337; 
	Thu, 17 May 2018 18:31:21 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:20 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:41 -0700
Message-Id: <1526607046-8081-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 12/17] ceres-solver: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:20 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index 29917c8..ad7c8f2 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -1,20 +1,17 @@
 DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solving large, complicated optimization problems."
 AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
 HOMEPAGE = "http://ceres-solver.org/"
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
 
+DEPENDS = "libeigen glog"
+
 SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
 SRCREV = "facb199f3eda902360f9e1d5271372b7e54febe1"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libeigen glog"
-
 inherit cmake
 
 # Only a static library and headers are created
 ALLOW_EMPTY_${PN} = "1"
-
-FILES_${PN}-dev += "${libdir}/cmake/*"
-- 
1.9.1


