Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9551C38147
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 08:14:20 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.12073.1702714454491919771
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Dec 2023 00:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d1e52Cmk;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1f8a1e9637so250230066b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702714453; x=1703319253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8QTJbzmWjNjXO7qdkhYfGcuZhQ5hHbwTNI607RKFArY=;
        b=d1e52Cmk+5nzJxwFU1FykRbKTJvhIkKL3I5XD70xB7blvtfx7EowlcmqmonIRm99Ti
         OTg2yKRDVO6nfG6MI8BIM/QpMwuJDAg8LtsynIyFmip3i2SelwmpH0XZ9G3tDONE5uJa
         6qbyqDRGqdGNkCnBPzkccFnu//ZyuSjKDIORItmC0VknJvQoQF7EIzFOxsdp6UwFojYj
         L0LlGAM7RGFA11z7ECT+nCb6zHpvRT/cUQKFLBYOXByEIiT0YJJkN6a1nQZTbGAE/eRx
         KecVq6TM4MiojEMogjb5qirRWYkA79AuNn2Xr9pOAhd5HyKohLxM3+WyiZy5Xix2N7Xl
         cD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702714453; x=1703319253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QTJbzmWjNjXO7qdkhYfGcuZhQ5hHbwTNI607RKFArY=;
        b=Owe+L3K5u4Wiuzfe8vYEgovJkC+Hu7Lyq4zqqlSsDVtu8wKjt3W7MlVOTV97Auzw5R
         A8m0TuirfdnxyjSEclaA0dzJqwY/oPJcV+Tu2RSTrmOSa79UD96+r5cxBYzBoYdo5zgB
         SG7sI7j/R0ia1ZkhHhGYAOXF+n4xQAc/pZlgcVGdgDfUSADNGJFQVjYfjfYc6gIjVor7
         LKKYUvePumAXJpmqb/SU1HiyoCOCnWXLH4bIoYoGdnRmVcCuSLkO5ulWxXB3qO+Jq+35
         2vFjwZ7otUGj4eON5OPqgBoZmGYtEzBuEoiy2bXbK6A3cWA/lnWAT/L+JJRXa+gIdQo3
         icgQ==
X-Gm-Message-State: AOJu0Yz0C3bGGWInZKXZ3MR8TRxHnfSKx77g7dKYspfRiJCa6TEDVqHf
	uQMsZ681j8+YYVnhnMDvlvdgnoNlHu4=
X-Google-Smtp-Source: AGHT+IEqn2FjfOndWa65dS9JVtEBE1IZ5aQ1fi1de9UQjO8TRBKOVg2bP8e5KdBqwhmKesC5gcv6Hw==
X-Received: by 2002:a17:907:9486:b0:a1d:c376:216b with SMTP id dm6-20020a170907948600b00a1dc376216bmr15449732ejc.45.1702714452632;
        Sat, 16 Dec 2023 00:14:12 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id rg14-20020a1709076b8e00b00a23002c8059sm4666840ejc.70.2023.12.16.00.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 00:14:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][langdale][PATCH] poco: fix branch
Date: Sat, 16 Dec 2023 09:14:06 +0100
Message-ID: <20231216081406.3638074-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 08:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107533

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The current SRCREV is not on any branch anymore, switch to the 1.12.4
branch HEAD which is similar and the only change is irrelevant.

The SRCREV is still referenced from the tag so we could use nobranch here:
github/poco $ git tag --contains f1aefe34a46891b09230422bbc37465bc6d0a0d1
poco-1.12.3-release
poco-1.12.4-release

but the only difference in "new" branch HEAD is .github/FUNDING.ym file
(don't know why they force pushed all the branches just to remove this)

github/poco $ git diff f1aefe34a46891b09230422bbc37465bc6d0a0d1 9fc117d585e552ae3327b56900df9cc40653d574
  diff --git a/.github/FUNDING.yml b/.github/FUNDING.yml
  deleted file mode 100644
  index b2884d85e..000000000
  --- a/.github/FUNDING.yml
  +++ /dev/null
  @@ -1,13 +0,0 @@
  -# These are supported funding model platforms
  -
  -github: [aleks-f]
  -patreon: # Replace with a single Patreon username
  -open_collective: # Replace with a single Open Collective username
  -ko_fi: # Replace with a single Ko-fi username
  -tidelift: # Replace with a single Tidelift platform-name/package-name e.g., npm/babel
  -community_bridge: # Replace with a single Community Bridge project-name e.g., cloud-foundry
  -liberapay: # Replace with a single Liberapay username
  -issuehunt: # Replace with a single IssueHunt username
  -otechie: # Replace with a single Otechie username
  -lfx_crowdfunding: # Replace with a single LFX Crowdfunding project-name e.g., cloud-foundry
  -custom: # Replace with up to 4 custom sponsorship URLs e.g., ['link1', 'link2']

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.12.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.3.bb b/meta-oe/recipes-support/poco/poco_1.12.3.bb
index 32c57ce978..5bd029a6d9 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.3.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=1.12.3;protocol=https \
            file://run-ptest \
            "
-SRCREV = "f1aefe34a46891b09230422bbc37465bc6d0a0d1"
+SRCREV = "9fc117d585e552ae3327b56900df9cc40653d574"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


