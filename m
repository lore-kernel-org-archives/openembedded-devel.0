Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF646C79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:49:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10391.1788515345586151544
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BAdaiWYX;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so5648915e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 02:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788515344; x=1789120144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Z+YbhjwBmJie76TnyZmV+EDTnMwRg+S6HFDugUUkus=;
        b=BAdaiWYX9pq4bUD28xm6rn1QzWGtGiaxzY6nxeEIKZZQs8iUt6rl4PWJmRcoaW1mf8
         7pg/8cWX7C6+PbTq+CCKwsmYVzxzqH3nPizhECh571+Y8RQrUv7YmAwGXjrw2Rwxc5L1
         sDWiTox07qf90Jlkglh2/uKGh3snqUVW+AtYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515344; x=1789120144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Z+YbhjwBmJie76TnyZmV+EDTnMwRg+S6HFDugUUkus=;
        b=pchrUTyZdKxNoY2NAqC8jgefLJMwpbWggtmOQ2QSXtscczMpNGQ/Ex2jKC0BDKbMv1
         IhPz+fDEOhCW6+9AdSRSyjYFq7CyQQVZF3F05XABYYlAiZg/LyQ73nrEI5zmdVI+vT2L
         krUi9Nzu+xmLgETvPzvfrG8mvRlXqMZAS8UMJnifPDcWkln8lmQ79s1CTFdee+md3AZd
         Y0nUK3zmAtoJJBxbeIWj4K64ziNgHy14dNfPPr8M2bkFRiArTpMf5oShwTUCip0PRcJj
         StKuyRqPBhdc6DnVya0HW/jzmKcXGl+Co0HYu2/82KuAOrQgq6kAIoKh5CI5yJETqtHf
         lszg==
X-Gm-Message-State: AFuF++mCMHhfbZwJN6cOdQdHZdf5DyGBkTFcOgUpxrcCjPvWfAXCC4cX
	M5nGH0TL8bBrhOndumj2/23JZK41dovxoe2hfNyZO7mjYl3Tf5Q+L6ZLqeFqJWGr21oUJyNfaDF
	pfRaD
X-Gm-Gg: AYBFou1o8hXaytvI9ZpKElD2rlfcIr9Gt1jT1f1mFUllCJghy7Xuuss2qUCtEs9tn+7
	7Pty/JyTQpP7BZr1Tgt9cwwJwkpixxwM87W+Ug3ocZUh//7uMYECm+ptEgu88eJsPh2Iz9JdzzL
	MOvES8EZhrhLyKFMRD60075NT++y3AA6B7LgkjMV/9T1g/Cg8xKH8prQkBT7Plv9HkqsTNGnEu1
	144RstpS+daZFEKQ7oSv4jSvNGOeYeIL0c5Cf1qn+HrGZmm576wGleTft4amK3HaePMk3EjJKiO
	J/T0VvXkkmJ9ipMdSIzayS3w/ZE6P4rSGv0DeJH6X764I2TwDkjiZJwDaFhW1rOu7/L4iFCYYS0
	ROsuWBpOfZVnGFRGB5Xl6QXmIv8gK6WMnY72IJSF7zVgOTRtQlJ73o9sPKsFO/wRxVJDvvZJukU
	SDaRR1q4McdOTrNEQbFtfO/9kAkS13QR6bNaj+Q5a0rIU/KRmDDmWaTENezL6V15urS/zU3Gdr+
	17X5XABzGeB/79SbHtffozqdlG8U0TrjHYi24/I/5H+Mg0Hq6znSPUK/aFbw9DZpFO7XqHHkNed
	wE6bOQnSuOYrwA==
X-Received: by 2002:a05:600c:3551:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49cf8224cd8mr50452825e9.4.1788515343432;
        Fri, 04 Sep 2026 02:49:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d4938sm141045965e9.2.2026.09.04.02.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:49:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-cmd2: Upgrade 4.2.2 -> 4.2.3
Date: Fri,  4 Sep 2026 12:48:53 +0300
Message-ID: <20260904094854.3706560-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 09:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129753

Upgrade to release 4.2.3:

- Fix ty unresolved-attribute warnings and add mypy back
- Update ruff to version 0.16.5
- Bump github/codeql-action
- Update readme

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_4.2.2.bb => python3-cmd2_4.2.3.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.2.2.bb => python3-cmd2_4.2.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.2.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.2.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.2.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.2.3.bb
index e5916dedb9..b1de6df644 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.2.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "8f1aff338f693be4c5ae0a1c928b17d728940e03386018615b25cdcd4abd6df3"
+SRC_URI[sha256sum] = "b5543c81e01eea9445f1248879855b727c949d5af27c0390fbb8796f782783e9"
 
 inherit pypi python_setuptools_build_meta python3native
 
@@ -19,6 +19,7 @@ RDEPENDS:${PN} += "\
     python3-json \
     python3-numbers \
     python3-rich-argparse \
+    python3-prompt-toolkit \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


