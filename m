Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9BDC37E069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:47 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id t1so6418376pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b2Z9V9Nhpp2vCHVxMAHX6ogS464JLEkFPO0nJjCC7TY=;
	b=qQxuoQsEYPsPBOiY3aj9AtTc8Cj0Khbau+WtaaHC7yroNTrZpM61EdRDOoBPNA01DX
	X9n5mjNXl0GC/l10OXu8vdmnzH9jS8pDpCiv3UN4Lx0CPRlFeuwl29hjweGaUIu5IxxI
	0xqLeYb8Hcs1rOzFHPfMZxJeeA3YLeWNA5YOItdmtyLlxCsc8OZ36sMxA/7xCOfgIcI9
	VlUUmYYf3rZ+u9vYeE80R3CHuq9psOluQbpLuBlq2NQLtWDDzAw4ma/zFg/hNOHJ3vhv
	QWJ9jgoSQTcScPwoGg/knQ3zbdxahYZ2JqRzTthOi2s90ZWvlom8Zu0VE5gaAD4Sl/Sm
	D7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b2Z9V9Nhpp2vCHVxMAHX6ogS464JLEkFPO0nJjCC7TY=;
	b=YCptz3UEGofXOhCcU7EmpFunxJrlB9CIiYsOTVAOtYr2747ES3ZusbWCnd9w7wXsLL
	qGOFQgmxEBJLRZZtrNTJBgEK4frLv8NMYW5GRAnRcT75qp5d2SlVyFETebaX3WPwZbVE
	x5xg8r+TWEsCD/r7znUsZ8TjTF69XNdwSIfff0pmP+dLJVIlSk+gdqPmyGwy1trCXlKC
	MDpScQLnIhhNyIND9YC4QnQQcKRFvXLw0PzeGqSMoE4AFLq+jvLaNCPZb0m1kfJQZL5l
	zrVaGkDmjdr8CLo4Dpqfwsq82LPlqgceo2cccXZk0pZQhqShOvJNEQ6BSxuJINlw1veU
	AFog==
X-Gm-Message-State: APjAAAXbbT++U3wjWpmN8vpZ1IJHMvQVAKeoDbHzRBVsIGVhRFrZ5qMZ
	P2bVaRblGUDimqexb8Qbjrcw+bd9
X-Google-Smtp-Source: APXvYqzNLOyUoppl+rdhk9X0z+eINlg57Pe3EZsEvUfBubA6+nK0nLLK3i8CnLT03H5OcHj+xzy72Q==
X-Received: by 2002:a63:4c54:: with SMTP id m20mr79928851pgl.316.1558411008511;
	Mon, 20 May 2019 20:56:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:12 -0700
Message-Id: <2a534f23d63b8d9b9bbbc124fffef6ed7fbc7af2.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 12/34] zbar: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 21 May 2019 03:56:47 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/zbar/zbar_0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb b/meta-oe/recipes-support/zbar/zbar_0.10.bb
index 6b6e501..ebd1f7a 100644
--- a/meta-oe/recipes-support/zbar/zbar_0.10.bb
+++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
@@ -6,7 +6,7 @@ DEPENDS = "pkgconfig intltool-native libpng jpeg"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=42bafded1b380c6fefbeb6c5cd5448d9"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://0001-undefine-__va_arg_pack.patch \
            file://0001-make-relies-GNU-extentions.patch \
 "
-- 
2.7.4


