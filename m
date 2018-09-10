Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C04427931A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:06:45 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id h69-v6so9840268pfd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 22:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p+sxttF17PTfCx3W8jnpjbZdkZl4bY+xY++WGJCXDmQ=;
	b=gYDPPHjf2l75V1/UAUEzk74JDPhHSr+TQOL6dr6+CNBmk+jYBwmlK8fFnk0kXBZrT4
	zFgF/ekYorDhCYW1coIJ+ZZSB3XLDxnRsLFFegt4kTROMNZ+c5v9Pn8HaidLjbrEZEoO
	PxkgQ4hzsyE3NudsqpiKtq9ZpWt11bV3kCG1ygbBAViQqxlvjs8mktaMZmxwNpOM7wWN
	RevvcyJAzpWIPMP/YP5bTYPuc+tGZ2Qx5QXuQQoakXUAlIBNsLto7FPd8YiZ3M48CRnE
	vMZlcQ28WAZhK4PIDXDoUmf1OdBi5ZL53o0MDNdaokeAH/FJ8HdrMhtgX+XB4BiiXVPG
	ZgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p+sxttF17PTfCx3W8jnpjbZdkZl4bY+xY++WGJCXDmQ=;
	b=QPsf+Ovb14lQNQIcvRBRfWJGL7ftpOrBY+omtkj/ovhGLgs5+l2t4b8W//AArG7B1I
	HzlhWSm3efbALZRBhzaOIBKZOc0o64EedZUpPwkfCcfByr3NR5taoHdOlw3sk5xvELNb
	GQbwCFvuOTHJJRUyJbVMzXvim/mn4Ae4ov4mKz7Hmb6tzpPrxB/TFH4Ht7uqDbyULU/w
	tAwyxXZ+OdG2HwSGC8KXkAnGsOJi5VYh2fLV488o5tZm8VRW9TSZuT69R8G41sPv8/Ne
	x1PGDCyLdxjKxwbgdyTT4szVPBJuwR7HV5kw3EAeUGFVJT5r6Pjr3D+SD8aO36D19JYx
	JzuQ==
X-Gm-Message-State: APzg51CGgzGiTCfmv/gA/pp2DNu0ypK/i8Me9ny7ShMMtWpygOrH6NOe
	c7LF4QhEie/yjlkoYydhEFyNypIU
X-Google-Smtp-Source: ANB0VdbiK9UiYgjpoaX+rVMJ/wtDNGaCkzoj1kaCbKhO6FEWbOAe4Mbg6it7hCBCiEbeoOXQYOscrw==
X-Received: by 2002:a63:170b:: with SMTP id
	x11-v6mr19978061pgl.364.1536556006459; 
	Sun, 09 Sep 2018 22:06:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm18819188pfh.67.2018.09.09.22.06.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 22:06:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 22:06:28 -0700
Message-Id: <20180910050629.16170-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180910050629.16170-1-raj.khem@gmail.com>
References: <20180910050629.16170-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/10] libkcapi: Disable Wsign-compare warning with clang/musl
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
X-List-Received-Date: Mon, 10 Sep 2018 05:06:46 -0000

clang 7.0 is grumpy and complains about cmsg structures and macros from
sys/socket.h

kcapi-kernel-if.c:25:11: error: comparison of integers of different signs: 'unsigned long' and 'long' [-Werror,-Wsign-compare] header = CMSG_NXTHDR(&msg, header);

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
index addd169a8d..a93ddc8237 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
@@ -24,3 +24,5 @@ do_install_append() {
     # when no binaries are installed (empty bin_PROGRAMS in Makefile.am),
     rmdir --ignore-fail-on-non-empty ${D}${bindir}
 }
+
+CPPFLAGS_append_libc-musl_toolchain-clang = " -Wno-error=sign-compare"
-- 
2.18.0


