Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDD1C5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:23 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19642.1786922659771917305
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Bp3C/d+q;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3149792a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922659; x=1787527459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhd67geONQMeEM2Et9Vr2KWmAdS+4NPP9CB5OzrclTc=;
        b=Bp3C/d+qFtzqoZuUogSNwQfEZFAORC+1tH5LjqI38PuymfyNMOHimgggXgonddsQDB
         4SPHh4YDuw39xAldat3XNsBMXlOj4eXjnZuNlqiw7nywwLb7PP7EtfaF3sFDkPQA5Mmf
         BGja9/oBZHgbWezQiZpQFe+NoZc3i2e/tGyr0ahPqUzuVfCzpSk8jEuuhagveDpE7u+V
         Kxy9iFrOE4ZlXDoEC9ckw7Eg2mUeyxjZ9JZngKVwKKUpFxvi/dJEESWZ2Y4yJQyspwiE
         4dTUqe80gYl4hfbOhs0nsV4oKjI3xB8UgiOuW79Y5KwZF+2pQEfhTdTthC9pXT0ypNWE
         zP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922659; x=1787527459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhd67geONQMeEM2Et9Vr2KWmAdS+4NPP9CB5OzrclTc=;
        b=KWQFyfW72sZwr21YsUA8F0h1U0xQP3Oj3wDrY297YgLBSLilc+gG5DfKg2CZfsW3Vq
         cTJHhJDzyPxB1TJBFCd4alIkNk+YsWN1zmZvci+2CceF5RCNtSajaBW0vz/qf2xwJtMv
         Obe3+6MJrFHKRsajtJ+pHcCmjgNRTaMR/AuVkYcLudXWMTsHRQP6YWMeB+KorJefZUQT
         7+vfb20aT3R7P1nz9aQ1vhvTULfEwttHj2CA+08Rp+9EgN+mBfAskGwsXpKXsjpSAGOa
         fy8mgLYX+ONGCp8tEjKi8tu2q1XNY6OToJzR2/GkXWhqZVQNU+xqFu4psOdxPIYIH6kz
         f+8g==
X-Gm-Message-State: AOJu0Yxh1LtExCwdgx0B9BvHqSKqE4NrzJnjgOL6VxMov/+XXb0XzRmD
	/LuEmLwbJZXP8vRAP1tSqRTzWWvD2XLjj/P4Ko0oNJEVaeiKd/ujVmW3bLH04MFG
X-Gm-Gg: AR+sD11hy9Qdfxv9RXajRSjXEw1AL4cKHfovrLWXe+iIV3v+YcJh9Tlw6L55jUOF3eS
	0pmqzNTRKzeCokKwPyuz47MaDa90DoFldqcuX7p6JIAlh+L9eU0WeFUAV5lh7wzLTla7ooPBaOz
	ryw0s0Rn9hefknTwCAV0wwkEkAi0Ci0IfZgmYO5NBJSemd/9TKCpqXm3rrzxexM5RRUpAPhPIAD
	X8PH1u9W5UgbD2XpKsxh+HYL7pXX7MXjy84Wk28PVznMkEy37wAKuVXWMnSUKVzstQ+6lDJ0+GX
	VC383zhcFo4D3E2L9fIUo7b2LV1JYgum1WeP3lRTCK5nhCRKEFBU6Xc0Aoz4DjiebVUvwTceXWa
	OByxPox3jAYFw4hS9Ft34m+xYL6FNZEHvVAeRYLHm8O/kv3Q5XxRBfIzioneVKQZ/4F+9zhmXd9
	UzXa6ySL1GYMEUwS0YsOTgyFt4U8FRpI+FSEvggJ4VWThKhVNKgMnE+GPO+DXQTuVnrdDjaeSD4
	icCKo6qWq72Nv6eg4YV+yrilUez1JKLZk4FxDZ5sCRhgEsU2eJiajyuXPDgnEDqIuKWONZzuk4/
	mvup8ZOr8s1Xn6o07Egp/OubZrd8o2/OWnOcGiRzZzVu90oIdznTxQ5R7q3BSNPwGvnQ/OoCpX2
	u4f7yqlGkJZFLCA2rLeQxKZMy5e0C9eqRhpSlVAsBSGgZ8g==
X-Received: by 2002:a17:90b:3d83:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-3933ed4c64cmr25069494a91.21.1786922659060;
        Sun, 16 Aug 2026 16:24:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 12/12] python3-wsproto: drop stale PTEST_PYTEST_DIR override
Date: Sun, 16 Aug 2026 16:23:58 -0700
Message-ID: <20260816232358.1947922-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129189

From: Khem Raj <raj.khem@gmail.com>

Upstream ships its test suite under tests/ (plural), but the recipe
overrode PTEST_PYTEST_DIR to "test" (singular), which doesn't exist in
the source tree. ptest-python-pytest.bbclass's default is already
"tests"; drop the override so the real directory gets installed and
run instead of nothing.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-wsproto_1.3.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-wsproto_1.3.2.bb b/meta-python/recipes-devtools/python/python3-wsproto_1.3.2.bb
index 3a9b18b7af..8ab84d7a09 100644
--- a/meta-python/recipes-devtools/python/python3-wsproto_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wsproto_1.3.2.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=69fabf732409f4ac61875827b258caaf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-PTEST_PYTEST_DIR = "test"
-
 SRC_URI[sha256sum] = "b86885dcf294e15204919950f666e06ffc6c7c114ca900b060d6e16293528294"
 
 RDEPENDS:${PN} += " \

