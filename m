Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id C8F6D6100D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 17:18:44 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id gv19so706746pjb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dBZxwiZazSGT7+QsLBVq+8Fe3JnQztozEvSpogdD1zY=;
	b=jUQbvx2bS4vQvLfUdOTIKT7DTS1zLzTb78IWyyx5IwnEC4CLFmM0FYOuJl/SXZojnu
	56gXBHBlHG9xaSo17xeGJQn47ZRTY8WmB5hyGxRuHVITWGoMDXJdyYqf0ryDZwSGXu3L
	2JcS2aZVANRUesUIl+EN63jbJAaYIxWcgXk7GCse7rAGFyDEZ3/oT/g/d/idYtTxPiXj
	IFxvF07MXkliT1/UOAadjXXltPvobCAq6ZJLhNxjHpLBsdqPr6odZOkp2H9oo8+j6zUL
	5d0XUVYcFj857MeChLw0lHCF6pv7QzpXIK4W6BB5SWu5HBlU3d9gzyUbAvXtq6wIlJu8
	lOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dBZxwiZazSGT7+QsLBVq+8Fe3JnQztozEvSpogdD1zY=;
	b=Xijl28tMUkz2yrmbkdnKknQVTqLZiEpzCeC3S2CnQRqfvh+aCdr8RQ/fw/nkPP/FZJ
	FvZnKVD+CFuMQ5Wm5K4VR382FlT0CRMZhj3NnPUi4NNR4lHYIIEZjtSWDADCJfnWOy9R
	VqLgdtNJt1z24ATSPzASu12eTsS04f/nNBYIOXERZoMGYvNVJLaLvujeOLA0LUMu8V+G
	4vjvT+7IqtpFA88EOU5h1iykjejK/csCPBSVuqrJGf8tP0eXP1WIOAnN6iUJZ+abCHHg
	oz6/K4QBGFNcqCjxDqIIFmt9K2QU+3YBnDQ/QuEzklDpPHADA++Du5a8l5YV8vr/Gp2U
	Hg+g==
X-Gm-Message-State: ANhLgQ2Ywg4PaPf1wjA4dvx4UYg1XoDUy0tBcbaDhJuwC0yHmbg0c5Gk
	hxbZgnp1UW+MmK40iT3l21u4myYWZyI=
X-Google-Smtp-Source: ADFU+vsM8EnpihIst92gfU+r9X3+Z4iJChNTmbQseKp2su+2UucdmJC+6CsygWvXLIPL+NbtCo6xjw==
X-Received: by 2002:a17:90a:7345:: with SMTP id
	j5mr2664624pjs.69.1583860725213; 
	Tue, 10 Mar 2020 10:18:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	v16sm2896369pjr.11.2020.03.10.10.18.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 10:18:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2020 10:18:56 -0700
Message-Id: <20200310171856.1851988-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] renderdoc: Upgrade to 1.7
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
X-List-Received-Date: Tue, 10 Mar 2020 17:18:44 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../renderdoc/{renderdoc_1.6.bb => renderdoc_1.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.6.bb => renderdoc_1.7.bb} (95%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.6.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.7.bb
similarity index 95%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.6.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.7.bb
index 7cb79d0704..6ea632d064 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.6.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=df7ea9e196efc7014c124747a0ef9772"
 
-SRCREV = "0e7f772596035137416be01766c2d61205efc63e"
+SRCREV = "a56af589d94dc851809fd5344d0ae441da70c1f2"
 SRC_URI = "git://github.com/baldurk/${BPN}.git;protocol=http;branch=v1.x \
 	   file://0001-renderdoc-use-xxd-instead-of-cross-compiling-shim-bi.patch \
 	   file://0001-Remove-glslang-pool_allocator-setAllocator.patch \
-- 
2.25.1


