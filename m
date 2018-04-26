Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 93876607DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 17:00:10 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f189so9757297pfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 10:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Oum4w/FXDOnPNm1I5/ntq2QvydQfcDOE6E0FNOlHmuI=;
	b=eFdGt3uGa/VzegzCsTDoWFsnLilTWmAOnSztf1Tvy9+dZU51yzNacXXFJXPboErVMv
	FJdUb46qODOZnax0IXruBAg57NLtYrC6OOb3aaoUU5q8CVveELVFwGZpG0UXj1yZF+Qg
	KYQY1Mqmr8HZm0XzVco7pgp3SfZgpC1RmWFoBYEuR/MJx0vs7h+tVVJtK22XTmI3IiIj
	5YAgH+PszeRJJStBoyPTfwHC+MgrClv3I2ViJDoWNDL+bUUsDLdRJeJi2aLsgdSz+XWy
	m7rKcCNL6MT0M6ys4uvD9Uz7L8q5oYFN9xAu2JdHvcXugVBF9RRmmS8VgVSNsW4bZc4G
	ITHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Oum4w/FXDOnPNm1I5/ntq2QvydQfcDOE6E0FNOlHmuI=;
	b=X3z3ypZ6CSKqv038KhUBt4fZSCU8q3jH46Yr9VrlfE+eYc89Z3IWRoaEAVp3vaLlJZ
	4oOwfQS2MpxZCZURnuSAhpGu9dd3zILy6/g0hv/JizwXDw7mxylxQUP7YG/C7/mtNW1w
	MB/dM+nyYs14AYP/5OvkY/kQGZTfwqTI5wfBVhm6SeIm0cWqnMpTqb//t6P2rma51cmw
	5EA9GuJwK5Z4O4xJVmXb/OOAoNx+d3Pjy6WiG0wYpbq2qzjySBoNj0A8Zu4/FGY1Gm9S
	97+QKko/xszY52s3I/Wh1Dravfq5pXumqyvue7iCUPwe5mlBZeU1nHk+R7FiDUeLCQ87
	Ve2A==
X-Gm-Message-State: ALQs6tBi+wq7d177zlHxnEWP4jKbYFeoJUV+5Csf6BCbSIdkAZan+6wD
	mAcGKHMO+KXseBRJur1bmicAVA==
X-Google-Smtp-Source: AIpwx4/sx80Q3XsVt0869at0bNYP8rsvLg+8MqXHvB2rqwo6yGjZRk1yOrSj9lYLRbWJN7TGFbK0BA==
X-Received: by 2002:a17:902:481:: with SMTP id
	e1-v6mr35160212ple.377.1524762011100; 
	Thu, 26 Apr 2018 10:00:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	w134sm41690845pfd.132.2018.04.26.10.00.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Apr 2018 10:00:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2018 10:00:01 -0700
Message-Id: <20180426170004.20602-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH 1/4] ceres-solver: Upgrade to 1.14
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
X-List-Received-Date: Thu, 26 Apr 2018 17:00:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ceres-solver/{ceres-solver_1.13.bb => ceres-solver_1.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/ceres-solver/{ceres-solver_1.13.bb => ceres-solver_1.14.bb} (91%)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
similarity index 91%
rename from meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
rename to meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
index e883c70d1..29917c8a1 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
 
 SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
-SRCREV = "19333b0f55c8462381038e70d42af43b52941128"
+SRCREV = "facb199f3eda902360f9e1d5271372b7e54febe1"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.0


