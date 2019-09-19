Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id E85C49009D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 02:05:33 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s17so842920plp.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 19:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4zkg1Z5DTp/8kHJUGJRn9zrDTl6WW8BqcHDla7Sf//4=;
	b=g87R/QEviSpqKc0GcIJAX5WPEft1c+3G3xsALft8jmRvpHhS/3S246BWB940ytQVL/
	5SfAnfVCKiA6Lbgj17z/GhoqeU1UEyeYwFqu7dtqFtdwx4s2uq1WSRLmQN5F1kpuoC0Y
	vpt5wNA4GJnsXUVTa2sBXIRBVtpw/Rg6VnnDF8+ThWgvLEjYXOjysj72FYl4ij7LaXOa
	ksDUirpTqddBMVSUHTnZMQK9zCkXP/QGLFDF988WDdqzaWQZLXht1JkfGxmTt02X0RL/
	IJyg5p/UwT4iP82ERCIcWNBV8iWluhAmFntOt5MWdbGxdR7eVMIx1CF8H8zWQXkgsG4L
	HnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4zkg1Z5DTp/8kHJUGJRn9zrDTl6WW8BqcHDla7Sf//4=;
	b=RWpaA6w0D4kLGL98UfG7aJv9nX0p6YUW7X8O3qwYE9iCzRH8uaUJz/BjpK48j8NbEQ
	ga6CQQ7oAo1LoLE+6Aafz+jqHNouDZABjtN4ufl1MgR7fpUUdQa1p7yNukzv7bLX2p+h
	Zd5TEzOZH9Atca3ZXwd60I1TZ2TMxru8vQKwU+/6KgcOAfx3ZJ2ULFvrODHScvWJK0/Z
	A4nUt7Pych6UisoVG3eQgNU4K4bzNEE5B7iFUl8yyp1GldjKfpu8jt9YRTq4Pq4h9QAb
	Syy9e/PW0qXeJ6dfIHyfHllSD3qOft1OEzjIWva4czzw7Oa51dhQAy+KhfL+vbf6Wr3h
	2YKg==
X-Gm-Message-State: APjAAAV1q+1EyXIuqpp966gW8Jz62pHjbTd/nRmb/Q56/XicCCagqOTO
	rpWSUzALiPc+CKCVM+n+Ro7/HsShdqw=
X-Google-Smtp-Source: APXvYqyKMzS8ZVEL/5jSp4pNuoD0POGjEmk2rCzHVMn9CZTf6e+7IODl8colKu18p2Ut7FdwtrHMMg==
X-Received: by 2002:a17:902:a406:: with SMTP id
	p6mr7526219plq.134.1568858734385; 
	Wed, 18 Sep 2019 19:05:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id c1sm7651815pfn.22.2019.09.18.19.05.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 19:05:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Sep 2019 19:05:27 -0700
Message-Id: <20190919020527.1399914-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] kernel-selftest: Exclude from world builds
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
X-List-Received-Date: Thu, 19 Sep 2019 02:05:34 -0000
Content-Transfer-Encoding: 8bit

Avoid need for installing clang on host, or depending on meta-clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: EXCLUDE_FROM_WORLD is enough for CI

 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index fb4534dca8..02359e782b 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -117,3 +117,7 @@ INSANE_SKIP_${PN} += "ldflags"
 SECURITY_CFLAGS = ""
 COMPATIBLE_HOST_libc-musl = 'null'
 
+# It has native clang/llvm dependency, poky distro is reluctant to include them as deps
+# this helps with world builds on AB
+EXCLUDE_FROM_WORLD = "1"
+
-- 
2.23.0


