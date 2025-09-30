Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233F2CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:19 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.21063.1759223955250576661
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YWZDD4p7;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-425911e5661so22421035ab.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223954; x=1759828754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdSbea/7fidj1hFWOXuQUByyANoKgCWvXXfsnAY/UQM=;
        b=YWZDD4p7TaFZSLzLPAyLJx9dWoOOdWbANnZ95khNioujOsKwOKKEWFvIamQhtEKJDz
         fu7xm4yu9W27GyssbVrRfIgJy3wh3Tq5AcGWvRXDgqrNO+LDq2iLp1rZpOickcJQXF80
         xhIMESLAeGXjICbuHNsZo35XNBwEmPlvE17GaaobKfzuxg8HTYCX4cwkQI7qmkej9SOJ
         NZCUxmH4uoIfJjuh7Nx9Hb3J71hAJpyzeCZDtdQHNOU3f/34SLpsxhiBP3LpJFElKUYR
         ajXNULKo36fdQxtSEQZYXxSg4ZzK2c+5Ymsv3ZD3Ur8ZvHuS4qTNz2gUhHmufP/iG8PY
         hs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223954; x=1759828754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdSbea/7fidj1hFWOXuQUByyANoKgCWvXXfsnAY/UQM=;
        b=SdGs3rUUP+r3nwEOjvgYh2hWzgK+OZtxuFT7yex2OlqaEJzvmd25mVoKxzu9CByVpp
         QDdix9nIaaAQGutxeHbSWPVkxGG06O6bNQ2TEtSnMtCi8I/GFqCKOtT6THlOfYVBzmM/
         Kprymt3O/YkqOHEwOmYHCyBwf0RApO/h3B8UHeAk3G90V2uQBP4MdjY4XPSYmQqYXt51
         j5ACxyN+i2ww2eZFWgDd2rlFrNEn8jpwJKVakOk47/NG0wCMxE0AFhIst0w5VbRRHg6B
         U2kaUR9Ry+AphFcl/xmxpll7/2ogCDe69ONQPMv6JAI0ajWfyDEOO2iKzTlbhJZHywxe
         HZyw==
X-Gm-Message-State: AOJu0YxmT101kiHPaIJU4VHWY9wxKZ35kGaTTcWnj8fdeFtsapcsVFsY
	QO0P9PDjzFe2dHYJ2EQj/Om3/h/zY9ohXWYzg+cUPCal32LyLE5huZY3qJPrbHQX
X-Gm-Gg: ASbGncuUfQFt5fj1YQsm8z0Uwp9HAkk/B3UrBMFRJ/sweUvjK7OM2GMq/J5Oe3zDmPl
	vBvw/xOt89ejSS3QAg1nSCnxiU0Z3XLDITFqt82U2fnUPFYrIbtWYevrYKz3+XiAPGYmj11cuoJ
	Qe+de0w6zS8Q45FNHonu3kN3Opnba2BsOyG0k3za4vnEcqN9jkypLau6RPFkRy40bgWjx0WenAx
	fCUhdegoYTo2qQwa62Pis9OGB6etJtm3QKfDOrbYuq6VBvVBbSefafEjc9SWpb7MX0zV8kNVwsg
	AENKQOTNZya9F8FXsu8NhKbBKDZXDWYGEfx0LTJLtrkcgjn4k6Ub0RCsrHa+ibcWXeRB7kk/gfK
	i7nk8OCNlj/nxl0TS0CZhY8FlCzKGvjlVqLg2qyBadgmuFosCUrJE/uuMHlHGfNRrwb5GpPw3y9
	5F81OV93UpOA==
X-Google-Smtp-Source: AGHT+IHPFKqYgxWTxyhj9X9dxaIDop/atun+qMdF9F98GYVY5+eaQ6hRp63shfpmL5R/LR1BYzAzsQ==
X-Received: by 2002:a05:6e02:218f:b0:424:b862:8329 with SMTP id e9e14a558f8ab-425955cc9a8mr302025575ab.6.1759223954212;
        Tue, 30 Sep 2025 02:19:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:14 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 10/22] freeglut: changed SRC_URI to github + added UPSTREAM_CHECK
Date: Tue, 30 Sep 2025 22:18:29 +1300
Message-ID: <20250930091841.1693131-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120062

From: Jan Vermaete <jan.vermaete@gmail.com>

- added HOMEPAGE
- downloads are now from github
  "Stable releases are available on our releases page on github, where you can find more information about each release. All releases are also mirrored on the old downloads page on sourceforge."
  @see: https://freeglut.sourceforge.net/
- fixed 'devtool check-upgrade-status'

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6afcc7939e74023b06fc8655f4120647e4907f8c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
index 2cd00b0349..b3a103054f 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "FreeGLUT is a free-software/open-source alternative to the OpenGL \
                Utility Toolkit (GLUT) library"
+HOMEPAGE = "https://freeglut.sourceforge.net"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 
-SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
 
 inherit cmake features_check pkgconfig
@@ -24,6 +25,9 @@ PROVIDES += "mesa-glut"
 
 DEPENDS = "virtual/libgl libxi"
 
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+
 do_install:append() {
     # Remove buildpaths
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/FreeGLUT/FreeGLUTTargets.cmake

