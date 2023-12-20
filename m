Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C58C46CD2
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 14:47:28 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.22846.1703083639292706315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 06:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZER8uZC+;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso7988363e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703083637; x=1703688437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxYJ/YXHi+444EncvO9OOqDrbaFAW40cdQvbQM/SPNE=;
        b=ZER8uZC+O6C46JmyktHbxtCo8eIWNanja3tZKE3Hd6Z8itGlQdGMWeMjmCe9/52smJ
         SEUwzRpPNINj8PJj6nIbON9oY5zPaBWYNierZ2SXRxvY9+YbMinEMOdwh5jZXAp6wppf
         MiYv4QtyE+/oA3ehQOCQ9YixwiHA6gHNaVa+HxpUxCjGJyxYGcphEu1JyWHDTKtimi1a
         YnNxSGWPvgP1uZDzH9Y8AMpPgmlzyBzKOp6qgISgKnvRb56sR0hMcB+t8bOVd8U29UG0
         MOI9AdhLPcoj7Vr78GkWSMKebChduxw0uFs/FNJey4r993V+KhlJF9Wdns903Id06DoE
         DHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703083637; x=1703688437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxYJ/YXHi+444EncvO9OOqDrbaFAW40cdQvbQM/SPNE=;
        b=FqwZGHVPwHba7SIXjf7LarHUYyfzBMdEdneihxKpOjaCi/JG5tBN1f9sW+qR3t2bq2
         60ciPHwYx8m0HOtl1DaMs1ihqeK5u3WwVpG+xXAlrUgIQ5oeavV4C1SzVP97vRUN405q
         X8QJNC+CJEgwzOcWY2hfJsTkeB37Ye+t3urDda+uGW+6juWz3yqZCiOFcML7QLCunB48
         mL0LNNKDOSjc1Fur2GJkkYkgzzJfXnUtb2t0/8XN/XdXY4bQLBFVnlPnS0PqbxuU1kW7
         KXMewfdZkiBFrYEEsgU2ATeRCZVfjPIATRDvV1I96WGzuto4F+LgBdyFqP3RWCrT5B+6
         t8LQ==
X-Gm-Message-State: AOJu0YwrVmwbQAnS/ZP9OW5qkM8O193dFfdSOh1OBeJighjJPB4KYdOg
	uKc9+PpEFY1pBA++wr6u0Ls65bOPShc=
X-Google-Smtp-Source: AGHT+IFVPfwGTaFFpA8DQU2QwAWjrFXeQVXzeY9/0vHRDD7JWUzbVn2qXrRyacbzBa7h/4w4jmT73A==
X-Received: by 2002:ac2:42c7:0:b0:50e:3659:8657 with SMTP id n7-20020ac242c7000000b0050e36598657mr2769045lfl.21.1703083637185;
        Wed, 20 Dec 2023 06:47:17 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id op24-20020a170906bcf800b00a2361163cfesm3282880ejb.13.2023.12.20.06.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 06:47:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][langdale][PATCHv2] poco: fix branch
Date: Wed, 20 Dec 2023 15:47:08 +0100
Message-ID: <20231220144710.438752-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107658

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
v2: fix branch again, now it has "poco-" prefix

 meta-oe/recipes-support/poco/poco_1.12.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.3.bb b/meta-oe/recipes-support/poco/poco_1.12.3.bb
index 32c57ce978..55988a6f55 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.3.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.3.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.12.3;protocol=https \
            file://run-ptest \
            "
-SRCREV = "f1aefe34a46891b09230422bbc37465bc6d0a0d1"
+SRCREV = "9fc117d585e552ae3327b56900df9cc40653d574"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


