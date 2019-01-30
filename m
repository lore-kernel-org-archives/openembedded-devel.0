Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 97AE07C31B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 19:00:16 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id u47so735201qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QOpxQ+SaNoiGaJQR3Sg788S7LZwE7o4A53JjaRF7KCU=;
	b=n9upd/u0+SWsJ5Dj4n2c4Y2Tqfzs6EySbSPzhJVvxEAHRUaGp/V8o4w9Ykd1kywXc2
	Be/CHC2KqsiwzAmjAGBJduKVC9RCXjK36chYVpApXS60coSH2PT6uw6PWADEi/cXJYcs
	C9tdKkfcOgPFy4yoNrk5FcX5IYQv07+NgY9FIuyAUP7o0m3KjgLasqD1c6l9LJNYeE6y
	3UNqGfz2UtIUhd2OStHya5zJI+FeeTllN8xdGjjZ4QernnVpgmq9WdHeYKzZHN95eYjZ
	xjKLCLUCKubfoXzAkn/Ei5uAuMd7H5HvADt9MoJbOlOVo+W9HRuWebFd9vYh8deCJ8wX
	GlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QOpxQ+SaNoiGaJQR3Sg788S7LZwE7o4A53JjaRF7KCU=;
	b=l2UVOpViOnkDrtGfiiPKfzR/rvN6Hs5bXzZ3gno4/fn6tRz5pE8e0MmN9xJTI6sRHp
	kDY9VOP7gBMujj1P5orRM7IZiHSLeH5aIg9oNbHDDPRlcBZ9adykMmD1eBg8nfS7/0b/
	aPI4vnZH9FkdZINwSu6G0z2rS1fMCuKtHLzlMKhIJbbt/N9kisge4kzvhnCAyjKgdc5/
	1OtRP+sRcVGfSskfT+z1K4yW+avQskLnC57wlziWIpF8mMkwUhDQdpcibNjFcoOGh0Iu
	QXq34rPcmdMWPxE84U9vP0lbpyjYNLg773BjAxzJCF76kr7fNnqQaPshuPUqCw1jLM+d
	DO/Q==
X-Gm-Message-State: AJcUukcolQytN9dfZ5XVW2FM9C7keS+Vuo3u6ZmDMpkaY4fNEXasre9L
	xYPmWxqBMaXUkxwSi1X/V1NcKiXR
X-Google-Smtp-Source: ALg8bN49kPIg2YQIWr0yqkAXXM9c9WYhyXxBYydVrAPrOz2ZQdLtXDD/XDRYckDiQ1AyOz6Z57l9kA==
X-Received: by 2002:a0c:9659:: with SMTP id 25mr29089312qvy.3.1548874817117;
	Wed, 30 Jan 2019 11:00:17 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	b134sm1300825qkg.78.2019.01.30.11.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 11:00:16 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 13:46:56 -0500
Message-Id: <20190130184656.745-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libeigen: switch from http to https
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
X-List-Received-Date: Wed, 30 Jan 2019 19:00:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
index 3be04478b0..e1deb662ae 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://eigen.tuxfamily.org/"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
+SRC_URI = "https://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
 SRC_URI[md5sum] = "05b1f7511c93980c385ebe11bd3c93fa"
 SRC_URI[sha256sum] = "9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce"
 
-- 
2.20.1


