Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC886011C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 17:27:23 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hh10so8431704pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 10:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MUydtzh5QLVFPF37GUi3XqbCvIbnH3Uyv93cOTqomoE=;
	b=bmzTIvMWZPb4ZcHrcpgvqPk9J9Nima0euuFUbPRHaYo0LAN4/y2SM/6xPkaVVMIgLc
	QkNXtTXMloSdkbsWrc6jKAIZVL1meUH7U7hfU6dWno5Mjm6lVVqGOtpszoICoXklvcWw
	jdCKwTTphsvrLLRft5V2IbMl1NaltilcDtxGOau+qKA0x5NqJAjUfCZR1rUiBWWLwc5I
	Dq5TgiRmVHydpkMmjybJk1RDavjp8mLZpxfNb+B5oT2cKs2oYGYSZPfYI3KppydzOGNz
	9bD0FyJgoO+2e7TZAhBzDOQC5JJn3C1GghdvBq6oy66QNm+pqlhkW9wVm+WQWh5qc8gn
	jb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MUydtzh5QLVFPF37GUi3XqbCvIbnH3Uyv93cOTqomoE=;
	b=fvcCwHA/3Wo3f0kDYPBCZ112uDw2ajMFFk2CIaGi6+uxIjecLcQEs+r3uvMw4ASi4H
	BVFzYRjMWRDDf3gDzSSMyN734ynoDvKtjzQ0fFSuSVCUN1VCy/N7sVEdpHvfYXRLUs55
	7viupOQAC1yGhjbPKf73VXgGXneIShGYwyVOaZLLq7973Q7ZzPBvDYQ9QtTPu2Xpc0j0
	p0DCuKDvBvfxMf/uX1XssNFF68nSbDGt6GeAHRmoUDWH13x5bZ4ziEbac1FjG1ga5Zs0
	ypj0WYrEgin2iJFCG9oiKDdhK786RRkpkfGk9/yIZMIyTkjaYs3AnmSCBF3JP16cN71u
	KUxA==
X-Gm-Message-State: AEkoouuFQ1cwJXuXwi1Fj2czpDso24YIa8amWnXqm7uJrsb0rHzHWXBIm5ymNoD2q3XfUg==
X-Received: by 10.66.72.40 with SMTP id a8mr44942530pav.15.1471886844676;
	Mon, 22 Aug 2016 10:27:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l81sm28644144pfi.50.2016.08.22.10.27.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Aug 2016 10:27:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 10:27:17 -0700
Message-Id: <20160822172717.4479-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160822172717.4479-1-raj.khem@gmail.com>
References: <20160822172717.4479-1-raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/2] core-image-minimal-xfce: add kernel modules to image
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
X-List-Received-Date: Mon, 22 Aug 2016 17:27:25 -0000

With existing image, USB mouse and keyboard doesnt
work, it shows the GUI, adding kmod's make this possible
to get keyboard/mouse working out of box. Improves
first time experience

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
index 63900f8..a683c2d 100644
--- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
+++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
@@ -4,6 +4,7 @@ IMAGE_INSTALL = "packagegroup-core-boot \
     ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
     packagegroup-core-x11 \
     packagegroup-xfce-base \
+    kernel-modules \
 "
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.9.3


