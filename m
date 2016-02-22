Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id AD15D731A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:05 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g62so156181706wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JNR7GH0IE6Hea/fLd3Ux4LfVaMhyK/4M77TvwaqvDsg=;
	b=ztuvLrN2az2FKh1NOvsSvo6q7Dtv19BWTyiAqjzJX8m+dCevfj0gX2K8r4pWVOUlwf
	GJVu9203LZpN1IBxtZmjLVGM9c2mOFHTMyVhG/Myj+UixaJBiRGE5py5JJVgbYu/xLWM
	g1zabSer8VX22OwSNSXIXgUtSrWBl6zuoz3EfG+VyhNBr++lHNtQKH0fmaiNJeoJydhN
	VTwrowaeftk/Z4HLS1as2NL4B12LwQXgIkyCtIiwAA5Aad5vHa+AcOy0E7kc5JQVZPlK
	2TOh/KE2ES0zaOZix0EUIjnOj7iDbgN8rrML0QkTdEGlku0RKouIF2W3cvcy8YeZS9Qy
	LWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JNR7GH0IE6Hea/fLd3Ux4LfVaMhyK/4M77TvwaqvDsg=;
	b=BkBnhqAkCMjVB0q9k8WyESohdg+iLBZK9I38zZv4g+Z+WZ2oHu+WP6C7GR68fMKL9V
	ACDEvIlJssF0YZuJ9y2abR1yjh+pKdiDzoZBaJwt3AoxHL7xTOP3Q7u8MUSj0pJFKMHu
	/PUUVDe1oXkVZlgzqBxlBJOcO2FCDQfqcrBIfofHPWRjFmgCA0uN3lLntt7FkJ68z0oq
	gqteJ+qzYyMzvpWAinF9Mk14Mw87cJtixNURqLCbYQGD7gsFYPqbNgML4VNooi7A+3dJ
	1OUDyAEFMRgdXXarP6EeJrtLjA7l1pM+mGr1DPDKy4wnX6qqA9cLx825uyfjcE3tzjOb
	8Uzw==
X-Gm-Message-State: AG10YORUXKpFXzSxslrCmm1IqFOQH5oX6rnUST/RhmELN9tRaW1DCAdmruIJBE62g7tlUQ==
X-Received: by 10.28.54.197 with SMTP id y66mr11648882wmh.16.1456146545711;
	Mon, 22 Feb 2016 05:09:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t3sm24694372wjz.11.2016.02.22.05.09.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:47 +0100
Message-Id: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe 01/10] fakeroot: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
index 156d513..37b3c18 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
@@ -25,3 +25,6 @@ RDEPENDS_${PN} = "util-linux"
 
 SRC_URI[md5sum] = "706171d8d520b1ca1576ac73f2ceb4f3"
 SRC_URI[sha256sum] = "0a359efa3e9496c33234b3e9c89306a09bb4da9d33de43c261f1d8447e6ebea2"
+
+# http://errors.yoctoproject.org/Errors/Details/35143/
+PNBLACKLIST[fakeroot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so"
-- 
2.7.1


