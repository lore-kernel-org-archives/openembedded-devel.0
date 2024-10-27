Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF005D13583
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 20:17:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.36809.1730060208499826465
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 13:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDE+oGV4;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so2816595f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730060207; x=1730665007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jgEG+WJOzfWRfJa/miGiRHc25R0SVQriwG1ng4aG/dA=;
        b=lDE+oGV46ZxzW69fxduUy85zbsMd7ULhwhJLrQ5GP8b35coaZn7qkC1fQ117FXQRwz
         H22KBFxEKx5934kjwsLy3da5TTDK7X9CMEZjNNZ+u6oDs4BA4cwiyIHEahFrAX12eTWh
         VZDNWhWKRpHRKCjYW3SI8H6ywnuUDOqsRbhL/bsFebV7wcysuSM/ma8+YZi/ImgBYbcl
         +e9NTyIK3d+b1yDhO4P26BuUbFXGoO6HjOq4ezzVKPfVCpz74Vv8PkrhnJDvOnf2HhUx
         8QSYSOIHXGhjMrBt+7GTsuuZnzGRkLucJKeQ4RA2P2bidIaNu8oC5/aNIjTlFc/it0Hp
         u4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730060207; x=1730665007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgEG+WJOzfWRfJa/miGiRHc25R0SVQriwG1ng4aG/dA=;
        b=t/TpETgG1vC9vqmmpc5sk3c5QrX0L1oFnzK4scHlj8+C1ZneqkudrXZtxJmsizYSco
         PcB9Rpo0HSOb4lFOurrVqikBkzspSBEgv4Jtl0J5jrZKCLQL2rmkNhbsN7lPAcmwm5uk
         8rCL7zz6+qzBA1jmZpJgh3m7NYBV/4QZd/YyBh/mX/43zyx8TwMZX8sZaaZqTYc0nE26
         cfJdRNLPn2txnwPN2f8C+b/ALeyBmOFRG/DugVqeTOeGX/zEn8o5nSqwKKSOwfUuT7Z/
         N2LTL1xYw9dbqpMUID5xwzHHkKFdruXJcQi3CQ4pxQ/dHKMGmX/lki3T/mkAmh+N8I8m
         kHfw==
X-Gm-Message-State: AOJu0YyE272f8Xpq1RaKlA7cC89kuuPnumhb/1nJcXDzYo7iSHmMR0g3
	9hP3GyJLXuwTbJu/HypvgkgRzr/ztUjru/jjaNWOE4r0/ANg+m8j2OHWSQ==
X-Google-Smtp-Source: AGHT+IHTFDVebxogfHLy3TqiuLW+Q8B/Pe+4jzuw5zE7de1m5hYEk//TrrdPLS837Kay5Opc8YwTDg==
X-Received: by 2002:a5d:440a:0:b0:37c:d1b6:a261 with SMTP id ffacd0b85a97d-3806122feefmr4606484f8f.59.1730060206619;
        Sun, 27 Oct 2024 13:16:46 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360d233sm84204645e9.45.2024.10.27.13.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:16:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] gitpkgv: Fix python deprecation warning
Date: Sun, 27 Oct 2024 21:16:41 +0100
Message-ID: <20241027201641.3858573-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 20:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113252

From: Khem Raj <raj.khem@gmail.com>

Fixes
DeprecationWarning: 'pipes' is deprecated and slated for removal in Python 3.13

pipes is an alias for shlex therefore switch to using shlex

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/gitpkgv.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 180421ed35..cb2cea26be 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -56,7 +56,7 @@ def gitpkgv_drop_tag_prefix(d, version):
 def get_git_pkgv(d, use_tags):
     import os
     import bb
-    from pipes import quote
+    from shlex import quote
 
     src_uri = d.getVar('SRC_URI').split()
     fetcher = bb.fetch2.Fetch(src_uri, d)
-- 
2.47.0


