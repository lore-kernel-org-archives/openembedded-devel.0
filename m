Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C45827E69A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c6so3720412wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Pv431PJfiT+kZzTFOJ51a7uPpQYQ02Icc8LRB1ovyNg=;
	b=kqqzONhv6V5Wzn6XUCJHPD1lGlHLOnEnZnUfKYS2KyCRWyWOQe5cHMu0JssKUitYKS
	JWnIUf3h3C723nSkDriBhN/YVqEYdRce2m3aox048Dtsaii+6DQ3j3nlmErkBsWxuGVn
	haEwwtDG5gLUKr40O4k36bdm81gFaNH7YOX3RjaZiDxJt6W8GUFdxdniJS+/Icxl5ikF
	xo1zleUaDc5WOPDyt/IETEgQNzveUTvGyzASR+U5veNwK57RH70N1OGmqfvx3Tc4oTe6
	sWUMgdEiLPrsuFlym2enw5xImCEMkeaKu/buG3TqNU5zUUSFeoQZP0XpqAqVBA96FPUq
	x8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Pv431PJfiT+kZzTFOJ51a7uPpQYQ02Icc8LRB1ovyNg=;
	b=mG6DkIoxQ1oxcUScwoRAelJTiwXdSd2Wv5NOZzyohL20pqKBTl48fiA15fFA7d/zIv
	NcFCl2n9guoR4ry+ixy9XNSJdjjaMm/Wfr5SMDWQG2I8i7iFed37Wt4eSA4WgE1Q9mpW
	Kxk4urTTucZdrD2o+kwPh/6ZzXskNnz8cPfUhCVr96vVUO/wF04XBufGGvZhwgHzcL/F
	wOCJeQGGL8Z517N4iEMGqHA0+5TdY4QPWuyLjuvad4etwzwxKvoTj4HSJfZ7NwworwvW
	F0tAgbOMqAX2633irXCPi8wiWGX+6CnL4nU3jsKdtoD3RdyQxdjxBgsP2A2sXQ2dxYwV
	WofA==
X-Gm-Message-State: APjAAAVMI/mrsKU4jwtpDECv3pmiUJujI+dDQtcNSy0eKCk5eHKCqKdp
	2h+0rdgqLZhhaSeL4fUED1+xch2V
X-Google-Smtp-Source: APXvYqwMrnZOeCQ75wzXaC2WN3Rl08XkhGNTtFTDpzFj5YqcV/2HTMkg+cfxj2Ot4iC9ykf8iyu7gg==
X-Received: by 2002:a1c:2d8b:: with SMTP id t133mr18468771wmt.57.1560272117378;
	Tue, 11 Jun 2019 09:55:17 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d3sm4321819wrf.87.2019.06.11.09.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:55:03 +0000
Message-Id: <20190611165504.23049-10-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 10/11] libvncserver: set PV in the recipe
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:17 -0000

* last SRCREV bump commit says:
  libvncserver: Update to latest commit post 0.9.12
  but there is no PV in the recipe, so the version was just:
  git-r0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
index 6a806ffbaf..bc47a3f156 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_git.bb
@@ -32,6 +32,6 @@ inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver"
 SRCREV = "c0a23857a5c42b45b6d22ccf7218becd1fa69402"
-
+PV = "0.9.12+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


