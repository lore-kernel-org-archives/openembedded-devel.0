Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800C5C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 14:50:15 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.48254.1723474213065610280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 07:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tFR5JVa6;
 spf=pass (domain: konsulko.com, ip: 209.85.208.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a1f9bc80e3so1952069a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723474211; x=1724079011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl6/hFe73/vkV4UW6by6mnMrw09co5y8UBblPSO+5wM=;
        b=tFR5JVa6sk/BhsjLOQH45DoK4gyc/binwVUshJgQzHfo+hqWbI9IxnIkukaYluvqV+
         dvwfTssMSyut11ASCO7YwSJAn17q3AKqJPjWwVFJZo7a9kaLl+lT4D/OKiUoH/gaYEKi
         nRiDw1DXyKfUfMDOKL7tW2Jeas7NsVdjpXFIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723474211; x=1724079011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl6/hFe73/vkV4UW6by6mnMrw09co5y8UBblPSO+5wM=;
        b=uYAQ7A4p8KyYh+0eiJizvudrCwyRBcTmogPUmjCnkQKWWtHrwjG5rCiJkRrEu3kopg
         CI4TTwL1kKGYrXts1gPDQqNcGN6V1JAfVRiU1xyEKb1Kw2hpSns3dCGX2iW+Ew8DqDVC
         pOsF97/nHKEo8x+l4Qw1X3Bbkq/Pz2mwIwKMaY/AC8kvJJ+l8FbZLF7A7mT4uYmecpJ0
         MGDbpG+tmBIH7Np3YkxEadIR0EHcPdeH+VnM48gUK3dxu0YphxhdrEwJDfdbswaybXcA
         OTh5goiRNtYhW9I62ogIav1PAeM1xOFb2KE17z94dH7YEDQhPyQeCEykJ1Vl9cbJFUtC
         fHsg==
X-Gm-Message-State: AOJu0Yy2x56/ZBa2b06R3zFCeHlU4ai4igjpbuYAEgk34tMSwX9yYk9d
	8bXNKkfHGvUvv898JlD6AQqYVMhx/+DJq6krtYbdjk9Z/y1FH529WBky3FwN3wbA4+W9wPuXihu
	8
X-Google-Smtp-Source: AGHT+IGkByFa+UwNpilYVo8Xu59D6kc8jNpcn4cZiN6doNkPy+7N20yWyNn/AKUYb6d1261bumiBrA==
X-Received: by 2002:a05:6402:f0d:b0:5a2:8f7d:aff4 with SMTP id 4fb4d7f45d1cf-5bd44c3f430mr690153a12.20.1723474211198;
        Mon, 12 Aug 2024 07:50:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd187f29d0sm2176676a12.2.2024.08.12.07.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 07:50:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-transitions: Upgrade 0.9.1 -> 0.9.2
Date: Mon, 12 Aug 2024 17:50:07 +0300
Message-Id: <20240812145008.3210575-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240812145008.3210575-1-leon.anavi@konsulko.com>
References: <20240812145008.3210575-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 14:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111771

Upgrade to release 0.9.2:

- Bug: Decorate models appropriately when HierarchicalMachine is
  passed to add_state
- Bug: Let may_<trigger> check all parallel states in processing
  order
- Bug: HSM.is_state works with parallel states now
- Feature: Add may_trigger to models to check whether transitions
  can be conducted by trigger name
- Feature: Add Mermaid diagram backend that returns a mermaid
  diagram as a string. use_pygraphviz is deprecated in favour for
  graph_engine which may be pygraphviz (default), graphviz or
  mermaid

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-transitions_0.9.1.bb => python3-transitions_0.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.9.1.bb => python3-transitions_0.9.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.9.1.bb b/meta-python/recipes-devtools/python/python3-transitions_0.9.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-transitions_0.9.1.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.9.2.bb
index 5f1e3d9e2..3a27b666c 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.9.2.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de0a0876a688a4483bfafa764773ab39"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3542c37108e93e2ae5f215208ec5732c94a772937854a102cd7345b967fee61b"
+SRC_URI[sha256sum] = "2f8490dbdbd419366cef1516032ab06d07ccb5839ef54905e842a472692d4204"
 
 RDEPENDS:${PN} += "python3-six python3-logging"
-- 
2.39.2


