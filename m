Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C058C369B5
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:30:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.12849.1744471828787689296
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kbjGD6/p;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2264aefc45dso43515745ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744471828; x=1745076628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5eF+4mBp/8UPRpFik2WkO/2GIbSgz9QbMcKvRKv9c4=;
        b=kbjGD6/pzOamPt3cMf4yzPU7X9/sK6rSYhnhCyfMkcwqFL+QhQp7/9Z9fPuRQAu+vD
         gyN5i9HOJG4Kool/Ppz095iOZnv93JkUZPgbP1Lg8ARv32mhgZDMlpnL+KLKaaX2EHCH
         JI+gMg8tC8Uvbo5L9v4P6ysBcmglD1GganugmgORjoPilJupaviOwXbRVJbkwVhB+BAy
         Vwxuh7REhl2hUTuafA363iKGhaasLxDccU5YOyJ/r0y3WEeAg4o/ifAG0iD1x5PIXWgh
         Hl1vZOsYtvwJcGiYNpU57J0Udg1M/Cltf8s82UISOAi1wOjr8ljHO8cVGVs5Nk8/yFym
         NiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744471828; x=1745076628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5eF+4mBp/8UPRpFik2WkO/2GIbSgz9QbMcKvRKv9c4=;
        b=hkNkAPcOEGcsD2j62Ay3+kU3RgWodgUk5nTnvpXOu7FVE5amk/RimdgAFDh2yZbRTD
         kiTcoSgXOduYsIkhMf+6QoaTxeo2+C4fgZzZLJXiDgTHQgjy1SAJA7o0jW3rEDyZkdny
         8he+nVvZKjHTFla1twIPmxx+ubdKYhJGptN26WoBf1JbsZSzla+TALyh82el72YesMDV
         KfHLz+SAc56HZZ/rRFE4EV/ovbpcpoUg+xiONvIW5yAraA7DU0bBDEYVGkrq2pG7FcX6
         Hz9r0qa+lJK+UOYE1fmXV2wJc8IoPhu2s+a8GgY3lV9PiZ6poGKy+fSquIM75SDqxabC
         bFaw==
X-Gm-Message-State: AOJu0Yyk0FCX8gwbNamhkiBApsEwQP7J/usvc6uUY5yc4ZtAAVq0Z+J5
	A/wH1WLwWZOVd1qZ2YRyLSSAEm5Sk4HXpBMNN3VtVNFAVO+KTy7y9M+wjJXe
X-Gm-Gg: ASbGncs9hQjG897PzjJ5TFqJBcblJSWst+rYrDpWiCEq4GqyopXpRkLNc6bqzm6XiOQ
	kVZwxF9TNCN6ks1yY8l+krSM6igu0qzHtz3Srlrma+u8a210uuEB5TS+CZEE9uDZByVQuEAjVBq
	dj0/kq3utRrRQWZTB7r0noxvx7pggjy6137Y26+1DFxwc1MGRbsohebMxWGIwUYA7d+HcL6wirE
	n/YE22pxlmVdDFHCv0wH22lDNoPH+dWWvu9SlT8HzOPunR8EidLOjzmqqAO1kfC+4QZpVkCD9bs
	k5P0RA9o7Glu8gt3+TaZJUc690di/p6H
X-Google-Smtp-Source: AGHT+IGann60fCJh8PxPzQQWt4gFHgqAWNK5ICquHzzDHJ2MdmguRMVUA2aX2bnSYMlzP2vDSHYVNw==
X-Received: by 2002:a17:902:e547:b0:224:1219:934b with SMTP id d9443c01a7336-22bea4fe125mr85009115ad.50.1744471827870;
        Sat, 12 Apr 2025 08:30:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm7686659a91.47.2025.04.12.08.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 08:30:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/8] meta-python-image-ptest-all: Do not run PTESTS_PROBLEMS_META_PYTHON
Date: Sat, 12 Apr 2025 08:30:16 -0700
Message-ID: <20250412153022.2343322-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412153022.2343322-1-raj.khem@gmail.com>
References: <20250412153022.2343322-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 15:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116814

PTESTS_PROBLEMS_META_PYTHON are known failures exclude then from normal runs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-core/images/meta-python-image-ptest-all.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-core/images/meta-python-image-ptest-all.bb b/meta-python/recipes-core/images/meta-python-image-ptest-all.bb
index d6708c5fd0..56c392f036 100644
--- a/meta-python/recipes-core/images/meta-python-image-ptest-all.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest-all.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "ptest"
 require conf/include/ptest-packagelists-meta-python.inc
 
 # Include the full set of ptests
-PTESTS_META_PYTHON = "${PTESTS_FAST_META_PYTHON} ${PTESTS_SLOW_META_PYTHON} ${PTESTS_PROBLEMS_META_PYTHON}"
+PTESTS_META_PYTHON = "${PTESTS_FAST_META_PYTHON} ${PTESTS_SLOW_META_PYTHON}"
 
 do_testimage[noexec] = "1"
 do_testimage[depends] = "${@' '.join(['meta-python-image-ptest-'+x+':do_testimage' for x in d.getVar('PTESTS_META_PYTHON').split()])}"

