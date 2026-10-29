Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7739.1793266016327005555
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jxQQhANI;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1402913a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266015; x=1793870815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBUfIXe9ivxrJ5jksO74fe5X00U5WzSqO+Lt2rj25h0=;
        b=jxQQhANIwIATohJQyu8Y28dF7eiNOP8asbjZL90E//9pqDp10EJPz0JcqkGnJpfdWc
         Gh+DG7/0718uaeumeAvgKGEWf589x6DnxFtYJWKRN+MH+IFM6J6OstRXcNhIiGPekkbg
         pUl1+cEabdurg9rYj4Sv9q9gwxNrxL+R/QBDWbfFLwNpF+MQqQFM4vIylE2Y78Ts+C9A
         yQRCTdnK+BQx9tiGzg5lnfY/VqxopT49aVrHL2dzi4mOXA1Q6DXF5slB+0zjSWbl/UhD
         tm26ghN+8tjIy5Gcdj0bQmdpICVZnkl0vDsFYDtt0GlgfEGlvzK2WeCT77Lwg4+sPm8S
         gYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266015; x=1793870815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBUfIXe9ivxrJ5jksO74fe5X00U5WzSqO+Lt2rj25h0=;
        b=DBn0oI6LVYc1x6HRCbxxHNfnMU2eMshu9GpdkwLoZa3npj/wRR5MN09kYjCx/JaccG
         OHJ0HeLSINYWGMdVVvDCVGAisPJ6VSv/WAxGAMSm1gLwjSNYM2jq3Qo3PQdZrglzS7W8
         eBmqcLIFOXvLoayvPG3Zaw3tqXV7IqVlVtwHxYfnp2/YKSg1fi2nJclu7Ld2jCH2kM4X
         IgKsdCNQsv2pFHVybRRKjxo8F+faNroYIa7HEGvhBzJ+L1azyxy+EqAKcf9al2ZamWS7
         1XAxOr6YY+v2LuvRkEUchut6DEdK6pJBf8TuBFQ/D72BuL4E3y1JfwKdzVEmOwl8l1eZ
         HzGg==
X-Gm-Message-State: AFq9FYJU9pIgHv6mT5wZobtUwuoZr/yPfocOnHql0zMAl3oKO4AIAhlr
	o7Hj/S7v6oLTmq7FDTVr0IdPlQFmSKAAzhNnfDzW0cHr3pRjpVwaFyGGAjFL5g==
X-Gm-Gg: AYBFou2na23oUUv48Q/4x7WATWCk4rbVNR89sXlIfTzU4knSMqF2oc5Q4e3taiKsfgz
	D/5haLgQxbFMtAOYI0GDJD6QuxQOR1fWQ4RBSqDuw3mAkynJrTOPZ3yzGUF0B9ndw4uEOMwSV9C
	iERjr8Eu7WBSS0Cc/cfsrGOgGpTWA6A8R2jkvUzF9ZY9zPYFGDvF2zc30kJsNF45BY5XTjOIBMO
	jm6m1vRnHMroX2hBz4IVv+rusQxZnludN3ZSL4AlixiS4CELVXDnM/LlycbhH0zvOypj/z65oIE
	k4rHkRx1J1L7pxBerAyt66DScupF9iqwJF269tlNRf44kVhbCcQI5rHgOgb5m8JEAH3Vv/YpZrM
	jPtrxZbU3mRt8DU29T8SEgh0eI280wfmQOt0kAb7Tc0QRoy4hwAsvrQOEOvgocFSiN+R+zVotZK
	oSJkxbgesmgv1RHotQL+fzxwlwcTqOmzi9+SF7jdalnFLocKWOUpFMxy3+IiC9FKRjFKCCXBGbj
	tqLRNNpUqMxnNv+dHrU7zWMYtUDztJsTT7poN7qyY6T//MosMsTGELsmfDiBBWyrrQ4yhrbNYTY
	tBiBudDkCLirOOj76PEYfD/P1/OkfNZnyhHhVNWMqy7z9gOVvLllQhKMK9zbog==
X-Received: by 2002:a17:90b:5348:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3ae5822fc89mr3981898a91.31.1793266015282;
        Thu, 29 Oct 2026 02:26:55 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e874bebsm3513079a91.14.2026.10.29.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:26:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/7] zchunk: upgrade 1.5.4 -> 1.5.5
Date: Thu, 29 Oct 2026 22:26:40 +1300
Message-ID: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131649
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fix out-of-bounds read
- Harden multipart download parsing against malicious servers
- Harden chunk decompression and header parsing

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb} (81%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb b/meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
similarity index 81%
rename from meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
index 9d587debfd..f84cd8d6fe 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.5.4.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.5.5.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "A file format designed for highly efficient deltas while maintain
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
-SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;nobranch=1;tag=${PV}"
+SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "99e51afa38c723e7c25834c2c3b305d20ef55d04"
+SRCREV = "ae8e9f5b1e820a906c39f7eaf231e71bef72a3a6"
 
 DEPENDS = "zstd"
 DEPENDS:append:libc-musl = " argp-standalone"
