Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0DE771D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:59:08 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 128so74137194wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ivEWNUSr8F2AO4lwcum3Cq300EHkfV5/77+BSCNnVDs=;
	b=Q+rbPMYX3lRSVj0h3q98Qv1kSzg2SqBbUyTFwq26SIAF8c645dwekbFGlfSEyhSecc
	HxM62q/4juxEOodKq7tHbgtUGDiq5ZI/gqlJQzLPXnAyXmvBYgQ2pt4avqX6pN+RAxB4
	x3e0mM0nvEcmXZyR3GMjQwrXddj8wmnuHTr1Enxnnpr9IA1kUy/gphOW0QyLRVrG7wGF
	BpKq+LR3vCCX+p/xHM6YPKYmTrFFSj6Zz/Mrhc3XL4jg2zuRx3+sONHlPCLvhtkhwJo+
	ynAP+pcK0m67pwuMjw/5vIqnN5sab9Pq6QpYpqhkd/vLP9sS7/tRm5i03ej2PZwzWLmm
	C57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ivEWNUSr8F2AO4lwcum3Cq300EHkfV5/77+BSCNnVDs=;
	b=jSpQrdIunbcn4syC1/VsLa5qgr8k+Ot6DK074LOkv+2KUADmdYn2pAWIAy0tjNVslS
	AJ1qpwwR4KQvchNLX8Mna1snFot4Dawu5tHlX3wlq+mwkSVrUS2RD0mCJ98As/SLaDwQ
	Olu5efG9xo5WlU5XzpOoW8tHRFwt4/SrM0BCVxC+Xp2X/lPKCB6Kx6vnsFhdDwvGEr5u
	NBspgebuFTwY2VKB+7IqvALK55Wb9IW4hJpXDh9zFgxbp3MeFrVQtb6B9Z0TYt7V4q0E
	16uPwkHEa/j2S89UzcQLhOGgcD1mjEIhCBjI1cGO/YmZ+5/QiK0MJImGmT34atZ3woMA
	qgKA==
X-Gm-Message-State: AG10YOQgV82CUzkQdsgRKiB6nn0xuLfxXPfzgt0FCrzkuaeT7KK/vux0P9pc7YCoUd3dnQ==
X-Received: by 10.28.172.193 with SMTP id v184mr18215665wme.94.1454684349149; 
	Fri, 05 Feb 2016 06:59:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x66sm7536277wmb.20.2016.02.05.06.59.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Feb 2016 06:59:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Feb 2016 16:02:36 +0100
Message-Id: <1454684556-24680-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][meta-oe] vboxguestdrivers: upgrade to 4.3.36
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
X-List-Received-Date: Fri, 05 Feb 2016 14:59:13 -0000

* 4.3.30 isn't compatible with newer kernels and fails with:
  4.3.30-r0/vbox_module/vboxsf/lnkops.c: In function 'sf_follow_link':
  4.3.30-r0/vbox_module/vboxsf/lnkops.c:43:5: error: implicit declaration of function 'nd_set_link' [-Werror=implicit-function-declaration]
     nd_set_link(nd, error ? ERR_PTR(error) : path);
     ^
  4.3.30-r0/vbox_module/vboxsf/lnkops.c: In function 'sf_put_link':
  4.3.30-r0/vbox_module/vboxsf/lnkops.c:49:18: error: implicit declaration of function 'nd_get_link' [-Werror=implicit-function-declaration]
     char *page = nd_get_link(nd);
                  ^
* see:
  https://www.virtualbox.org/ticket/14227

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{vboxguestdrivers_4.3.30.bb => vboxguestdrivers_4.3.36.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_4.3.30.bb => vboxguestdrivers_4.3.36.bb} (93%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.30.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
similarity index 93%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.30.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
index fd2187b..781e3d5 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.30.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
            file://Makefile.utils \
 "
-SRC_URI[md5sum] = "cc053340f88922a11ad9d4fab56557bd"
-SRC_URI[sha256sum] = "ea9569ec16cd6202ee61bcadb2506d31ac12fd343adb91565773a05eaaea9a36"
+SRC_URI[md5sum] = "8635387dec6cbfd576ba453355d4dc0c"
+SRC_URI[sha256sum] = "af0776df6d03b2709cb76a69f055487bf12bdb3b4163e2a82959860300283046"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.7.0


