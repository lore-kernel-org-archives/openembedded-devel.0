Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1358A751D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2018 20:46:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x12-v6so4595612wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2018 13:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+M9kyjAmXKSxjueZQClNbY1ez7S8KO9j35mRPdA/5bo=;
	b=FETPxmBlTxLuWroJ5UZWouXzkKtJqvZeVftCEnLmSt2VAmJ2lWL9EXPYf4lHwhMSBU
	n5HhEqFQdJTVSyXGVrL281j6T0JZ10dPmqKGgF+RYMP6yBIwQRPLK0Cq9ly02g8nZSoD
	jv0P0/FD/+Ag6CT60BmxGMkLkATe63LwfGVazHVU6Ks1/Qh7Qy5CjnrTUeLMRTJPDdlZ
	W9LagN2yI8fLQCqdq51Ibd7JNhmwS7dAj6ptCTTGySfOUZDStso0VIALIBtJj29e0nI+
	lkxgeUzljX9o7f3KLlOTrI/CM0YUAKh8hXZNcSamRP0hwhYaQKuD3mELAxUoW6PJbRCJ
	BVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+M9kyjAmXKSxjueZQClNbY1ez7S8KO9j35mRPdA/5bo=;
	b=kILiE/RlWIbZDwiB7ohH51+rwTD2KD1oBybRIHRifwk/sC+SHIPepFducPKhY8pMEY
	aXpylGFZ3LiWUXaoYOQojipXNbYcg+tJe8Y0E81COVwmUU37xocRypGyGng9GAMXgLS4
	ut1kyUI9xKqyfKIq81VYu+vrfg01g2JA1PFdQyo79yDVwos41V8qjaTPJbD4+FFMkARL
	xZeZ+KGN/Ibim9UtQ13DJMFCOCCb5lFv0VgLjT71k6DmZG7RpxkuBIvphR5+c2uKElnQ
	deYxhmzHpYALattdhqSv286FjmN+pPYgMHeEV/is8oB0S5Ts9PBKk+XjEbFzSunYINtV
	sFTQ==
X-Gm-Message-State: AGRZ1gKPPs6p7rsSMu2OOZvqMzacnMlwhl69VvV6vE+39qw0xkIjClwR
	vVVoVytqYEPUCUXfd1qjbETh3sJO
X-Google-Smtp-Source: AJdET5fFWFvMrJwBr1pjopelOHwUC0sDxWRlhce8DAv3+jncMFhrU8Zg8eTmhTUD9voUe2+zdGS1MQ==
X-Received: by 2002:adf:9326:: with SMTP id
	35-v6mr10262575wro.318.1540673172079; 
	Sat, 27 Oct 2018 13:46:12 -0700 (PDT)
Received: from localhost.localdomain
	(host211-58-dynamic.14-87-r.retail.telecomitalia.it. [87.14.58.211])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm20503384wrr.64.2018.10.27.13.46.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Oct 2018 13:46:11 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Oct 2018 22:46:05 +0200
Message-Id: <1540673165-32042-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] kernel-selftest: temporary disable bpf for arm - fix build for qemuarm
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
X-List-Received-Date: Sat, 27 Oct 2018 20:46:12 -0000

Even running on 32bit the bpf objects are 64bit: this triggers the QA  about
bitsize mismatch 32 vs. 64. Besides, objdump does not recognize the arch 0xf7.

Trying the workaround to use the llvm-objdump and setting TOOLCHAIN = "clang"
the build for arm fails on libcxx

  |include/c++/8.2.0/atomic:250: undefined reference to `__atomic_load_4'

Temporary disable bpf as done for x86/32bit as it seems still unstable.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 71bf83c..181e97c 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://run-ptest \
 # if you have older kernel than that you need to remove it from PACKAGECONFIG
 PACKAGECONFIG ??= "bpf vm"
 PACKAGECONFIG_remove_x86 = "bpf"
+PACKAGECONFIG_remove_arm = "bpf"
 
 PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
 PACKAGECONFIG[vm] = ",,libcap,libgcc bash"
-- 
2.7.4


