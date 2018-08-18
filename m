Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 23EBA792B5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 11:32:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u12-v6so9160307wrr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 04:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VTuaAjuTqPp7Tw0X56giume6o6BylAIupGVc1Tq5Epc=;
	b=vWXbqN25oMKE6qjdCl9zvDiw74sSzkwZyEeX3adImWZkaHUs2v95dV8858pNulewGR
	mvKWQTABrQjpS4XSWB10KBwQ9Q5q3wwwDW3x+bGdXWts6Wk3D122G13Tn5S3EfnRp2io
	lkEEZCd9s2AYRJfVAXZKdnkN/ru+qmAvmqRvuhakrV7DNMIavv1PKqEMdh1BFp0DVbKS
	j+L8QZX8Dv+ZEwLZmcymcyksJopQqv4HjFovQnrfVvS9xoeaAQskCvI2hw9nnXyyzuE/
	bq8lN5P8cz3D2wTip+/oJ83rN4j82CX2wxkmVVtmb/hljEaWG93WIIRmuB2nlh70cc+K
	tDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VTuaAjuTqPp7Tw0X56giume6o6BylAIupGVc1Tq5Epc=;
	b=rkwrxKcvB43o/EkO9xxrump3bvX19HO5m35/rMGOvTfr64R9fnWLz7zwXx+ETqe8o3
	F0o7PyNIf+5selkI7rGyMxTQ8WnA5IHNxfdKIsu49+IXx4cmBm9Yq9BX7ku4Y2L5B8nf
	phJGk6nuHfkS5qSrhk+NvQBMqAvihh4gLRt+Rr+9vFg1boO9wkCfotI6xVEh4ub1ZYX2
	ggHUbUkOGWQ8L/ibGZXGKZPKvfXLKpu/PcNInsy5S00udstMqo4dxCHjek8Idgkuapzb
	P7PeSAg8B7h7iyn9QQZ531rtNBFZ1oQ+wmJp1CsywwiS46tsKBU/sTXaasDC7u7IP6qP
	a/dA==
X-Gm-Message-State: AOUpUlFMkPHHV7bS/ZYx5c1Rei2y4kE98CaoMCF0qI6MT+lzOx4Dz2We
	vyVd5cRTZzs0QpSju9k1yz8RAYTq
X-Google-Smtp-Source: AA+uWPzcdFmHhZF/Oae5WxohxFQX29AFCgu7Zv4iFLUluJuI++7OPADLHk22Pt9yZZoNNI4pVUq7zg==
X-Received: by 2002:adf:b642:: with SMTP id
	i2-v6mr23620474wre.54.1534591948633; 
	Sat, 18 Aug 2018 04:32:28 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h8-v6sm690992wre.15.2018.08.18.04.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 04:32:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 11:32:26 +0000
Message-Id: <20180818113226.26537-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] kernel-selftest: add dependency on libcap
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
X-List-Received-Date: Sat, 18 Aug 2018 11:32:28 -0000

* vm selftest uses it as well:
i586-webos-linux-gcc  -m32 -march=i586 -fstack-protector-strong   -Wformat -Wformat-security -Werror=format-security --sysroot=kernel-selftest/1.0-r0/recipe-sysroot -Wall -I ../../../../usr/include   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now  mlock-random-test.c -lrt -lcap -o kernel-selftest/1.0-r0/kernel-selftest-1.0/tools/testing/selftests/vm/mlock-random-test
mlock-random-test.c:8:10: fatal error: sys/capability.h: No such file or directory
 #include <sys/capability.h>
          ^~~~~~~~~~~~~~~~~~
compilation terminated.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 34a869d1fe..e92f3d8ca4 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -18,7 +18,7 @@ SRC_URI_libc-musl += "file://userfaultfd.patch \
 PACKAGECONFIG ??= "bpf vm"
 
 PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
-PACKAGECONFIG[vm] = ",,,libgcc bash"
+PACKAGECONFIG[vm] = ",,libcap,libgcc bash"
 
 do_patch[depends] += "virtual/kernel:do_shared_workdir"
 
-- 
2.17.1


