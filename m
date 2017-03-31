Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD43077DB3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:18:38 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k6so20064315wre.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wLBGEMEnoGdBA5Z2exCa6z1YU2JeuwkzqPHdJgd3tCY=;
	b=dpG17vYwIDunU/AyQFUZyjqMXCQti5w9r8UbldNFsXprjPXNRcdEopD8lYrSxHTxpt
	T6UPUZc2DXwg+8fL6E7D/PoWGyHd8vNcxtxoc9Lbo5+IBpKr3jY9e8qEsBCCcVAKQ2HH
	Dl+Rb0+apwr7zhJ8lCn/S5s64B+iVX99AnbcyM78/ltvnVZGmwJrZldyrH4mwqqvb1Dq
	z8MyKJo3XLLVcSrzh9P99mAywepSlaKHV6qFxuBOcdWqqpWq6klK81Mje7n7NhFPnUa7
	qi9VsdLs8EKs/Iwz99j6DJK6W5QiAktqg7mlBcYCMKlnlyeG7rxo8qJQrw1UPd2Id9nc
	yZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wLBGEMEnoGdBA5Z2exCa6z1YU2JeuwkzqPHdJgd3tCY=;
	b=rdBtykByypNme7w41nX2b66S+5dSi+bg1dep12gCmTlWu3O7YRy0InlwEC4pR5HB/+
	arCMpzUeFWMIFhJcPNUAqkyoTgAqcTV8zGLXRJIY0l9npnc4z3J760xOlw2h913Y+rOZ
	sXEBj7CvDSZC1Kum5vjlky3iyfB3mjYKJrApl2fkBGEo9xTOtI0P4bnYqiThi6yIYdCE
	+Oq5mqEggq43uHZVzHxPS2Ukld4a8YUTbAyWnsTF4FQiBfWc32zn/fWhRZYVao8/hjjR
	/qi7aKcUBA+VtddbSKEQwmJ3U/5ozEe+ARIHeLEVgGXS3AFd9L+k/e45vHtnUQAQemM5
	84bA==
X-Gm-Message-State: AFeK/H33aF35lFH/ppYm18M/K9tzsL8x5mU+1bR6pxTwf9+9xlXyCkwpyA0xHT6gn4E3Jw==
X-Received: by 10.223.175.103 with SMTP id z94mr3427331wrc.3.1490973519766;
	Fri, 31 Mar 2017 08:18:39 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m7sm3247339wmi.34.2017.03.31.08.18.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:18:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 17:18:24 +0200
Message-Id: <20170331151828.25907-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331151828.25907-1-Martin.Jansa@gmail.com>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
	<20170331151828.25907-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][morty][PATCHv2 3/7] libqb: inherit autotools-brokensep
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
X-List-Received-Date: Fri, 31 Mar 2017 15:18:39 -0000

* otherwise build fails with:
  http://errors.yoctoproject.org/Errors/Details/138387/
  make[2]: *** No rule to make target 'auto_check_header_qbconfig.c', needed by 'auto_check_header_qbconfig.o'.  Stop.
* cherry picked from master:
  commit 1a9dc230315a77ade7a36baf3a2c2a0c9745af46
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Wed Mar 29 12:08:37 2017 +0200

    libqb: inherit autotools-brokensep

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


