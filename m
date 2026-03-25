Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABFD106B51A
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20829.1774441271229052472
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EIfXL8B2;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fb14227cso25395625e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441269; x=1775046069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs/51sPJhNAB8qPnr3/x61/Cu9wXIoMKdnPHDoaaa+Q=;
        b=EIfXL8B2CB6Kn5Z7aATz2KVJWKN4HYGzCENWppxB2um58GZr1NGjRAQ4eK1QZxzlDw
         6zMmGSjfu0oF1XnNJvcIZnsomKYHCZ2M+fmYx5kDe8pkJXKF/f7NnVtMrqXF1V3Zxzgi
         6wX/yOqgvvMYTqvJgQoXftdjUEVPMQQRbPPzeAumeFnP4M1SuD/fka2R8OOUQWkZULG7
         kLUyefz4qAh5/i2ikCp7xSfa6O+jfeZHGH0lhUmpVC498r7Jrk3aA6XU86zhAhkUhb7p
         PfXQ2cd0kB1vr4cSiDGp5oBeNWtHLjttgLTAxyCDpn5aDebL/D1NpSgr+tODUsAtXwwg
         f0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441269; x=1775046069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fs/51sPJhNAB8qPnr3/x61/Cu9wXIoMKdnPHDoaaa+Q=;
        b=NteZ90OQTJh1zH15mXw/kRd6K3yuCwb0B3q5gMsMDLbJcQRbpGzO194mz3dtjNDEgh
         5W8zYm3KGSWR2nBP2hkEK1IhNvdichkJN13MBUm0QXv3oO/Dcr2Q5qcU9lGOKw5bICyx
         ByX9WZHa7Oc/Dij8dOzWuUSGD37CRQWFZrkoBjT5wJfcRtLdFSuXj+2+XEzgqNmSleHf
         wZz68RLgDqPzZia4q6/mDGmNHJbt/wl6315MoMP6kUlIkHOuhwySHUIOt+0BRBu6gKZb
         kLCkIzwF4nkIFJ2VvuUwyLa7h9EaXaSpSNiqaOSpMTQciXxrFPD+ioMRQomOJi8PSPhI
         ReBg==
X-Gm-Message-State: AOJu0Yyx2UkxlUf0E8QGpsBuN2/eMRifLUtG6VqAYZKRlZWaQAOTk/p+
	PjlAZkms6UsdoaBCr5VB3dxO4Ou+/WcT1lZeXPNoDi1gg2rKkFi4syPK+rKhyw==
X-Gm-Gg: ATEYQzzOo7jmsSmFjy+ciEXAvFIC6rsMQEIjQ6CVfBkKrFLx6dmFGUs91Iz0mAUB+Xm
	G4TZx7857fZrORADqRMamBtxNg9o8cK31x9bEDgYY5zXt3NPO/KBYeUEaO94OqQxirKVw39S9y5
	ZdRA4bPG5+fZyaO0RnkQFFl+RRceALieDJl/X3tlnifcbuKlHy3/WYSIjfWNdHbG8z26UMV+ulr
	p+KEIbqLr6bkt/r0lY1b21/dr6noBBvEoupP9JMiqDp4z0/w2y9J3R/Sv/QyLxkQxED+DwQyGMO
	zjJDVDH4bzwpCm7ZqVRdi5jmYQVX9dXMbvjIR/mIWymB6g/4uhFC7Z/i+oOy1jjcNBhiBeb5vSw
	3cH+fZewAxHiMAgof+aDQhYcVF0AQ/Mug+ADwl0d8a/2UipCWfJ5Hdz8XQcZLa0aE02NgKWZezV
	oxPaQyZhW9MKF+qwOyoX48W/El
X-Received: by 2002:a05:600c:4ecb:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-487160aa232mr47050265e9.31.1774441269239;
        Wed, 25 Mar 2026 05:21:09 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:07 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 07/15] isomd5sum: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:33 +0100
Message-ID: <20260325122046.1211090-8-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125614

PYTHON_DIR now contains PYTHON_ABI, use that.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
index fc94d2caab..f1e0efb238 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.5.bb
@@ -16,7 +16,7 @@ inherit python3native
 
 EXTRA_OEMAKE += " \
     DESTDIR='${D}' \
-    PYTHONINCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}' \
+    PYTHONINCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
     PYTHONSITEPACKAGES='${PYTHON_SITEPACKAGES_DIR}' \
 "
 
-- 
2.53.0


