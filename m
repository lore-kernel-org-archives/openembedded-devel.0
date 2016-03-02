Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B7B2D77070
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 16:19:16 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id p65so85032525wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 08:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nK1dDtk64OQ4B5KVFqSbOY/fcEfl4NoNadWmPnft0Sg=;
	b=tmlToV6LitfWwTgHMU5X9n4RYoWZ7wFECBdHBWwLA0aWDu8xs7wVL6+SeIoGwTeP7u
	DgLu5HXexLMDgi/3U0o1XNLeoY77JU9rJy5LFGTTXf+Enik6muB1dMX5E5Q2ZSmMqvzS
	MBzH0yy779RcgfjYrIu2WpZbgmA28VeITRg1sOk0rEVVIrceOsjSe5mPnsICVpe+RW4E
	QHeTZUVqoZ9fi3Lu26bht4dvLDafxGqJ6q+g2yhPCDI9SUXG/1m6PzemuPArPA75kUaA
	ZuOXzG9kISS/A507eZVbPerBek4/wmhE/3mZ9nm6E2aH89UauIBdjO0aQ4Yg/GBBxn4r
	W9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nK1dDtk64OQ4B5KVFqSbOY/fcEfl4NoNadWmPnft0Sg=;
	b=kqkp/Bd0XkUUFnfi5soMA3ls1dw1ab7OGq/byC4elxHhSYtCG6FSBefKAbj1F3WWpe
	dY/w75Po2hChUrRSkH/vjLgQMNPrj615KI78lf+kolzMDdtgL+3gJXhsuwLbslM1AUmP
	NIyj9F8e7MSWYOzScqqf2QHtrOMff9lHSYgag3zr474KtCe5zocW+spNtm2WY+obSkSs
	mUjs+LjfhtyhYI84Z2irtiTySxtzPXsxJ2qvlbkGmDBi/XG1Davn+vYHwVhDvn5YA9In
	dS0p6VhM8Mj120wb/kDWkGzRVKiCkNfouSiNraYcReD2QLmXgHNmVvK8t42/AviMseYt
	kwQQ==
X-Gm-Message-State: AD7BkJJ7IHxDtlf7R26+CtBu+4qkoJauN1DbWAxW3B1Uarx/TkDZKE2v7ED3gBAgVv/ajg==
X-Received: by 10.194.121.136 with SMTP id lk8mr30692572wjb.92.1456935556687; 
	Wed, 02 Mar 2016 08:19:16 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x186sm4828295wmg.19.2016.03.02.08.19.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 08:19:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2016 17:21:08 +0100
Message-Id: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH][meta-oe 1/5] opencv: blacklist, not compatible with currently used ffmpeg 3
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
X-List-Received-Date: Wed, 02 Mar 2016 16:19:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 3 +++
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index a74853c..eb38a5a 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -103,3 +103,6 @@ do_install_append() {
         rm -rf ${D}/usr/lib
     fi
 }
+
+# http://errors.yoctoproject.org/Errors/Details/40660/
+PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
index 1948a16..99ca8b3 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -131,3 +131,6 @@ do_install_append() {
     install -d ${D}${datadir}/OpenCV/samples/bin/
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
 }
+
+# http://errors.yoctoproject.org/Errors/Details/40660/
+PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
-- 
2.7.2


