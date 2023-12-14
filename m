Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4A9C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 04:59:35 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.15330.1702529965198606020
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 20:59:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b3708b3eacso318573839f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 20:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702529963; x=1703134763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iHinEr6Bdr+eVgZqraUGlLJCurzUjy1eECs/2FPiek=;
        b=YitsYr2BZzUg4bwo9aw/z4chmkC40CVpKPlOGVpmLf9VkZ5qKLZaXTxtNm0WQLulhG
         OvFKNN+0BHyzKP9/W3kUZtoGXRo7xnKd/4zl4gurvmFjF4pG+XdGEKLT3K69RUO8mIc8
         dIwUgvKwmFy3FCEGgKh+ao3zfuioQMGCmdQWCibHRm7SQGg8fGfEXqN0VhkhTKuOV43Q
         D4ZVYZCIjG5sc8Ae3tv0ppr9WWwj/WCUgpvbLx03HMPh5DgMRLQdMIzOnwI5vtuj5Kf7
         8ucUglxs0bXSeOKIKXAllSA8KQTG0uSunaMdjYvHN046IFMw42doQLLVb+wYlxYPY1jP
         xqug==
X-Gm-Message-State: AOJu0YyNpAOYlpkQjyT1BZtUfL9G7M/sQvr9QiZSFgP1quJeOC0A39Wb
	R/YKonTeSHgHDt+yNCxNLQpkwphpRO3QMw==
X-Google-Smtp-Source: AGHT+IG/5/ntzg+5kaGvf8Ih1Dy+dlT4iTJ6VmQXcrHpMd8IGH0+3aERQQq+8/r06UfYhFuUdhVd8A==
X-Received: by 2002:a6b:e818:0:b0:7b3:9232:36b7 with SMTP id f24-20020a6be818000000b007b3923236b7mr9780371ioh.5.1702529963555;
        Wed, 13 Dec 2023 20:59:23 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id g12-20020a05663811cc00b004667167d8cdsm3198185jas.116.2023.12.13.20.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 20:59:23 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCHv2] python3-olefile: update to version 0.47
Date: Thu, 14 Dec 2023 04:59:09 +0000
Message-Id: <20231214045909.1188612-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 04:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107411

Update license file checksum and verified the terms are the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-olefile_0.46.bb => python3-olefile_0.47.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-olefile_0.46.bb => python3-olefile_0.47.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-olefile_0.46.bb b/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-olefile_0.46.bb
rename to meta-python/recipes-devtools/python/python3-olefile_0.47.bb
index e29f30f6f..2db0adad8 100644
--- a/meta-python/recipes-devtools/python/python3-olefile_0.46.bb
+++ b/meta-python/recipes-devtools/python/python3-olefile_0.47.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python package to parse, read and write Microsoft OLE2 files"
 HOMEPAGE = "https://github.com/decalage2/olefile"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e21a06208415d5eb2001555d37851362"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f18814bd70fd28e11a4545145dcb3822"
 
-SRC_URI[sha256sum] = "133b031eaf8fd2c9399b78b8bc5b8fcbe4c31e85295749bb17a87cba8f3c3964"
+SRC_URI[sha256sum] = "599383381a0bf3dfbd932ca0ca6515acd174ed48870cbf7fee123d698c192c1c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


