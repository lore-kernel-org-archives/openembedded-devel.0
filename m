Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236D7F357BA
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:04:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25379.1771952694325083879
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i9073mWI;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so35210965e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 09:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771952693; x=1772557493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9WQ30CuIODKs/+jidDhlgvrqiMg78B1Kp7exlVl+aI=;
        b=i9073mWIqHu9K3aFQan50s114ZsmIMHhJ0rtfhSo7G2iyKnR5yBAW5uojwcfLXBu4X
         VCyyDBIVqrnWXjir3/Y63Y4SqILBuyVx0z2GPmP9uyR1G6a407u7JqHhxUsnjT3srdtB
         Rd+/Z6QVTMSQfHmY/C1XsipDzcjH7LXm5aBwgyNZVApa05M8EnfLTrnQ1PO/y86LDh4h
         M5hTW83kHiOQYIjzeO3EuujWXWd1Wm7VPNR6VxONpI8DTnG56MzgBmXw77hJp4y4H/6s
         9JKqyFrLrsM9CU3jn9PODzpEJQ9DwWnw1YhxLGxU7qeienBU8jp6Asz+MBpeaG9UQALw
         TaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771952693; x=1772557493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9WQ30CuIODKs/+jidDhlgvrqiMg78B1Kp7exlVl+aI=;
        b=GwMcdHViZs6j808ySomp2m3xhnxSZ6Ezcgd0rztIRqTd78wmOYnivZV2CjsuDBL39y
         65OSeJdhHNgrsNkERoJFtzTcZzWjeEdqEeVtP6EzkYmv5m2PiV9xlMjhXLpdKIXCsXcJ
         HA9Sq2jiM8jfiNjqY7yUrKLxJGpHdf5h6ppIrgoGoBhiUgKzz21X3Dhby/NOn5D3xSFV
         5ovlIsoJAEKjW3fne4uXJj+jEfGfRp3JkwIYxA7L1ZOmRA7GGxEUtKtCKvQoKyQ8t36K
         d4Ux/3eYU/ESMW6OY5cr8yjB9fj2N6s8+NFp+nXxHOnSn6YnfdkaaNO3HwBKIlt9fKbA
         n4Gg==
X-Gm-Message-State: AOJu0Yx2R8WDgPaMfoAU0Ea6mni0T+rTH4eIC1xzSHZQm+7DZmEqNIxz
	+fy6l1tLIXJtNXc7gP3z4Rcu02dSDHkOVhIZSRpcDHnduPVzi8UyLnER2F485g==
X-Gm-Gg: AZuq6aLYMclc35Z5w9KZ1/vfDT0VQLcFB/CNQI8KkYVEt7/zjRsv4n16W2rLY71hqND
	X8fSBubyXNtgCxDCXO+QR0Kcq4pYdXAwfjhj7imalwX31zIci73qD3rz63wt/uiNJpMJgFaLSpK
	iBJpEtZd4RmfgmAeJi4QwcJ+9ougkRvXvNWGoeMDRCD6fiol738fWw5Aq/suRzs5wZBx8DIBcrF
	Gb3e4Fx1SRlmwsUIMddt/FtdyuJf/mfrghqV+bJEYAW/E3+l1zI3BqLXiKKZTAzd1LAC7vXmCVb
	w6w32TnBXjyxfDG052MxmOArOax7zLeMBNkDr+gUbZXNZKT9FqOx3Kvtb6L5JYkAD3pfsjyTj+K
	SXjRsfLA+nZKTk+WnqZsoTgJQHEjyhrMQ5QL+Ss+CkkYh8brA73U/1bCIDX7bAvqRzg5QpPs0Kw
	jCkclwW4q1Msy2vf38zXWQ
X-Received: by 2002:a05:600c:8107:b0:483:103c:b1ee with SMTP id 5b1f17b1804b1-483a95c536dmr188771045e9.8.1771952692622;
        Tue, 24 Feb 2026 09:04:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm19990535e9.0.2026.02.24.09.04.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 09:04:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-nltk: upgrade 3.9.2 -> 3.9.3
Date: Tue, 24 Feb 2026 18:04:48 +0100
Message-ID: <20260224170448.1310931-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224170448.1310931-1-skandigraun@gmail.com>
References: <20260224170448.1310931-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 17:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124585

Contains fix for CVE-2026-14009.

Changelog:
* Fix CVE-2025-14009: secure ZIP extraction in nltk.downloader
* Block path traversal/arbitrary reads in nltk.data for protocol-less refs
* Block path traversal/abs paths in corpus readers and FS pointers
* Validate external StanfordSegmenter JARs using SHA256
* Add optional sandbox enforcement for filestring()
* Maintenance: downloader/zipped models, CI/tooling updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-nltk_3.9.2.bb => python3-nltk_3.9.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.9.2.bb => python3-nltk_3.9.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
index 43c23254d9..8953b75b28 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
@@ -23,4 +23,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "0f409e9b069ca4177c1903c3e843eef90c7e92992fa4931ae607da6de49e1419"
+SRC_URI[sha256sum] = "cb5945d6424a98d694c2b9a0264519fab4363711065a46aa0ae7a2195b92e71f"

