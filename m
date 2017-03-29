Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 506BB77BB4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 10:08:49 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id k6so233950wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=T0BSFxcDFo/A5kwpxyIR9Y4RjrInlBJ384stbAIyHys=;
	b=M+RTpBpzbxl5fMCIhqyRLB84Iq8eH/KjsxNs68RFimEJi2msjy3xBSTlKtXr5FtlOz
	jCS5FYDuhTdVajZRcwAG4O6beLUDGOC0cxZrwPRWMfGd7pz50bGtI5T0UFU/AX+CN2HC
	TB6oE4DDJoqrQKwJbr4PvfB6LOoz3ZmkqCk8O1+DopngYzNYzeRtjeRohmqt9MShaEkd
	URqx+8XHIb2N8jjWaTTv691gITUrMRFnG3r6u7/yzDRIyOpQhS+wOW+iLSoN878zjm7E
	ekdZBSNHCox0MxlJWqSTxM02Y0mh7Mm+L42npu4D7PaRUiI0i6cUv7FKyHIx5xWiD3cS
	KxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T0BSFxcDFo/A5kwpxyIR9Y4RjrInlBJ384stbAIyHys=;
	b=jEULPTBffVBbno42eUAD9tsnToDH+NFFSCzGv7C949odhmoPqELXgiKKOzqF/uj/FM
	TrYZKyZoKCbRH8ZhOihonqrdydw9rDFVR9lOsPvdL3pRDK3rXXE2DZzpgqIiMDQ/9H/3
	820iUhxWiUWqg1nJRyZkKZZgNtJSBBe+3ii0xBOTOo8qUsDkQhR/52uEt+F1fWs5sx2g
	Hc7rECdIeOTym9XboEYEy0D7NCUc64dpWSlzS9D9h6sOMgN0Gl3ir9N/9RQjBM4Pfqli
	Q3/V+SFlwcByq6oP6FJoKbH3T84H5aAVPGKQZt+x8oh2GEPqQTuDVYioNT9KGTWoVB6W
	FJCw==
X-Gm-Message-State: AFeK/H3rntaQBNwWvblU3469JlR71ifuQscXfZW+KTuNhs0jnQ2aloVigL5PJjKpaQUYpA==
X-Received: by 10.223.135.110 with SMTP id 43mr16572533wrz.141.1490782131119; 
	Wed, 29 Mar 2017 03:08:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q29sm8694549wrc.49.2017.03.29.03.08.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 03:08:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 12:08:47 +0200
Message-Id: <20170329100847.896-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH][meta-oe] libqb: inherit autotools-brokensep
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
X-List-Received-Date: Wed, 29 Mar 2017 10:08:50 -0000

* otherwise build fails with:
  http://errors.yoctoproject.org/Errors/Details/138387/
  make[2]: *** No rule to make target 'auto_check_header_qbconfig.c', needed by 'auto_check_header_qbconfig.o'.  Stop.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libqb/libqb_0.17.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
index 2d3278ce8..94030b2ea 100644
--- a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 PV = "0.17.2+git${SRCPV}"
 
-- 
2.12.2


