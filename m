Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.6521.1616721774669517599
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESiCSdny;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so3466436pjc.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 18:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1531SP2nBMVWg9wsxjjoBSB6EB8ZhfuhRBNho8UEdwQ=;
        b=ESiCSdnyYieOsMQ3/IyA9LRQl6izx6RYUnaijyUCgPNke8oqHNmUkjZ3/9W8NE6Qu/
         XF9H/63lGGS+q12JFlnu2N89tIi0+jtTgrIeILF6HH3cj8scqBRuOk4V7hHe9JMqhxUs
         boUNc+fLsCmjnYPgPsjvNIXxBTf2eVf1wmphK/YrW5jIV/jUNnebLhRJlZGgIpycierS
         3LrZiKN17QyiU9RXCgCOAA+Y51jE2aXgE0Si+9nnz+Vq/yIwEeZ2FwuTcs4V8XwFwVbT
         jmpt9Imz5WxBwT2Wlcu5MmU+r9Vrxarazer9UiWqcAQg3yqTCxdFm5tMXF52hqk3uGXO
         zPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1531SP2nBMVWg9wsxjjoBSB6EB8ZhfuhRBNho8UEdwQ=;
        b=b9uxSmQInYbGUHqCGWkucVmVngecsUNz7Gk8f92Hu9isz7l+QflhWGyJ1n1O2eXFq4
         mESVgRRtIWdr9LMTSTEnApHZNlv7aBNpqOkRlhQ2rzx7ThqUZ9ia351Wl3gaGm5QhGFy
         mfwLtVqQFK7V/b3Zho7h3z4vtio0Offrt7VpRymnqsnJPkngW4HqX0hChLiQuJZIXeIh
         wFLE7tEUSnSqFKz/jHfMb8e/9eFCM9KnrXZITydqPd676Voj011CKMcphlVZ20MKouTS
         zp4wcZwD4gcoUmoBPgLbZY3wiXX8g5xxpXc+Cd646Z3+HWbTDbc1KRU2UZKAjNnImtf/
         O1eA==
X-Gm-Message-State: AOAM531vRUeueW6EFUg8cNOk5nO8DdSxLJj1HhiHDzepDQPkbGWjhQf0
	QnB9H0qZqoyLurhlkJmtsvvhvRX9ZCCHkg==
X-Google-Smtp-Source: ABdhPJy78eSLeWgzOAV0veToMHzuBckhmZ5gckp4RD/bhSfj2qTaO6AquElO6fac54wbbfy8+dX2tw==
X-Received: by 2002:a17:902:8303:b029:e6:4ef3:4f17 with SMTP id bd3-20020a1709028303b02900e64ef34f17mr12742359plb.22.1616721773967;
        Thu, 25 Mar 2021 18:22:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id q10sm6472873pgs.44.2021.03.25.18.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:22:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH 1/4] tracker-miners: Check for commercial license to enable ffmpeg
Date: Thu, 25 Mar 2021 18:22:48 -0700
Message-Id: <20210326012251.1063470-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb
index 097bcdb6f1..07fa10a0e2 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.5.bb
@@ -23,7 +23,7 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
 PACKAGECONFIG ??= " \
-    ffmpeg \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "ffmpeg", "", d)} \
     flac \
     gexiv2 \
     gstreamer \
-- 
2.31.0

