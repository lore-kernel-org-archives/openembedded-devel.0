Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web11.24700.1586985310355878744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 14:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@northern.tech header.s=google header.b=QQaY2WXr;
 spf=pass (domain: northern.tech, ip: 209.85.217.68, mailfrom: drew.moseley@northern.tech)
Received: by mail-vs1-f68.google.com with SMTP id g184so998693vsc.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 14:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northern.tech; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hgBQz5hQNa76Rmxkg84kvraTpjkSpB9+JOXnHCzcDYk=;
        b=QQaY2WXr9wzY/cu8lMCNBq08xI80h/UrPTdWWUbRXMkT78+TWyzce1B+rV2l+y9pCq
         /z/O5V1WomhbwUVdmQ13bYe5T/v8oZzmZhw2D+GOnVHgOs/BlX9+iO/3h3gb2N0XEpXI
         zxLvRJ9WJVFZ9aS8a9iV6j/pXj+jTO9xqJ5NIlGpwij0SDA42/1csPMBWsP5X8LKvltk
         7pt2ytkmYbkEW6rpOfl0f4xm+AsSQI7RUd327Gm6sGNyZLJQ5okajSP6tH2Hc7s+2y25
         avtrbDJB19Wi7C+pN9jJRXKxkRBtsF1e25DEtkZnmxpUfbwgBpeRUmFlxWTSmhtkcq4O
         jmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hgBQz5hQNa76Rmxkg84kvraTpjkSpB9+JOXnHCzcDYk=;
        b=J/ui6WJNwQzPgFjbwtarUxYrbtViI5R8N3eBKebInHcliT0KHP4/QKQ8MlyMXYdyjp
         at7XWuK4m+81FN1I1j38cbrIJXXoAQ1g8F0XbeWrDEPw0U7DmaU7de9EAdFR9qfhVbKp
         AmyTuayihXrf37X+HDNqLt0VsUV7ZfjijzBDJG5Oe0A3QtgqrdO1o6TwyRo+WRzCD+9M
         3mJB7RPiyo1aw9Yl05VrlbjJya9XDZzG6wqaqiUFGQo2dUFvpX7OmJqscz2InPtXIKBH
         6a2MVCMJ3Xajpcemy4M8N6A7EUU/KqYHlMj+R1kQ1hO6gQ8THjRGjGt22US88h4wL6Xb
         Ai0w==
X-Gm-Message-State: AGi0PubDeyr5TVcN8U+UXJ0xAMF2Y1IH1wMMwcYXXbKZSDBaGOfanyIf
	v1VV2UxtaiJkdFIDxrL2jNaEez28ajI=
X-Google-Smtp-Source: APiQypJS7zI/x+8U+Am8BasxzKY+Yx+UpvOT88meRihM1CD4ZNKBFdWzZirZLfP/YSZrFTjS+Jkzlg==
X-Received: by 2002:a67:3282:: with SMTP id y124mr6427092vsy.202.1586985309025;
        Wed, 15 Apr 2020 14:15:09 -0700 (PDT)
Return-Path: <drew.moseley@northern.tech>
Received: from dmoseley-build.c.developers-build-hub.internal (189.109.211.35.bc.googleusercontent.com. [35.211.109.189])
        by smtp.googlemail.com with ESMTPSA id t66sm2290095vkb.23.2020.04.15.14.15.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 14:15:08 -0700 (PDT)
From: "Drew Moseley" <drew.moseley@northern.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] memcached: Add aarch64 to COMPATIBLE_HOST.
Date: Wed, 15 Apr 2020 21:15:08 +0000
Message-Id: <20200415211508.22373-1-drew.moseley@northern.tech>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Drew Moseley <drew.moseley@northern.tech>

This gets it in sync with libhugetlbfs which according to the comment,
is supposed to be correct.

Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
---
 meta-networking/recipes-support/memcached/memcached_1.5.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.5.20.bb b/meta-networking/recipes-support/memcached/memcached_1.5.20.bb
index 37a77c364..feb4f3f14 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.5.20.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.5.20.bb
@@ -26,7 +26,7 @@ SRC_URI[md5sum] = "4b64296ea0eeccdee9168c035e0488ab"
 SRC_URI[sha256sum] = "cfd7b023a9cefe7ae8a67184f51d841dbbf97994ed0e8a55e31ee092320ea1e4"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
-COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
+COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 python __anonymous () {
     endianness = d.getVar('SITEINFO_ENDIANNESS')
-- 
2.25.0

