Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A90C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 09:36:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2664.1784108170750837789
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 02:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kNhesPZj;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4720f3bf164so253927f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 02:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784108169; x=1784712969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSY5eO7zch0hfDvLUC8DDrF59PbIZMMb2hX+oDFndPQ=;
        b=kNhesPZj6uJ2zAxR4a655TFb9LQV9kyI3X0AgwUKxXb8D6ptdAwnPg4KfKBInA2Qh8
         LelDH9uQ/4CWiDeWXIfRw0NxbdPT9y5Puqm+4KQicYxqhh/pEGvdAUV11QHFJbOOM7Tu
         O4lFuWPHqWouBpwgBOm1QJ/sdejUrJ5Z0h6Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108169; x=1784712969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSY5eO7zch0hfDvLUC8DDrF59PbIZMMb2hX+oDFndPQ=;
        b=TTWqtu/5LBmIAXuJwi02Sep9teiZxhHWp61sNqUIqe41mnn53myrbouxuH6o4VDuZ0
         67eDhMFN4wJRCioJjZT437C/JQ/hF5km6ZUnPc9zh4hP66UCs1T7I53bbuPhZHShPEPq
         mnE19ZxgokW6I84/qp+FD1dgwAljGIosUmgXYZrjHkkQjXl08B25c87L+DlI+yiXiFZ+
         dOThsg6sJTntrCgPAcvUQZzNrOQwDFGz9AEab9gMF3wD1LqabcvuMhfe+kAfHsp+aTfx
         YjsGGUjpX+PTpJWNEFpiYz+Nrgu5QlTqdd0rMuG7X/TF+1r8MAbm7kn4DccUTiGUyGL8
         oYsQ==
X-Gm-Message-State: AOJu0Yw+uULwO0OxGiQzUMSJHI3vBM+eZRrgclefWZoHsyLKNCsxGQ/S
	stNyvv8AQ5frw01FNwgysXrhuZjPTm1i8gS8swUuGMZ+Y42yMpjRIp/FVIwSz0MDib36RiiUEva
	FM0kq
X-Gm-Gg: AfdE7cmua54VBnNU3kqhW4BF3Ah906gq1NpqJ1B7yQVCRsJOLDHtWuUy8Cs7vYlWm+A
	iPNBB6qK4WHDoeNk0RBL58zN3VHTbtOEZw0TcTL4f6/SkoENB1W4LFbHnGId/kagtuP4P3ofyEv
	hda2RBKfPLKxMAUvUDl/EBsRP+CVLF9uoIgQ7VI5KUTgeZqCLF3sC7lbmyuULkIFHdmSjjL5XgO
	uNWUPH2IzxKMc4mJyR6d8nc5LQeRvvDiqSCHKD/jb43pLG9/DubVFqOMeuxd5+JkrTsYh83EB1D
	YUGtI2NfyrdcbWrOAwDMvBrFlLttaRhWCW8Ri0BV3Jl+1PLa7Rv3JXSIGTlO5PP9SJ5Xv6Ua595
	mMNGjLG+Kv8dEDmYWzAhshaIPqS8wfHUy8p7C0PqjPFJZ8/UQJt5Kepjpo3MCKW+Dd+dsyAteHt
	fGmnMq5NYOlGbtEMi6xS5oWDqESEPpNnhfSq+nsHnMxri8S2qrM0euodWWCfy3izzBang+9MirP
	EiAxEjHD5BFYr8hTMrY7RqMJwggUNWDWrsUvoRvFA==
X-Received: by 2002:a05:6000:4713:b0:473:41c6:f1b9 with SMTP id ffacd0b85a97d-47f2dc863cdmr18860008f8f.11.1784108168861;
        Wed, 15 Jul 2026 02:36:08 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm15032791f8f.33.2026.07.15.02.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:36:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-term: Upgrade 2.5 -> 3.0
Date: Wed, 15 Jul 2026 12:36:01 +0300
Message-ID: <20260715093602.2749784-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715093602.2749784-1-leon.anavi@konsulko.com>
References: <20260715093602.2749784-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 09:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128172

Upgrade to release 3.0:

- Remove deprecated license classifier.
- Upgrade .readthedocs.yaml.
- Upgrade sphinx and sphinx-rtd-theme in docs extra.
- Require Python >= 3.5.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-term_2.5.bb => python3-term_3.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-term_2.5.bb => python3-term_3.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-term_2.5.bb b/meta-python/recipes-devtools/python/python3-term_3.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-term_2.5.bb
rename to meta-python/recipes-devtools/python/python3-term_3.0.bb
index fe0aabf0ff..b4f801bf4d 100644
--- a/meta-python/recipes-devtools/python/python3-term_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-term_3.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d90e2d280a4836c607520383d1639be1"
 
-SRC_URI[sha256sum] = "846fda941dbb8a7c9f246e99bf5ee731910fc4a4cc54b7e36457c133c9f6b78b"
+SRC_URI[sha256sum] = "a6a81535e68fd98d25b1e2a1dff15400c5678e7f942e2d5bb5bde56784534d98"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


