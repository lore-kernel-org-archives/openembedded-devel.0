Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDBF7F27B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 09:07:59 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id n14so14468910wrw.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2019 02:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LaPogA59eN0ely7vIEhBrMTnWzprhOCo7HLyZpZdK9g=;
	b=SiqmqKq8bYrSunnDkaT1L4M5GAdIjd5q6cgGhSEG/opsKa8rxRMHAIwoCr/87+97qP
	3VhMEgvgixPZjd7pcTJgjqjVRMigU0Rm6Fhhg8wlgXsgJJekxNHWxYqtjQRCJXdiqAEG
	VQ0uqnMt6x8z07z4Tr2aePGxPP1kopJ6AAfiXD5C6d8g3w2DRX4OGIRXeyZNQeMmDKFn
	gPxGu2eSApq1dqe3VA1NNrBhDa10naYId3hlk2+Uhd/lCnxzUQVcDg68WuuPZchWnGsx
	r1hykj7JvNotchTbAAK5b1Qji2rADzutZIEXHAO7QSzj9YF6ozm8VzA78RXekGzBYire
	ljZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LaPogA59eN0ely7vIEhBrMTnWzprhOCo7HLyZpZdK9g=;
	b=Go7Z7SN507xM8y55vCCGstTuIFCuRs/mXgPxKpUI+vW98cWnv2d58NSl9hBb3v/+zT
	sum29+hmKZtpjbCCRgw8LEZGDsBXL2kKaiMl/LdwrZypnNIK6CC2+KDFt0DoCXJL0GfO
	ZVGdGBuQWDyDL2HJsmupxxCsLvEmDORhIZe+d8ZoP/JgV4/NZHaMYseITjL+E2ZfGHrf
	94N0ZLX6UZeqy7gbkJG1BK1qKxa/etMk+9BiypmEkR95Gf0KsD4FJ3M3aiu0TDVfPcvs
	ySZhOrDj1fT5SPgdrlQDxKgF473qZYnfQ/D8QaqAPwcJ3oayFKxbxMyqgCQ/XrilmmLY
	M3YQ==
X-Gm-Message-State: APjAAAVKzAViW+d1gPgbJgukaBRDA2pbOIgznLHJxb5F58Xkrh9/EzI1
	sH0bl7aBRKW0z+SZGlwwCy7ji+OY8UQ=
X-Google-Smtp-Source: APXvYqwgu+fzP4JSntK6EwcgfVHXM8Vz7Lqfu/5RbvG44PKAdMOjk3SHGL9LIMZUHaCcKb4cg7sweQ==
X-Received: by 2002:adf:e4ce:: with SMTP id v14mr16775255wrm.15.1569920880136; 
	Tue, 01 Oct 2019 02:08:00 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id i1sm3153160wmb.19.2019.10.01.02.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 Oct 2019 02:07:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Oct 2019 09:07:56 +0000
Message-Id: <20191001090756.1168-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001090756.1168-1-Martin.Jansa@gmail.com>
References: <20191001090756.1168-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCHv2 2/2] Revert "spice: Drop broken native"
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
X-List-Received-Date: Tue, 01 Oct 2019 09:07:59 -0000

This reverts commit 5f32fd6b08d79b9a4d1bffb9b2bcbc535a5b27d2.

* fixed by restricting -Wno-error=address-of-packed-member only for
  target, spice-native is still useful for qemu-native when spice
  PACKAGECONFIG is enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 5e6fbf6bad..06a79c5001 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -39,6 +39,7 @@ export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
 CFLAGS_append = " -Wno-error"
 
+PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG ?= "sasl"
 
@@ -53,6 +54,6 @@ PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 EXTRA_OECONF_append_toolchain-clang = " --disable-werror"
-- 
2.17.1


